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
      home: const FlightAnimation(),
    );
  }
}

class FlightAnimation extends StatefulWidget {
  const FlightAnimation({super.key});

  @override
  State<FlightAnimation> createState() => _FlightAnimationState();
}

class _FlightAnimationState extends State<FlightAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  // 都市データを追加（位置と名前）
  final List<Map<String, dynamic>> _cityData = [
    {'position': 100.0, 'name': '東京'},
    {'position': 200.0, 'name': '静岡'},
    {'position': 300.0, 'name': '名古屋'},
    {'position': 400.0, 'name': '大阪'},
    {'position': 500.0, 'name': '福岡'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          // 縦に繋がる線
          Positioned(
            left: 40,
            top: _cityData.first['position'],
            height: _cityData.last['position'] - _cityData.first['position'],
            child: Container(width: 2, color: Colors.white24),
          ),

          // 丸と都市名を生成
          ..._cityData.map(
            (city) => Positioned(
              left: 20,
              top: city['position'],
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20), // 都市名との間隔
                  Text(
                    city['name'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 飛行機アイコン
          Positioned(
            left: 80,
            top: _cityData.first['position'],
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                // アニメーションを最初の丸で停止
                final progress =
                    _animation.value < 0.2 ? _animation.value * 5 : 0.0;
                return Transform.translate(
                  offset: Offset(
                    0,
                    (_cityData.last['position'] - _cityData.first['position']) *
                        progress,
                  ),
                  child: Transform.rotate(
                    angle: 3.14159,
                    child: const Icon(
                      Icons.flight,
                      size: 150,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
