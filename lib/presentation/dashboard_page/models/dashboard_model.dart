import 'package:get/get.dart';
import 'sliderofferbannertitl_item_model.dart';
import 'categories_item_model.dart';
import 'category_item_model.dart';
import 'megasale_item_model.dart';
import 'dashboard_item_model.dart';

class DashboardModel {
  RxList<SliderofferbannertitlItemModel> sliderofferbannertitlItemList =
      RxList.generate(1, (index) => SliderofferbannertitlItemModel());

  RxList<CategoriesItemModel> categoriesListeningItemList =
      RxList.generate(4, (index) => CategoriesItemModel(part: index + 2));
  RxList<CategoriesItemModel> categoriesReadingItemList =
      RxList.generate(3, (index) => CategoriesItemModel(part: index + 6));

  RxList<CategoryItemModel> fullTestCategoryItemList = RxList([]);
  RxList<CategoryItemModel> miniTestCategoryItemList = RxList([]);

  RxList<MegasaleItemModel> megasaleItemList = RxList([]);

  RxList<DashboardItemModel> dashboardItemList = RxList([]);
  void setSliderofferbannertitlItemList(
      List<SliderofferbannertitlItemModel> list) {
    sliderofferbannertitlItemList.assignAll(list);
  }

  void setCategoriesListeningItemList(List<CategoriesItemModel> list) {
    categoriesListeningItemList.assignAll(list);
  }

  void setCategoriesReadingItemList(List<CategoriesItemModel> list) {
    categoriesReadingItemList.assignAll(list);
  }

  void setFullTestCategoryItemList(List<CategoryItemModel> list) {
    fullTestCategoryItemList.assignAll(list);
  }

  void setMiniTestCategoryItemList(List<CategoryItemModel> list) {
    miniTestCategoryItemList.assignAll(list);
  }

  void setMegasaleItemList(List<MegasaleItemModel> list) {
    megasaleItemList.assignAll(list);
  }

  void setDashboardItemList(List<DashboardItemModel> list) {
    dashboardItemList.assignAll(list);
  }
}
