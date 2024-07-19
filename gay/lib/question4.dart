import 'package:flutter/material.dart';
import 'package:gay/globalstate.dart';
import 'package:gay/question3.dart';
import 'package:gay/question5.dart';

class Question4 extends StatefulWidget {
  const Question4({Key? key}) : super(key: key);

  @override
  _Question4State createState() => _Question4State();
}

class _Question4State extends State<Question4> {
  String questionKey = "party";

  void handleButtonPress(bool answer) {
    setState(() {
      globalState.answers[questionKey] = answer ? 0 : 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    int? currentAnswer = globalState.answers[questionKey];

    Color yesButtonColor = currentAnswer == 0
        ? Colors.green
        : const Color.fromARGB(255, 255, 131, 172);
    Color noButtonColor = currentAnswer == 20
        ? Colors.red
        : const Color.fromARGB(255, 255, 131, 172);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Would you like to have a Party with your friends?',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: yesButtonColor,
                      child: TextButton(
                        onPressed: () => handleButtonPress(true),
                        child: const Text(
                          'Yes',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: 40,
                      width: 100,
                      color: noButtonColor,
                      child: TextButton(
                        onPressed: () => handleButtonPress(false),
                        child: const Text(
                          'No',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: const Color.fromARGB(255, 255, 131, 172),
                      child: TextButton(
                        onPressed: () {
                          // Navigate to previous screen (Question3)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Question3(),
                            ),
                          );
                        },
                        child: const Text(
                          'Previous',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: const Color.fromARGB(255, 255, 131, 172),
                      child: TextButton(
                        onPressed: () {
                          // Navigate to next screen (Question5)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Question5(),
                            ),
                          );
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
