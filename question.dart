class Question {
  String questionText;
  String questionImage;
  bool questionAnswer;
  
  Question({
    required String Text,
    required String Image,
    required bool Answer,
  })  : questionText = Text,
        questionImage = Image,
        questionAnswer = Answer;
}
