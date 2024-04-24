import 'package:flutter/widgets.dart';

import '../../../../core/themes/text_style.dart';
import '../../../../core/utils/app_strings.dart';

class LogoLoginAcount extends StatelessWidget {
  const LogoLoginAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.loginToAccount,
        style: TextStyles.font18CustomColorMedium,
      ),
    );
  }
}
