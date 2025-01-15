// // lib/screens/ai_screen.dart
// import 'package:flutter/material.dart';
// import '../ai/tensorflow_model.dart';

// class AIScreen extends StatefulWidget {
//   const AIScreen({super.key});

//   @override
//   _AIScreenState createState() => _AIScreenState();
// }

// class _AIScreenState extends State<AIScreen> {
//   String result = 'Loading...';

//   @override
//   void initState() {
//     super.initState();
//     _predict();
//   }

//   Future<void> _predict() async {
//     await TensorFlowModel.loadModel();
//     var prediction = await TensorFlowModel.predict([1.0, 2.0, 3.0]);  // Sample input
//     setState(() {
//       result = prediction.toString();
//     });
//   }

//   @override
//   void dispose() {
//     TensorFlowModel.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('AI Screen')),
//       body: Center(child: Text('Prediction Result: $result')),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:your_app/ai/tensorflow_model.dart';

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
