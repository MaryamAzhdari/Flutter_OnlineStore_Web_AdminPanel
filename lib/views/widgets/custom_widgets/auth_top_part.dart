import 'package:flutter/material.dart';

class AuthTopPart extends StatelessWidget {
  final String title;
  final String sunTitle;
  final String imgPath;
  const AuthTopPart({super.key, required this.title, required this.sunTitle, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
       Text(title,
          style: Theme.of(context).textTheme.titleLarge
          // GoogleFonts.getFont('Lato',
          //     color: themeService.isLightModeOn
          //                         ? AppTheme.textColorLight
          //                         : AppTheme.textColorDark,
          //     fontWeight: FontWeight.bold,
          //     letterSpacing: 0.2,
          //     fontSize: 23)
              ),
       Text(sunTitle,
          style: Theme.of(context).textTheme.titleSmall),
      Image.asset(
        imgPath,
        width: 300,
        height: 300,
      ),
    ]);
  }
}
