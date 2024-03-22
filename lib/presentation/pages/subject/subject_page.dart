import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/config/routes/route_path/app_route.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/presentation/pages/subject/subject_controller.dart';
import 'package:template/presentation/pages/subject/widgets/widget_delete_subject.dart';


class SubjectPage extends GetView<SubjectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Obx(() => ListView.builder(
          shrinkWrap: true,
          itemCount: controller.subjects.length,
          itemBuilder: (context, index) {
            return _buildSubjectItem(context, index);
          },
        ));
  }

  Widget _buildSubjectItem(BuildContext context, int index) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
          child: Column(
            children: [
              Container(
                width: 355.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: ColorResources.GREY_STUDENT,
                  borderRadius: BorderRadius.circular(10),
                ),
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
                            "${controller.subjects[index].fullName}",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${controller.subjects[index].subjectClass}",
                            style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(138, 138, 138, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.toNamed(AppRoute.EDIT_SUBJECT,
                                  arguments: controller.subjects[index]);
                            },
                            icon:
                                SvgPicture.asset('assets/icons/edit_icon.svg'),
                          ),
                          WidgetDeleteSubject(
                            subjectIndex: index,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Container(
            margin: EdgeInsets.only(top: 8.h),
            height: 26.h,
            width: 23.w,
            decoration: BoxDecoration(
              color: ColorResources.BLUE_STUDENT,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                "${controller.subjects[index].creditHours}",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 8,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
