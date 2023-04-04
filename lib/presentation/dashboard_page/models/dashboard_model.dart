import 'package:get/get.dart';
import 'sliderofferbannertitl_item_model.dart';
import 'categories_item_model.dart';
import 'exam_category_item_model.dart';
import 'megasale_item_model.dart';
import 'dashboard_item_model.dart';

class DashboardModel {
  RxList<SliderofferbannertitlItemModel> sliderofferbannertitlItemList =
      RxList.generate(1, (index) => SliderofferbannertitlItemModel());

  RxList<CategoriesItemModel> categoriesListeningItemList =
      RxList.generate(4, (index) => CategoriesItemModel(part: index + 1));
  RxList<CategoriesItemModel> categoriesReadingItemList =
      RxList.generate(3, (index) => CategoriesItemModel(part: index + 4));

  RxList<ExamCategoryItemModel> fullTestCategoryItemList =
      RxList.generate(3, (index) => ExamCategoryItemModel());
  RxList<ExamCategoryItemModel> miniTestCategoryItemList =
      RxList.generate(3, (index) => ExamCategoryItemModel());

  RxList<MegasaleItemModel> megasaleItemList =
      RxList.generate(3, (index) => MegasaleItemModel());

  RxList<DashboardItemModel> dashboardItemList =
      RxList.generate(4, (index) => DashboardItemModel());
}
