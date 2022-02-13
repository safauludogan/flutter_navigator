import 'dart:math';

import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  RedPage({Key? key}) : super(key: key);

  int _randomCount = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //Telefonun geri tuşu kontrolü
      onWillPop: () {
        _randomCount = Random().nextInt(100);
        Navigator.pop(context, _randomCount);
        return Future.value(
            true); //Bunu yazdığımız zaman telefonun kendi geri butonuna basıldığında çalışmasını engelliyor
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //Appbar'dan geri butonunu kapatıyoruz
          title: const Text('Red Page'),
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Red Page',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _randomCount = Random().nextInt(100);
                  Navigator.of(context).pop(_randomCount);
                },
                child: const Text('Geri dön')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/orangePage');
                },
                child: const Text('GoTo Orange')),
          ],
        ),
      ),
    );
  }
}
