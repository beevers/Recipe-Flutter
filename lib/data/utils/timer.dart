import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTimer extends ConsumerStatefulWidget {
  const CustomTimer({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomTimerState();
}

class _CustomTimerState extends ConsumerState<CustomTimer> {
  StateProvider<String> countDownProvider =
      StateProvider<String>((ref) => '0:00');
  void startCountdown() {
    //timerEnds describe when you want the timer to stop
    DateTime timerEnds = DateTime.now().add(const Duration(seconds: 60));

    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      DateTime currentTime = DateTime.now();

      if (currentTime.isAfter(timerEnds)) {
        timer.cancel();
      } else {
        Duration timerFrame = timerEnds.difference(currentTime);
        int days = timerFrame.inDays;
        int seconds = timerFrame.inSeconds % 60;
        int minutes = timerFrame.inMinutes % 60;
        int hours = timerFrame.inHours % 24;
        ref.read(countDownProvider.notifier).state =
            "${days == 0 ? '' : '$days:'}${hours == 0 ? '' : "$hours:"}${minutes.toString().length == 1 ? minutes.toString().padLeft(2, '0') : minutes}:${seconds.toString().padLeft(2, '0')}";
      }
    });
  }

  @override
  void initState() {
    startCountdown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      ref.watch(countDownProvider).toString().contains("-")
          ? "0:00"
          : ref.watch(countDownProvider).toString(),
    );
  }
}
