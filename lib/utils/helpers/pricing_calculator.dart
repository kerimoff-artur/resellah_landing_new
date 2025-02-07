class PricingCalculator {
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    
    double shippingCost = getShippingCostForLocation(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCostForLocation(location);
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // Implement logic to get tax rate for a given location
    return 0.10; // Placeholder value
  }

  static double getShippingCostForLocation(String location) {
    // Implement logic to get shipping cost for a given location
    return 5.0; // Placeholder value
  }
}