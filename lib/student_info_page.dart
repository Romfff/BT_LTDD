import 'package:flutter/material.dart';

class StudentInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thông tin sinh viên")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),

            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/student.jpg"),
            ),

            SizedBox(height: 20),

            text("Họ và tên: Nguyễn Văn A", Colors.blue),
            text("MSSV: 2001221234", Colors.red),
            text("Lớp: 13DHTH02", Colors.red),
            text("Khóa: 13 Đại học", Colors.red),
            text("Ngành: Công nghệ thông tin", Colors.red),
            text(
              "Trường: Đại học Công Thương\nTP. Hồ Chí Minh",
              Colors.red,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Trở về"),
            ),
          ],
        ),
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
