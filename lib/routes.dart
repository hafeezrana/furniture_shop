import 'package:flutter/material.dart';
import 'package:furniture_shop/main.dart';
import 'package:furniture_shop/model/product.dart';
import 'package:furniture_shop/payment/add_payment_screen.dart';
import 'package:furniture_shop/payment/payment_methods_scrn.dart';
import 'package:furniture_shop/profile/my_profile_screen.dart';
import 'package:furniture_shop/reviews/reviews_rating_screen.dart';
import 'package:go_router/go_router.dart';

import 'address/add_address_scrn.dart';
import 'address/shipping_addresses.dart';
import 'authentication/signin/signIn_screen.dart';
import 'authentication/signup/signUp_screen.dart';
import 'bottom_navbar.dart';
import 'cart/cart_screen.dart';
import 'cart/check_out_screen.dart';
import 'cart/order_note_screen.dart';
import 'favorites/favorites_screen.dart';
import 'home/home_screen.dart';
import 'home/product_detail_screen.dart';
import 'model/address.dart';
import 'myorders/order_screen.dart';
import 'notification/notification_screen.dart';
import 'reviews/my_reviews_screen.dart';
import 'setting/setting_screen.dart';

class MyRouter {
  final _rootNavKey = GlobalKey<NavigatorState>();
  final _shellNavKey = GlobalKey<NavigatorState>();

  late final router = GoRouter(
    navigatorKey: _rootNavKey,
    initialLocation: AuthStateChanges.route,
    errorBuilder: (context, state) {
      return const Center(
        child: Text('Unkown Navigation Occurred!'),
      );
    },
    routes: [
      GoRoute(
        path: BottomNavBarScreen.route,
        builder: (context, state) {
          return const BottomNavBarScreen();
        },
      ),
      // ShellRoute(
      //   navigatorKey: _shellNavKey,
      //   builder: (context, state, child) {
      //     return BottomNavBarScreen(child: child);
      //   },
      //   routes: [
      GoRoute(
        path: HomeScreen.route,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: ReviewsAndRatingScreen.route,
        builder: (context, state) => const ReviewsAndRatingScreen(),
      ),
      GoRoute(
        path: CartScreen.route,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: CheckOutScreen.route,
        builder: (context, state) => const CheckOutScreen(),
      ),
      GoRoute(
        path: OrderNoteScreen.route,
        builder: (context, state) => const OrderNoteScreen(),
      ),
      GoRoute(
        path: ProductDetailScreen.route,
        builder: (context, state) {
          final product = state.extra as Product;
          return ProductDetailScreen(product: product);
        },
      ),
      GoRoute(
        path: MyProfileScreen.route,
        builder: (context, state) => const MyProfileScreen(),
      ),
      GoRoute(
        path: OrderScreen.route,
        builder: (context, state) => const OrderScreen(),
      ),
      GoRoute(
        path: MyReviewScreen.route,
        builder: (context, state) => const MyReviewScreen(),
      ),
      GoRoute(
        path: ShippingAddressScreen.route,
        builder: (context, state) => const ShippingAddressScreen(),
      ),
      GoRoute(
        path: AddAdressScreen.route,
        builder: (context, state) => AddAdressScreen(),
      ),
      GoRoute(
        path: PaymentMethodscrn.route,
        builder: (context, state) => const PaymentMethodscrn(),
      ),
      GoRoute(
        path: AddPaymentMethodScrn.route,
        builder: (context, state) => const AddPaymentMethodScrn(),
      ),
      GoRoute(
          path: AddAdressScreen.route,
          builder: (context, state) {
            final address = state.extra as Address;

            return AddAdressScreen(address: address);
          }),
      GoRoute(
        path: SettingScreen.route,
        builder: (context, state) => const SettingScreen(),
      ),
      GoRoute(
        path: AuthStateChanges.route,
        builder: (context, state) => AuthStateChanges(),
      ),
      GoRoute(
        path: FavoriteScreen.route,
        builder: (context, state) => const FavoriteScreen(),
      ),
      GoRoute(
        path: NotificationScreen.route,
        builder: (context, state) => const NotificationScreen(),
      ),
      //   ],
      // ),
      GoRoute(
        path: SignInScreen.route,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: SignUpScreen.route,
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );

  static Route<void> route(Widget? child) {
    return PageRouteBuilder(
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
}


/*
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AuthStateChanges.route:
        return route(AuthStateChanges.route, AuthStateChanges());

      case SignInScreen.route:
        return route(SignInScreen.route, const SignInScreen());

      case SignUpScreen.route:
        return route(SignUpScreen.route, const SignUpScreen());

      case BottomNavBarScreen.route:
        return route(BottomNavBarScreen.route, const BottomNavBarScreen());

      case HomeScreen.route:
        return route(HomeScreen.route, const HomeScreen());

      case ProductDetailScreen.route:
        final args = settings.arguments as Product;

        return route(
          ProductDetailScreen.route,
          ProductDetailScreen(product: args),
        );

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

      case MyReviewScreen.route:
        return route(MyReviewScreen.route, const MyReviewScreen());

      case ReviewsAndRatingScreen.route:
        return route(
            ReviewsAndRatingScreen.route, const ReviewsAndRatingScreen());

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
        return const Center(child: Text('Something Went Wrong'));
      },
    );
  }
}
*/