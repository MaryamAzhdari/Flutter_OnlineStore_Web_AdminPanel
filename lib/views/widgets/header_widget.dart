import 'package:flutter/material.dart';
import 'package:onlinestoreweb/services/theme_service.dart';
import 'package:onlinestoreweb/theme.dart';


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeService themeService = ThemeService();
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
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
                // right: -MediaQuery.of(context).size.width/8,
                // top: MediaQuery.of(context).size.height / 20,
                right: -70,
                bottom: -50,
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 12,
                            color: themeService.isLightModeOn
                                ? AppTheme.mcCustomBtnBackgroundColor
                                : AppTheme.mcCustomBtnBackgroundColor
                                    .withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                )),
            Positioned(
                right: -10,
                bottom: -20,
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 3,
                            color: themeService.isLightModeOn
                                ? AppTheme.mcCustomBtnCircle1Color
                                : AppTheme.mcCustomBtnCircle1Color
                                    .withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                )),
            Positioned(
                right: -20,
                bottom: 40,
                child: Opacity(
                  opacity: 0.1,
                  child: Container(
                    width: 60,
                    height: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        //color: Colors.white,
                        color: themeService.isLightModeOn
                            ? AppTheme.mcCustomBtnCircle2Color
                            : AppTheme.mcCustomBtnCircle2Color.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                )),
            Positioned(
                right: 70,
                bottom: 60,
                child: Opacity(
                  opacity: 0.4,
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
                right: 90,
                bottom: 30,
                child: Opacity(
                  opacity: 0.2,
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
            Positioned(
                left: -20,
                bottom: -30,
                child: Opacity(
                  opacity: 0.1,
                  child: Container(
                    width: 200,
                    height: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        //color: Colors.white,
                        color: themeService.isLightModeOn
                            ? AppTheme.mcCustomBtnCircle2Color
                            : AppTheme.mcCustomBtnCircle2Color.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                )),
            // Center(
            //   child: Text(
            //     'title',
            //     style: Theme.of(context).textTheme.headlineLarge,
            //   ),
            // ),
            Positioned(
                left: 20,
                bottom: 35,
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: TextField(
                    style: Theme.of(context).textTheme.labelLarge,
                    decoration: InputDecoration(
                      hintText: 'Enter Text',
                      hintStyle: Theme.of(context).textTheme.displayMedium,
                      prefixIcon: const Icon(Icons.search),
                      //suffixIcon: const Icon(Icons.camera_front),
                      fillColor:AppTheme.mcTextColorDark.withOpacity(0.2),
                      filled: true,
                      focusColor:  AppTheme.mcTextColorDark.withOpacity(0.5),
                    ),
                  ),
                ))
          ],
        ));
  }
}
