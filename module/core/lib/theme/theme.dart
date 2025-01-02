// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';

const _whiteColor = Color(0xFFFFFFFF);
const _pageColor = Color(0xFFF8FAFC); // Daha ferah bir arka plan grisi
const _greyColor = Color(0xFF64748B); // Modern slate gri
const _blackColor = Color(0xFF0F172A); // Koyu lacivert
const _blueColor = Color(0xFF2563EB); // Zengin mavi
const _greenColor = Color(0xFF059669); // Koyu yeşil
const _redDeleteColor = Color(0xFFDC2626); // Koyu kırmızı

const _colorScheme = ColorScheme(
  primary: _blueColor, // Primary color değiştirildi
  secondary: _pageColor,
  onPrimary: _whiteColor,
  onSurface: _whiteColor,
  error: _redDeleteColor,
  background: _pageColor,
  onSecondary: _greenColor,
  onBackground: _blackColor,
  onError: _whiteColor,
  surface: _pageColor,
  brightness: Brightness.light,
);

final ThemeData ContactTheme = ThemeData(
  useMaterial3: false,
  fontFamily: 'Sf-pro-display',
  brightness: Brightness.light,
  primaryColor: _blueColor, // Primary color değiştirildi
  primaryColorLight: _blueColor.withOpacity(0.1),
  primaryColorDark: _blueColor.withOpacity(0.8),
  scaffoldBackgroundColor: _pageColor,
  cardColor: _whiteColor,
  dividerColor: _greyColor.withOpacity(0.5),
  highlightColor: const Color(0x66BCBCBC),
  splashColor: const Color(0x66C8C8C8),
  unselectedWidgetColor: _whiteColor,
  disabledColor: const Color(0xFFE2E8F0),
  secondaryHeaderColor: const Color(0xFFFEE2E2),
  dialogBackgroundColor: _whiteColor,
  indicatorColor: _blueColor,
  hintColor: _greyColor,

  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: _blackColor,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: TextStyle(
      color: _blackColor,
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: TextStyle(
      color: _blackColor,
      fontSize: 16.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: _blackColor,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    helperStyle: TextStyle(
      color: _greyColor,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    hintStyle: TextStyle(
      color: _greyColor,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorStyle: TextStyle(
      color: _redDeleteColor,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorMaxLines: null,
    isDense: true,
    isCollapsed: false,
    prefixStyle: TextStyle(
      color: _greyColor,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    suffixStyle: TextStyle(
      color: _greyColor,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    counterStyle: TextStyle(
      color: _greyColor,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    filled: true,
    fillColor: _whiteColor,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: _redDeleteColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: _blueColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: _redDeleteColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: _greyColor.withOpacity(0.5)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: _greyColor.withOpacity(0.5)),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: _greyColor.withOpacity(0.5)),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _blueColor,
      foregroundColor: _whiteColor,
      fixedSize: const Size(370, 54),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),

  iconTheme: const IconThemeData(
    color: _blackColor,
    opacity: 1,
    size: 24,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    foregroundColor: _blackColor,
    elevation: 0,
  ),

  colorScheme: _colorScheme,
);
