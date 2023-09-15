import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_profile/flutter_profile.dart';
import 'package:reddit_app/persistence/models/user_model.dart';
import 'package:reddit_app/persistence/persistence_adapter.dart';
import 'package:reddit_app/persistence/persistence_port.dart';
import 'package:reddit_app/ui/widgets/scaffold/footer.dart';
import 'package:reddit_app/utils/example_profile_data.dart';
import 'package:reddit_app/utils/example_profile_service.dart';
import 'package:reddit_app/utils/user_simple_preferences.dart';

class ProfileExample extends StatefulWidget {
  const ProfileExample({Key? key}) : super(key: key);

  @override
  State<ProfileExample> createState() => _ProfileExampleState();
}

class _ProfileExampleState extends State<ProfileExample> {
  PersistencePort database = PersistenceAdapter();
  late int _userId = 0;
  late UserModel _userModel;
  late User _user;
  late ProfileData profileData;
  late Future initializationFuture;

  @override
  void initState() {
    super.initState();
    initializationFuture = _initializeUser();
  }

  Future<void> _initializeUser() async {
    _userId = UserSimplePreferences.getLoggedInUser();
    //print('UserId loaded: $_userId');
    _userModel = database.getUserFromId(_userId);
    ByteData data = await rootBundle.load('assets/${_userModel.avatar}');
    //print('Usermodel loaded, user ${_userModel.username} has been loaded');
    profileData = ExampleProfileData().fromMap({
      'email': _userModel.email,
      'about': _userModel.about,
      'remarks': _userModel.remarks
    });
    _user = User(
      firstName: _userModel.firstname,
      lastName: _userModel.lastname,
      image: data.buffer.asUint8List(),
      profileData: profileData,
    );
    setState(() {
      //print('state has been set');
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future: initializationFuture,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.error != null) {
            return Text(snapshot.error.toString());
          } else {
            return Scaffold(
              backgroundColor: const Color(0xFF76F7BF),
              appBar: AppBar(
                title: const Text('Reddit Home'),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 63, 61, 61),
              ),
              bottomNavigationBar: const ScaffoldFooter(),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ProfilePage(
                          showItems: true,
                          showAvatar: true,
                          //prioritizedItems: const ['remarks', 'about'],
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
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        }));
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
