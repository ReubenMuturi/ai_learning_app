from django.http import JsonResponse
from ai_learning.auth_backend import load_model, make_prediction  # Import relevant backend functions
import tensorflow as tf
import json

model = None

def load_model():
    global model
    model = tf.keras.models.load_model('path_to_model/model.h5')

def predict(request):
    if model is None:
        load_model()

    try:
        # Ensure data is parsed correctly
        data = json.loads(request.body).get('input_data', [])
        input_data = data.get('input_data')

        if input_data is None:
            return JsonResponse({'error': 'Input data is required'}, status=400)

        # Preprocess and make prediction
        prediction = model.predict([input_data])
        return JsonResponse({'prediction': prediction.tolist()})

    except Exception as e:
        return JsonResponse({'error': str(e)}, status=500)
