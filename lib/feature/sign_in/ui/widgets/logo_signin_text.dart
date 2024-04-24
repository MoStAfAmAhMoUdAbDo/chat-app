import 'package:flutter/widgets.dart';

import '../../../../core/themes/text_style.dart';
import '../../../../core/utils/app_strings.dart';

class LogoSignInText extends StatelessWidget {
  const LogoSignInText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.signIn,
        style: TextStyles.font24WhiteBold,
      ),
    );
  }
}
