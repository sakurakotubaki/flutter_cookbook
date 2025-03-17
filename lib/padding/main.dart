import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SnackBarWidget(),
    );
  }
}

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Padding Demo')),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(16.0), child: Text('Hello World!')),
            Divider(),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('全体に16pxのPadding'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text('上に16pxのPadding'),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Text('右に16pxのPadding'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text('下に16pxのPadding'),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
              child: Text('縦横に5pxと16pxのPadding'),
            ),
            Divider(),
            Padding(
              padding:
                  EdgeInsets.lerp(EdgeInsets.zero, EdgeInsets.all(16.0), 0.5) ??
                  EdgeInsets.zero,
              child: Text('全体に16pxのPaddingの半分'),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child: Text('上下に8px、左右に16pxのPadding'),
            ),
          ],
        ),
      ),
    );
  }
}
