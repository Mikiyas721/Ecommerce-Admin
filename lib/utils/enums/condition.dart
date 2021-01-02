enum Condition { BRAND_NEW, SLIGHTLY_USED, USED }

extension ConditionExtension on Condition {
  String getString() {
    switch (this) {
      case Condition.BRAND_NEW:
        return 'Brand New';
      case Condition.SLIGHTLY_USED:
        return 'Slightly Used';
      default:
        return 'Used';
    }
  }

  static Condition fromString(String conditionString) {
    if (conditionString == 'Brand New')
      return Condition.BRAND_NEW;
    else if (conditionString == 'Slightly Used')
      return Condition.SLIGHTLY_USED;
    else if (conditionString == 'Used')
      return Condition.USED;
    else
      throw Exception("Couldn't Map condition String");
  }
}
