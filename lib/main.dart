import 'package:flutter/material.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 메시지를 저장할 상태 변수
  String message = '😎 당신의 수면을 괴롭혀드립니다 😎';

  // 새로운 페이지로 네비게이션 하는 메서드
  void _navigateToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder : (context) => const Registernewalarm()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⏰깨울랏'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToRegisterPage,
              child: const Text('깨울랏 등록하기'),
            ),
          ],
        ),
      ),
    );
  }
}
