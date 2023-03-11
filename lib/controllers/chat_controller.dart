import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:junction/models/message.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ChatController extends ChangeNotifier {
  File? audio;

  Future<String> getVoice() async {
    final path = await getExternalStorageDirectory();
    final voicePath = join(path!.path, 'sound.m4a');
    // audio = File(voicePath);
    return voicePath;
  }

  late String respStr;

  late dynamic data;

  Future<void> sendIt() async {
    String urlProduct = 'https://kyo-mail.onrender.com/voice/';
    var postUri = Uri.parse(urlProduct);

    http.MultipartRequest request = http.MultipartRequest(
      "POST",
      postUri,
    );

    String soundPath = await getVoice();

    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'audio',
      soundPath,
    );

    request.headers.addAll({'Content-Type': 'multipart/form-data'});
    // request.headers.addAll({'Content-Type': 'application/json'});

    request.files.add(multipartFile);

    http.StreamedResponse response = await request.send();

    respStr = await response.stream.bytesToString();
    print(response.statusCode);
    print(respStr);
    data = jsonDecode(respStr);
    messageController.text = data['text'];
  }

  sendMessage() {
    if (messageController.text != '') {
      addMessage(
        Message(text: data['text'], sent: true),
      );
      talkToGPT(messageController.text);
      messageController.clear();
    }
  }

  talkToGPT(String question) async {
    String urlProduct = 'https://kyo-mail.onrender.com/chat/';

    // http.get(
    //   Uri.parse(urlProduct),
    //   headers: {'Content-Type': 'multipart/form-data'},
    // );

    var response = await http.post(
      Uri.parse(urlProduct),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'prompt': question,
        },
      ),
    );
    var resp = jsonDecode(response.body);
    addMessage(
      Message(text: resp['suggestion'], sent: false),
    );
  }

  List<Message> discussion = [];

  addMessage(message) {
    discussion.add(message);
    notifyListeners();
  }

  TextEditingController messageController = TextEditingController();
}

// /chat // prompt
