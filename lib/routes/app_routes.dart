import 'package:get/get.dart';
import 'package:tasty_dinery/features/admin/settings/admin_logout_screen.dart';
import 'package:tasty_dinery/features/admin/settings/admin_setings_screen.dart';
import 'package:tasty_dinery/features/admin/shop/banners/admin_banners_screen.dart';
import 'package:tasty_dinery/features/admin/shop/categories/admin_categories_screen.dart';
import 'package:tasty_dinery/features/admin/shop/dashboard/admin_dashboard_screen.dart';
import 'package:tasty_dinery/features/admin/shop/media/admin_media_screen.dart';
import 'package:tasty_dinery/features/admin/shop/orders/admin_orders_screen.dart';
import 'package:tasty_dinery/features/admin/shop/products/admin_products_screen.dart';
import 'package:tasty_dinery/features/admin/users/customers/admin_customers_screen.dart';
import 'package:tasty_dinery/features/client/authentication/screens/1_onboarding/onboarding_view.dart';
import 'package:tasty_dinery/features/client/authentication/screens/2_login/login.dart';
import 'package:tasty_dinery/features/client/authentication/screens/3_signup/signup.dart';
import 'package:tasty_dinery/features/client/authentication/screens/3_signup/verify_email.dart';
import 'package:tasty_dinery/features/client/authentication/screens/4_password_configuration/forgot_password.dart';
import 'package:tasty_dinery/features/client/personnalization/screens/profile/profile_screen.dart';
import 'package:tasty_dinery/features/client/personnalization/screens/settings/settings.dart';
import 'package:tasty_dinery/features/client/shop/screens/cart/cart.dart';
import 'package:tasty_dinery/features/client/shop/screens/checkout/checkout.dart';
import 'package:tasty_dinery/features/client/shop/screens/home/home.dart';
import 'package:tasty_dinery/features/client/shop/screens/order/order.dart';
import 'package:tasty_dinery/features/client/shop/screens/product_reviews/product_reviews.dart';
import 'package:tasty_dinery/features/client/shop/screens/search/search_meal.dart';
import 'package:tasty_dinery/features/client/shop/screens/wishlist/wishlist.dart';
// import 'package:tasty_dinery/features/client/shop/screens/order_details/order_details.dart';
import 'package:tasty_dinery/routes/routes.dart';

class AppRoutes {
  static final pages = [
    // client pages

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

    // admin pages

    GetPage(name: CcRoutes.adminBanners, page: () => const AdminBanners()),
    GetPage(
        name: CcRoutes.adminCategories, page: () => const AdminCategories()),
    GetPage(name: CcRoutes.adminCustomers, page: () => const AdminCustomers()),
    GetPage(name: CcRoutes.adminDashboard, page: () => const AdminDashboard()),
    GetPage(name: CcRoutes.adminLogout, page: () => const AdminLogout()),
    GetPage(name: CcRoutes.adminMedia, page: () => const AdminMedia()),
    GetPage(name: CcRoutes.adminOrders, page: () => const AdminOrders()),
    GetPage(name: CcRoutes.adminProducts, page: () => const AdminProducts()),
    GetPage(name: CcRoutes.adminSettings, page: () => const AdminSettings()),
  ];
}
