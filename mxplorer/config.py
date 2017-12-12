import os, json

import numpy as np

THIS_PATH = os.path.dirname(__file__)

PARAMETERS = [
  dict(name='batch_size', type='int', bounds={'min': 8, 'max': 32}),
  dict(name='conv_1_num_filters',  type='int', bounds={'min': 32, 'max': 256}),
  dict(name='conv_1_filter_size', type='int', bounds={'min': 2, 'max': 10}),
  dict(name='conv_2_num_filters', type='int', bounds={'min': 32, 'max': 256}),
  dict(name='conv_2_filter_size', type='int', bounds={'min': 2, 'max': 10}),
  dict(name='conv_3_num_filters', type='int', bounds={'min': 32, 'max': 256}),
  dict(name='conv_3_filter_size', type='int', bounds={'min': 2, 'max': 10}),
  dict(name='log_lr', type='double', bounds={'min': np.log(1e-10), 'max': np.log(1)}),
  dict(name='log_beta_1', type='double', bounds={'min': np.log(1e-2), 'max': np.log(.5)}),
  dict(name='log_beta_2', type='double', bounds={'min': np.log(1e-6), 'max': np.log(.5)}),
  dict(name='log_epsilon', type='double', bounds={'min': np.log(1e-10), 'max': np.log(1e-6)}),
  dict(name='log_decay', type='double', bounds={'min': np.log(1e-10), 'max': np.log(1e-1)}),
]


DATASET = 'Coffee'
DATA_PATH = '../data/UCR_TS_Archive_2015'
EXPERIMENT_PATH = '../exp'

DATASET_FOLDER = os.path.join(DATA_PATH, DATASET)
DATASET_FILE = DATASET
DATASET_PATH = os.path.join(DATASET_FOLDER, DATASET_FILE)

EXPERIMENT_NAME = 'exp'

METRIC_1 = 'val_acc'
METRIC_2 = 'inference_time'

METRICS = [{'name': METRIC_1},
           {'name': METRIC_2}]

NB_EPOCHS = 50

OBSERVATION_BUDGET = 4096

DESIGN = 'ff'
