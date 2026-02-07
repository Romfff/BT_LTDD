import 'package:flutter/material.dart';
import 'student_info_page.dart';
import 'teacher_info_page.dart';
import 'topic_info_page.dart';
import 'product_info_page.dart';
import 'group_info_page.dart';
import 'major_info_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bài tập giao diện Flutter")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            menuButton(context, "Bài 01: Sinh viên", StudentInfoPage()),
            menuButton(context, "Bài 01: Giảng viên", TeacherInfoPage()),
            menuButton(context, "Bài 02: Đề tài đồ án", TopicInfoPage()),
            menuButton(context, "Bài 03: Sản phẩm", ProductInfoPage()),
            menuButton(context, "Bài 04: Thông tin nhóm", GroupInfoPage()),
            menuButton(context, "Bài 05: Giới thiệu ngành học", MajorInfoPage()),
          ],
        ),
      ),
    );
  }

  Widget menuButton(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
        child: Text(title),
      ),
    );
  }
}
