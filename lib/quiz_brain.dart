import 'question.dart';

class QuizBrain {
  // variable to keep tracking questions.
  // make it private to only QuizBrain has access to it.
  int _questionNumber = 0;

  // List of question and answer using Question Class.
  // In order to ENCAPSULATE it's necessary to add an _, as shown below:
  List<Question> _questionBank = [
    Question(q: 'Some cats are actually allergic to humans', a: true),
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    Question(
        q: 'No piece of square dry paper can be folded in half more than 7 times.',
        a: false),
    Question(
        q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a: true),
    Question(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    Question(
        q: 'The total surface area of two human lungs is approximately 70 square metres.',
        a: true),
    Question(q: 'Google was originally called \"Backrub\".', a: true),
    Question(
        q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
    Question(
        q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true),
  ];

  // *** EVERYTHING DOWN HERE ARE TAUGHT IN VIDEO LESSONS ***

  // *** Method to count number and keep tracking the index in the functions below.
  // this must be called in main.dart.

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

// **** Because questionBank is encapsulated, creating a function INSIDE QuizBrain to give access to the questions and answers of _questionBank at main.dat is required.
// **** This process also means ABSTRACT the code a bit more.

  // Now questionNumber is a function's input, following the same idea as before.
  String getQuestionText() {
    // effectively returning GETTING QUESTION to use in main.dart
    // -> .questionText is inside question.dart
    return _questionBank[_questionNumber].questionText;
  }

  // Using the same philosophy as above.
  bool getQuestionAnswer() {
    // .questionAnswer is inside question.dart
    return _questionBank[_questionNumber].questionAnswer;
  }
}
