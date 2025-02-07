import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class HelperFunction {
  static Color? getColor(String value) {

    //define product colors
    
  
  if (value == 'green') {
    return Color(0xFF307351);
  } else if (value == 'red') {
    return Colors.red;
  }
  else if (value == 'blue') {
    return Colors.blue;
  }
  else if (value == 'yellow') {
    return Color(0xFFEDF060);
  } else if (value == 'orange') {
    return Color(0xFFF86624);
  } else if (value == 'purple') {
    return Colors.purple;
  } else if (value == 'pink') {
    return Colors.pink;
  } else if (value == 'brown') {
    return Colors.brown;
  } else if (value == 'grey') {
    return Colors.grey;
  } else if (value == 'black') {
    return Color(0xFF2F323A);
  } else if (value == 'white') {
    return Color(0xFFF7F7F7);
  } else {
    return null;
  }
}

static void showSnackBar(String title, String message) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

static void showAlert(String title, String message) {
  showDialog(
    context: Get.context!, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), 
          child: Text('OK')),
        ],
      );
    }
  );
}

static void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
}

static String truncateText(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;}
    else {
      return '${text.substring(0, maxLength)}...';
    }
}

static bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

static Size screenSize() {
  return MediaQuery.of(Get.context!).size;
}

static double screenWidth() {
  return MediaQuery.of(Get.context!).size.width;
}

static double screenHeight() {
  return MediaQuery.of(Get.context!).size.height;
}

static String gotFormattedDate(DateTime date, {String format = 'dd-MM-yyyy'}) {
  return DateFormat(format).format(date);
}

static List<String> removeDuplicates(List<String> list) {
  return list.toSet().toList();
}

static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
  final wrappedList = <Widget>[];
  for (var i = 0; i < widgets.length; i += rowSize) {
    final rowChildren = widgets.sublist(i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
    wrappedList.add(Row(children: rowChildren));
  }
  return wrappedList;
}

}