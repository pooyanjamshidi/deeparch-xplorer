from multiprocessing import Process, Queue
import numpy as np
from datetime import datetime
import os
import csv
import itertools

from mxplorer.config import (PARAMETERS, EXPERIMENT_NAME, METRICS, DATASET,
                             OBSERVATION_BUDGET, DATASET_PATH, EXPERIMENT_PATH,
                             METRIC_1, METRIC_2, DESIGN)

from mxplorer.train_model import prepare_data, evaluate_assignments


class Experiment:
    def __init__(self, name, parameters, metrics, budget):
        self.id = name + '_' + DATASET + '_' + str(datetime.now())
        self.observation_count = 0
        self.name = name
        self.conf_space = parameters
        self.metrics = metrics
        self.budget = budget
        self.ndim = len(self.conf_space)

        csv_filename = self.id + '.csv'
        myField = ["config_id", METRIC_1, METRIC_2]
        with open(os.path.join(EXPERIMENT_PATH, csv_filename), 'w') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=myField)
            writer.writeheader()

    class Configuration:
        def __init__(self, parameters, budget, design):
            self.id = 0
            self.assignments = {}
            self.conf_space = parameters
            self.ndim = len(parameters)
            if design == 'random':
                self.configs = np.random.randint(2, size=(budget, self.ndim))
            else:
                confs = itertools.product(range(2), repeat=self.ndim)
                configs = np.zeros(shape=(budget, self.ndim))
                i = 0
                for c in confs:
                    configs[i, :] = np.array(c)
                    i +=1
                self.configs = configs

        def get_assignment(self):
            assignment = {}
            config = self.configs[self.id, :]
            for i in range(self.ndim):
                option = self.conf_space[i]
                if config[i] == 0:
                    assignment[option["name"]] = option["bounds"]["min"]
                else:
                    assignment[option["name"]] = option["bounds"]["max"]
            self.id += 1
            self.assignments = assignment
            return assignment

    def add_observation(self, measurement):
        self.observation_count += 1
        csv_filename = self.id + '.csv'
        myField = ["config_id", METRIC_1, METRIC_2]
        with open(os.path.join(EXPERIMENT_PATH, csv_filename), 'a') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=myField)
            writer.writerow(measurement)


nb_classes, x_train, Y_train, x_test, Y_test = prepare_data(DATASET_PATH)

q = Queue()

exp = Experiment(name=EXPERIMENT_NAME,
                 parameters=PARAMETERS,
                 metrics=METRICS,
                 budget=OBSERVATION_BUDGET)

conf = exp.Configuration(PARAMETERS, OBSERVATION_BUDGET, DESIGN)

while exp.observation_count < exp.budget:
    conf.get_assignment()

    p = Process(target=evaluate_assignments, args=(
        q, exp, conf, x_train, Y_train,
        x_test, Y_test, nb_classes)
    )

    p.start()
    p.join()
    data, metadata = q.get()

    exp.add_observation(data)
