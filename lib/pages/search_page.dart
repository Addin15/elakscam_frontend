import 'package:elakscam_frontend/configs/color.dart';
import 'package:elakscam_frontend/pages/account_result.dart';
import 'package:elakscam_frontend/pages/scan_qr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isValidating = false;

  String qrValue = '';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  dynamic code = Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScanQR()));

                  code = '812617213713';

                  if (code != null) {
                    setState(() {
                      isValidating = true;
                    });

                    setState(() {
                      isValidating = false;
                    });

                    showModalBottomSheet(
                      context: context,
                      builder: (context) => AccountResult(),
                    );
                  }
                },
                child: Container(
                  color: Color(0xFFFF8A8A),
                  alignment: Alignment.center,
                  child: Text(
                    'Scan QR',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  color: Color(0xFFD9D9D9),
                  alignment: Alignment.center,
                  child: Text(
                    'Enter Account Number',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        isValidating
            ? Container(
                color: Colors.black.withOpacity(0.2),
                width: 100.w,
                height: 100.h,
                alignment: Alignment.center,
                child: Container(
                  width: 40.sp,
                  height: 40.sp,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: SpinKitFadingCircle(
                    color: primaryColor,
                    size: 25.sp,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
