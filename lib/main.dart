import 'package:flutter/material.dart';
// import 'package:flutter_dev/screens/components/body.dart';
import 'package:flutter_dev/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
  // runApp(GameWidget<MyGameAudio>(game: MyGameAudio()));
}

//apple
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of Mybase application.
  @override
  Widget build(BuildContext context) {
  

    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const WelcomeScreen(),
    );
  }
}

// class MyGameAudio extends FlameGame with TapDetector {
//   @override
//   void onLoad() async {
//     Future<void> onLoadGame() async {
//       super.onLoad();
//     }

//     @override
//     void onTapUp(TapUpDetails info) {
//       FlameAudio.bgm.play('trackbg.mp3');
//     }
//   }
// }
