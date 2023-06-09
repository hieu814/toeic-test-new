import 'package:toeic_test/presentation/account_page/account_page.dart';
import 'package:toeic_test/presentation/account_page/binding/account_binding.dart';
import 'package:toeic_test/presentation/category_screen/binding/category_binding.dart';
import 'package:toeic_test/presentation/category_screen/category_screen.dart';
import 'package:toeic_test/presentation/exam_test_screen/binding/exam_test_binding.dart';
import 'package:toeic_test/presentation/exam_test_screen/exam_test_screen.dart';
import 'package:toeic_test/presentation/lession_topic_screen/lession_topic_screen.dart';
import 'package:toeic_test/presentation/lession_topic_screen/binding/lession_topic_binding.dart';
import 'package:toeic_test/presentation/lession_screen/binding/lession_binding.dart';
import 'package:toeic_test/presentation/lession_screen/lession_screen.dart';
import 'package:toeic_test/presentation/splash_screen/splash_screen.dart';
import 'package:toeic_test/presentation/splash_screen/binding/splash_binding.dart';
import 'package:toeic_test/presentation/login_screen/login_screen.dart';
import 'package:toeic_test/presentation/login_screen/binding/login_binding.dart';
import 'package:toeic_test/presentation/register_form_screen/register_form_screen.dart';
import 'package:toeic_test/presentation/register_form_screen/binding/register_form_binding.dart';
import 'package:toeic_test/presentation/dashboard_container_screen/dashboard_container_screen.dart';
import 'package:toeic_test/presentation/dashboard_container_screen/binding/dashboard_container_binding.dart';
import 'package:toeic_test/presentation/exam_category_screen/exam_category_screen.dart';
import 'package:toeic_test/presentation/exam_category_screen/binding/category_binding.dart';
import 'package:toeic_test/presentation/test_result_screen/binding/test_result_binding.dart';
import 'package:toeic_test/presentation/test_result_screen/test_result_screen.dart';
import 'package:toeic_test/presentation/review_exam_screen/review_exam_screen.dart';
import 'package:toeic_test/presentation/review_exam_screen/binding/review_exam_binding.dart';
import 'package:toeic_test/presentation/word_learning_screen/binding/word_learning_binding.dart';
import 'package:toeic_test/presentation/word_learning_screen/word_learning_screen.dart';
import 'package:toeic_test/presentation/word_topic_screen/binding/word_category_binding.dart';
import 'package:toeic_test/presentation/word_topic_screen/word_topic_screen.dart';
import 'package:toeic_test/presentation/write_review_fill_screen/write_review_fill_screen.dart';
import 'package:toeic_test/presentation/write_review_fill_screen/binding/write_review_fill_binding.dart';
import 'package:toeic_test/presentation/notification_screen/notification_screen.dart';
import 'package:toeic_test/presentation/notification_screen/binding/notification_binding.dart';
import 'package:toeic_test/presentation/list_category_screen/list_category_screen.dart';
import 'package:toeic_test/presentation/list_category_screen/binding/list_category_binding.dart';
import 'package:toeic_test/presentation/success_screen/success_screen.dart';
import 'package:toeic_test/presentation/success_screen/binding/success_binding.dart';
import 'package:toeic_test/presentation/profile_screen/profile_screen.dart';
import 'package:toeic_test/presentation/profile_screen/binding/profile_binding.dart';
import 'package:toeic_test/presentation/change_password_screen/change_password_screen.dart';
import 'package:toeic_test/presentation/change_password_screen/binding/change_password_binding.dart';
import 'package:toeic_test/presentation/add_card_screen/add_card_screen.dart';
import 'package:toeic_test/presentation/add_card_screen/binding/add_card_binding.dart';
import 'package:toeic_test/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:toeic_test/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String registerFormScreen = '/register_form_screen';

  static const String dashboardPage = '/dashboard_page';

  static const String dashboardContainerScreen = '/dashboard_container_screen';

  static const String categoryScreen = '/category_screen';

  static const String examCategoryScreen = '/exam_category_screen';

  static const String examTestResultScreen = '/exam_test_result_screen';

  static const String reviewExamScreen = '/review_exam_screen';

  static const String writeReviewFillScreen = '/write_review_fill_screen';

  static const String notificationScreen = '/notification_screen';

  static const String explorePage = '/explore_page';

  static const String listCategoryScreen = '/list_category_screen';

  static const String wordTopicScreen = '/word_topic_screen';

  static const String lessionTopicScreen = '/lession_topic_screen';

  static const String lessionScreen = '/lession_screen';

  static const String wordLearningScreen = '/word_learning_screen';

  static const String examTestScreen = '/exam_test_screen';

  static const String successScreen = '/success_screen';

  static const String accountPage = '/account_page';

  static const String wordCategoryPage = '/word_category_page';

  static const String lessionCategoryPage = '/lession_category_page';

  static const String profileScreen = '/profile_screen';

  static const String changePasswordScreen = '/change_password_screen';

  static const String addCardScreen = '/add_card_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: accountPage,
      page: () => AccountPage(),
      bindings: [
        AccountBinding(),
      ],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: registerFormScreen,
      page: () => RegisterFormScreen(),
      bindings: [
        RegisterFormBinding(),
      ],
    ),
    GetPage(
      name: dashboardContainerScreen,
      page: () => DashboardContainerScreen(),
      bindings: [
        DashboardContainerBinding(),
      ],
    ),
    GetPage(
      name: examCategoryScreen,
      page: () => ExamCategoryScreen(),
      bindings: [
        ExamCategoryBinding(),
      ],
    ),
    GetPage(
      name: categoryScreen,
      page: () => CategoryScreen(),
      bindings: [
        CategoryBinding(),
      ],
    ),
    GetPage(
      name: reviewExamScreen,
      page: () => ReviewExamScreen(),
      bindings: [
        ReviewExamBinding(),
      ],
    ),
    GetPage(
      name: writeReviewFillScreen,
      page: () => WriteReviewFillScreen(),
      bindings: [
        WriteReviewFillBinding(),
      ],
    ),
    GetPage(
      name: examTestResultScreen,
      page: () => TestResultScreen(),
      bindings: [
        TestResultBinding(),
      ],
    ),
    GetPage(
      name: notificationScreen,
      page: () => NotificationScreen(),
      bindings: [
        NotificationBinding(),
      ],
    ),
    GetPage(
      name: listCategoryScreen,
      page: () => ListCategoryScreen(),
      bindings: [
        ListCategoryBinding(),
      ],
    ),
    GetPage(
      name: wordTopicScreen,
      page: () => WordTopicScreen(),
      bindings: [
        WordTopiBinding(),
      ],
    ),
    GetPage(
      name: lessionTopicScreen,
      page: () => LessionTopicScreen(),
      bindings: [
        LessionTopicBinding(),
      ],
    ),
    GetPage(
      name: lessionScreen,
      page: () => LessionScreen(),
      bindings: [
        LessionBinding(),
      ],
    ),
    GetPage(
      name: wordLearningScreen,
      page: () => WordLearningScreen(),
      bindings: [
        WordLearningBinding(),
      ],
    ),
    GetPage(
      name: successScreen,
      page: () => SuccessScreen(),
      bindings: [
        SuccessBinding(),
      ],
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
      bindings: [
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: changePasswordScreen,
      page: () => ChangePasswordScreen(),
      bindings: [
        ChangePasswordBinding(),
      ],
    ),
    GetPage(
      name: addCardScreen,
      page: () => AddCardScreen(),
      bindings: [
        AddCardBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: examTestScreen,
      page: () => ExamTestScreen(),
      bindings: [
        ExamTestBinding(),
      ],
    )
  ];
}
