import 'package:flutter/material.dart';
import 'question.dart';

class QuizBrain {
  List<Icon> _scoreKeeper = [];
  int _scoreNumber = 0;
  int _questionNumber = 0;
  int score = 0;
  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void getNextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswerText() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  void checkAnswer(userAnswer) {
    bool correctAnswer = getAnswerText();
    if (_scoreNumber < _questionBank.length) {
      if (userAnswer == correctAnswer) {
        print('$_scoreNumber: User got right');
        score += 10;
        _scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        print('$_scoreNumber: User got wrong');
        _scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
      _scoreNumber++;
    }
  }

  List<Icon> getScoreKeeper() {
    return _scoreKeeper;
  }

  bool isEnd() {
    if (_scoreNumber > _questionBank.length - 1) {
      print('true');
      return true;
    } else {
      print('false');
      return false;
    }
  }

  void reset() {
    _scoreKeeper = [];
    _scoreNumber = 0;
    _questionNumber = 0;
    score = 0;
  }
}
