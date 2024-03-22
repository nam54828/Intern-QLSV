import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/data/model/subject/subject_model.dart';
import 'package:template/presentation/pages/student/widget/dialog_subject.dart';
import 'package:template/presentation/pages/subject/add/add_subject_controller.dart';
import 'package:flutter/material.dart';
import 'package:template/presentation/pages/subject/widgets/widget_input.dart';

class AddSubjectPage extends GetView<AddSubjectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetBody(context),
    );
  }

  Widget _buildHeader(){
    return  Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
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
  Widget _widgetBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 110),
                width: double.infinity,
                height: 700,
                decoration: const BoxDecoration(
                    color: ColorResources.BLUE_ADD_STUDENT,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(46),
                        topRight: Radius.circular(46))),
              ),
              _buildHeader(),
              Container(
                margin: const EdgeInsets.only(top: 130, left: 190),
                child: Text(
                  "Add subject",
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: ColorResources.BLUE_ACCENT_STUDENT),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 150),
                child: Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Form(
                    key: controller.formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "FullName",
                          style:AppText.textPoppin12.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SubjectInput(
                          getWidth: double.infinity,
                          hinText: "Đỗ Đức Nam",
                          keyboardType: TextInputType.text,
                          controller: controller.fullNameController,
                          onSave: (value) {
                            controller.fullNameController.text = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
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
                                    style: AppText.textPoppin12.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SubjectInput(
                                    getWidth: 175,
                                    hinText: "ST20A2A",
                                    keyboardType: TextInputType.text,
                                    controller: controller.classController,
                                    onSave: (value) {
                                      controller.classController.text =
                                          value;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Student ID",
                                    style: AppText.textPoppin12.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SubjectInput(
                                    hinText: "54828",
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    controller:
                                        controller.studentIdController,
                                    onSave: (value) {
                                      controller.studentIdController.text =
                                          value;
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
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
                                    "School term",
                                    style: AppText.textPoppin12.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SubjectInput(
                                    hinText: "Term 2/2023",
                                    keyboardType: TextInputType.text,
                                    controller: controller.termController,
                                    onSave: (value) {
                                      controller.termController.text =
                                          value;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Quantity of credits",
                                    style: AppText.textPoppin12.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SubjectInput(
                                    hinText: "3",
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    controller: controller.creditController,
                                    onSave: (value) {
                                      controller.creditController.text = value;
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Registering status",
                          style: AppText.textPoppin12.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Vui lòng chọn trạng thái đăng ký"),
                              items: controller.registrationStatuses
                                  .map((String status) {
                                return DropdownMenuItem<String>(
                                  value: status,
                                  child: Text(status),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller
                                    .setSelectedRegistrationStatus(newValue);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20
                        ),
                        Text(
                          "List registered subjects",
                          style: AppText.textPoppin12.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        const SizedBox(
                          height: 10
                        ),
                        Text(
                          "This student doesn't have any subject. Add one!!",
                          style:AppText.textPoppin12.copyWith(
                            color: const Color.fromRGBO(255, 255, 0, 0.4),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: 50,
                            child: Obx(() {
                              final List<String> selectedSubjects = [];
                              for (int i = 0; i < controller.addStudentCtr.isSelected.length; i++) {
                                if (controller.addStudentCtr.isSelected[i]) {
                                  selectedSubjects.add(controller.studentCtrl.subjects[i]);
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
                            })),
                        Center(
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white.withOpacity(0.5),
                                      spreadRadius: 2,
                                      offset: const Offset(2, 4),
                                      blurRadius: 7)
                                ]),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    Get.dialog(
                                        barrierDismissible: false,
                                        Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32),
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
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        _buildPost()
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  Widget _buildPost(){
    return  Row(
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
              final SubjectModel newSubject = SubjectModel(
                  fullName: controller.fullNameController.text,
                  subjectClass: controller.classController.text,
                  creditHours: int.parse(controller.creditController.text),
                  semester: controller.termController.text,
                  registrationStatus: controller.parseRegistrationStatus(controller.selectedRegistrationStatus),
                  registeredCourses: controller.addStudentCtr.registeredCourses);
              controller.addSubject(newSubject);
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
        const SizedBox(
          width: 20,
        ),
        Container(
          width: 76,
          height: 29,
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
                  fontWeight: FontWeight.w400,
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
