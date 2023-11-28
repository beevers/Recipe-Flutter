import 'package:flutter_riverpod/flutter_riverpod.dart';

bool serverStatus = false;
StateProvider<String> optionProvider = StateProvider<String>((ref) => 'All');
String extractedMinutes = '0.0';
