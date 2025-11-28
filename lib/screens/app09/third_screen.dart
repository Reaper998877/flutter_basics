import 'package:flutter/material.dart';
import 'package:flutter_basics/app_theme.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  String btnName = "Send OTP", error = "";
  int remainingSeconds = 5;
  bool hideOTPBox = false,
      resendOTPBtn = false,
      resendOTPTimer = true,
      errorMsg = false;
  final form1 = FormGroup({
    'username': FormControl<String>(
      validators: [
        Validators.required,
        Validators.pattern(
          r'^[a-zA-Z0-9]*$',
          validationMessage: "Invalid Input",
        ),
      ],
    ),
    'password': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(8),
        Validators.pattern(
          r'[!@#\$%^&*()_+|~\-={}\[\]:;"<>\?,.]',
          validationMessage: 'Special character required',
        ),
        Validators.pattern(r'\d', validationMessage: 'Digits required'),
      ],
    ),
    'checkbox': FormControl<bool>(value: false),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 3', gitLink: '',),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ReactiveForm(
          formGroup: form1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Part 3 : Widgets => ReactiveForm,    ReactiveFormConsumer,    ReactiveValueListenableBuilder,    Checkbox',
                  style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.4,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 2,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 2,
                    ),
                  ],
                ),
                  softWrap: true,
                ),
                const SizedBox(height: 30),
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    final isDirty = formGroup.control('username').dirty;
                    final isValidName = formGroup.control('username').valid;
                    return OutlineReactiveTextField(
                      formControlName: 'username',
                      label: 'Username',
                      showErrors: (control) => false,
                      keyboardType: TextInputType.text,
                      suffixIcon: (isDirty)
                          ? (isValidName)
                                ? Icons.check_circle
                                : Icons.dangerous
                          : null,
                      suffixIconColor: (isValidName)
                          ? Colors.green
                          : Colors.red,
                    );
                  },
                ),
                const SizedBox(height: 40),
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    return OutlineReactiveTextField(
                      formControlName: 'password',
                      label: "Password",
                      obscureText: true,
                      suffixIconPressable: true,
                      showErrors: (control) => control.touched || control.dirty,
                      suffixIcon: Icons.visibility,
                      keyboardType: TextInputType.visiblePassword,
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot Password",
                        style: GoogleFonts.average(
                          textStyle: const TextStyle(
                            color: Color(0xff0044FF),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ReactiveValueListenableBuilder widget helps build UI elements that react to changes in a value stream. Here, the value stream is the state of the checkbox form control, which holds a boolean value (true/false).
                    // You can use either ReactiveFormConsumer or ReactiveValueListenableBuilder to build the checkbox in your reactive form, and both approaches have their advantages and disadvantages.
                    ReactiveValueListenableBuilder<bool>(
                      formControlName: 'checkbox',
                      builder: (context, control, child) => Checkbox(
                        value: control.value,
                        onChanged: (value) {
                          control.value = value!;
                          debugPrint('Checkbox value: $value');
                          setState(() {});
                        },
                      ),
                    ),
                    Text(
                      "I'm a Service Provider",
                      style: GoogleFonts.montserratAlternates(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    final isFormValid = formGroup.valid;
                    return CustomGradientButton(
                      text: "Login",
                      borderColor: Colors.grey,
                      gradient: AppTheme.gradient3(),
                      opacity: isFormValid ? 1.0 : 0.2,
                      onPressed: isFormValid
                          ? () {
                              debugPrint(
                                "${formGroup.control('username').value.toString().trim()} ${formGroup.control('password').value.toString().trim()}",
                              );
                            }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
