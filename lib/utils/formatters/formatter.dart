import 'package:intl/intl.dart';

class CcFormatter {
  //customize date as needed
  static String formatDate(DateTime date) {
    date = DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  // customize local currency and its symbol
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', name: 'TZS', symbol: '/=')
        .format(amount);
  }

  // 10-digit phone number format: 0788 456 788
  static String formatPhoneNumber(String phoneNumber) {
    return '${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4, 6)} ${phoneNumber.substring(6)}';
  }
}
