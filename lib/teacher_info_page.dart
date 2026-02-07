import 'package:flutter/material.dart';

class TeacherInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thông tin giảng viên")),
      body: Column(
        children: [
          SizedBox(height: 20),

          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/teacher.png"),
          ),

          SizedBox(height: 20),

          text("Giảng viên: Trần Thị A", Colors.blue),
          text("Khoa: Công nghệ Thông tin", Colors.red),
          text("Học hàm: Thạc sĩ", Colors.red),
          text("Chuyên ngành: CNPM", Colors.green),
          text(
            "Giảng dạy:\nNhập môn lập trình\nLập trình Windows\nLập trình Web",
            Colors.blue,
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Trở về"),
          ),
        ],
      ),
    );
  }

  Widget text(String content, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        content,
        style: TextStyle(fontSize: 16, color: color),
        textAlign: TextAlign.center,
      ),
    );
  }
}
