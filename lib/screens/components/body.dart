import 'package:flutter/material.dart';
import 'package:flutter_dev/controllers/question_controller.dart';
import 'package:flutter_dev/screens/components/progress_bar.dart';
import 'package:flutter_dev/screens/components/question_card.dart';
import 'package:flutter_dev/screens/constraints.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatelessWidget {
   final String userName;

  const Body({super.key, required this.userName});
  // const Body({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());

    return Stack(
      children: [
        Positioned.fill(
          child: WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.cover),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child:Obx( 
                  () => Text.rich(
                  TextSpan(
                    text: "Question ${questionController.questionNumber}",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: kSecondaryColor),
                    children: [
                      TextSpan(
                        text: "/${questionController.questions.length}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: kSecondaryColor),
                      ),
                    ],
                  ),
                ),

              ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: kDefaultPadding),
              Expanded(
                  child: PageView.builder(
                    //block swipe to next qn
                    physics: const NeverScrollableScrollPhysics(),
                    controller: questionController.pageConroller,
                    onPageChanged: questionController.updateTheQnNum,
                    itemCount: questionController.questions.length,
                itemBuilder: (context, index) => QuestionCard(
                  question: questionController.questions[index],
                  userName: userName, // Pass the userName to QuestionCard
                ),
              ))
            ],
          ),
        ),
      ],
    );
  }
}







// import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:flutter_dev/constants.dart';
// // import 'package:flutter_dev/controllers/question_controller.dart';
// // import 'package:flutter_dev/models/Questions.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// import 'package:flutter_dev/constant.dart';
// import '../../../controllers/question_controller.dart';
// import 'progress_bar.dart';
// import 'question_card.dart';

// class Body extends StatelessWidget {
//   const Body({
   
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // So that we have acccess our controller
//     // QuestionController _questionController = Get.put(QuestionController());
//     QuestionController questionController = Get.put(QuestionController());
//     return Stack(
//       children: [
//         SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
//         SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                 child: ProgressBar(),
//               ),
//               // SizedBox(height: kDefaultPadding),
//               const SizedBox(height: kDefaultPadding),
//               Padding(
//                 // padding:
//                 //     const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                 child: Obx(
//                   () => Text.rich(
//                     TextSpan(
//                       text:
//                           // "Question ${_questionController.questionNumber.value}",
//                           "Question ${questionController.questionNumber.value}",
//                       style: Theme.of(context)
//                           .textTheme
//                           // .headline4
//                           // .copyWith(color: kSecondaryColor),
//                           .headlineMedium
//                           ?.copyWith(color: kSecondaryColor),
//                       children: [
//                         TextSpan(
//                           // text: "/${_questionController.questions.length}",
//                           text: "/${questionController.questions.length}",
//                           style: Theme.of(context)
//                               .textTheme
//                               // .headline5
//                               // .copyWith(color: kSecondaryColor),
//                               .headlineSmall
//                               ?.copyWith(color: kSecondaryColor),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               // Divider(thickness: 1.5),
//               // SizedBox(height: kDefaultPadding),
//               const Divider(thickness: 1.5),
//               const SizedBox(height: kDefaultPadding),
//               Expanded(
//                 child: PageView.builder(
//                   // Block swipe to next qn
//                   // physics: NeverScrollableScrollPhysics(),
//                   // controller: _questionController.pageController,
//                   // onPageChanged: _questionController.updateTheQnNum,
//                   // itemCount: _questionController.questions.length,
//                   physics: const NeverScrollableScrollPhysics(),
//                   controller: questionController.pageController,
//                   onPageChanged: questionController.updateTheQnNum,
//                   itemCount: questionController.questions.length,
//                   itemBuilder: (context, index) => QuestionCard(
//                       // question: _questionController.questions[index]),
//                       question: questionController.questions[index]),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }