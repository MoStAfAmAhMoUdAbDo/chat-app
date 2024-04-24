import 'package:flutter/widgets.dart';

import '../../../../core/themes/text_style.dart';
import '../../../../core/utils/app_strings.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.createNewAccount,
        style: TextStyles.font18CustomColorMedium,
      ),
    );
  }
}
