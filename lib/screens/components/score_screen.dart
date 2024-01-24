import 'package:flutter/material.dart';
import 'package:flutter_dev/controllers/question_controller.dart';
import 'package:flutter_dev/screens/constraints.dart';
import 'package:flutter_dev/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '';

class ScoreScreen extends StatelessWidget {
  final String userName;
  // final AudioPlayer audioPlayer = AudioPlayer();

   ScoreScreen({Key? key, required this.userName});

  // const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('userName in ScoreScreen:  $userName');
    // QuestionController qnController = Get.put(QuestionController());
    QuestionController qnController = Get.find<QuestionController>();
    // Play clapping sound effect
    // playClappingSound();

    // Print userName to check its value

    // Calculate the score percentage
    double scorePercentage =
        (qnController.numOfCorrectAns / qnController.questions.length) * 100;

    // Determine the message based on the score percentage
    String message = "";
    if (scorePercentage < 50) {
      message = "You are doing great $userName . Let's do better!";
    } else if (scorePercentage >= 50 && scorePercentage < 80) {
      message = "Congratulations $userName ! You are smart!";
    } else {
      message = "Congratulations, $userName ! You are great professor!";
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                "${qnController.numOfCorrectAns * 10}/${qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: kSecondaryColor),
              ),
              Text(
                message,
                style: const TextStyle(
                  color: kSecondaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
//               ElevatedButton(
//   onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ScoreScreen(userName: 'yusuf'),
//       ),
//     );
//   },
//   child: const Text('Navigate to ScoreScreen'),
// ),
              ElevatedButton(
                onPressed: () {
                  qnController.reset();
                  // Navigate to the quiz screen using GetX navigation
                  Get.offAll(const WelcomeScreen());
                },
                child: const Text("Start New Game"),
              ),
            ],
          )
        ],
      ),
    );
  }
// void playClappingSound() async {
//   try {
//     await audioPlayer.play('assets/sounds/success-fanfare-trumpets-6185.mp3' );
//   } catch (e) {
//     print('Error playing sound: $e');
//   }
// }
}
