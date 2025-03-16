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
      appBar: AppBar(title: const Text('SnackBar Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(
              backgroundColor: Colors.black.withValues(alpha: 0.3),
              content: Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('コメントを送信しました'),
                ],
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Show SnackBar'),
        ),
      ),
    );
  }
}
