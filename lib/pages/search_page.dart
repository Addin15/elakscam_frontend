import 'package:elakscam_frontend/apis/check_api.dart';
import 'package:elakscam_frontend/configs/color.dart';
import 'package:elakscam_frontend/models/account.dart';
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

  checkAccount(String number) async {
    setState(() {
      isValidating = true;
    });

    Account account = await CheckAPI.checkAccount(number);

    setState(() {
      isValidating = false;
    });

    // ignore: use_build_context_synchronously
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.sp),
          topRight: Radius.circular(20.sp),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.95,
        maxChildSize: 0.95,
        builder: (_, controller) => AccountResult(account: account),
      ),
    );
  }

  final TextEditingController _accountController = TextEditingController();
  final FocusNode _accountFocus = FocusNode();

  String qrValue = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.w,
                  child: TextButton(
                    onPressed: () async {
                      String? account = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScanQR(),
                        ),
                      );

                      if (account != null) {
                        checkAccount(account);
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      'Scan DuitNow QR',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        height: 0.5,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Text('or'),
                    SizedBox(width: 1.w),
                    const Expanded(
                        child: Divider(
                      height: 0.5,
                      color: primaryColor,
                    )),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _accountController,
                        focusNode: _accountFocus,
                        decoration: InputDecoration(
                          hintText: 'Account Number',
                          isDense: true,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 3.w,
                            vertical: 1.5.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 1.w),
                    IconButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_accountController.text.isNotEmpty) {
                          checkAccount(_accountController.text);
                        }
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: primaryColor,
                      ),
                      icon: Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
      ),
    );
  }
}
