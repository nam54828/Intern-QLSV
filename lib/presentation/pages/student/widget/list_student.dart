import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/config/routes/route_path/app_route.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/data/model/student/student_model.dart';
import 'package:template/presentation/pages/student/widget/delete_student.dart';

class StudentList extends StatelessWidget {
  final Student student;
  const StudentList({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
          const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Column(
            children: [
              Container(
                width: 355.w,
                height: 60.h,
                decoration: BoxDecoration(
                    color: ColorResources.GREY_STUDENT,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      width: 200.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.fullName.tr,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            student.contactInfo.email.tr,
                            style: AppText.textPoppin12.copyWith(
                              color:  const Color.fromRGBO(138, 138, 138, 1
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 20, top: 10),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.toNamed(AppRoute.EDIT_STUDENT,
                                    arguments: student);
                              },
                              icon: SvgPicture.asset(
                                  'assets/icons/edit_icon.svg')),
                          DeleteStudentPage(studentIndex: student)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            height: 26.h,
            width: 23.w,
            decoration: BoxDecoration(
                color: ColorResources.BLUE_STUDENT,
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
               student.averageScore.toString(),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 8,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
