import 'package:get/get.dart';
import '../../page/splash/splash_index.dart';
import 'app_routes.dart';

class AppPages {
  static List<GetPage> pages() {
    return [
      GetPage(
          name: AppRoutes.initial,
          page: () => const SplashPage(),
          binding: SplashBinding(),
      ),
    ];
  }
}
