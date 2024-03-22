import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/data/model/subject/subject_model.dart';
import 'package:template/presentation/pages/subject/update/update_subject_controller.dart';
import 'package:template/presentation/pages/subject/widgets/widget_add_more_subject.dart';
import 'package:template/presentation/pages/subject/widgets/widget_input.dart';

class UpdateSubjectPage extends GetView<UpdateSubjectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBody()
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(){
    return Row(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 310,
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: ColorResources.GREY_STUDENT,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          hintText: "Enter keyword to find out...",
                          hintStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          border: InputBorder.none,
                          suffixIcon: const Icon(
                            Icons.search,
                            color: ColorResources.GREY_STUDENT,
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: ColorResources.GREY_STUDENT,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.list,
                            color: ColorResources.YELLOW_STUDENT)),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Image.asset(
                    "assets/images/student.png",
                    width: 76,
                    height: 121,
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
      ],
    );
  }

  Widget _buildBody(){
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 800,
          margin: const EdgeInsets.only(top: 150),
          decoration: const BoxDecoration(
              color: ColorResources.BLUE_ADD_STUDENT,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(46),
                  topRight: Radius.circular(46))),
        ),
        _buildHeader(),
        Container(
          margin: const EdgeInsets.only(left: 60, top: 170),
          child: Text(
            "Edit Subject Information",
            style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorResources.BLUE_ACCENT_STUDENT),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 180),
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Form(
              key: controller.formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FullName",
                    style: AppText.textPoppin12.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SubjectInput(
                    hinText: "Đỗ Đức Nam",
                    controller: controller.fullNameController,
                    onSave: (value){
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
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SubjectInput(hinText: "ST20A2A",
                                controller: controller.classController,
                                onSave: (value){
                                  controller.classController.text = value;
                                })
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
                            SubjectInput(hinText: "54828",
                                controller: controller.studentIdController,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                onSave: (value){
                                  controller.studentIdController.text = value;
                                })
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
                              style:AppText.textPoppin12.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SubjectInput(hinText: "Term 2/2023",
                                controller: controller.termController,
                                onSave: (value){
                                  controller.termController.text = value;
                                })
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
                            SubjectInput(hinText: "3",
                                controller: controller.creditController,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                onSave: (value){
                                  controller.creditController.text = value;
                                })
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
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      )
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
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                            controller.registrationController.text),
                        items: controller
                            .addSubjectCtrl.registrationStatuses
                            .map((String status) {
                          return DropdownMenuItem<String>(
                            value: status,
                            child: Text(status),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          controller.addSubjectCtrl
                              .setSelectedRegistrationStatus(newValue);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "List registered subjects",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "This student doesn't have any subject. Add one!!",
                    style: AppText.textPoppin12.copyWith(
                      color: const Color.fromRGBO(255, 255, 0, 0.4),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 60,
                      child: Obx(() => GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                          mainAxisExtent: 25,
                          mainAxisSpacing: 35,
                        ),
                        itemCount:
                        controller.selectMoreSubject.length,
                        itemBuilder: (context, index) {
                          final course =
                          controller.selectMoreSubject[index];
                          final isSelected = controller
                              .studentCtrl.isSelected[index];

                          return Row(
                            children: [
                              Container(
                                height: 60,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? ColorResources.BLUE_STUDENT
                                      : Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(32),
                                ),
                                child: Center(
                                  child: Text(
                                    course,
                                    style: GoogleFonts.poppins(
                                      color: isSelected
                                          ? ColorResources
                                          .YELLOW_STUDENT
                                          : ColorResources
                                          .BLUE_STUDENT,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ))),
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
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight:
                                            Radius.circular(32),
                                            bottomLeft:
                                            Radius.circular(32))),
                                    child: AddMoreSubject(
                                      textEditingController: controller.subjectCtrl.moreSubjectController,
                                      onSave: (subject) {
                                        controller.selectMoreSubject.add(subject);
                                        Get.back();
                                      },
                                    ),
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
              final SubjectModel editSubject = SubjectModel(
                  fullName: controller.fullNameController.text,
                  subjectClass: controller.classController.text,
                  creditHours: int.parse(controller.creditController.text),
                  semester: controller.termController.text,
                  registrationStatus: controller.addSubjectCtrl.parseRegistrationStatus(controller.addSubjectCtrl.selectedRegistrationStatus),
                  registeredCourses: controller.selectMoreSubject);
              controller.updateSubject(editSubject);
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
