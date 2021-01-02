enum ProductCategory {
  ELECTRONICS,
  COSMETICS,
  PROPERTY,
  FASHION,
  VEHICLE,
  OTHERS
}

extension ProductCategoryExtension on ProductCategory {
  String getString() {
    switch (this) {
      case ProductCategory.ELECTRONICS:
        return 'Electronics';
      case ProductCategory.COSMETICS:
        return 'Cosmetics';
      case ProductCategory.PROPERTY:
        return 'Property';
      case ProductCategory.FASHION:
        return 'Fashion';
      case ProductCategory.VEHICLE:
        return 'Vehicle';
      default:
        return 'Others';
    }
  }

  static ProductCategory fromString(String categoryString) {
    if (categoryString == 'Electronics')
      return ProductCategory.ELECTRONICS;
    else if (categoryString == 'Cosmetics')
      return ProductCategory.COSMETICS;
    else if (categoryString == 'Property')
      return ProductCategory.PROPERTY;
    else if (categoryString == 'Fashion')
      return ProductCategory.FASHION;
    else if (categoryString == 'Vehicle')
      return ProductCategory.VEHICLE;
    else if (categoryString == 'Others')
      return ProductCategory.OTHERS;
    else
      throw Exception("Couldn't Map String");
  }
}
