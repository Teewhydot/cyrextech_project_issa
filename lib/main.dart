import 'package:cyrextech_project_issa/features/task_2/presentation/views/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const ProjectHome());
}

class ProjectHome extends StatelessWidget {
  const ProjectHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const ProductDetails(),
      ),
    );
  }
}
