import 'package:car_rental/core/resources/strings_manager.dart';
import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/core/shared_components/shared_widgets/custom_text_form_field.dart';
import 'package:car_rental/features/auth/domain/usecases/email_auth/sign_up_with_email_usecase.dart';
import 'package:car_rental/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_components/data/models/car_model.dart';


class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupCubit>(
      create: (context) => SignupCubit(sl<SignUpWithEmailUseCase>() ),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('sign up success'),));
            Navigator.pushNamedAndRemoveUntil(context, AppRouter.homeRoute, (predicate){
              return false;
            });
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormField(hintText: 'Enter Your Email', controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is Empty';
                    } else if (!AppStrings.emailRegex.hasMatch(value)) {
                      return 'Invalid Email';
                    }
                    return null;
                  } ,),

                const SizedBox(height: 20),

                CustomTextFormField(hintText: 'Enter Your Name', controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is Empty';
                    } else if (!AppStrings.usernameRegex.hasMatch(value)) {
                      return 'Invalid Name';
                    }
                    return null;
                  } ,),
                const SizedBox(height: 20),

                CustomTextFormField(hintText: 'Enter Your phone', controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'phone is Empty';
                    } else if (!AppStrings.phoneRegex.hasMatch(value)) {
                      return 'Invalid Phone Number';
                    }
                    return null;
                  } ,),
                const SizedBox(height: 20),

                CustomTextFormField(hintText: 'Enter Your Password', controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password is Empty';
                    } else if (!AppStrings.passwordRegex.hasMatch(value)) {
                      return 'Invalid password';
                    }
                    return null;
                  } ,),

                const SizedBox(height: 30),


                state is SignupLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // final email = _emailController.text.trim();
                        // final password = _passwordController.text.trim();

                        print("EMAIL: ${_emailController.text.trim()}");
                        print("PASSWORD: ${_passwordController.text.trim()}");
                        print("email: $_emailController");
                        print("password: $_passwordController");

                        context.read<SignupCubit>().signUpWithEmail(
                            email: _emailController.text,
                            name: _nameController.text,
                            password: _passwordController.text,
                            phone: _phoneController.text
                        );
                      }
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: const Text("Sign up"),
                  ),


                const SizedBox(height: 20),

                GestureDetector(
                  onTap: ()async {
                    await seedCars();

                    //  Navigator.of(context).pushReplacementNamed(ForgetPwScreen.routeName);
                  },
                  child: const Text(
                    "Forget your password?",
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// class SignForm extends StatefulWidget {
//   const SignForm({super.key});
//
//   @override
//   _SignFormState createState() => _SignFormState();
// }
//
// class _SignFormState extends State<SignForm> {
//   final _formKey = GlobalKey<FormState>();
//   String? email;
//   String? password;
//   bool? remember = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginCubit(),
//       child: BlocConsumer<LoginCubit, LoginState>(
//         listener: (context, state) {
//           if (state is SuccessLoginState) {
//             showSuccessSnackBar("Login successful", 3, context);
//             Helper.navAndFinish(context, HomeScreen());
//           }
//         },
//         builder: (context, state) {
//           return Form(
//             key: _formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   keyboardType: TextInputType.emailAddress,
//                   onSaved: (newValue) => email = newValue,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return kEmailNullError; // Return the actual error message
//                     } else if (!emailValidatorRegExp.hasMatch(value)) {
//                       return kInvalidEmailError; // Return the actual error message
//                     }
//                     return null; // Return null if valid
//                   },
//                   decoration: const InputDecoration(
//                     hintText: "your email",
//                     suffixStyle: (TextStyle(color: AppColor.orange)),
//                     fillColor: Color(0xFFe5e5e5),
//                     filled: true,
//                     hintStyle: TextStyle(color: Color(0xFFbcb8b1)),
//                     contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   onChanged: (value) {},
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 TextFormField(
//                   obscureText: true,
//                   onSaved: (newValue) => password = newValue,
//                   onChanged: (value) {},
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return kPassNullError;
//                     } else if (value.length < 8) {
//                       return kShortPassError;
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     hintText: "Enter your password",
//                     fillColor: Color(0xFFe5e5e5),
//                     filled: true,
//                     hintStyle: TextStyle(color: Color(0xFFbcb8b1)),
//                     contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//
//                 state is LoadingLoginState
//                     ? CircularProgressIndicator()
//                     : SizedBox(
//                       height: 50,
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Validate the form when the button is pressed
//                           if (_formKey.currentState!.validate()) {
//                             _formKey.currentState!.save();
//                             // All fields are valid, proceed with login logic
//                             print("Email: $email, Password: $password");
//                             context.read<LoginCubit>().login(
//                               context,
//                               emailController: email,
//                               passwordController: password,
//                             );
//                           } else {
//                             print("Form is invalid. Please check the fields.");
//                           }
//                         },
//                         style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColor.orange)),
//                         child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18)),
//                       ),
//                     ),
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pushReplacementNamed(ForgetPwScreen.routeName);
//                   },
//                   child: const Text(
//                     "Forget your password?",
//                     style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
