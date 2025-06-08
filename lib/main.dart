import 'package:cyrextech_project_issa/features/task_1/presentation/views/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'core/client/graphql_client.dart';

void main() {
  runApp(const ProjectHome());
}

class ProjectHome extends StatelessWidget {
  const ProjectHome({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> client =
        GraphQLConfiguration.initializeClient();
    return GraphQLProvider(
      client: client,
      child: ScreenUtilInit(
        designSize: Size(390, 844),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: const Welcome(),
        ),
      ),
    );
  }
}
