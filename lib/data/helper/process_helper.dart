import 'package:intl/intl.dart';

abstract class AppServicesInterface {}

class AppServices {
  static String processDate(String dateTime) {
    DateTime formatted = DateTime.parse(dateTime);

    // Define the desired date format
    String formattedDate = DateFormat('MMM dd, yyyy').format(formatted);

    return formattedDate;
  }

  //This is add integer that are enclosed in strings
  static double addString(String fnum, String snum) {
    if (fnum.contains(",") || snum.contains(",")) {
      String fnumWithoutComma = fnum.replaceAll(',', '');
      String snumWithoutComma = snum.replaceAll(',', '');
      double result =
          double.parse(fnumWithoutComma) + double.parse(snumWithoutComma);
      return result;
    } else {
      double result = double.parse(fnum) + double.parse(snum);
      return result;
    }
  }

  static double removeAllComma(String value) {
    if (value.contains(",")) {
      String valueWithoutComma = value.replaceAll(',', '');
      double result = double.parse(valueWithoutComma);
      return result;
    } else {
      double result = double.parse(value);
      return result;
    }
  }

  static String processDateTime(String dateTime) {
    DateTime formatted = DateTime.parse(dateTime);

    // Define the desired date format
    String formattedDate =
        DateFormat('MMM dd, yyyy, hh:mm a').format(formatted);

    return formattedDate;
  }

  static bool isDateToday(String dateTime) {
    DateTime date = DateTime.parse(dateTime);
    // Get the current date
    DateTime today = DateTime.now();
    // Compare the year, month, and day of the given date with today's date
    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;
  }

  static bool isYesterday(String dateTime) {
    DateTime date = DateTime.parse(dateTime);
    // Get the current date
    DateTime now = DateTime.now();

    // Subtract one day from the current date
    DateTime yesterday = now.subtract(const Duration(days: 1));

    // Compare the date portion of the input date with yesterday's date
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  static bool isSameDay(String? dateTime1, String? dateTime2) {
    if (dateTime1 == null || dateTime2 == null) {
      return false;
    }
    DateTime date1 = DateTime.parse(dateTime1);
    DateTime date2 = DateTime.parse(dateTime2);
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static getDay(String date) {
    try {
      DateTime parseDate = DateTime.parse(date);

      return "${parseDate.day}";
    } catch (e) {
      return '';
    }
  }

  static String processTime(String? date) {
    try {
      return date!.split('T')[1].split('.')[0];
    } catch (e) {
      //
    }
    return "";
  }

  // process money partition
  static String processPrice(String price) {
    try {
      return NumberFormat().format(double.parse(price));
    } catch (e) {
      //
    }
    return '0.00';
  }

  static String processNumber(String price) {
    try {
      return NumberFormat.compact().format(double.parse(price));
    } catch (e) {
      //
    }
    return '0.00';
  }

  static String generateInit(String name) {
    if (name.split(' ').length >= 2) {
      return "${name.split(' ')[0][0].toUpperCase()}${name.split(' ')[1][0].toUpperCase()}";
    } else {
      return name[0].toUpperCase();
    }
  }

  static String hideCardNumber(String number) {
    if (number.length < 10) {
      return number;
    } else {
      return '${number.substring(0, 3)}***********${number.substring(number.length - 3, number.length)}';
    }
  }

  static String timeAgo(String dateTime) {
    final now = DateTime.now();
    final difference = now.difference(DateTime.parse(dateTime));

    if (difference.inSeconds < 5) {
      return 'just now';
    } else if (difference.inMinutes < 1) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }

  static bool dateIsPassed(String dateTime) {
    DateTime now = DateTime.now();
    return DateTime.parse(dateTime).isBefore(now);
  }

  static String formatDuration(int durationInSeconds) {
    int minutes = durationInSeconds ~/ 60;
    int seconds = durationInSeconds % 60;

    String formattedDuration =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    return formattedDuration;
  }
}
