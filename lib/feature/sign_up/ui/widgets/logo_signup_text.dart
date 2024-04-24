import 'package:flutter/widgets.dart';

import '../../../../core/themes/text_style.dart';
import '../../../../core/utils/app_strings.dart';

class LogoSignUpText extends StatelessWidget {
  const LogoSignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.signUp,
        style: TextStyles.font24WhiteBold,
      ),
    );
  }
}
