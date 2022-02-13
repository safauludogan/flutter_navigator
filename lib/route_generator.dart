import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigator/main.dart';
import 'package:navigator/orange_page.dart';
import 'package:navigator/student_detail.dart';
import 'package:navigator/student_list.dart';
import 'package:navigator/yellow_page.dart';

//Genel bir rota sınıfı oluşturduk. Sayfalar arası geçişlerin hepsini buradan yönetiyoruz
//Aşağıdaki kod yapısında iOS ve android platformlarına göre sayfalar arası geçiş efektlerini ayarlıyoruz.
class RouteGenerator {
  static Route<dynamic>? _createRoute(
      Widget goingWidget, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
          settings: settings, builder: (context) => goingWidget);
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
          settings: settings, builder: (context) => goingWidget);
    } else {
      return MaterialPageRoute(
          settings: settings, builder: (context) => goingWidget);
    }
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _createRoute(HomePage(), settings);

      case '/orangePage':
        return _createRoute(OrangePage(), settings);

      case '/yellowPage':
        return _createRoute(YellowPage(), settings);

      case '/studentList':
        return _createRoute(StudentList(), settings);

      case '/studentDetail':
        var selectedStudent = settings.arguments as Student;
        return _createRoute(StudentDetail(selectedStudent: selectedStudent), settings);

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                //Bu yapı sayesinde, rota oluştururken bir hata ile karşılaşırsa standart bir(404) sayfaya yönelndiriyoruz
                appBar: AppBar(title: const Text('404')),
                body: const Center(
                  child: Text('Sayfa bulunamadı'),
                )));
    }
  }
}
