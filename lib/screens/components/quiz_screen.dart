import 'package:flutter/material.dart';
import 'package:flutter_dev/controllers/question_controller.dart';
import 'package:get/get.dart';
// import 'package:websafe_svg/websafe_svg.dart';

import 'body.dart';

class QuizScreen extends StatelessWidget {
  final String userName;
  // ignore: use_super_parameters
  const QuizScreen({Key? key, required this.userName}) : super(key: key);
  // const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('userName in QuizScreen: $userName');
    QuestionController controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: controller.nextQuestion, child: const Text("skip")
          ),
        ],
      ),
      body: Body(userName: userName),
      

      // (
      //   children: [
      //     Positioned.fill(
      //       child: WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
      //     ),
      //   ],
      // ),
    );
  }
}
