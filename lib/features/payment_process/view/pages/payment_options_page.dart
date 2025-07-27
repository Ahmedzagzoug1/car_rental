import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PaymentOptionsPage extends StatefulWidget {
  const PaymentOptionsPage({super.key});

  @override
  State<PaymentOptionsPage> createState() => _PaymentOptionsPageState();
}

class _PaymentOptionsPageState extends State<PaymentOptionsPage> {
  // State to manage the expansion of the Credit/Debit Card section
  bool _isCreditCardExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Existing Card Section
          _buildPaymentOptionTile(
            title: '****0258',
            leading:  CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.logo.wine%2Flogo%2FVisa_Inc.&psig=AOvVaw2AHYxt9GDw8nB6itTGiZ4A&ust=1753611063307000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPjagrmk2o4DFQAAAAAdAAAAABAE.png' ,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
            onTap: () {
              // Handle selection of existing card
            },
            showChevron: true,
          ),
          const Divider(), // Separator

          // Credit/Debit Card Section (Expandable)
          _buildExpandablePaymentOptionTile(
            title: 'Credit/Debit Card',
            leading: const Icon(Icons.credit_card),
            isExpanded: _isCreditCardExpanded,
            onTap: () {
              setState(() {
                _isCreditCardExpanded = !_isCreditCardExpanded;
              });
            },
            // Content for the expanded section
            expandedContent: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                _buildCardInputField(hintText: 'Card Number'),
                const SizedBox(height: 10),
                _buildCardInputField(hintText: 'Name on Card'),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(
                      child:
                          _buildCardInputField(hintText: 'Valid Thru (mm/yy)'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildCardInputField(hintText: 'CVV'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please ensure your card can be used for online transactions.',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 10),
                // Card logos
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                 CachedNetworkImage(
                fit: BoxFit.fill,
                  imageUrl:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.logo.wine%2Flogo%2FVisa_Inc.&psig=AOvVaw2AHYxt9GDw8nB6itTGiZ4A&ust=1753611063307000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPjagrmk2o4DFQAAAAAdAAAAABAE.png' ,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                    const SizedBox(width: 8),
                /*    Image.network(
                      'https://placehold.co/40x25/FF5733/FFFFFF?text=MC',
                      // Placeholder for Mastercard
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.payment),
                    ),
                    const SizedBox(width: 8),
                    Image.network(
                      'https://placehold.co/40x25/663399/FFFFFF?text=RuPay',
                      // Placeholder for RuPay
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.payment),
                    ),
                    const SizedBox(width: 8),
                    Image.network(
                      'https://placehold.co/40x25/CC3300/FFFFFF?text=Disc',
                      // Placeholder for Discover
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.payment),
                    ),
                    const SizedBox(width: 8),
                    Image.network(
                      'https://placehold.co/40x25/0078D4/FFFFFF?text=AMEX',
                      // Placeholder for AMEX
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.payment),
                    ),*/
                  ],
                ),
              ],
            ),
          ),
          const Divider(),

          // Apple Pay Section
          _buildPaymentOptionTile(
            title: 'Apple Pay',
            leading:  CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.logo.wine%2Flogo%2FVisa_Inc.&psig=AOvVaw2AHYxt9GDw8nB6itTGiZ4A&ust=1753611063307000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPjagrmk2o4DFQAAAAAdAAAAABAE.png' ,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            onTap: () {
              // Handle Apple Pay
            },
            showChevron: true,
          ),
          const Divider(),

          // PayPal Section
          _buildPaymentOptionTile(
            title: 'PayPal',
            leading:  CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.logo.wine%2Flogo%2FVisa_Inc.&psig=AOvVaw2AHYxt9GDw8nB6itTGiZ4A&ust=1753611063307000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPjagrmk2o4DFQAAAAAdAAAAABAE.png' ,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            onTap: () {
              // Handle PayPal
            },
            showChevron: true,
          ),
          const Divider(),

          // Net Banking Section
          _buildPaymentOptionTile(
            title: 'Net Banking',
            leading: const Icon(Icons.account_balance),
            onTap: () {
              // Handle Net Banking
            },
            showChevron: true,
          ),
        ],
      ),
    );
  }

  // Helper widget for a single payment option tile
  Widget _buildPaymentOptionTile({
    required String title,
    required Widget leading,
    required VoidCallback onTap,
    bool showChevron = false,
  }) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: showChevron
          ? const Icon(Icons.keyboard_arrow_down, color: Colors.grey)
          : null,
      onTap: onTap,
    );
  }

  // Helper widget for expandable payment option tile
  Widget _buildExpandablePaymentOptionTile({
    required String title,
    required Widget leading,
    required bool isExpanded,
    required VoidCallback onTap,
    required Widget expandedContent,
  }) {
    return Column(
      children: [
        ListTile(
          leading: leading,
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.grey,
          ),
          onTap: onTap,
        ),
        if (isExpanded)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: expandedContent,
          ),
      ],
    );
  }

  // Helper widget for card input fields
  Widget _buildCardInputField({required String hintText}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none, // No border line
        ),
        filled: true,
        fillColor: Colors.grey[200],
        // Light grey background for input fields
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      keyboardType: hintText.contains('Card Number') || hintText.contains('CVV')
          ? TextInputType.number
          : TextInputType.text,
    );
  }
}
