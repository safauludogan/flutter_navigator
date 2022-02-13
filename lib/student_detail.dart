import 'package:flutter/material.dart';

import 'main.dart';

class StudentDetail extends StatelessWidget {
  final Student selectedStudent;

  const StudentDetail({required this.selectedStudent,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selected = ModalRoute.of(context)!.settings.arguments as Student;

    print("seçilen öğrenci :::: ${selected.name}");

    return Scaffold(
      appBar: AppBar(title: const Text('Öğrenci detay'),),
      body: Center(
        child: Column(
          children: [
            Text(selectedStudent.id.toString()),
            Text(selectedStudent.name.toString()),
            Text(selectedStudent.lastname.toString()),
          ],
        ),
      ),
    );
  }
}
