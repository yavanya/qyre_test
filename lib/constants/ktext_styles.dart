import 'package:flutter/material.dart';
import 'package:qyre_test/constants/kcolors.dart';

class KTextStyles {
  static const _family = 'Matter';

  static const appBar = TextStyle(
    fontFamily: _family,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: KColors.grey,
  );

  static const title16 = TextStyle(
    fontFamily: _family,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: KColors.black,
  );

  static const title14 = TextStyle(
    fontFamily: _family,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: KColors.black,
  );

  static const subTitle14 = TextStyle(
    fontFamily: _family,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: KColors.black,
  );

  static const subTitle12 = TextStyle(
    fontFamily: _family,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: KColors.black,
  );

  static const subTitle10 = TextStyle(
    fontFamily: _family,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: KColors.black,
  );

  static const paragraph = TextStyle(
    fontFamily: _family,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: KColors.black,
  );
}
