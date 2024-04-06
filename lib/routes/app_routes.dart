import 'package:get/get.dart';
import 'package:tasty_dinery/features/authentication/screens/1_onboarding/onboarding_view.dart';
import 'package:tasty_dinery/features/authentication/screens/2_login/login.dart';
import 'package:tasty_dinery/features/authentication/screens/3_signup/signup.dart';
import 'package:tasty_dinery/features/authentication/screens/3_signup/verify_email.dart';
import 'package:tasty_dinery/features/authentication/screens/4_password_configuration/forgot_password.dart';
import 'package:tasty_dinery/features/personnalization/screens/profile/profile_screen.dart';
import 'package:tasty_dinery/features/personnalization/screens/settings/settings.dart';
import 'package:tasty_dinery/features/shop/screens/cart/cart.dart';
import 'package:tasty_dinery/features/shop/screens/checkout/checkout.dart';
import 'package:tasty_dinery/features/shop/screens/home/home.dart';
import 'package:tasty_dinery/features/shop/screens/order/order.dart';
// import 'package:tasty_dinery/features/shop/screens/order_details/order_details.dart';
import 'package:tasty_dinery/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:tasty_dinery/features/shop/screens/search/search_meal.dart';
import 'package:tasty_dinery/features/shop/screens/wishlist/wishlist.dart';
import 'package:tasty_dinery/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: CcRoutes.home, page: () => const HomeScreen()),
    GetPage(name: CcRoutes.search, page: () => const SearchScreen()),
    GetPage(name: CcRoutes.favorites, page: () => const FavoriteScreen()),
    GetPage(name: CcRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: CcRoutes.productReviews,
        page: () => const ProductReviewsScreen()),
    GetPage(name: CcRoutes.order, page: () => const OrderScreen()),
    // GetPage(name: CcRoutes.orderDetail, page: () => const OrderDetailsScreen()),
    GetPage(name: CcRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: CcRoutes.cart, page: () => const CartScreen()),
    GetPage(name: CcRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: CcRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: CcRoutes.verifyEmail, page: () => const VerifyEmail()),
    GetPage(name: CcRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: CcRoutes.forgotPassword, page: () => const ForgotPassword()),
    GetPage(name: CcRoutes.onboarding, page: () => const OnboardingView()),
  ];
}
