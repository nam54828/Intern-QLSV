import 'dart:ui';
import 'package:get/get.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/data/model/blog/blog_model.dart';
import 'package:template/data/model/category/category.dart';
import 'package:template/data/model/store/store_model.dart';

class UICloneController extends GetxController{

  final RxInt _selectedIndexButton = 0.obs;

  int get selectedIndexButton => _selectedIndexButton.value;



  final List<CategoryModel> selects = [
    CategoryModel(ImagesPath.home, "Đặt lịch Nails",const Color.fromRGBO(255, 135, 207, 1)),
    CategoryModel(ImagesPath.home, "Đặt lịch Spa",const Color.fromRGBO(255, 135, 154, 1)),
    CategoryModel(ImagesPath.home, "Đặt lịch Salon",const Color.fromRGBO(255, 170, 143, 1)),
    CategoryModel(ImagesPath.home, "Cửa hàng thân thiết",const Color.fromRGBO(237, 172, 145, 1)),
    CategoryModel(ImagesPath.home, "Hỗ trợ khách hàng",const Color.fromRGBO(255, 209, 139, 1)),
    CategoryModel(ImagesPath.home, "Mini game",const Color.fromRGBO(237, 126, 255, 1))
  ];

  final List<BlogModel> viewBlog = [
    BlogModel(ImagesPath.blog1, "Cách chăm sóc da mặt cho da dầu"),
    BlogModel(ImagesPath.blog3, "Kỹ thuật giữ nếp tóc sao cho không bị gẫy rụng"),
    BlogModel(ImagesPath.blog4, "Hoa lài giúp giữ cho sức khỏe"),
    BlogModel(ImagesPath.blog2, "Cách chăm sóc da mặt cho làn da bị thâm mụn")
  ];

  final List<StoreModel> viewStore = [
    StoreModel(ImagesPath.blog1, "Tiệm Nail Mai Vy", "123 Châu Thị Vĩnh Tế, Ngũ Hành Sơn, Mỹ An, TP.Đà Nẵng", "45 đánh giá", 4.7, "nail"),
    StoreModel(ImagesPath.blog2, "Tiệm Salon Lộc Phạm", "123 Châu Thị Vĩnh Tế, Ngũ Hành Sơn, Mỹ An, TP.Đà Nẵng", "45 đánh giá", 4.7, "salon"),
    StoreModel(ImagesPath.blog3, "Spa mẹ và bé Nguyễn Hoài Ân", "123 Châu Thị Vĩnh Tế, Ngũ Hành Sơn, Mỹ An, TP.Đà Nẵng", "45 đánh giá", 4.7,"spa"),
  ];

  void changeIndexButton(int index){
    if(index == selectedIndexButton){
      return;
    }
    _selectedIndexButton.value = index;
  }
}