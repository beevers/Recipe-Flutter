import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TimeCounter extends ConsumerStatefulWidget {
  const TimeCounter({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimeCounterState();
}

class _TimeCounterState extends ConsumerState<TimeCounter> {
  StateProvider<bool> isFinishedProvider = StateProvider<bool>((ref) => false);
  late CountdownController controller;

  @override
  void initState() {
    controller = CountdownController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Countdown(
      controller: controller,
      seconds: 5,
      build: (BuildContext context, double time) =>
          ref.watch(isFinishedProvider)
              ? InkWell(
                  onTap: () {
                    controller.restart();
                  },
                  child: const Text("Resend"))
              : Text(time.toString()),
      interval: const Duration(seconds: 1),
      onFinished: () {
        ref.read(isFinishedProvider.notifier).state = true;
      },
    );
  }
}
