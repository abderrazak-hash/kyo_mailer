import 'package:flutter/material.dart';
import 'package:junction/controllers/audio_controller.dart';
import 'package:junction/controllers/chat_controller.dart';
import 'package:junction/screens/intro_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    const KYOApp(),
  );
}

class KYOApp extends StatelessWidget {
  const KYOApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AudioController>(
          create: (context) => AudioController(),
        ),
        ChangeNotifierProvider<ChatController>(
          create: (context) => ChatController(),
        ),
      ],
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: IntroScreen(),
        );
      },
    );
  }
}
