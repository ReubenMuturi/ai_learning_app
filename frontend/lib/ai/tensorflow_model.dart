// import 'package:tflite_flutter/tflite_flutter.dart';

// class TensorFlowModel {
//   static late Interpreter _interpreter;

//   // Load the model from assets
//   static Future<void> loadModel() async {
//     try {
//       _interpreter = await Interpreter.fromAsset('model.tflite');
//     } catch (e) {
//       print('Error loading model: $e');
//     }
//   }

//   // Run predictions
//   static Future<List<dynamic>> predict(List<dynamic> input) async {
//     var output = List.filled(1, 0).reshape([1]); // Adjust based on your model
//     try {
//       _interpreter.run(input, output);
//     } catch (e) {
//       print('Error running model: $e');
//     }
//     return output;
//   }

//   // Close the interpreter
//   static void close() {
//     _interpreter.close();
//   }
// }




import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';

class TensorflowModel {
  late Interpreter _interpreter;

  /// Initialize TensorFlow Lite model
  Future<void> initializeModel() async {
    try {
      // Load the model from assets
      _interpreter = await Interpreter.fromAsset('model.tflite');
      print("TensorFlow Lite model loaded successfully.");
    } catch (e) {
      print("Error loading TensorFlow Lite model: $e");
    }
  }

  /// Perform prediction using the model
  List<double> predict(List<double> inputData) {
    try {
      // Define input and output tensors
      var input = Float32List.fromList(inputData);
      var output = List<double>.filled(1, 0).reshape([1, 1]);

      // Run inference
      _interpreter.run(input, output);

      print("Prediction completed: $output");
      return output[0]; // Return the prediction result
    } catch (e) {
      print("Error during prediction: $e");
      return [];
    }
  }

  /// Dispose of interpreter to release resources
  void dispose() {
    _interpreter.close();
    print("TensorFlow Lite model resources released.");
  }
}
