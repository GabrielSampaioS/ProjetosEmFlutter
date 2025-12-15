import 'package:flutter/material.dart';

import 'package:fokus/app/shared/utils/app_config.dart';
import 'package:fokus/app/view_model/timer_view_model.dart';
import 'package:provider/provider.dart';
import '../../view_model/timer_view_model.dart';

class TimerWidget extends StatefulWidget {
  final int initialMinutes;

  const TimerWidget({super.key, required this.initialMinutes});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  //final timeViweModel = TimeViewModel();
  late TimeViewModel timeViewModel;

  @override
  void initState() {
    timeViewModel = Provider.of<TimeViewModel>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    timeViewModel.stopTime();
    super.dispose();
  }

  // -----------------------------
  // MAIN BUILD
  // -----------------------------

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(20, 68, 128, 0.5),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xff144480), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Estudar mais sobre o AnimatedBuilder
          AnimatedBuilder(
            animation: timeViewModel,
            builder: (context, child) {
              final duration = timeViewModel.duration;
              return Text(
                "${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}",
                style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'monospace',
                ),
              );
            },
          ),

          const SizedBox(height: 40),

          // Botões de controle
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ListenableBuilder(
              listenable: timeViewModel,
              builder: (context, child) {
                Color buttonColor = timeViewModel.buttonColor;
                IconData buttonIcon = timeViewModel.buttonIcon;
                String buttonText = timeViewModel.buttonText;

                return ElevatedButton(
                  onPressed: () {
                    timeViewModel.togglePlay(widget.initialMinutes);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(buttonIcon, color: AppConfig.backgroundColor),
                      const SizedBox(width: 10),
                      Text(
                        buttonText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppConfig.backgroundColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(color: Colors.transparent, thickness: 1),
          SizedBox(
            height: 56,
            child: ListenableBuilder(
              listenable: timeViewModel,
              builder: (context, child) {
                Color buttonColorPausa = timeViewModel.buttonColorPause;
                IconData buttonIconPausa = timeViewModel.buttonIconPause;
                String buttonTextPausa = timeViewModel.buttonTextPausa;

                if (timeViewModel.isPlaying) {
                  return ElevatedButton(
                    onPressed: () {
                      timeViewModel.togglePause();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColorPausa,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(buttonIconPausa, color: AppConfig.backgroundColor),
                        const SizedBox(width: 10),
                        Text(
                          buttonTextPausa,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppConfig.backgroundColor,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
