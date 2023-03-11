import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:junction/constants.dart';
import 'package:junction/models/message.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: mainClr,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: message.sent ? TextDirection.rtl : TextDirection.ltr,
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(20.0),
          //   child: SizedBox(
          //     height: 35.0,
          //     child: Image.asset(
          //       getImage(message.sent ? 'own' : 'cat_ava'),
          //     ),
          //   ),
          // ),
          const SizedBox(width: 5.0),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 30,
              maxWidth: MediaQuery.of(context).size.width * .5,
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: message.sent
                    ? mainClr.withOpacity(.5)
                    : grey.withOpacity(.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: Text(
                message.text,
                textAlign: message.sent ? TextAlign.right : TextAlign.left,
              ),
            ),
          ),
          if (!message.sent)
            GestureDetector(
              onTap: () {},
              child: Transform.rotate(
                angle: pi / 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    'assets/send.svg',
                    color: mainClr,
                    height: 25.0,
                    width: 25.0,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
