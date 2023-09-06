import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_registration/flutter_registration.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return RegistrationScreen(
      registrationOptions: RegistrationOptions(
        registrationRepository: ExampleRegistrationRepository(),
        registrationSteps: RegistrationOptions.getDefaultSteps(),
        afterRegistration: () {
          debugPrint('Registered!');
        },
      ),
    );
  }
}

class ExampleRegistrationRepository with RegistrationRepository {
  @override
  Future<bool> register(HashMap values) {
    debugPrint('register: $values');
    return Future.value(true);
  }
}
