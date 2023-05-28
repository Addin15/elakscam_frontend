import 'package:carousel_slider/carousel_slider.dart';
import 'package:elakscam_frontend/configs/color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  int selectedPackage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 3.h),
                  child: Text(
                    'Introducing ElakScam Premium',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 55.h,
                    viewportFraction: 0.9,
                    enableInfiniteScroll: false,
                  ),
                  items: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15.sp,
                          ),
                          image: const DecorationImage(
                            image: AssetImage("assets/svg/cardBackground.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.stars_rounded,
                                  color: Colors.yellow.shade600,
                                ),
                                SizedBox(width: 1.5.w),
                                Text(
                                  'Main Features',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.done_rounded,
                                  color: tertiaryColor,
                                ),
                                SizedBox(width: 1.5.w),
                                Text(
                                  'Auto-update \nNumber Database',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.done_rounded,
                                  color: tertiaryColor,
                                ),
                                SizedBox(width: 1.5.w),
                                Text(
                                  'AD Free',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 3.h,
                        ),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15.sp,
                          ),
                          image: const DecorationImage(
                            image: AssetImage("assets/svg/cardBackground1.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 3.h,
                        ),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15.sp,
                          ),
                          image: const DecorationImage(
                            image: AssetImage("assets/svg/cardBackground2.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start your first 7 days free. Cancel anytime.',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPackage = 0;
                          });
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10.sp),
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.w,
                                vertical: 0.5.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: selectedPackage == 0
                                    ? Color(0xFF283145)
                                    : Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: selectedPackage == 0,
                                    activeColor: primaryColor,
                                    shape: CircleBorder(
                                      side: BorderSide(
                                        width: 5.sp,
                                        color: primaryColor,
                                      ),
                                    ),
                                    onChanged: (val) {},
                                  ),
                                  SizedBox(width: 2.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Yearly RM87.90',
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          color: selectedPackage == 0
                                              ? Colors.white
                                              : Color(0xFF283145),
                                        ),
                                      ),
                                      Text(
                                        'RM7.32/month after free trial',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: selectedPackage == 0
                                              ? Colors.white
                                              : Color(0xFF283145),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 12,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.5),
                                  borderRadius: BorderRadius.circular(8.sp),
                                  color: Colors.white,
                                ),
                                child: Text('15% OFF'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 0.2.h),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPackage = 1;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10.sp),
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 0.5.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: selectedPackage == 1
                                ? Color(0xFF283145)
                                : Colors.white,
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: selectedPackage == 1,
                                activeColor: primaryColor,
                                shape: CircleBorder(
                                  side: BorderSide(
                                    width: 5.sp,
                                    color: primaryColor,
                                  ),
                                ),
                                onChanged: (val) {},
                              ),
                              SizedBox(width: 2.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Monthly RM8.90',
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color: selectedPackage == 1
                                          ? Colors.white
                                          : Color(0xFF283145),
                                    ),
                                  ),
                                  Text(
                                    'RM8.90/month after free trial',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: selectedPackage == 1
                                          ? Colors.white
                                          : Color(0xFF283145),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                        ),
                        child: Text(
                          'Start your first 7 days free',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Restore Purchases',
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Redeem Code',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
