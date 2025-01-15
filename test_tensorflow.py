# import tensorflow as tf

# # Load your TensorFlow model (e.g., saved_model)
# model = tf.saved_model.load("\Users\QWERTY\ai_learning_app\ai_learning_app\backend\ai_learning\models")

# # Convert it to TensorFlow Lite
# converter = tf.lite.TFLiteConverter.from_saved_model("\Users\QWERTY\ai_learning_app\ai_learning_app\backend\ai_learning\models")
# tflite_model = converter.convert()

# # Save the converted model
# with open("model.tflite", "wb") as f:
#     f.write(tflite_model)



import tensorflow as tf

# Load your saved Keras model
model = tf.keras.models.load_model(r'C:\Users\QWERTY\ai_learning_app\ai_learning_app\backend\ai_learning\models\model.keras')
model.save('model.keras', save_format='keras', include_optimizer=False)
print(model.summary())  # This prints out the model architecture



