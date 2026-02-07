import 'package:flutter/material.dart';

class ProductInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thông tin sản phẩm")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== 3 HÌNH ẢNH SẢN PHẨM =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                productImage("assets/product1.jpg"),
                productImage("assets/product2.jpg"),
                productImage("assets/product3.jpg"),
              ],
            ),

            SizedBox(height: 20),

            info("Mã sản phẩm", "SP001"),
            info("Tên sản phẩm", "Laptop Dell"),
            info("Nhà sản xuất", "Dell"),
            info("Giá bán", "15.000.000 VNĐ"),
            info(
              "Mô tả",
              "Laptop phục vụ học tập và làm việc",
            ),
          ],
        ),
      ),
    );
  }

  Widget productImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        path,
        width: 90,
        height: 90,
        fit: BoxFit.cover,
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
