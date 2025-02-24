import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginButton3(),
    );
  }
}

Widget loginBUtton2(){
  return SizedBox();
}

class LoginButton3 extends StatelessWidget {
  const LoginButton3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(

    );
  }
}
