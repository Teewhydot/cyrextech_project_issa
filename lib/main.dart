import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'features/task_1/presentation/views/bicycle_home.dart';

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
        home: const BicycleHome(),
      ),
    );
  }
}
