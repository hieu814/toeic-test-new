import 'package:toeic_test/presentation/lession_category_screen/lession_category_screen.dart';
import 'package:toeic_test/presentation/word_category_screen/word_category_screen.dart';

import 'controller/dashboard_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/account_page/account_page.dart';
import 'package:toeic_test/presentation/dashboard_page/dashboard_page.dart';
import 'package:toeic_test/presentation/explore_page/explore_page.dart';
import 'package:toeic_test/widgets/custom_bottom_bar.dart';

class DashboardContainerScreen extends GetWidget<DashboardContainerController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.dashboardPage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            })));
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.dashboardPage;
      case BottomBarEnum.Word:
        return AppRoutes.wordCategoryPage;
      case BottomBarEnum.Lession:
        return AppRoutes.lessionCategoryPage;
      case BottomBarEnum.Account:
        return AppRoutes.accountPage;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.dashboardPage:
        return DashboardPage();
      case AppRoutes.explorePage:
        return ExplorePage();
      case AppRoutes.accountPage:
        return AccountPage();
      case AppRoutes.wordCategoryPage:
        return WordCategoryScreen();
      case AppRoutes.lessionCategoryPage:
        return LessionCategoryScreen();
      default:
        return DefaultWidget();
    }
  }
}
