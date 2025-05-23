import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the TextFormFields
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // User Name TextFormField
              TextFormField(
                controller: _userNameController,
                decoration:const InputDecoration(
                  hintText: 'Enter your username',
                  labelText: 'Username', // Optional: if you want a floating label
                  border:  UnderlineInputBorder(), // Inline border
                  suffixIcon:  Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Email TextFormField
              TextFormField(
                controller: _emailController,
                decoration:const InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  border:  UnderlineInputBorder(),
                  suffixIcon:  Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Password TextFormField
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  border: const UnderlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_isPasswordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Mobile Number TextFormField
              TextFormField(
                controller: _mobileNumberController,
                decoration:const InputDecoration(
                  hintText: 'Enter your mobile number',
                  labelText: 'Mobile Number',
                  border:  UnderlineInputBorder(),
                  suffixIcon:  Icon(Icons.phone_android_outlined),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  // Add more specific mobile number validation if needed
                  return null;
                },
              ),
              const SizedBox(height: 24.0), // Spacing before the button

              // Sign Up Button
              SizedBox(
                width: double.infinity, // Makes the button full width
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process data
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      print('Username: ${_userNameController.text}');
                      print('Email: ${_emailController.text}');
                      print('Password: ${_passwordController.text}');
                      print('Mobile Number: ${_mobileNumberController.text}');
                      // Add your sign-up logic here
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0), // Adjust button padding
                    textStyle: const TextStyle(fontSize: 18), // Adjust button text style
                  ),
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// To use this form in your app:
// void main() {
//   runApp(MaterialApp(
//     home: SignUpForm(),
//   ));
// }
