import 'package:elakscam_frontend/apis/report_api.dart';
import 'package:elakscam_frontend/configs/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/report.dart';

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

                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.report),
                          title: Text(report.accountNumber.toString()),
                          subtitle: Text(report.category.toString()),
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
