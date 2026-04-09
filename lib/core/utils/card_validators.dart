import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// this file contains all the validators for the card form 
//and the input formatters for the card number and expiry date
// 1. Card number validator using Luhn algorithm
class CardValidators {
  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) return 'Required';
    
    //delete all spaces from the card number
    String cleanValue = value.replaceAll(RegExp(r'\s+\b|\b\s+'), "");
// Check if the card number is between 13 and 19 digits
    if (cleanValue.length < 13 || cleanValue.length > 19) {
      return 'Invalid Card Number';
    }

    // Luhn Algorithm Check
    int sum = 0;
    bool shouldDouble = false;
    for (int i = cleanValue.length - 1; i >= 0; i--) {
      int digit = int.parse(cleanValue[i]);
      if (shouldDouble) {
        digit *= 2;
        if (digit > 9) digit -= 9;
      }
      sum += digit;
      shouldDouble = !shouldDouble;
    }

    return (sum % 10 == 0) ? null : 'Invalid Card Number';
  }

  // 2. Validator for expiry date in the format MM/YY
  static String? validateExpiry(String? value) {
    if (value == null || value.isEmpty) return 'Required';

    if (!RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$').hasMatch(value)) {
      return 'Invalid Format (MM/YY)';
    }

//make sure the card is not expired
    var parts = value.split('/');
    int month = int.parse(parts[0]);
    int year = int.parse('20${parts[1]}'); 
    
    DateTime now = DateTime.now();
  DateTime expiryDate = DateTime(year, month + 1, 0);

    if (expiryDate.isBefore(DateTime(now.year, now.month))) {
      return 'Card Expired';
    }
    return null;
  }

  // 3. cvv validator
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) return 'Required';
    if (value.length < 3 || value.length > 4) {
      return 'Invalid';
    }
    return null;
  }
  static CardType getCardTypeFromNumber(String input) {
    String cleanInput = input.replaceAll(RegExp(r'\s+\b|\b\s+'), "");
    
    if (cleanInput.startsWith(RegExp(r'[4]'))) {
      return CardType.visa;
    } else if (cleanInput.startsWith(RegExp(r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      return CardType.mastercard;
    } else if (cleanInput.startsWith(RegExp(r'((34)|(37))'))) {
      return CardType.amex;
    } else if (cleanInput.startsWith(RegExp(r'((6011)|(65)|(64[4-9])|(622[1-9]))'))) {
      return CardType.discover;
    } else {
      return CardType.unknown;
    }
}
}
//2- Input formatter for card number to add spaces every 4 digits
class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.replaceAll(RegExp(r'\s+\b|\b\s+'), "");
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' ');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
//3- Input formatter for expiry date to add a slash after the month

 class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
// Remove all non-digit characters
    String digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

//set a max length of 4 digits (MMYY)
    if (digits.length > 4) {
      digits = digits.substring(0, 4);
    }

    String formatted = '';

    if (digits.length >= 2) {
      formatted = digits.substring(0, 2);
      if (digits.length > 2) {
        formatted += '/' + digits.substring(2);
      }
    } else {
      formatted = digits;
    }
      
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
 }

enum CardType { visa, mastercard, amex, discover, unknown }