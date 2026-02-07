import 'package:flutter/material.dart';

class MajorInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giới thiệu ngành học"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            majorSection(
              title: "Ngành Công nghệ Thông tin (CNTT)",
              content:
                  "Ngành Công nghệ Thông tin đào tạo sinh viên có kiến thức "
                  "về lập trình, cơ sở dữ liệu, mạng máy tính, phát triển phần mềm "
                  "và ứng dụng công nghệ vào thực tiễn. "
                  "Sinh viên ra trường có thể làm lập trình viên, kỹ sư phần mềm, "
                  "quản trị hệ thống, phân tích dữ liệu.",
            ),

            SizedBox(height: 20),

            majorSection(
              title: "Ngành An toàn Thông tin (ATTT)",
              content:
                  "Ngành An toàn Thông tin đào tạo chuyên sâu về bảo mật hệ thống, "
                  "an ninh mạng, phòng chống tấn công mạng và bảo vệ dữ liệu. "
                  "Sinh viên có thể làm chuyên viên bảo mật, kiểm thử xâm nhập, "
                  "quản trị an ninh mạng tại các doanh nghiệp và tổ chức.",
            ),

            SizedBox(height: 20),

            Text(
              "Khoa Công nghệ Thông tin\n"
              "Trường Đại học Công Thương TP. Hồ Chí Minh",
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget majorSection({
    required String title,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
