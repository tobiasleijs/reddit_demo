import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_profile/flutter_profile.dart';
import 'package:reddit_app/utils/example_profile_data.dart';
import 'package:reddit_app/utils/example_profile_service.dart';

class ProfileExample extends StatefulWidget {
  const ProfileExample({Key? key}) : super(key: key);

  @override
  State<ProfileExample> createState() => _ProfileExampleState();
}

class _ProfileExampleState extends State<ProfileExample> {
  late User _user;
  ProfileData profileData = ExampleProfileData().fromMap(
      {'email': 'example@email.com', 'about': 'about', 'remarks': 'remarks'});

  @override
  void initState() {
    super.initState();
    _user = User(
      firstName: 'Freek',
      lastName: 'Vonk',
      image: Uint8List.fromList(
        [],
      ),
      profileData: profileData,
    );
  }

  @override
  Widget build(BuildContext context) {
    //get width and height
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: 800,
              child: ProfilePage(
                showItems: true,
                showAvatar: true,
                prioritizedItems: const ['remarks', 'about'],
                wrapViewOptions: WrapViewOptions(
                  direction: Axis.horizontal,
                  spacing: 16,
                ),
                bottomActionText: 'Log out',
                itemBuilderOptions: ItemBuilderOptions(
                  //no label for email
                  validators: {
                    'first_name': (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Field empty';
                      }
                      return null;
                    },
                    'last_name': (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Field empty';
                      }
                      return null;
                    },
                    'email': (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Field empty';
                      }
                      return null;
                    },
                  },
                ),
                user: _user,
                service: ExampleProfileService(),
                style: ProfileStyle(
                  avatarTextStyle: const TextStyle(fontSize: 20),
                  pagePadding: EdgeInsets.only(
                    top: 50,
                    bottom: 50,
                    left: width * 0.1,
                    right: width * 0.1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomItemBuilderExample extends ItemBuilder {
  CustomItemBuilderExample({
    required super.options,
  });

  @override
  Widget build(String key, dynamic value, Widget? widget,
      Function(String) updateItem, Function(String?) saveItem) {
    if (widget == null) {
      var controller = TextEditingController(
        text: '${value ?? ''}',
      );

      late InputDecoration inputDecoration;

      inputDecoration =
          options.inputDecorationField?[key] ?? options.inputDecoration;
      var formFieldKey = GlobalKey<FormFieldState>();
      return SizedBox(
        width: 400,
        child: TextFormField(
          keyboardType: options.keyboardType?[key],
          key: formFieldKey,
          controller: controller,
          decoration: inputDecoration,
          style: options.inputTextStyle,
          readOnly: options.readOnly,
          onFieldSubmitted: (value) {
            updateItem(value);
          },
          onSaved: (newValue) {
            saveItem(newValue);
          },
          validator: (value) {
            return options.validators?[key]?.call(value);
          },
        ),
      );
    }
    return widget;
  }
}
