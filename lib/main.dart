import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:za_ui/constants/app_colors.dart';
import 'package:za_ui/controller/product_details_con.dart';
import 'package:za_ui/views/product_details_view/product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ckPrimaryMaterialColor,
      ),
      home:  ProductDetailPage()
    );
  }
}
