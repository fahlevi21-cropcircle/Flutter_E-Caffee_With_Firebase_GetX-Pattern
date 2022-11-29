import 'package:get/get.dart';
import 'package:my_caffee/app/middlewares/auth.dart';
import 'package:my_caffee/app/middlewares/guest.dart';
import 'package:my_caffee/app/modules/cart/binding.dart';
import 'package:my_caffee/app/modules/cart/page.dart';
import 'package:my_caffee/app/modules/dashboard/binding.dart';
import 'package:my_caffee/app/modules/dashboard/page.dart';
import 'package:my_caffee/app/modules/details/binding.dart';
import 'package:my_caffee/app/modules/details/page.dart';
import 'package:my_caffee/app/modules/home/binding.dart';
import 'package:my_caffee/app/modules/home/page.dart';
import 'package:my_caffee/app/modules/authentication/binding.dart';
import 'package:my_caffee/app/modules/authentication/page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.HOME,
        page: () => HomePage(),
        binding: HomeBinding(),
        middlewares: [
          AuthMiddleware(),
        ]),
    GetPage(
        name: Routes.DETAILS,
        page: () => DetailsPage(),
        binding: DetailsBinding()),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthenticationPage(),
      binding: AuthenticationBinding(),
      middlewares: [
        GuestMiddleware(),
      ],
    ),
    GetPage(
        name: Routes.DASHBOARD,
        page: () => DashboardPage(),
        binding: DashboardBinding()),
    GetPage(
      name: Routes.CARTS,
      page: () => CartsPage(),
      binding: CartsBinding(),
    ),
  ];
}
