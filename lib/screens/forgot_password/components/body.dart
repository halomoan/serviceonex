import 'package:flutter/material.dart';
import 'package:serviceonex/components/custom_suffix_icon.dart';
import 'package:serviceonex/components/default_button.dart';
import 'package:serviceonex/components/form_error.dart';
import 'package:serviceonex/components/no_account_text.dart';
import 'package:serviceonex/constants.dart';
import 'package:serviceonex/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Text(
            "Forgot Password",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(28),
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Please enter your email and we will send you a link to return to your account",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          ForgotPasswordForm()
        ]),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  ForgotPasswordForm({Key key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              }
              if (value.isEmpty || emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
            },
            validator: (value) {
              if (value.isEmpty) {
                addError(error: kEmailNullError);
              } else if (value.isNotEmpty &&
                  !emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Enter Your Email Address",
              labelText: "Email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(
                svgIcon: "assets/icons/Lock.svg",
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {}
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText()
        ],
      ),
    );
  }
}
