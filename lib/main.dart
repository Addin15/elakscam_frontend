import 'package:elakscam_frontend/configs/color.dart';
import 'package:elakscam_frontend/pages/nav.dart';
import 'package:elakscam_frontend/services/page_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => PageService()),
          ],
          builder: (context, child) {
            return MaterialApp(
              title: 'ElakScam',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: primaryColor,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const Nav(),
            );
          },
        );
      },
    );
  }
}
