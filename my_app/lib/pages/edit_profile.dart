import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/cells/forms.dart';
import 'package:my_app/design_system/cells/headers.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:my_app/models/forms/contact.dart';
import 'package:my_app/models/forms/personal_info.dart';
import 'package:my_app/models/volunteer.dart';
import 'package:my_app/providers/user_provider.dart';
import 'package:my_app/services/images_service.dart';

import '../services/user_service.dart';
import 'package:intl/intl.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  static String get routeName => 'edit_profile';
  static String get routeLocation => 'edit_profile';

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  bool personalIsValid = false;
  bool contactIsValid = false;
  bool loading = false;
  late PersonalInfo personalInfo;
  late ContactInfo contactInfo;
  GlobalKey<FormState> personalInfoFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> contactInfoFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Volunteer currentUser = ref.read(userProvider)!;
    if (currentUser.profileCompleted) {
      final DateFormat formatter = DateFormat('dd/MM/yyy');
      personalInfo = PersonalInfo(
          birthDate: formatter.format(currentUser.birthDate!),
          gender: currentUser.gender,
          profileImageUrl: currentUser.imagePath);
      contactInfo =
          ContactInfo(email: currentUser.email, phoneNumber: currentUser.phone);
      contactIsValid = true;
      personalIsValid = true;
    } else {
      personalInfo = PersonalInfo();
      contactInfo = ContactInfo(email: currentUser.email);
    }
  }

  final userService = AuthenticationService();
  final imageService = ImagesService();

  void onPersonalInfoValidationChanged(bool isValid) {
    setState(() => personalIsValid = isValid);
  }

  void onContactInfoValidationChanged(bool isValid) {
    setState(() => contactIsValid = isValid);
  }

  void onEditPressed() {
    setState(() {
      loading = true;
    });
    if (personalInfoFormKey.currentState!.validate() &&
        contactInfoFormKey.currentState!.validate()) {
      personalInfoFormKey.currentState!.save();
      contactInfoFormKey.currentState!.save();

      final parsedBirthDate = personalInfo.birthDate!.split('/');
      userService
          .editUser(
        DateTime.parse(
            '${parsedBirthDate[2]}-${parsedBirthDate[1]}-${parsedBirthDate[0]}'),
        personalInfo.gender!,
        personalInfo.profileImageUrl,
        contactInfo.phoneNumber!,
        personalInfo.profileImageFile,
      )
          .then(
        (value) {
          ref.read(userProvider.notifier).setUser(value!);
          setState(() {
            loading = false;
          });
          context.pop();
        },
      ).catchError((error) {
        setState(() {
          loading = false;
        });
      });
    } else {
      if (!personalIsValid) {
        setState(() {
          personalIsValid = false;
        });
      } else {
        setState(() {
          contactIsValid = false;
        });
      }
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SerManosWhiteHeader(
      body: SafeArea(
        child: SerManosGridPadding(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _EditProfileBody(
                      onPersonalInfoValidationChanged:
                          onPersonalInfoValidationChanged,
                      personalInfo: personalInfo,
                      personalInfoformKey: personalInfoFormKey,
                      onContactInfoValidationChanged:
                          onContactInfoValidationChanged,
                      contactInfo: contactInfo,
                      contactInfoformKey: contactInfoFormKey,
                    ),
                  ],
                ),
                _EditProfileFooter(
                  editEnabled: (contactIsValid && personalIsValid),
                  onEditPressed: onEditPressed,
                  loading: loading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EditProfileBody extends StatelessWidget {
  const _EditProfileBody({
    required this.onPersonalInfoValidationChanged,
    required this.personalInfo,
    required this.personalInfoformKey,
    required this.contactInfo,
    required this.contactInfoformKey,
    required this.onContactInfoValidationChanged,
  });

  final PersonalInfo personalInfo;
  final GlobalKey<FormState> personalInfoformKey;
  final Function(bool) onPersonalInfoValidationChanged;

  final ContactInfo contactInfo;
  final GlobalKey<FormState> contactInfoformKey;
  final Function(bool) onContactInfoValidationChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        SerManosPersonalInfoForm(
          formKey: personalInfoformKey,
          onValidationChanged: onPersonalInfoValidationChanged,
          personalInfo: personalInfo,
        ),
        const SizedBox(height: 32),
        SerManosContactForm(
          formKey: contactInfoformKey,
          onValidationChanged: onContactInfoValidationChanged,
          contactInfo: contactInfo,
        ),
      ],
    );
  }
}

class _EditProfileFooter extends StatelessWidget {
  const _EditProfileFooter(
      {Key? key,
      required this.editEnabled,
      required this.onEditPressed,
      this.loading = false})
      : super(key: key);

  final bool editEnabled;
  final Function() onEditPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 33),
          child: SerManosElevatedButton(
            label: 'Guardar Datos',
            disabled: !editEnabled,
            onPressed: onEditPressed,
            loading: loading,
          ),
        ),
      ],
    );
  }
}
