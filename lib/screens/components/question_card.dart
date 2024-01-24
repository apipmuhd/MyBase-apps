import 'package:flutter/material.dart';
import 'package:flutter_dev/controllers/question_controller.dart';
import 'package:flutter_dev/models/Questions.dart';
import 'package:flutter_dev/screens/components/option.dart';
import 'package:flutter_dev/screens/constraints.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  // const QuestionCard({
  //   Key? key,
  //   required this.question,
  // }) : super(key: key);

  final Question question;
   final String userName; // Add this line to accept userName

  const QuestionCard({Key? key, required this.question, required this.userName})
      : super(key: key);
  



  @override
  Widget build(BuildContext context) {
      QuestionController controller = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: kBlackColor),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
              question.options.length,
              (index) => Option(
                  text: question.options[index], 
                  index: index, 
                  press: () => controller.checkAns(question, index),
                  ),
                  ),
             Text(
                        "Lets Start Quiz $userName",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.black),
             ),     
        ],
      ),
    );
  }
}
