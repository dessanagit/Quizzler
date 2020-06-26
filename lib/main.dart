import 'package:flutter/material.dart';

import 'quiz_brain.dart';

// Creating an new OBJECT using QuizBrain class/object.
QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
// List = Array
// Creating a List and specifying the type -> List<Type> name = [];
  // List of Icons.
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // Showing question following the index inside the list, using quizBrain Object.
                // *** NOW: Calling and Using the function created in quiz_brain.dart to pass the input and returning the question.
                // *** this process is now required because questionBank is now ENCAPSULATED -> _questionBank.
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                // Storing question's answers according with index, calling from the class Question.
                bool correctAnswer =
                    // getting answer -> Access questionBank inside quizBrain and pull out the questionNumber and then the correct answer.
                    // *** using function because questionBank is encapsulated. SEE MORE IN quiz_brain.dart.
                    quizBrain.getQuestionAnswer();

                //The user picked true.
                setState(() {
                  // To keep main.dart's function, the method was created inside quiz_brain.dart to keep tracking the questions/answers properly.
                  quizBrain.nextQuestion();

                  if (correctAnswer == true) {
                    scoreKeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                    print('User got it right!');
                  } else {
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                    print('User got it wrong!');
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          // Showing score icon
          // All children by nature accept lists.
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
