//Muhammad Nazrin Bin Hazrul Nizam (S63683)
//CSM3114
//22 Oct 2023 9.20 am
import 'package:flutter/material.dart';
// import 'package:quiz_app/answer.dart';
// import 'package:quiz_app/question.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
 
class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
    // Define a lists
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score':10},
          {'text': 'Red', 'score':5},
          {'text': 'Green', 'score':3},
          {'text': 'Blue', 'score':1},
          
          ],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Tiger', 'score':10},
          {'text': 'Snake', 'score':5},
          {'text': 'Mouse', 'score':3},
          {'text': 'Cat', 'score':1},
          
          ],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': [
          {'text': 'Afiq', 'score':10},
          {'text': 'MdNor', 'score':5},
          {'text': 'Ajmal', 'score':3},
          {'text': 'Abe', 'score':1},
          
          ],
      },
      {
        'questionText': 'What\'s your favorite food?',
        'answers': [
          {'text': 'Nasi Lemak', 'score':10},
          {'text': 'Lontong', 'score':5},
          {'text': 'Nasi Ganja', 'score':3},
          {'text': 'tak makan', 'score':1},
          
          ],
      }
    ];

    var _questionIndex = 0;
    var _totalScore = 0;

    void _resetQuiz() {
      setState(() {
        _questionIndex = 0;
        _totalScore = 0;
      });
    }

    void _answerQuestion(int score) {
      // print('Answer chosen..!');
      _totalScore += score;
      setState(() {
        _questionIndex = _questionIndex + 1;
      });

      print(_questionIndex);

      if (_questionIndex < questions.length) {
        print('We have more questions!');
      } else {
        print('No more questions!');
      }
    }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('My Quiz App')),
        body: _questionIndex < questions.length
            ? Quiz(
              question: questions, 
              answerQuestion: _answerQuestion, 
              questionIndex: _questionIndex,
              )
            :Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
