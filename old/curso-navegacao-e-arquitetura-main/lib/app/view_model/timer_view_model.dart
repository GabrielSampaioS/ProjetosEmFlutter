import 'package:flutter/material.dart';
import 'package:fokus/app/shared/utils/app_config.dart';
import 'dart:async';

class TimeViewModel extends ChangeNotifier {
  bool isPlaying = false;
  bool isPaused = false;

  Timer? time;
  Duration duration = Duration.zero;

  // ------- GETTERS DE UI (MVVM REAL) -------

  String get formattedTime =>
      "${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";

  Color get buttonColor => isPlaying ? Colors.red : AppConfig.buttonColor;
  Color get buttonColorPause =>
      isPaused ? Colors.lightGreenAccent : const Color.fromRGBO(54, 244, 67, 1);

  IconData get buttonIcon => isPlaying ? Icons.pause : Icons.play_arrow;
  IconData get buttonIconPause => isPaused ? Icons.pause : Icons.play_arrow;

  String get buttonText => isPlaying ? "00:00" : "Iniciar";
  String get buttonTextPausa => isPaused ? "Retornar" : "Pausar";

  // ------- AÇÕES -------

  void togglePlay(int initialMinutes) {
    if (!isPlaying) {
      // começando do zero
      duration = Duration.zero;
      isPaused = false;
      isPlaying = true;
      notifyListeners();
      _startTimer(initialMinutes);
      return;
    } else {
      stopTime();
    }
  }

  void togglePause() {
    if (!isPlaying) return;

    isPaused = !isPaused;
    notifyListeners();
  }

  void _startTimer(int initialMinutes) {
    time?.cancel();

    time = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!isPlaying) return;
      if (isPaused) return;

      if (duration.inMinutes < initialMinutes) {
        duration += Duration(seconds: 1);
        notifyListeners();
      } else {
        stopTime();
      }
    });
  }

  void stopTime() {
    isPlaying = false;
    isPaused = false;
    time?.cancel();
    duration = Duration.zero;

    notifyListeners();
  }
}
