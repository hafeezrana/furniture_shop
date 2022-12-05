import 'package:flutter/material.dart';
import 'package:furniture_shop/ui/authentication/signin/view/signIn_screen.dart';
import 'package:furniture_shop/ui/authentication/signup/view/signUp_screen.dart';
import 'package:furniture_shop/ui/bottom_navbar.dart';
import 'package:furniture_shop/ui/cart/cart_screen.dart';
import 'package:furniture_shop/ui/cart/check_out_screen.dart';
import 'package:furniture_shop/ui/cart/order_note_screen.dart';
import 'package:furniture_shop/ui/favorites/favorites_screen.dart';
import 'package:furniture_shop/ui/home/view/home_screen.dart';
import 'package:furniture_shop/ui/home/view/product_detail_screen.dart';
import 'package:furniture_shop/ui/notification/notification_screen.dart';
import 'package:furniture_shop/ui/profile/address/add_address_scrn.dart';
import 'package:furniture_shop/ui/profile/address/shipping_addresses.dart';
import 'package:furniture_shop/ui/profile/my_profile_screen.dart';
import 'package:furniture_shop/ui/profile/myorders/order_screen.dart';
import 'package:furniture_shop/ui/profile/payment/add_payment_screen.dart';
import 'package:furniture_shop/ui/profile/payment/payment_methods_scrn.dart';
import 'package:furniture_shop/ui/profile/reviews/reviews_screen.dart';
import 'package:furniture_shop/ui/profile/setting/setting_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignInScreen.route:
        return route(SignInScreen.route, const SignInScreen());

      case SignUpScreen.route:
        return route(SignUpScreen.route, const SignUpScreen());

      case BottomNavBarScreen.route:
        return route(BottomNavBarScreen.route, const BottomNavBarScreen());

      case HomeScreen.route:
        return route(HomeScreen.route, const HomeScreen());

      case ProductDetailScreen.route:
        return route(ProductDetailScreen.route, const ProductDetailScreen());
      case FavoriteScreen.route:
        return route(FavoriteScreen.route, const FavoriteScreen());

      case CartScreen.route:
        return route(CartScreen.route, const CartScreen());

      case CheckOutScreen.route:
        return route(CheckOutScreen.route, const CheckOutScreen());

      case OrderNoteScreen.route:
        return route(OrderNoteScreen.route, const OrderNoteScreen());

      case NotificationScreen.route:
        return route(NotificationScreen.route, const NotificationScreen());

      case MyProfilesScreen.route:
        return route(MyProfilesScreen.route, const MyProfilesScreen());

      case OrderScreen.route:
        return route(OrderScreen.route, const OrderScreen());

      case ShippingAddressScreen.route:
        return route(
            ShippingAddressScreen.route, const ShippingAddressScreen());

      case AddAdressScreen.route:
        return route(AddAdressScreen.route, const AddAdressScreen());

      case PaymentMethodscrn.route:
        return route(PaymentMethodscrn.route, const PaymentMethodscrn());

      case AddPaymentMethodScrn.route:
        return route(AddPaymentMethodScrn.route, const AddPaymentMethodScrn());

      case ReviewScreen.route:
        return route(ReviewScreen.route, const ReviewScreen());

      case SettingScreen.route:
        return route(SettingScreen.route, const SettingScreen());

      default:
        return error();
    }
  }

  static Route<void> route(String? routeName, Widget? child) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName),
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static Route<dynamic> error() {
    return MaterialPageRoute(
      builder: (context) {
        return Container(
          child: const Center(child: Text('Something Went Wrong')),
        );
      },
    );
  }
}
