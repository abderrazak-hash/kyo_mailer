import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class AudioController extends ChangeNotifier {
  final record = Record();

  void listen() async {
    if (await record.hasPermission()) {
      final path = await getExternalStorageDirectory();
      await record.start(
        path: join(path!.path, 'sound.m4a'),
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        samplingRate: 44100,
      );
    }
  }

  void pause() {
    record.stop();
  }
}
