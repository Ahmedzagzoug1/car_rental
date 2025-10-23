import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/core/shared_components/shared_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DriverLicenseScreen extends StatelessWidget {
  const DriverLicenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Driver\'s License',
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
              'Enter License Details',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please enter your info exactly as it appears on your license so EcoFlex can verify your eligibility to drive.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            // Scan license button
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[100],
              ),
              child: Row(
                children: [
                  const Icon(Icons.credit_card_outlined,
                      color: Colors.green, size: 28),
                  const SizedBox(width: 16),
                  const Text(
                    'Scan license to autofill',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Form Fields
            _buildFormSection(
              title: 'Full Name',
              hintText: 'Enter your full name',
            ),
            const SizedBox(height: 24),
            _buildFormSection(
              title: 'Country',
              hintText: 'Select country',
              isDropdown: true,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _buildFormSection(
                    title: 'Expiration Date',
                    hintText: 'dd/mm/yyyy',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildFormSection(
                    title: 'Date of Birth',
                    hintText: 'dd/mm/yyyy',
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Pushes the button to the bottom
            CustomButton(onPressed: (){
              Navigator.pushNamed(context, AppRouter.mobileNumber);
            },title: 'Save and Continue',),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildFormSection({
    required String title,
    required String hintText,
    bool isDropdown = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: isDropdown
              ? DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: 'placeholder',
              icon: const Icon(Icons.keyboard_arrow_down,
                  color: Colors.grey),
              onChanged: (String? newValue) {
                // Handle dropdown change
              },
              items: <String>['placeholder', 'US', 'CA', 'GB']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value == 'placeholder' ? hintText : value,
                    style: TextStyle(
                      color: value == 'placeholder'
                          ? Colors.grey
                          : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
              : TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}