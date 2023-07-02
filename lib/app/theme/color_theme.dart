part of 'theme.dart';

const colorStyle = ColorStyle;

class ColorStyle {
  static Color cE665FD = Color(0xffE665FD);
  Color cF7980B = Color(0xffF7980B);
  Color cf2d232 = Color(0xfff2d232);
  Color cFC6054 = Color(0xffFC6054);
  Color cBEBEBE = Color(0xffBEBEBE);
  Color kPrimaryColor = Color(0xFF1D9D6D);
  Color kLightGreenColor = Color(0xFFe8f5f0);
  Color kPrimaryLightColor = Color(0xFFD9EEE6);
  Color kPrimaryGreyColor = Color.fromRGBO(105, 109, 119, 1);
  Color kPrimaryBlackColor = Color(0xff424242);
  Color kPrimaryBlueColor = Color(0xFF2699FB);
  Color kLightTextColor = Color(0xFF616161);
  Color kHintTextColor = Color(0xff707070);
  Color kLightYellowColor = Color(0xffF9B403);
  Color kErrorColor = Color(0xffAA0000);
  Color kDangerColor = Color(0xffAA0000);
  Color kOfferBackgroundColor = Color(0xffd1d1d1);
  Color kLightBlueColor = Color(0xffEAF0F4);
  static Color c19D376 = Color(0xff19D376);
  Color cF4EB13 = Color(0xffF4EB13);
  Color cEC24C3 = Color(0xffEC24C3);
  Color c09d7dc = Color(0xff09d7dc);
}

class ColorStyle2 extends ColorStyle {
  static Color cE665FD = Color(0xff82D964);
  static Color c19D376 = Color(0xff19D376);
}

class ColorStyle1 extends ColorStyle {
  static Color c19D376 = Color(0xff19D376);
  static Color cE665FD = Color(0xffEC24C3);
}

class ColorS {
  Color? c19D376;
  Color? cE665FD;
  bool isDark = false;

  ColorS({required this.isDark});

  changeColor() {}
}

class ColorStyleA extends ColorS {
  Color? c19D376 = Color(0xff82D964);
  Color? cE665FD = Color(0xff19D376);

  ColorStyleA({required super.isDark});
}

class ColorStyleB extends ColorStyle {
  static Color c19D376 = Color(0xff19D376);
  static Color cE665FD = Color(0xffEC24C3);
}

class ColorStyleC {
  static Color c19D376 = Color(0xff19D376);
  static Color cE665FD = Color(0xffEC24C3);
}

class MyColors<T> extends ColorS {
  var _data = T;
  var _data2 = ColorStyleB;

  MyColors({required super.isDark});

  getTheme() {
    return _data;
  }

  getTheme2() {
    return _data2;
  }
}

class C {
  static void abc() {
    var style = MyColors<ColorStyleB>(isDark: true);
    var theme = style.getTheme();
    var theme2 = style.getTheme2();
    var type = theme.runtimeType;
    var type2 = theme.runtimeType;
    print(type);
    print(type2);
  }
}
