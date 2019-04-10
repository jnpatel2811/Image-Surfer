// This sample shows creation of a [Card] widget that can be tapped. When
// tapped this [Card]'s [InkWell] displays an "ink splash" that fills the
// entire card.

import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App to showcase random images',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImagesListWidget(),
    );
  }
}

class ImagesListWidget extends StatelessWidget {
  final controller = new PageController(initialPage: Random().nextInt(1000));

  ImagesListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new PageView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return _getImageCard(index);
        },
      ),
    );
  }

  Widget _getImageCard(int index) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        child: Stack(
          children: <Widget>[
            Center(
              child: new CircularProgressIndicator(),
            ),
            new Center(
              child: _getRandomImage(index),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getRandomImage(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        'https://picsum.photos/300?image=$index',
      ),
    );
  }
}
