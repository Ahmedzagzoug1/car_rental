class SelectPaymentMethod {
  String? _selectedMethod;

  void call(String paymentMethod) {
    _selectedMethod = paymentMethod;
  }

  String? get selectedMethod => _selectedMethod;
}
