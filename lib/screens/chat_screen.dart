import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:junction/constants.dart';
import 'package:junction/controllers/audio_controller.dart';
import 'package:junction/controllers/chat_controller.dart';
import 'package:junction/screens/widgets/input_text.dart';
import 'package:junction/screens/widgets/message_card.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: greyish,
      body: Column(
        children: [
          Image.asset('assets/kyo_black.png'),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // height: 320.0,
                  child: Consumer<ChatController>(
                      builder: (context, chatController, child) {
                    return ListView.builder(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      reverse: false,
                      itemCount: chatController.discussion.length,
                      itemBuilder: (context, index) {
                        return MessageCard(
                          message: chatController.discussion[index],
                        );
                      },
                    );
                  }),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 80.0,
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80.0,
                        width: MediaQuery.of(context).size.width - 100.0,
                        child: Consumer<ChatController>(
                            builder: (context, chatController, child) {
                          return PeInput(
                            hintText: '',
                            controller: chatController.messageController,
                            decorations: InputDecoration(
                              filled: true,
                              fillColor: white,
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: mainClr,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: mainClr,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              hintStyle: const TextStyle(
                                color: grey,
                                fontSize: 15.0,
                                letterSpacing: 1,
                              ),
                              suffixIcon: Consumer<ChatController>(
                                  builder: (context, chatController, child) {
                                return GestureDetector(
                                  onTap: () {
                                    chatController.sendMessage();
                                  },
                                  child: Transform.rotate(
                                    angle: pi / 2,
                                    child: SvgPicture.asset(
                                      'assets/send.svg',
                                      color: mainClr,
                                      height: 25.0,
                                      width: 25.0,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                );
                              }),
                              hintTextDirection: TextDirection.rtl,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            ),
                          );
                        }),
                      ),
                      Consumer<AudioController>(
                          builder: (context, audioController, child) {
                        return Consumer<ChatController>(
                            builder: (context, chatController, child) {
                          return GestureDetector(
                            onLongPress: () {
                              audioController.listen();
                            },
                            onLongPressEnd: (details) {
                              audioController.pause();
                              chatController.sendIt();
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: mainClr,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SvgPicture.asset(
                                'assets/voice.svg',
                                color: mainClr,
                                height: 25.0,
                                width: 25.0,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          );
                        });
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
