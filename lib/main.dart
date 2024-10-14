// This is a minimal example demonstrating a play/pause button and a seek bar.
// More advanced examples demonstrating other features can be found in the same
// directory as this example in the GitHub repository.



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/common_ui/theme/theme_controller.dart';
import 'package:todo/common_ui/theme/theme_service.dart';
import 'package:todo/core/utils/app_context.dart';
import 'package:todo/features/home/presentation/controller/home_controller.dart';
import 'core/auth_token_storage/auth_token_storage.dart';
import 'core/network/dio_request_manager.dart';
import 'core/network/i_api_request_manager.dart';
import 'core/routers/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(const MyApp());

  AuthTokenStorage.instance.watch().listen((event) {
    if (event == null) {
      // Get.offAndToNamed(Routes.phoneNumberPage);
    }
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // if (!Get.isRegistered<AppContextProvider>()) {
    //   Get.put<AppContextProvider>(AppContextProvider(context));
    // }
    return GetMaterialApp(
      title: 'Alvand',
      // theme: AppTheme.,
      // darkTheme: Themes.dark,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeService().theme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', 'IR'),
      ],
      locale: const Locale('fa', 'IR'),
      getPages: appPages(),
      initialRoute: Routes.home,
      initialBinding: BindingsBuilder(() {
        Get.put(HomeController());
        Get.put(AppContextProvider(context));
        Get.put<IHttpClient>(DioHttpClient(logEnabled: true));
      }),
    );
  }
}
