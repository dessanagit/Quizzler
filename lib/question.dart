// Creating an class
// class' name always start with capital letter.
class Question {
  // properties
  String questionText;
  bool questionAnswer;

  // Creating the constructor
  Question({String q, bool a}) {
    questionText = q;
    questionAnswer = a;
  }

  // https://medium.com/jay-tillu/constructors-in-dart-4f972186c372
  // A constructor is a special method (function) of a class that helps to create an object. As its name indicates its constructs the new object.
  // It helps to create the object by initializing values to instance variables. So we can say that its main goal is to provide values to instance variables.
}

// it's necessary to import this file at main.dart in order to be functional.
