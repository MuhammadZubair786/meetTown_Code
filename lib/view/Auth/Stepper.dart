import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/Auth/SelectImage.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  List<Step> steps = [
    Step(
      title: Text(''),
      content: SelectImagePage(),
      isActive: true,
    ),
    Step(
      title: Text(''),
      content: Text('Step 2: Select a location'),
      isActive: false,
    ),
    Step(
      title: Text(''),
      content: Text('Step 3: Enter your name and email'),
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 246),
      appBar: AppBar(
        backgroundColor:appColors.textBlueColor ,
        title: Text('Complete Profile',
        style: TextStyle(color:const Color.fromARGB(255, 254, 254, 255)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Stepper(
            type: StepperType.horizontal,
            
            connectorColor: MaterialStateProperty.all(appColors.textBlueColor),
            // connectorThickness: 3,
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep < steps.length - 1) {
                setState(() {
                  steps[_currentStep] = Step(
                    title: steps[_currentStep].title,
                    content: steps[_currentStep].content,
                    isActive: false, // Set current step to inactive
                  );
                  _currentStep += 1; // Move to the next step
                  steps[_currentStep] = Step(
                    title: steps[_currentStep].title,
                    content: steps[_currentStep].content,
                    isActive: true, // Set next step to active
                  );
                });
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  steps[_currentStep] = Step(
                    title: steps[_currentStep].title,
                    content: steps[_currentStep].content,
                    isActive: false, // Set current step to inactive
                  );
                  _currentStep -= 1; // Move to the previous step
                  steps[_currentStep] = Step(
                    title: steps[_currentStep].title,
                    content: steps[_currentStep].content,
                    isActive: true, // Set previous step to active
                  );
                });
              }
            },
            steps: steps,
          ),
        ),
      ),
    );
  }
}
