import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider<int> screenIndexProvider = StateProvider<int>((ref) => 0);
late PageController controller;
