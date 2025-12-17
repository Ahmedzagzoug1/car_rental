import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/features/driver_information/presentation/cubits/otp_cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class MobileNumberScreen extends StatelessWidget {
  const MobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late String phoneNumber;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            // Handle close action
          },
        ),
        title: const Text(
          'Mobile Number',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Enter Your Phone Number',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please enter your mobile number we\'ll send you a verification code.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            // Phone Number Input Field
            IntlPhoneField(
              initialCountryCode: 'EG',
              decoration: InputDecoration(
                hintText: "Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (phone) {
                print(phone.completeNumber);
                phoneNumber=phone.completeNumber;
              },
            ),  const SizedBox(height: 16),
            // Checkbox
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (bool? newValue) {
                    // Handle checkbox change
                  },
                  activeColor: Colors.green,
                ),
                const Text(
                  'Get trip updates via text',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Spacer(), // Pushes the button to the bottom
            
            
            BlocListener<OtpCubit, OtpState>(
  listener: (context, state) {
if(state is OtpSent){

  showOtpBottomSheet(context);

}else if(state is OtpSendFailure){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));

}else if(state is OtpVerified){
Navigator.pushReplacementNamed(context, AppRouter.driverLicense);
}else if(state is OtpVerifyFailure){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
}
  },
  child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
if(phoneNumber.isEmpty){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please Enter phone Number')));
}else{
  context.read<OtpCubit>().sendOtp(phoneNumber);

}
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Get OTP',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

void showOtpBottomSheet(BuildContext context) {
  String otp='';
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Enter 6 Digit Code",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                )
              ],
            ),

            const SizedBox(height: 8),
            const Text(
              "Please enter the 6 digit code sent you on\n+120-555-0877",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // OTP Fields
            PinCodeTextField(
              length: 6,
              appContext: context,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              enableActiveFill: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 50,
                fieldWidth: 45,
                inactiveColor: Colors.grey.shade300,
                activeColor: Colors.green,
                selectedColor: Colors.green,
                inactiveFillColor: Colors.white,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
              ),
              onCompleted: (value){
                otp=value;
              },
            ),

            const SizedBox(height: 10),

            // Resend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive the text? "),
                GestureDetector(
                  onTap: () {

                  },
                  child: const Text(
                    "Resend Code",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  context.read<OtpCubit>().verifyOtp(otp);
                },
                child: const Text(
                  "Verify and Continue",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
