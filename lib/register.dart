// 알람 등록 화면

import 'package:flutter/material.dart';
import 'main.dart';

class Registernewalarm extends StatefulWidget {
  const Registernewalarm({super.key});

  @override
  _Registernewalarm createState() => _Registernewalarm();
}

class _Registernewalarm extends State<Registernewalarm> {
 TimeOfDay _wakeUpTime = TimeOfDay.now();
 TimeOfDay _wakeUpHurryTime = TimeOfDay.now();
 String _wakeUpTimeText = '';
 String _wakeUpHurryTimeText = '';

 // 새로운 페이지로 네비게이션 하는 메서드
 void _navigateToMainPage() {
   Navigator.push(
     context,
     MaterialPageRoute(builder: (context) => const MyHomePage()),
   );
 }

 // 일어나는 시간 설정 다이얼로그
 Future<void> _wantToWakeup(BuildContext context) async {
   final TimeOfDay? picked = await showTimePicker(
       context: context,
       initialTime: _wakeUpTime
   );
   if (picked != null && picked != _wakeUpTime) {
     setState(() {
       _wakeUpTime = picked;
       _wakeUpTimeText = '최초 알람 시간 : ${_wakeUpTime.format(context)}';
     });
   }
 }

 // 늦게 일어나면 큰일나는 시간 설정 다이얼로그
 Future<void> _wantToWakeupHurry(BuildContext context) async {
   final TimeOfDay? picked = await showTimePicker(
       context: context,
       initialTime: _wakeUpHurryTime
   );
   if (picked != null && picked != _wakeUpHurryTime) {
     setState(() {
       _wakeUpHurryTime = picked;
       _wakeUpHurryTimeText = '더 자면 큰일 나는 시간 : ${_wakeUpHurryTime.format(context)}';
     });
   }
 }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('깨울랏 등록하기'),
     ),
     body: Stack(
       children: <Widget>[
         Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               const SizedBox(height: 20),
               ElevatedButton(
                 onPressed: () => _wantToWakeup(context),
                 child: const Text('일어나고 싶은 시간 설정하기'),
               ),
               const SizedBox(height: 10),
               Text(_wakeUpTimeText),
               const SizedBox(height: 50),
               ElevatedButton(
                   onPressed: () => _wantToWakeupHurry(context),
                   child: const Text('더 자면 큰일나는 시간 설정하기')
               ),
               const SizedBox(height: 10),
               Text(_wakeUpHurryTimeText),
             ],
           ),
         ),
         Positioned(
           bottom: 20,
           right: 0,
           left: 0,
           child: Center(
             child: ElevatedButton(
               onPressed: _navigateToMainPage,
               child: const Text('깨울랏 등록하기'),
             )
           )
         ),
       ]
     )
   );
 }
}