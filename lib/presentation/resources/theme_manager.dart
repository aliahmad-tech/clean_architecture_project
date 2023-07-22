
import 'package:clean_architecture_projct/presentation/resources/color_manager.dart';
import 'package:clean_architecture_projct/presentation/resources/font_manager.dart';
import 'package:clean_architecture_projct/presentation/resources/styles_manager.dart';
import 'package:clean_architecture_projct/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme ( )
{
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary ,
      primaryColorLight: ColorManager.lightPrimary ,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
   splashColor: ColorManager.lightPrimary,
   // cardView theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,),
    // app bar theme
appBarTheme: AppBarTheme(
      elevation: AppSize.s4,
    centerTitle: true,
    color: ColorManager.primary,
    shadowColor: ColorManager.lightPrimary,
    titleTextStyle: getRegularStyle(color: ColorManager.white , fontSize: FontSize.s16),
  ),

    // text theme

    // button theme
   buttonTheme: ButtonThemeData(
     shape: StarBorder(),
     disabledColor: ColorManager.grey1,
     buttonColor: ColorManager.primary,
     splashColor: ColorManager.lightPrimary, 
   ),
      // elevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
            color: ColorManager.white,
            fontSize: FontSize.s17) ,
             primary: ColorManager.primary,
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(AppSize.s12))
      )
    ) ,
    textTheme: TextTheme(
             displayLarge:  getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
              headlineLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16)  ,
              headlineMedium: getRegularStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14)  ,
              titleMedium: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16)  ,
              bodyLarge: getRegularStyle(color: ColorManager.grey1) ,
              bodySmall: getRegularStyle(color: ColorManager.grey,)  ,
  ),
// input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      labelStyle: getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary , width: AppSize.s1_5),
        borderRadius:  const  BorderRadius.all(Radius.circular(AppSize.s8))
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey , width: AppSize.s1_5),
        borderRadius:  const  BorderRadius.all(Radius.circular(AppSize.s8))
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error , width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary , width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))
      ),



  )




   );
}