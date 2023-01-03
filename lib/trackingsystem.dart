import 'package:flutter/material.dart';

class TrackingSystem extends StatefulWidget {
  const TrackingSystem({super.key});

  @override
  State<TrackingSystem> createState() => _TrackingSystemState();
}

class _TrackingSystemState extends State<TrackingSystem> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        controlsBuilder: (context, onStepContinue) {
          return SizedBox();
        },


       currentStep: _index,

        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: <Step>[
          Step(
            title: const Text('Step 1 title'),
            content: Container(
                alignment: Alignment.centerLeft,
                child: const Text('Content for Step 1')),
          ),
           Step(
            title: Text('Step 2 title'),
            content : Container(
                alignment: Alignment.centerLeft,
                child: const Text('Content for Step 2')),
             isActive: true,
          ),
          Step(
            title: Text('Step 3 title'),
            content: Container(
                alignment: Alignment.centerLeft,
                child: const Text('Content for Step 3')),
            isActive: true,
          ),
           Step(
            title: Text('Step 4 title'),
            content: Container(
                alignment: Alignment.centerLeft,
                child: const Text('Content for Step 4')),
             isActive: true,
          ),
        ],
      ),
    );
  }
}
