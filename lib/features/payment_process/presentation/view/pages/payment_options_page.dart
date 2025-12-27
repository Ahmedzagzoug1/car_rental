import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int selectedMethod = 0; // 0=card,1=apple,2=paypal,3=bank

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'Payment Options',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),

                // Saved Card
                _savedCardTile(),
                const SizedBox(height: 8),

                // Credit / Debit Card
                _expandableTile(
                  title: 'Credit / Debit Card',
                  index: 0,
                  child: _cardForm(),
                ),

                // Apple Pay
                _expandableTile(
                  title: 'Apple Pay',
                  index: 1,
                  child: _walletInfo('Apple Pay will be used for payment'),
                ),

                // PayPal
                _expandableTile(
                  title: 'PayPal',
                  index: 2,
                  child: _walletInfo('You will be redirected to PayPal'),
                ),

                // Net Banking
                _expandableTile(
                  title: 'Net Banking',
                  index: 3,
                  child: _walletInfo('Select your bank to continue'),
                ),
              ],
            ),
          ),

          // Checkout Button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _canCheckout() ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  disabledBackgroundColor: Colors.green.withOpacity(.4),
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _canCheckout() {
    // هنا بتتحط شروطك الحقيقية (OTP, License, Approval)
    return true;
  }

  Widget _savedCardTile() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('**** **** **** 0258'),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  Widget _expandableTile({
    required String title,
    required int index,
    required Widget child,
  }) {
    final isOpen = selectedMethod == index;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () => setState(() => selectedMethod = index),
            leading: const Icon(Icons.payment),
            title: Text(title),
            trailing: Icon(
              isOpen
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
            ),
          ),
          if (isOpen)
            Padding(
              padding: const EdgeInsets.all(12),
              child: child,
            ),
        ],
      ),
    );
  }

  Widget _cardForm() {
    return Column(
      children: [
        _input('Card Number'),
        const SizedBox(height: 8),
        _input('Name on Card'),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _input('MM/YY')),
            const SizedBox(width: 8),
            Expanded(child: _input('CVV')),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Please ensure your card can be used for online transactions.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _walletInfo(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _input(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        isDense: true,
      ),
    );
  }
}
