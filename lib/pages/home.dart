import 'package:elakscam_frontend/configs/color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool autoUpdate = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.only(
        left: 5.w,
        right: 5.w,
        top: 20.h,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primaryColor,
            primaryColor.withGreen(100),
          ],
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/svg/protected.png',
            width: 12.w,
            color: Colors.white,
          ),
          SizedBox(height: 1.h),
          Text(
            'Protecting',
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            'Latest update: Today',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 2.h),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 1.h,
              ),
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20.sp),
              ),
            ),
            child: const Text(
              'Check for updates',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10.sp,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text('Auto-Update Number Database'),
                      SizedBox(width: 1.w),
                      Container(
                        alignment: Alignment.center,
                        width: 15.sp,
                        child: IconButton(
                          onPressed: () {},
                          iconSize: 12.sp,
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            backgroundColor: Colors.white,
                            shape: CircleBorder(
                              side: BorderSide(),
                            ),
                          ),
                          icon: Icon(
                            Icons.question_mark_rounded,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: autoUpdate,
                  onChanged: (val) {
                    setState(() {
                      autoUpdate = !autoUpdate;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
