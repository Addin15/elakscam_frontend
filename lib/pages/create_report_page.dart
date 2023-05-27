import 'dart:io';

import 'package:elakscam_frontend/configs/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateReportPage extends StatefulWidget {
  const CreateReportPage({super.key});

  @override
  State<CreateReportPage> createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _evidenceDescriptionController =
      TextEditingController();
  String? selectedCategory;
  File? selectedEvidence;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        iconSize: 16.sp,
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Center(
                        child: Text(
                      'Submit Report',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    SizedBox(height: 2.h),
                    Text(
                      'Type of Scam',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    SizedBox(height: 0.5.h),
                    DropdownButtonFormField(
                      value: selectedCategory,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please select the category'
                          : null,
                      hint: Text(
                        '-- Select Category --',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text('Business'),
                          value: 'Business',
                        ),
                        DropdownMenuItem(
                          child: Text('Carousell Scammer'),
                          value: 'Carousell Scammer',
                        ),
                        DropdownMenuItem(
                          child: Text('Other'),
                          value: 'Other',
                        ),
                      ],
                      onChanged: (val) {
                        setState(() {
                          selectedCategory = val;
                        });
                      },
                    ),
                    SizedBox(height: 1.5.h),
                    Text(
                      'Why is this a scam account?',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    SizedBox(height: 0.5.h),
                    TextFormField(
                      controller: _evidenceDescriptionController,
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(height: 1.5.h),
                    Text(
                      'Evidence',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: TextButton(
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(allowMultiple: false);

                          if (result != null) {
                            File file =
                                File(result.files.single.path.toString());
                            setState(() {
                              selectedEvidence = file;
                            });
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                        ),
                        child: Text(
                          'Upload File',
                          style: TextStyle(
                            color: Color(0xFF283145),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.2.h),
                    selectedEvidence != null
                        ? Text(
                            selectedEvidence!.path.toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.redAccent,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              Container(
                width: 100.w,
                margin: EdgeInsets.only(bottom: 2.h),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, {
                        'category': selectedCategory,
                        'evidence': selectedEvidence,
                        'evidence_description':
                            _evidenceDescriptionController.text
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
