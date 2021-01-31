import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serviceonex/components/no_account_text.dart';
import 'package:serviceonex/constants.dart';
import 'package:serviceonex/screens/sign_in/components/sign_form.dart';
import 'package:serviceonex/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("Login", style: headingStyle),
                Text(
                  "Ensure The Phone Has Been Registered",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                NoAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class SignForm extends StatefulWidget {
//   SignForm({Key key}) : super(key: key);

//   @override
//   _SignFormState createState() => _SignFormState();
// }

// class _SignFormState extends State<SignForm> {
//   final _formKey = GlobalKey<FormState>();
//   final List<String> errors = [];
//   bool remember = false;

//   void addError({String error}) {
//     if (!errors.contains(error))
//       setState(() {
//         errors.add(error);
//       });
//   }

//   void removeError({String error}) {
//     if (errors.contains(error))
//       setState(() {
//         errors.remove(error);
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           SizedBox(
//             height: getProportionateScreenHeight(40),
//           ),
//           buildInputIDField(),
//           // SizedBox(
//           //   height: getProportionateScreenHeight(10),
//           // ),
//           Row(
//             children: [
//               Checkbox(
//                 value: remember,
//                 activeColor: kPrimaryColor,
//                 onChanged: (value) {
//                   setState(() {
//                     remember = value;
//                   });
//                 },
//               ),
//               Text("Remember Me"),
//               Spacer(),
//               GestureDetector(
//                 onTap: () => Navigator.pushNamed(
//                     context, ForgotPasswordScreen.routeName),
//                 child: Text(
//                   "Forgot Password",
//                   style: TextStyle(decoration: TextDecoration.underline),
//                 ),
//               ),
//             ],
//           ),
//           FormError(errors: errors),
//           DefaultButton(
//               text: "Login",
//               press: () {
//                 if (_formKey.currentState.validate()) {
//                   _formKey.currentState.save();
//                 }
//               }),
//           SizedBox(height: getProportionateScreenHeight(20)),
//           NoAccountText()
//         ],
//       ),
//     );
//   }

//   TextFormField buildInputIDField() {
//     return TextFormField(
//       obscureText: true,
//       maxLength: 5,
//       keyboardType: TextInputType.number,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kSOneIDNullError);
//         }
//         if (value.isEmpty || kSOneIDRegExp.hasMatch(value)) {
//           removeError(error: kInvalidSOneID);
//         }
//       },
//       validator: (value) {
//         if (value.isEmpty) {
//           addError(error: kSOneIDNullError);
//         } else if (value.isNotEmpty && !kSOneIDRegExp.hasMatch(value)) {
//           addError(error: kInvalidSOneID);
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         hintText: "Enter Your ID",
//         labelText: "Service ID",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSuffixIcon(
//           svgIcon: "assets/icons/Lock.svg",
//         ),
//       ),
//     );
//   }
// }
