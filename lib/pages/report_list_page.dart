import 'package:elakscam_frontend/apis/report_api.dart';
import 'package:elakscam_frontend/configs/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../apis/check_api.dart';
import '../models/account.dart';
import '../models/report.dart';
import 'account_result.dart';

class ReportListPage extends StatefulWidget {
  const ReportListPage({super.key});

  @override
  State<ReportListPage> createState() => _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage> {
  List<Report>? reports;

  getReports() async {
    List<Report> data = await ReportAPI.getReports();

    setState(() {
      reports = data;
    });
  }

  @override
  void initState() {
    getReports();
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 10, right: 10),
      child: Column(
        children: [
          Center(
              child: Text(
            'Your Reported List',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Image(
            image: const AssetImage("assets/svg/warning.png"),
            height: 15.h,
            width: 25.h,
          ),
          reports != null
              ? Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      Report report = reports![index];

                      return GestureDetector(
                        onTap: () {
                          checkAccount(report.accountNumber.toString());
                        },
                        child: Card(
                          child: ListTile(
                            leading: Icon(Icons.report),
                            title: Text(report.accountNumber.toString()),
                            subtitle: Text(report.category.toString()),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      if (index == reports!.length - 1) {
                        return const SizedBox.shrink();
                      } else {
                        return SizedBox(height: 1.h);
                      }
                    },
                    itemCount: reports!.length,
                  ),
                )
              : Container(
                  height: 60.h,
                  alignment: Alignment.center,
                  child: SpinKitFadingCircle(
                    color: primaryColor,
                    size: 25.sp,
                  ),
                )
        ],
      ),
    );
  }
}
