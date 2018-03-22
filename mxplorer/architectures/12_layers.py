import time
import warnings
import os
import numpy as np
import pandas as pd
import keras
from keras.callbacks import ReduceLROnPlateau
from keras.models import Model
from keras.utils import np_utils
from config import NB_EPOCHS, EXPERIMENT_PATH
warnings.simplefilter("ignore", UserWarning)


def readucr(filename):
    """Load data from csv."""
    data = np.loadtxt(filename, delimiter=',')
    Y = data[:, 0]
    X = data[:, 1:]
    return X, Y


def prepare_data(dataset_path):
    """Prepare data for keras neural network."""

    x_train, y_train = readucr(dataset_path + '_TRAIN')
    x_test, y_test = readucr(dataset_path + '_TEST')
    nb_classes = len(np.unique(y_test))

    y_train = (y_train - y_train.min())/(y_train.max()-y_train.min())*(nb_classes-1)
    y_test = (y_test - y_test.min())/(y_test.max()-y_test.min())*(nb_classes-1)

    Y_train = np_utils.to_categorical(y_train, nb_classes)
    Y_test = np_utils.to_categorical(y_test, nb_classes)

    x_train_mean = x_train.mean()
    x_train_std = x_train.std()
    x_train = (x_train - x_train_mean)/(x_train_std)

    x_test = (x_test - x_train_mean)/(x_train_std)
    x_train = x_train.reshape(x_train.shape + (1,1,))
    x_test = x_test.reshape(x_test.shape + (1,1,))

    return nb_classes, x_train, Y_train, x_test, Y_test


def save_model_to_file(model, filename):
    model.save(os.path.join(EXPERIMENT_PATH, filename))


def calculate_inference_time(model, data):
    start = time.time()
    model.predict(data)
    end = time.time()
    inference_time = end - start

    return inference_time


def get_model(assignments, x_train, nb_classes):
    """Return Keras model."""
    # define model architecture
    # input
    x = keras.layers.Input(x_train.shape[1:])

    # conv 1
    conv1 = keras.layers.Conv2D(
        assignments['conv_1_num_filters'],
        assignments['conv_1_filter_size'],
        strides=1,
        padding='same')(x)
    conv1 = keras.layers.normalization.BatchNormalization()(conv1)
    conv1 = keras.layers.Activation('relu')(conv1)

    # conv 2
    conv2 = keras.layers.Conv2D(
        assignments['conv_2_num_filters'],
        assignments['conv_2_filter_size'],
        strides=1,
        padding='same')(conv1)
    conv2 = keras.layers.normalization.BatchNormalization()(conv2)
    conv2 = keras.layers.Activation('relu')(conv2)

    # conv 3
    conv3 = keras.layers.Conv2D(
        assignments['conv_3_num_filters'],
        assignments['conv_3_filter_size'],
        strides=1,
        padding='same')(conv2)
    conv3 = keras.layers.normalization.BatchNormalization()(conv3)
    conv3 = keras.layers.Activation('relu')(conv3)

    # conv 4
    conv4 = keras.layers.Conv2D(
        assignments['conv_3_num_filters'],
        assignments['conv_3_filter_size'],
        strides=1,
        padding='same')(conv3)
    conv4 = keras.layers.normalization.BatchNormalization()(conv4)
    conv4 = keras.layers.Activation('relu')(conv4)
    
    # conv 5
    conv5 = keras.layers.Conv2D(
        assignments['conv_3_num_filters'],
        assignments['conv_3_filter_size'],
        strides=1,
        padding='same')(conv4)
    conv5 = keras.layers.normalization.BatchNormalization()(conv5)
    conv5 = keras.layers.Activation('relu')(conv5)
    
    # conv 6
    conv6 = keras.layers.Conv2D(
        assignments['conv_3_num_filters'],
        assignments['conv_3_filter_size'],
        strides=1,
        padding='same')(conv5)
    conv5 = keras.layers.normalization.BatchNormalization()(conv6)
    conv5 = keras.layers.Activation('relu')(conv6)

    # conv 7
    conv7 = keras.layers.Conv2D(
        assignments['conv_1_num_filters'],
        assignments['conv_1_filter_size'],
        strides=1,
        padding='same')(conv6)
    conv7 = keras.layers.normalization.BatchNormalization()(conv7)
    conv7 = keras.layers.Activation('relu')(conv7)

    # conv 8
    conv8 = keras.layers.Conv2D(
        assignments['conv_2_num_filters'],
        assignments['conv_2_filter_size'],
        strides=1,
        padding='same')(conv7)
    conv8 = keras.layers.normalization.BatchNormalization()(conv8)
    conv8 = keras.layers.Activation('relu')(conv8)

    # conv 9
    conv9 = keras.layers.Conv2D(
        assignments['conv_3_num_filters'],
        assignments['conv_3_filter_size'],
        strides=1,
        padding='same')(conv8)
    conv9 = keras.layers.normalization.BatchNormalization()(conv9)
    conv9 = keras.layers.Activation('relu')(conv9)

    # conv 10
    conv10 = keras.layers.Conv2D(
        assignments['conv_3_num_filters'],
        assignments['conv_3_filter_size'],
        strides=1,
        padding='same')(conv9)
    conv10 = keras.layers.normalization.BatchNormalization()(conv10)
    conv10 = keras.layers.Activation('relu')(conv10)
    
    # conv 11
    conv11 = keras.layers.Conv2D(
        assignments['conv_3_num_filters'],
        assignments['conv_3_filter_size'],
        strides=1,
        padding='same')(conv10)
    conv11 = keras.layers.normalization.BatchNormalization()(conv11)
    conv11 = keras.layers.Activation('relu')(conv11)
    
    # conv 12
    conv12 = keras.layers.Conv2D(
        assignments['conv_3_num_filters'],
        assignments['conv_3_filter_size'],
        strides=1,
        padding='same')(conv11)
    conv12 = keras.layers.normalization.BatchNormalization()(conv12)
    conv12 = keras.layers.Activation('relu')(conv12)

    # output
    full = keras.layers.pooling.GlobalAveragePooling2D()(conv12)
    out = keras.layers.Dense(nb_classes, activation='softmax')(full)

    model = Model(input=x, output=out)
    return model


