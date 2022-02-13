import 'package:flutter/material.dart';
import 'package:navigator/main.dart';

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int elementCount = ModalRoute.of(context)!.settings.arguments as int;
    List<Student> allStudents = List.generate(
        elementCount,
        (index) =>
            Student(index + 1, 'İsim : ${index + 1}', 'Soyisim ${index + 1}'));

    print('eleman sayısı alındı: $elementCount');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenci listesi'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: (){
              var selected = allStudents[index];
              Navigator.pushNamed(context, '/studentDetail',arguments: selected);
            },
            leading: CircleAvatar(
              child: Text(allStudents[index].id.toString()),
            ),
            title: Text(allStudents[index].name.toString()),
            subtitle: Text(allStudents[index].lastname.toString()),
          );
        },
        itemCount: elementCount,
      ),
    );
  }
}
