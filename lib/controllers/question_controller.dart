import 'package:flutter/cupertino.dart';
import 'package:flutter_dev/models/Questions.dart';
import 'package:flutter_dev/screens/components/score_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

class QuestionController extends GetxController

    // ignore: deprecated_member_use
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageConroller => _pageController;
 

  final List<Question> _questions = sampleData
      .map(
        (question) => Question(
            id: question.id,
            question: question.question,
            options: question.options,
            answer: question.answer),
      )
      .toList();

  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;
  //  int get numOfCorrectAns => _questions.where((q) => q.answer == q.selectedAns).length;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    //start animation
    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();
    super.onInit();
  }

  // @override
  // void onClose() {
 
  //   super.onClose();
  //   _animationController.dispose();
  //   _pageController.dispose();
  // }
  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  // void checkAns(Question question, int selectedIndex) {
  //   _isAnswered = true;
  //   _correctAns = question.answer;
  //   _selectedAns = selectedIndex;

  //   if (_correctAns == _selectedAns) {
  //     _numOfCorrectAns++;
  //   }
  //   _questionNumber++;

  //   _animationController.stop();
  //   update();
  //   //lepas user pilih ans 3s pergi nxt page
  //   Future.delayed(const Duration(seconds: 3), () {
  //     nextQuestion();
  //   });
  // }
  

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    // if (_correctAns == _selectedAns) {
    //   _numOfCorrectAns++;
    // }
    // _questionNumber++;
    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    _animationController.stop();
    update();
    //lepas user pilih ans 3s pergi nxt page
    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() async {
    TextEditingController nameController = TextEditingController();
    String userName = nameController.text;

    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      //reset counter
      _animationController.reset();

      //then start back
      _animationController.forward().whenComplete(nextQuestion);

      
    } else {
      
      // Get.to( ScoreScreen(userName:'koko'));
      Get.to(ScoreScreen(userName: userName));
      
  
     
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void reset() {
    _isAnswered = false;
    _correctAns = 0;
    _selectedAns = 0;
    _questionNumber.value = 1;
    _numOfCorrectAns = 0;

    // Stop and reset animation controller
    _animationController.dispose();
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    // Reset page controller
    _pageController.jumpToPage(0);

    // Start animation controller
    _animationController.forward().whenComplete(nextQuestion);
  }
}
