import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/sleep/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ChangeThemeIconButton extends StatelessWidget {
  const ChangeThemeIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, theme, child) => GestureDetector(
        onTap: () => theme.changeTheme(),
        child: SvgPicture.asset(
          theme.isLightTheme
              ? 'assets/icons/Sun.svg'
              : 'assets/images/Moon.svg',
          height: 48,
          width: 48,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
