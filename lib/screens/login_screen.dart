import 'package:peer2all/components/login/login.dart';
import 'package:peer2all/const_pattern.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey();

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          leading: null,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'peer2All',
            style: titleStyle(context, 24.0, FontWeight.w700),
          ),
        ),
        SliverToBoxAdapter(
          child: Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 16.0),
                    const LoginTextField(
                      label: 'ID',
                      inputType: TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                    ),
                    // const SizedBox(height: 16.0),
                    // const LoginTextField(
                    //     label: 'first name', inputType: TextInputType.name),
                    // const SizedBox(height: 16.0),
                    // const LoginTextField(
                    //     label: 'last name', inputType: TextInputType.name),
                    const SizedBox(height: 16.0),
                    const LoginTextField(
                        label: 'Password',
                        inputType: TextInputType.visiblePassword),
                    const SizedBox(height: 16.0),
                    const LoginTextField(
                        label: 'Department', inputType: TextInputType.name),
                    const SizedBox(height: 16.0),
                    // Row(
                    //   children: const [
                    //     Flexible(
                    //       flex: 2,
                    //       child: LoginTextField(
                    //         label: 'ID',
                    //         inputType: TextInputType.numberWithOptions(
                    //             decimal: false, signed: false),
                    //       ),
                    //     ),
                    //     SizedBox(width: 8.0),
                    //     Flexible(
                    //       flex: 1,
                    //       child: LoginTextField(
                    //           label: 'section', inputType: TextInputType.name),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 16.0),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(width: 16.0),
                        Text(
                          'Year: ',
                          style: textStyle(context, .9, 16.0, FontWeight.w700),
                        ),
                        const SizedBox(width: 16.0),
                        const Years(),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    LoginButton(gKey: _key),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
