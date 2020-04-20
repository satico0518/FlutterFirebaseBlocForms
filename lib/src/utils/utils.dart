class Utils {
  bool isNumeric(String value) {
    if (value.isEmpty) return false;
    final tryNumber = num.tryParse(value);
    return tryNumber != null;
  }
}