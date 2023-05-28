import 'dart:developer';

import 'package:elakscam_frontend/apis/report_api.dart';
import 'package:elakscam_frontend/models/account.dart';
import 'package:elakscam_frontend/pages/create_report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../configs/color.dart';

class AccountResult extends StatefulWidget {
  const AccountResult({
    super.key,
    required this.account,
  });

  final Account account;

  @override
  State<AccountResult> createState() => _AccountResultState();
}

class _AccountResultState extends State<AccountResult> {
  bool isSubmitting = false;

  late Account account;

  @override
  void initState() {
    account = widget.account;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  iconSize: 16.sp,
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              CircleAvatar(
                backgroundColor: Color(0xFF283145),
                radius: 25.sp,
                child: Icon(
                  Icons.person,
                  size: 24.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                account.holderName ?? account.accountNumber.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFF283145),
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 0.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    account.score == null
                        ? 'No Search Result Found'
                        : '${account.score} Scammer Score',
                    style: TextStyle(
                      color: Color(0xFF283145),
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(width: 1.w),
                  CircleAvatar(
                    radius: 15.sp,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 14,
                      onPressed: () {
                        log('clicked');
                      },
                      iconSize: 14,
                      icon: Icon(Icons.question_mark_rounded),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      // ignore: use_build_context_synchronously
                      Map<String, dynamic>? data = await showModalBottomSheet(
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
                            builder: (_, controller) => CreateReportPage()),
                      );

                      // Submit Report
                      if (data != null) {
                        setState(() {
                          isSubmitting = true;
                        });

                        Account? acc = await ReportAPI.createReport(
                          number: account.accountNumber!,
                          category: data['category'],
                          evidence: data['evidence'],
                          evidenceDescription: data['evidence_description'],
                        );

                        setState(() {
                          isSubmitting = false;
                        });

                        if (acc != null) {
                          // ignore: use_build_context_synchronously
                          await showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 2.h,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Lottie.network(
                                        'https://assets2.lottiefiles.com/packages/lf20_265tGQ.json'),
                                    SizedBox(height: 1.h),
                                    Text(
                                      'Reported Successfully',
                                      style: TextStyle(fontSize: 20.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );

                          setState(() {
                            account = acc;
                          });
                        }
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 7.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.create_new_folder_outlined),
                          SizedBox(height: 0.5.h),
                          Text('Report'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 7.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.info_outline),
                        SizedBox(height: 0.5.h),
                        Text('More info'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),
              Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 7.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${account.totalReports} Community Report'),
                    SizedBox(height: 0.5.h),
                    Text('Ticket Scammer'),
                  ],
                ),
              ),
              account.score != null
                  ? Column(
                      children: [
                        SizedBox(height: 1.5.h),
                        Container(
                          width: 100.w,
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 7.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child:
                                      Text('Incorrect report. I am the owner')),
                              Icon(Icons.search),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        isSubmitting
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
