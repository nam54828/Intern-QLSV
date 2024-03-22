import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/data/model/student/student_model.dart';
import 'package:template/presentation/pages/student/add/add_controller.dart';
import 'package:template/presentation/pages/student/widget/dialog_subject.dart';
import 'package:template/presentation/pages/subject/widgets/widget_input.dart';


class AddStudentPage extends GetView<AddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetBody(),
    );
  }

  Widget _widgetHeader(){
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Image.asset(
            "assets/images/student.png",
            width: 76,
            height: 121,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Student",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: ColorResources.YELLOW_STUDENT,
                      fontWeight: FontWeight.w700,
                      fontSize: 19)),
            ),
            Text("Management",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: ColorResources.BLUE_STUDENT,
                      fontWeight: FontWeight.w700,
                      fontSize: 19),
                ))
          ],
        )
      ],
    );
  }

  Widget _widgetBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100.h),
                width: double.infinity,
                height: 700,
                decoration: const BoxDecoration(
                    color: ColorResources.BLUE_ADD_STUDENT,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(46),
                        topRight: Radius.circular(46))),
              ),
              _widgetHeader(),
              Container(
                margin: const EdgeInsets.only(top: 115, left: 190),
                child: Text(
                  "Add student",
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: ColorResources.BLUE_ACCENT_STUDENT),
                ),
              ),
              _buildInput(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInput(){
    return Container(
      margin: EdgeInsets.only(top: 125.h),
      child: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FullName",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormFieldInput(
                  hinText: "Đỗ Đức Nam",
                  controller: controller.fullNameController,
                  onSave: (value) {
                    controller.fullNameController.text = value;
                  }),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Class",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormFieldInput(
                            hinText: "ST20A2A",
                            controller: controller.classController,
                            onSave: (value) {
                              controller.classController.text = value;
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Student ID",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormFieldInput(
                            hinText: "54828",
                            controller: controller.idSVController,
                            onSave: (value) {
                              controller.idSVController.text = value;
                            })
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormFieldInput(
                            hinText: "dnam291002@gmail.com",
                            controller: controller.emailController,
                            onSave: (value) {
                              controller.emailController.text = value;
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date of Birth",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormFieldInput(
                          hinText: "10/29/2002",
                          controller:
                          controller.dateOfBirthController,
                          onSave: (value) {
                            controller.dateOfBirthController.text = value;
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Address",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormFieldInput(
                          hinText: "103 Hoài Thanh",
                          controller: controller.addressController,
                          onSave: (value){
                            controller.addressController.text = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 20.w
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone number",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormFieldInput(
                          hinText: "0123456789",
                          controller: controller.phoneController,
                          onSave: (value){
                            controller.phoneController.text = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Average mark",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10.h,
              ),

              TextFormFieldInput(
                hinText: "3.91",
                controller: controller.averageController,
                onSave: (value){
                  controller.averageController.text = value;
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "List subjects",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "This student doesn’t have any classes yet. Click here to add new subject!",
                style: GoogleFonts.poppins(
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              _buildViewSubject(),
              _buildChooseSubject(),
              SizedBox(
                height: 30.h,
              ),
              _buildPost(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewSubject(){
    return SizedBox(
        height: 50,
        child: Obx(() {
          final List<String> selectedSubjects = [];
          for (int i = 0;
          i < controller.isSelected.length;
          i++) {
            if (controller.isSelected[i]) {
              selectedSubjects
                  .add(controller.studentCtrl.subjects[i]);
            }
          }
          return GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisExtent: 25,
                  mainAxisSpacing: 35),
              itemCount: selectedSubjects.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(32)),
                      child: Center(
                        child: Text(
                          selectedSubjects[index],
                          style: GoogleFonts.poppins(
                              color: ColorResources
                                  .BLUE_STUDENT,
                              fontWeight: FontWeight.w700,
                              fontSize: 8),
                        ),
                      ),
                    )
                  ],
                );
              });
        }));
  }

  Widget _buildChooseSubject(){
    return Center(
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 2,
                  offset: Offset(2.h, 4.w),
                  blurRadius: 7)
            ]),
        child: Center(
          child: IconButton(
              onPressed: () {
                Get.dialog(
                    barrierDismissible: false,
                    Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: DialogSubject(),
                    ));
              },
              icon: const Icon(
                Icons.add,
                color: ColorResources.BLUE_STUDENT,
                size: 20,
              )),
        ),
      ),
    );
  }

  Widget _buildPost(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 76,
          height: 29,
          decoration: BoxDecoration(
            color: ColorResources.YELLOW_ACCENT_STUDENT,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
            onPressed: () async {
              final Student newStudent = Student(
                contactInfo: ContactInfo(
                  address: controller.addressController.text,
                  email: controller.emailController.text,
                  phoneNumber: controller.phoneController.text,
                ),
                registeredCourses: controller.registeredCourses,
                averageScore: double.parse(controller.averageController.text),
                dateOfBirth: int.parse(controller.averageController.text),
                classField: controller.classController.text,
                fullName: controller.fullNameController.text,
              );
              controller.addStudent(newStudent);
            },
            child: Text(
              "Save",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 10,
                color: ColorResources.BLUE_STUDENT,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Container(
          width: 76.w,
          height: 29.h,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Center(
              child: Text(
                "Cancel",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}


