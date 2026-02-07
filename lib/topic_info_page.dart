import 'package:flutter/material.dart';

class TopicInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thông tin đề tài đồ án")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            info("Mã đề tài", "DT001"),
            info("Tên đề tài", "Quản lý sinh viên"),
            info("Số SV tối đa", "3"),
            info("Chuyên ngành", "Công nghệ phần mềm"),
            info("GV hướng dẫn", "Trần Thị A"),
            info(
              "Yêu cầu",
              "Biết Flutter, CSDL, API",
            ),
          ],
        ),
      ),
    );
  }

  Widget info(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(
              text: "$title: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
