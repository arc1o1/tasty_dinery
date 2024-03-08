class CcPricingCalculator {
  // calculate Price based on tax

  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double totalPrice = productPrice + taxAmount;

    return totalPrice;
  }

  // calculate tax

  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // tax rate for tanzania is 15%
    return 0.15;
  }

  // static double calculateCartTotal(CartModel cart) {
  //   return cart.item.map((e) => e.price).fold(0,
  //       (previousPrice, currentPrice) => previousPrice + (CurrentPrice ?? 0));
  // }
}
