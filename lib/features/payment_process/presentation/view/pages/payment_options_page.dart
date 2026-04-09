import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/features/payment_process/domain/entities/payment_request_entity.dart';
import 'package:car_rental/features/payment_process/domain/entities/payment_type.dart';
import 'package:car_rental/features/payment_process/presentation/cubit/cubit/payment_cubit.dart';
import 'package:car_rental/features/payment_process/presentation/view/widgets/card_form.dart';
import 'package:car_rental/features/payment_process/presentation/view/widgets/wallet_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int selectedMethod = 0; // 0=card,1=apple,2=paypal,3=bank

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>(
      create: (context) => sl<PaymentCubit>(),
      
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Checkout'),
            leading: const BackButton(),
          ),
          body: BlocConsumer<PaymentCubit, PaymentState>(
  listener: (context, state) {
    if (state is PaymentSuccess) {
      Navigator.pushNamed(context, AppRouter.webViewRoute, arguments: state.url);
    } else if (state is PaymentFailure) {
      ScaffoldMessenger.of(context).
      showSnackBar(SnackBar(content: Text(state.errorMessage)));
    }
  },
  builder: (context, state) {
    // Determine if the checkout button should be enabled based on the current state
    bool isEnabled = false;
    if (state is PaymentInitial) {
      isEnabled = state.isButtonEnabled;
    }

    return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    const Text(
                      'Payment Options',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),

                    // Saved Card we can add this later if we have time
                    // we can also add the option to add a new card and save it for later use
                    //   _savedCardTile(),
                    //    const SizedBox(height: 8),

                    // Credit / Debit Card
                    _expandableTile(
                      title: 'Credit / Debit Card',
                      index: 0,
                      child: const CardForm(),
                    ),

                    // wallet
                    _expandableTile(
                      title: 'wallet',
                      index: 1,
                      child: const WalletForm(),
                    ),

                    // koisk
                    _expandableTile(
                      title: 'koisk',
                      index: 2,
                      child: const Text(
                          'You will be redirected to pay at the nearest kiosk'),
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
                    onPressed: _canCheckout() ? () {
                      if (state is PaymentLoading ||(state is PaymentInitial && !state.isButtonEnabled)) return; // Prevent multiple clicks during loading
                        
                        final paymentType =  context.read<PaymentCubit>().state is PaymentInitial
                            ? (context.read<PaymentCubit>().state as PaymentInitial).selectedType
                            : null;
                        context.read<PaymentCubit>().getPaymentData();
                    } : null,
                    style: Theme.of(context).elevatedButtonTheme.style!,
                    child: const Text(
                      'Checkout',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          );
  },
        ),
      ),
    ));
  }

  bool _canCheckout() {
    
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
              isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
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
}
