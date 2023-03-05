import 'package:flutter/material.dart';
import 'package:beigam_desktop/screens/components/main_button.dart';
import 'package:beigam_desktop/screens/components/rounded_card.dart';
import 'package:beigam_desktop/screens/components/textfield.dart';
import 'package:beigam_desktop/constants/image_path.dart';
import 'package:beigam_desktop/screens/authentication/authentication_state.dart';
import 'package:beigam_desktop/themes/app_theme.dart';
import 'package:beigam_desktop/screens/components/app_scaffold.dart';
import 'package:provider/provider.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthenticationState>();
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppTheme.cardPadding),
        child: Column(
          children: [
            Image.asset(ImagePath.logo, width: 120),
            const SizedBox(height: AppTheme.cardPadding * 2),
            SizedBox(
              width: 500,
              child: RoundedCard(
                color: AppTheme.darkBlue,
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.cardPadding),
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: AppTheme.cardPadding),
                      FodaTextfield(
                        title: "Email Address",
                        controller: state.emailController,
                        autofillHints: const [
                          AutofillHints.email,
                        ],
                      ),
                      const SizedBox(height: AppTheme.elementSpacing),
                      FodaTextfield(
                        title: "Password",
                        controller: state.passwordController,
                        autofillHints: const [
                          AutofillHints.password,
                        ],
                      ),
                      const SizedBox(height: AppTheme.cardPadding),
                      MainButton(
                        title: "Login to your account",
                        state: state.isLoading
                            ? ButtonState.loading
                            : (state.emailIsValid ? ButtonState.idle : ButtonState.disabled),
                        onTap: state.login,
                      ),
                      const SizedBox(height: AppTheme.cardPadding),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
