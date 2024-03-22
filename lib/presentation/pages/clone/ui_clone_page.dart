import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/presentation/pages/clone/ui_clone_controller.dart';

class UIClonePage extends GetView<UICloneController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND_UI_CLONE,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(
                height: 15,
              ),
              _buildSearch(context),
              const SizedBox(
                height: 15,
              ),
              _buildBanner(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Text(
                  "Danh mục",
                  style: AppText.textPoppin12.copyWith(
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              _buildCategories(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Text(
                  "Cẩm nang làm đẹp",
                  style: AppText.textPoppin12.copyWith(
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              _buildBlog(context),
              const SizedBox(
                height: 10,
              ),
              _buildSelectButton(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cửa hàng gần đây",
                      style: AppText.textPoppin12.copyWith(
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Xem tất cả",
                          style: AppText.textPoppin12.copyWith(
                            color: ColorResources.PINK_TEXT
                          ),
                        ),
                        const Icon(
                          CupertinoIcons.right_chevron,
                          color: ColorResources.PINK_TEXT,
                          size: 12,
                        )
                      ],
                    )
                  ],
                ),
              ),
              _buildStore()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: Image.asset("assets/images/student.png"),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Xin chào, Đức Nam",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: ColorResources.GREY_STUDENT),
              child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/bell.svg")),
            ),
            Positioned(
              left: 25,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), color: Colors.red),
                child: Center(
                  child: Text(
                    "2",
                    style: AppText.textPoppin12.copyWith(
                      color: Colors.white,
                      fontSize: 8
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildSearch(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          height: 40,
          width: MediaQuery.of(context).size.width * 0.73,
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "Tìm theo tên cửa hàng, dịch vụ",
                border: InputBorder.none,
                hintStyle: GoogleFonts.poppins(
                    color: ColorResources.GREY, fontSize: 10),
                contentPadding: const EdgeInsets.only(bottom: 10, left: 10)),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 40.h,
          width: MediaQuery.of(context).size.width * 0.13,
          decoration: BoxDecoration(
              color:const Color.fromRGBO(220, 76, 100, 1),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        )
      ],
    );
  }

  Widget _buildBanner() {
    return SizedBox(
      height: 120.h,
      width: double.infinity,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/banner_ui_clone.jpg",
            fit: BoxFit.fitWidth,
          )),
    );
  }

  Widget _buildCategories() {
    return Container(
        height: 180.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisExtent: 65, mainAxisSpacing: 10),
          itemCount: controller.selects.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 50.w,
                        decoration: BoxDecoration(
                            color: controller.selects[index].color,
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.asset(
                          controller.selects[index].imagesUrl,
                          width: 45.w,
                          height: 45.h,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(controller.selects[index].text,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: ColorResources.GREY,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget _buildBlog(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: double.infinity.w,
      child: ListView.builder(
        itemCount: controller.viewBlog.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              width: 120.w,
              height: 120.h,
              child: Column(
                children: [
                  SizedBox(
                      height: 100.h,
                      width: 120.w,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            controller.viewBlog[index].imagesBlog,
                            height: 100,
                            width: 120,
                            fit: BoxFit.cover,
                          ))),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    controller.viewBlog[index].text,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSelectButton() {
    return IndexedStack(
      children: [
        Obx(() => Row(
              children: [
                _buildSelectCategoryButton(0, "Tất cả dịch vụ"),
                const SizedBox(width: 10),
                _buildSelectCategoryButton(1, "Spa/Massage"),
                const SizedBox(width: 10),
                _buildSelectCategoryButton(2, "Nail Salon"),
              ],
            ))
      ],
    );
  }

  Widget _buildSelectCategoryButton(int index, String title) {
    final isSelected = controller.selectedIndexButton == index;
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : ColorResources.PINK_BACKGROUND,
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: () {
          controller.changeIndexButton(index);
        },
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: ColorResources.PINK_TEXT,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildStore() {
    return SizedBox(
      height: 500.h,
      child: ListView.builder(
        itemCount: controller.viewStore.length,
        itemBuilder: (context, index) {
          return Expanded(
            child: Container(
              width: double.infinity.w,
              height: 120.h,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 100.h,
                        width: 90.w,
                        child: Image.asset(
                          controller.viewStore[index].imagesStore,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.viewStore[index].textNameStore,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          const  Icon(
                              CupertinoIcons.location_solid,
                              color: Colors.red,
                              size: 14,
                            ),
                            SizedBox(
                              width: 185.w,
                              child: Text(
                                controller.viewStore[index].address,
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Text(
                              controller.viewStore[index].star.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "(${controller.viewStore[index].feedback})",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
