import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/color_resources.dart';


class StudentSubject extends StatelessWidget {
  final List<String> selectedSubjects;

  const StudentSubject({Key? key, required this.selectedSubjects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisExtent: 25,
        mainAxisSpacing: 35,
      ),
      itemCount: selectedSubjects.length,
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 100,
              child: Center(
                child: Text(
                  selectedSubjects[index],
                  style: GoogleFonts.poppins(
                    color: ColorResources.BLUE_STUDENT,
                    fontWeight: FontWeight.w700,
                    fontSize: 8,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ],
        );
      },
    );
  }
}
