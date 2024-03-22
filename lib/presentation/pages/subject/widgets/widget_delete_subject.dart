import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/presentation/pages/subject/subject_controller.dart';


class WidgetDeleteSubject extends StatefulWidget {
  final int subjectIndex;
  const WidgetDeleteSubject({Key? key, required this.subjectIndex}) : super(key: key);

  @override
  State<WidgetDeleteSubject> createState() => _WidgetDeleteSubjectState();
}

class _WidgetDeleteSubjectState extends State<WidgetDeleteSubject> {
  final subjectCtrl = Get.find<SubjectController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.dialog(
            barrierDismissible: false,
            Dialog(
              child: WillPopScope(
                onWillPop: () async => false,
                child: Container(
                  height: 150,
                  width: 350,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Center(
                          child: Text("Are you sure to delete this student?", style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: ColorResources.BLUE_STUDENT
                          ),),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: ColorResources.BLUE_STUDENT,
                                borderRadius: BorderRadius.circular(32)
                            ),
                            child: TextButton(onPressed: (){
                              subjectCtrl.deleteSubject(subjectCtrl.subjects[widget.subjectIndex].id ?? "");
                              Get.back();
                            },
                              child: Center(
                                child: Text("Delete", style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white
                                ),),
                              ),),
                          ),
                          const SizedBox(width: 20,),
                          Container(
                            height: 34,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2, color: const Color.fromRGBO(0, 33, 132, 1)),
                                borderRadius: BorderRadius.circular(32)
                            ),
                            child: TextButton(onPressed: (){
                              Get.back();
                            },
                              child: Text("Cancel", style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: ColorResources.BLUE_STUDENT
                              ),),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
        );
      },
      child: SvgPicture.asset(
          "assets/icons/delete_icon.svg"
      ),
    );
  }
}
