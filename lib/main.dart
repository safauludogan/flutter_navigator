import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator/green_page.dart';
import 'package:navigator/red_page.dart';
import 'package:navigator/route_generator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      // home: HomePage(),
      /*  routes: {
        '/redPage': (context) => RedPage(),
        //'/' : (context)=>HomePage(),
        '/orangePage': (context) => const OrangePage(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(//Bu yapı sayesinde, rota oluştururken bir hata ile karşılaşırsa standart bir sayfaya yönelndiriyoruz
          builder: (context) => Scaffold(
              appBar: AppBar(title: const Text('error')),
              body: const Center(
                child: Text('404'),
              ))),*/
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                int? returnValue = await Navigator.push<int>(
                    context,
                    CupertinoPageRoute(
                        builder: (redContext) => RedPage())); //IOS stili açılış
                print('Gelen sayı $returnValue');
              },
              style: ElevatedButton.styleFrom(primary: Colors.red.shade300),
              child: const Text(
                'Kırmızı sayfaya gir IOS',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.push(context, route);
                Navigator.of(context)
                    .push<int>(MaterialPageRoute(
                        //Android stili açılış
                        builder: (redContext) => RedPage()))
                    .then((int? value) => debugPrint('Gelen sayı $value'));
              },
              style: ElevatedButton.styleFrom(primary: Colors.red.shade600),
              child: const Text(
                'Kırmızı sayfaya gir Android',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              style: ElevatedButton.styleFrom(primary: Colors.red.shade600),
              child: const Text(
                'Maybe Pop kullanımı',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  print("evet pop olabilir.");
                } else
                  print('hayır olamaz');
              },
              style: ElevatedButton.styleFrom(primary: Colors.red.shade600),
              child: const Text(
                'Can Pop kullanımı',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        const GreenPage())); //pushReplacement'in amacı, yeni bir sayfaya geçiş yaparken stack yapısında, gittiğimiz sayfayı en üste koyoruz ve back yaptığımızda uyuglamayı kapatıyoruz
              },
              style: ElevatedButton.styleFrom(primary: Colors.red.shade600),
              child: const Text(
                'Push Replacament kullanımı',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/orangePage');
              },
              style: ElevatedButton.styleFrom(primary: Colors.blue.shade600),
              child: const Text(
                'PushNamed kullanımı',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/yellowPage');
              },
              style: ElevatedButton.styleFrom(primary: Colors.yellow.shade600),
              child: const Text(
                'PushNamed kullanımı',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/studentList', arguments: 80);
              },
              style: ElevatedButton.styleFrom(primary: Colors.orange.shade600),
              child: const Text(
                'Liste Oluştur',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Student {
  final int id;
  final String name;
  final String lastname;

  Student(this.id, this.name, this.lastname);
}
