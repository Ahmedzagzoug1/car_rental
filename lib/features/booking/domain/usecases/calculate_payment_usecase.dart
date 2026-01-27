class CalculatePaymentUseCase {
  double call({
    required double pricePerDay,
    required int days,
    required double tripFee,
    double discount = 0,
  }) {
    return (pricePerDay * days + tripFee - discount);
  }
}
