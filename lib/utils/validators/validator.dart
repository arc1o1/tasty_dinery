import 'package:get/get.dart';
import 'package:tasty_dinery/features/shop/controllers/product_checkout_controller.dart';

class CcValidator {
  // emppty text validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'email is required';
    }

    // regex for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'invalid email address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password is required';
    }

    // check min password length
    if (value.length < 6) {
      return 'password must be atleast 6 characters long';
    }

    // check for uppercase letters
    // if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return 'password must contain at least one uppercase letter';
    // }

    // check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'password must contain at least one number';
    }

    // check for special characters
    // if (!value.contains(RegExp(r'[!@#$%^&*(),./":{|<>}]'))) {
    //   return 'password must contain at least one special character';
    // }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'phone number is required';
    }

    // regex for phone number validation (assuming 10-digit Tanzania phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'invalid phone number format (10 digits required)';
    }

    return null;
  }
  // more custom validators

  // only checkout phone number validator
  static String? validatePaymentMethodWithPhoneNumber(String? value) {
    // controller
    final checkoutController = Get.put(CheckOutController());
    // final firstThreeNumbers = value?.substring(0, 3);

    if (value == null || value.isEmpty) {
      return 'phone number is required';
    } else {
      final firstThreeNumbers = value.substring(0, 3);
      final halotelList = ['061', '062'];
      final airtelList = ['068', '069', '078', '079'];
      final tigoList = ['065', '067', '071', '077', '073'];
      final vodacomList = ['074', '075', '076'];
      final ttclList = ['072', '073'];

      // check 01
      if (checkoutController.selectedPaymentMethod.value.name ==
              'Airtel Money' &&
          !airtelList.contains(firstThreeNumbers)) {
        return 'Enter Airtel Mobile Number';
      }

      // check 02
      if (checkoutController.selectedPaymentMethod.value.name == 'Tigo Pesa' &&
          !tigoList.contains(firstThreeNumbers)) {
        return 'Enter Tigo Mobile Number';
      }

      // check 03
      if (checkoutController.selectedPaymentMethod.value.name == 'M-Pesa' &&
          !vodacomList.contains(firstThreeNumbers)) {
        return 'Enter Vodacom Mobile Number';
      }

      // check 04
      if (checkoutController.selectedPaymentMethod.value.name == 'HaloPesa' &&
          !halotelList.contains(firstThreeNumbers)) {
        return 'Enter Halotel Mobile Number';
      }

      // check 05
      if (checkoutController.selectedPaymentMethod.value.name == 'T-Pesa' &&
          !ttclList.contains(firstThreeNumbers)) {
        return 'Enter TTCL Mobile Number';
      }
    }

    // regex for phone number validation (assuming 10-digit Tanzania phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'invalid phone number format (10 digits required)';
    }

    return null;
  }
}