def fit_model(assignments, model, x_train, Y_train, x_test, Y_test):

    # define model training
    optimizer = keras.optimizers.Adam(lr=np.exp(assignments['log_lr']),
                                      beta_1=1-np.exp(assignments['log_beta_1']),
                                      beta_2=1-np.exp(assignments['log_beta_2']),
                                      epsilon=np.exp(assignments['log_epsilon']),
                                      decay=np.exp(assignments['log_decay']))
    model.compile(loss='categorical_crossentropy',
                  optimizer=optimizer,
                  metrics=['accuracy'])
    reduce_lr = ReduceLROnPlateau(monitor='loss',
                                  factor=0.5,
                                  patience=50,
                                  min_lr=0.0001)

    batch_size = assignments['batch_size']
    # train model
    hist = model.fit(x_train, Y_train,
                     batch_size=batch_size,
                     nb_epoch=NB_EPOCHS,
                     verbose=0,
                     validation_data=(x_test, Y_test),
                     callbacks=[reduce_lr])

    return model, hist


def store_hist(hist, experiment, suggestion):
    # create and store history of training progress
    log = pd.DataFrame(hist.history)
    csv_filename = experiment.id + '_' + str(suggestion.id) + '.csv'
    log.to_csv(os.path.join(EXPERIMENT_PATH, csv_filename))
    print("Learning Curve Data Stored: " + csv_filename + ".")
    return log


def add_to_queue(func):
    def wrapper(q, *args, **kwargs):
        result = func(*args, **kwargs)
        q.put(result)
        return result
    return wrapper


@add_to_queue
def evaluate_assignments(experiment, suggestion,
                         x_train, Y_train,
                         x_test, Y_test,
                         nb_classes):
    num_iters = 10
    print('process id: ', os.getpid())
    assignments = suggestion.assignments
    model = get_model(assignments, x_train, nb_classes)
    model, hist = fit_model(assignments,
                            model,
                            x_train, Y_train,
                            x_test, Y_test)
    log = store_hist(hist, experiment, suggestion)
    for i in range(num_iters):
        print("STARTING INFERENCE")
        inference_time = calculate_inference_time(model, x_test)
        print("DONE INFERENCE")
    metrics = {"config_id": suggestion.id,
               'val_acc': log.iat[-1, -2],
               'inference_time': inference_time}
    metadata = {k: v[NB_EPOCHS-1] for k, v in log[-1:].to_dict().items()}

    return metrics, metadata

