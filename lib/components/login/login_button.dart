import 'package:peer2all/palette.dart';
import 'package:peer2all/screens/screens.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.gKey,
  }) : super(key: key);

  final GlobalKey<FormState> gKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              width: 2, color: Theme.of(context).colorScheme.primary)),
      child: MaterialButton(
        height: 40,
        padding: EdgeInsets.zero,
        onPressed: () {
          if (gKey.currentState!.validate()) {
            gKey.currentState!.save();
            FocusScope.of(context).unfocus();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PublicScreen(),
              ),
            );
          }
        },
        child: const Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: kGreen,
          ),
        ),
      ),
    );
  }
}
