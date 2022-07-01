import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/injector/injection_container.dart';
import 'package:news_app/common/theme/theme_data.dart';
import 'package:news_app/common/utils/database_util.dart';
import 'package:news_app/presentation/journey/news/headlines_list/headlines_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await DatabaseUtil.initDatabase();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme(context),
          home: child,
        );
      },
      child: const HeadlinesScreen(),
    );
  }
}
