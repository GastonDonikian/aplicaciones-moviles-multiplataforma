import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/molecules/components.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool _hasProfileCompleted = false;

  //Testing purposes, to switch from one profile view to another
  void changeProfile() {
    setState(() {
      _hasProfileCompleted = !_hasProfileCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _hasProfileCompleted
          ? ProfileTabCompleted(
              onPressed: changeProfile,
            )
          : ProfileTabEmpty(
              onPressed: changeProfile,
            ),
    );
  }
}

class ProfileTabEmpty extends StatelessWidget {
  const ProfileTabEmpty({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SerManosAvatar(),
          SerManosTextButton(label: "Change profile", onPressed: onPressed)
        ],
      ),
    );
  }
}

class ProfileTabCompleted extends StatelessWidget {
  const ProfileTabCompleted({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SerManosAvatar(
            imageUrl:
                "https://fastly.picsum.photos/id/357/200/200.jpg?hmac=hHhE00vBpBPSjAiUhwzFKQi9PsCWu7sblLKC2rT6Fn8",
          ),
          SerManosTextButton(label: "Change profile", onPressed: onPressed)
        ],
      ),
    );
  }
}
