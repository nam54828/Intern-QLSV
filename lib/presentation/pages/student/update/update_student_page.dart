import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/data/model/student/student_model.dart';
import 'package:template/presentation/pages/student/update/update_student_controller.dart';
import 'package:template/presentation/pages/student/widget/dialog_subject.dart';
import 'package:template/presentation/pages/student/widget/search_student.dart';
import 'package:template/presentation/pages/subject/widgets/widget_input.dart';


class UpdateStudentPage extends GetView<UpdateStudentController>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBody(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(){
    return  Row(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100.h),
              child: Row(
                children: [
                  SearchStudent(),
                  SizedBox(
                    width: 15.w,
                  ),
                  Container(
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                        color: ColorResources.GREY_STUDENT,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: IconButton(onPressed: (){},
                        icon: const Icon(Icons.list, color: ColorResources.YELLOW_STUDENT)),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Image.asset("assets/images/student.png", width: 76, height: 121,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Student", style: TextStyle(
                        color: ColorResources.YELLOW_STUDENT,
                        fontWeight: FontWeight.w700,
                        fontSize: 19
                    ),),
                    Text("Management", style: TextStyle(
                        color: ColorResources.BLUE_STUDENT,
                        fontWeight: FontWeight.w700,
                        fontSize: 19
                    ),)
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context){
    return  Stack(
      children: [
        Container(
          width: double.infinity,
          height: 800,
          margin: EdgeInsets.only(top: 150.h),
          decoration: const BoxDecoration(
              color: ColorResources.BLUE_ADD_STUDENT,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(46), topRight: Radius.circular(46))
          ),
        ),
        _buildHeader(),
        Container(
          margin: const EdgeInsets.only( left: 60, top: 170),
          child: Text("Edit Student Information", style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: ColorResources.BLUE_ACCENT_STUDENT
          ) ,),
        ),
        Container(
          margin: EdgeInsets.only(top: 180.h),
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("FullName", style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.white
                  ),),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormFieldInput(
                      hinText: "Đỗ Đức Nam",
                      controller: controller.fullNameController,
                      onSave: (value){
                        controller.fullNameController.text = value;
                      },
                  ),
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
                            Text("Class", style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.white
                            ),
                              textAlign: TextAlign.start,),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormFieldInput(
                                hinText: "ST20A2A",
                                controller: controller.classController,
                                onSave: (value){
                                    controller.classController.text = value;
                                },
                            ),
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
                            Text("Student ID", style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                            ),),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormFieldInput(
                                hinText: "54828",
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                controller: controller.idSVController,
                                onSave: (value){
                                  controller.idSVController.text = value;
                                },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email", style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.white
                            ),
                        ),
                           SizedBox(
                              height: 10.h,
                            ),
                            TextFormFieldInput(
                                hinText: "dnam291002@gmail.com",
                                controller: controller.emailController,
                                onSave: (value){
                                    controller.emailController.text = value;
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date of Birth", style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                            ),),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormFieldInput(
                                hinText: "10/29/2002",
                                controller: controller.dateOfBirthController,
                                onSave: (value){
                                    controller.dateOfBirthController.text = value;
                                },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Address", style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.white
                            ),
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
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Phone number", style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                            ),),
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
                  Text("Average mark", style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Container(
                  //   width: double.infinity,
                  //   height: 50,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 15),
                  //     child: TextFormField(
                  //       decoration: InputDecoration(
                  //           hintText: "3.91",
                  //           hintStyle: GoogleFonts.poppins(
                  //               textStyle: TextStyle(
                  //                   fontSize: 12,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: Colors.grey
                  //               )
                  //           ),
                  //           border: InputBorder.none
                  //       ),
                  //       controller: controller.averageController,
                  //     ),
                  //   ),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(12),
                  //     color: Colors.white,
                  //   ),
                  // ),
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
                  Text("List subjects", style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("This student doesn’t have any classes yet. Click here to add new subject!", style: GoogleFonts.poppins(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 60.h,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisExtent: 25,
                        mainAxisSpacing: 35,
                      ),
                      itemCount: controller.studentModel.registeredCourses.length,
                      itemBuilder: (context, index) {
                        final course = controller.studentModel.registeredCourses[index];
                        final isSelected = controller.studentCtrl.isSelected[index];

                        return GestureDetector(
                          onTap: () {
                            if (isSelected) {
                              controller.studentCtrl.updateSelection(index, false);
                            } else {
                              controller.studentCtrl.updateSelection(index, true);
                            }
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    course,
                                    style: GoogleFonts.poppins(
                                      color: isSelected ? ColorResources.YELLOW_STUDENT : ColorResources.BLUE_STUDENT,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected ? ColorResources.BLUE_STUDENT : Colors.white,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
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
                                offset: Offset(2, 4),
                                blurRadius: 7
                            )
                          ]
                      ),
                      child: Center(
                        child: IconButton(onPressed: (){
                          Get.dialog(
                              barrierDismissible: false,
                              Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child:DialogSubject(),
                              )
                          );
                        },
                            icon: Icon(Icons.add, color: ColorResources.BLUE_STUDENT, size: 20,)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 76,
                        height: 29,
                        decoration: BoxDecoration(
                            color: ColorResources.YELLOW_ACCENT_STUDENT,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: (){
                              String fullName = controller.fullNameController.text;
                              String classField = controller.classController.text;
                              String email = controller.emailController.text;
                              String dateOfBirth = controller.dateOfBirthController.text;
                              String address = controller.addressController.text;
                              String phoneNumber = controller.phoneController.text;
                              String averageScore = controller.averageController.text;

                              Student newStudent = Student(
                                fullName: fullName,
                                classField: classField,
                                contactInfo: ContactInfo(email: email, phoneNumber: phoneNumber, address: address),
                                dateOfBirth: int.parse(dateOfBirth),
                                averageScore: double.parse(averageScore),
                                registeredCourses: controller.addStudentCtrl.registeredCourses,
                              );
                              controller.updateStudent(newStudent);
                            },
                            child: Text("Save", style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                                color: ColorResources.BLUE_STUDENT
                            ),
                              textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 76,
                        height: 29,
                        child: Center(
                            child: GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: Text("Cancel", style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                  color: Colors.white
                              ),
                                textAlign: TextAlign.center,),
                            )
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}