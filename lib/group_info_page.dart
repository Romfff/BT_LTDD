import 'package:flutter/material.dart';

class GroupInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thông tin nhóm")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            info("Mã nhóm", "N01"),
            info("Tên nhóm", "Nhóm Flutter"),
            info("Số lượng thành viên", "3"),

            Divider(height: 30, thickness: 1),

            Text(
              "Danh sách thành viên",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            memberCard(
              "2001221234",
              "Nguyễn Văn A",
              "Nhóm trưởng",
            ),
            memberCard(
              "2001221235",
              "Trần Thị B",
              "Thành viên",
            ),
            memberCard(
              "2001221236",
              "Lê Văn C",
              "Thành viên",
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

  Widget memberCard(String mssv, String name, String role) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(name),
        subtitle: Text("MSSV: $mssv"),
        trailing: Text(
          role,
          style: TextStyle(
            color: role == "Nhóm trưởng" ? Colors.red : Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
