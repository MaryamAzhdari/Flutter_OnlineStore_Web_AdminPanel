import 'package:flutter/material.dart';
import 'package:onlinestoreweb/services/theme_service.dart';
import 'package:onlinestoreweb/theme.dart';


class CustomButtonSmall extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool isLoading;

  const CustomButtonSmall(
      {super.key,
      required this.onTap,
      required this.title,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    ThemeService themeService = ThemeService();
    return InkWell(
      onTap: () => onTap(),
      child: Container(
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
                colors: themeService.isLightModeOn
                    ? [
                        AppTheme.mcCustomBtnGradientFirstColor,
                        AppTheme.mcCustomBtnGradientSecondColor,
                      ]
                    : [
                        AppTheme.mcCustomBtnGradientFirstColor.withOpacity(0.5),
                        AppTheme.mcCustomBtnGradientSecondColor.withOpacity(0.5),
                      ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    color: Theme.of(context).primaryColor)
                : Text(
                    title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
          )),
    );
  }
}
