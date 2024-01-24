// import 'package:flutter/material.dart';
// import 'package:websafe_svg/websafe_svg.dart';

// class WelcomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:const Text('MyBase App'),
//       ),
//       body: Stack(
//         children: [WebsafeSvg.asset("assets/icons/bg.svg")],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:websafe_svg/websafe_svg.dart';

// class WelcomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: WebsafeSvg.asset(
//               "assets/icons/bg.svg",
//               fit: BoxFit.cover,

//             ),
//           ),
//           SafeArea(
//             child: Column(
//               children: [Text("Let's Play Quiz,", style: Theme.of(
//                 context).textTheme.headline4?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_dev/screens/components/quiz_screen.dart';
import 'package:flutter_dev/screens/components/score_screen.dart';
import 'package:flutter_dev/screens/constraints.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  Text(
                    "Let's Play Quiz,",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Text("Enter your information below"),
                  const Spacer(),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1C2341),
                        hintText: "Full Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        )),
                  ),
                  const Spacer(),
                  InkWell(
                    // onTap: () => Get.to(const QuizScreen()),
                    onTap: () {
                      if (nameController.text.isNotEmpty) {
                        // Pass the user's name to the QuizScreen only if it's not empty

                        Get.to(QuizScreen(userName: nameController.text));
                  
                      } else {
                        // Show a snackbar or any other feedback for an empty name
                        // For simplicity, I'm showing a snackbar here
                        Get.snackbar(
                          "Error",
                          "Please enter your name before starting the quiz",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }

                      // Get.to(QuizScreen(userName: nameController.text));
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Lets Start Quiz",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
