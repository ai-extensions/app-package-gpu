import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
from tensorflow.python.client import device_lib
import tensorflow as tf

def get_available_devices():
    local_device_protos = device_lib.list_local_devices()
    return [x.name for x in local_device_protos]

print(get_available_devices())


print(tf.reduce_sum(tf.random.normal([1000, 1000])))
