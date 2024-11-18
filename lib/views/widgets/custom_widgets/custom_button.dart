import 'package:flutter/material.dart';
import 'package:onlinestoreweb/services/theme_service.dart';
import 'package:onlinestoreweb/theme.dart';


class Custom_Button extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool isLoading;

  const Custom_Button(
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
          width: 320,
          height: 50,
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
          child: Stack(
            children: [
              Positioned(
                  left: 280,
                  top: 20,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 12,
                              color: themeService.isLightModeOn
                                  ? AppTheme.mcCustomBtnBackgroundColor
                                  : AppTheme.mcCustomBtnBackgroundColor
                                      .withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Positioned(
                  left: 250,
                  top: 30,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: 10,
                      height: 10,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: themeService.isLightModeOn
                                  ? AppTheme.mcCustomBtnCircle1Color
                                  : AppTheme.mcCustomBtnCircle1Color
                                      .withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  )),
              Positioned(
                  left: 300,
                  top: 25,
                  child: Opacity(
                    opacity: 0.3,
                    child: Container(
                      width: 15,
                      height: 15,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: themeService.isLightModeOn
                              ? AppTheme.mcCustomBtnCircle2Color
                              : AppTheme.mcCustomBtnCircle2Color.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )),
              Positioned(
                  left: 280,
                  top: -7,
                  child: Opacity(
                    opacity: 0.3,
                    child: Container(
                      width: 20,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          //color: Colors.white,
                          color: themeService.isLightModeOn
                              ? AppTheme.mcCustomBtnCircle2Color
                              : AppTheme.mcCustomBtnCircle2Color.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )),
              Center(
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Theme.of(context).primaryColor)
                    : Text(
                        title,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
              )
            ],
          )),
    );
  }
}
