import 'package:flutter/material.dart';
// import 'package:ai_learning_app/ai/tensorflow_model.dart';

class TensorflowModel {
  Future<void> initializeModel() async {
    // Simulated model initialization
    print("TensorFlow model initialized.");
  }

  List<double> predict(List<double> input) {
    // Simulated prediction
    return input.map((x) => x * 2).toList();
  }

  void dispose() {
    // Dispose of resources if needed
    print("TensorFlow model disposed.");
  }
}


class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  _AiScreenState createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  late TensorflowModel _model;
  List<double> _prediction = [];

  @override
  void initState() {
    super.initState();
    _model = TensorflowModel();
    _initializeAi();
  }

  Future<void> _initializeAi() async {
    await _model.initializeModel();
  }

  void _getPrediction(List<double> input) {
    final result = _model.predict(input);
    setState(() {
      _prediction = result;
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Assistant")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Prediction Result: $_prediction"),
          ElevatedButton(
            onPressed: () {
              // Example input for prediction
              _getPrediction([0.5, 0.2, 0.1]);
            },
            child: Text("Get Prediction"),
          ),
        ],
      ),
    );
  }
}
