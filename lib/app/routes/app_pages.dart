import 'package:get/get.dart';

import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/chatpage/bindings/chatpage_binding.dart';
import '../modules/chatpage/views/chatpage_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/checkout_success/bindings/checkout_success_binding.dart';
import '../modules/checkout_success/views/checkout_success_view.dart';
import '../modules/detail_histories/bindings/detail_histories_binding.dart';
import '../modules/detail_histories/views/detail_histories_view.dart';
import '../modules/editprofile/bindings/editprofile_binding.dart';
import '../modules/editprofile/views/editprofile_view.dart';
import '../modules/histories/bindings/histories_binding.dart';
import '../modules/histories/views/histories_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.CHATPAGE,
      page: () => const ChatpageView(),
      binding: ChatpageBinding(),
    ),
    GetPage(
      name: _Paths.EDITPROFILE,
      page: () => const EditprofileView(),
      binding: EditprofileBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT_SUCCESS,
      page: () => const CheckoutSuccessView(),
      binding: CheckoutSuccessBinding(),
    ),
    GetPage(
      name: _Paths.HISTORIES,
      page: () => const HistoriesView(),
      binding: HistoriesBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_HISTORIES,
      page: () => const DetailHistoriesView(),
      binding: DetailHistoriesBinding(),
    ),
  ];
}
