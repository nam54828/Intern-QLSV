import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/config/routes/route_path/app_route.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/presentation/pages/student/add/add_page.dart';
import 'package:template/presentation/pages/student/student_controller.dart';
import 'package:template/presentation/pages/student/widget/delete_student.dart';
import 'package:template/presentation/pages/student/widget/list_student.dart';
import 'package:template/presentation/pages/student/widget/search_student.dart';
import 'package:template/presentation/pages/student/widget/top_bar.dart';
import 'package:template/presentation/pages/subject/add/add_subject_page.dart';
import 'package:template/presentation/pages/subject/subject_page.dart';

class StudentPage extends GetView<StudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBody(context),
            _changeText(context),
            _bodyList(context)
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    const String settingIcon = "assets/icons/icon_setting.svg";
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 110.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SearchStudent(),
                        Container(
                          width: 35.w,
                          height: 35.w,
                          decoration: BoxDecoration(
                              color: ColorResources.GREY_STUDENT,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(settingIcon),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Image.asset(
                          "assets/images/student.png",
                          width: 76.w,
                          height: 135.h,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Student",
                            style: TextStyle(
                                color: ColorResources.YELLOW_STUDENT,
                                fontWeight: FontWeight.w700,
                                fontSize: 19),
                          ),
                          Text(
                            "Management",
                            style: TextStyle(
                                color: ColorResources.BLUE_STUDENT,
                                fontWeight: FontWeight.w700,
                                fontSize: 19),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              TopBar(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _changeText(BuildContext context) {
    return Obx(() {
      if (controller.selectedButton.value == "Students") {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "List students",
                    style: GoogleFonts.poppins(
                        textStyle: AppText.textPoppin16
                            .copyWith(fontWeight: FontWeight.w600)),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(() => AddStudentPage());
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: ColorResources.YELLOW_STUDENT,
                        size: 16.w,
                      )),
                ],
              ),
              Row(
                children: [
                  Text("View all",
                      style: AppText.textPoppin8
                          .copyWith(color: ColorResources.YELLOW_STUDENT)),
                  Icon(
                    Icons.expand_more,
                    color: ColorResources.YELLOW_STUDENT,
                    size: 12.w,
                  )
                ],
              )
            ],
          ),
        );
      } else if (controller.selectedButton.value == "Subject") {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "List subjects",
                    style: GoogleFonts.poppins(
                        textStyle: AppText.textPoppin16
                            .copyWith(fontWeight: FontWeight.w600)),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(() => AddSubjectPage());
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: ColorResources.YELLOW_STUDENT,
                        size: 16.w,
                      )),
                ],
              ),
              Row(
                children: [
                  Text(
                    "View all",
                    style: AppText.textPoppin8.copyWith(
                      color: ColorResources.YELLOW_STUDENT
                    ),
                  ),
                  Icon(
                    Icons.expand_more,
                    color: ColorResources.YELLOW_STUDENT,
                    size: 12.w,
                  )
                ],
              )
            ],
          ),
        );
      } else if (controller.selectedButton.value == "Evaluation") {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "List evaluation",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black)),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(() => AddStudentPage());
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: ColorResources.YELLOW_STUDENT,
                        size: 18,
                      )),
                ],
              ),
              Row(
                children: [
                  Text(
                    "View all",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 8,
                        color: ColorResources.YELLOW_STUDENT),
                  ),
                  const Icon(
                    Icons.expand_more,
                    color: ColorResources.YELLOW_STUDENT,
                    size: 10,
                  )
                ],
              )
            ],
          ),
        );
      } else if (controller.selectedButton.value == "Event") {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "List event",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black)),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(() => AddStudentPage());
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: ColorResources.YELLOW_STUDENT,
                        size: 18,
                      )),
                ],
              ),
              Row(
                children: [
                  Text(
                    "View all",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 8,
                        color: ColorResources.YELLOW_STUDENT),
                  ),
                  const Icon(
                    Icons.expand_more,
                    color: ColorResources.YELLOW_STUDENT,
                    size: 10,
                  )
                ],
              )
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget _bodyList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6.h,
      child: Expanded(child: Obx(() {
        if (controller.selectedButton.value == 'Subject') {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.6.h,
              child: SubjectPage());
        } else if (controller.selectedButton.value == 'Students') {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.students.length,
            itemBuilder: (context, index) {
              return StudentList(student: controller.students[index]);
            },
          );
        } else if (controller.selectedButton.value == "Evaluation") {
          return Container();
        } else if (controller.selectedButton.value == "Event") {
          return Container();
        } else {
          return Container();
        }
      })),
    );
  }

}
