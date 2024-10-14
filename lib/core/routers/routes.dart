
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:todo/features/splash/presentation/binding/splash_binding.dart';
import 'package:todo/features/splash/presentation/page/splash_page.dart';

class Routes {
  Routes._();

  static const String splash = "/splash";
  static const String intro = "/intro";
  static const String main = "/";
  static const String home = "/home";
  static const String chat = "/chat";
  static const String phoneNumberPage = "/phone_number_page";
  static const String checkPasswordPage = "/check_password_page";
  static const String createPasswordPage = "/create_password_page";
  static const String otpPage = "/otp_page";
  static const String forgotPasswordPage = "/forgot_password_page";
  static const String welcomePage = "/welcome_page_page";

}

List<GetPage> appPages() => [
      GetPage(
          transition: Transition.cupertinoDialog,
          transitionDuration: 350.milliseconds,
          name: Routes.splash,
          page: () => const SplashPage(),
          binding: SplashBinding()),

      // GetPage(name: Routes.home, page: () => const HomePage(), binding: HomePageBindings()),

    ];
