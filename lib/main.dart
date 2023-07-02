import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_calender/app/constants/constants.dart';
import 'package:my_calender/app/routes/app_pages.dart';
import 'package:my_calender/app/theme/theme.dart';
import 'package:my_calender/generated/locales.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final settings = ValueNotifier(ThemeSettings(
    sourceColor: Colors.pink,
    themeMode: ThemeMode.system,
  ));

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => ThemeProvider(
          lightDynamic: lightDynamic,
          darkDynamic: darkDynamic,
          settings: settings,
          child: NotificationListener<ThemeSettingChange>(
            onNotification: (notification) {
              settings.value = notification.settings;
              return true;
            },
            child: ValueListenableBuilder<ThemeSettings>(
              valueListenable: settings,
              builder: (context, value, _) {
                // final theme = ThemeProvider.of(context);
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  translationsKeys: AppTranslation.translations,
          /*     localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ], */
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: child!,
                    );
                  },
                  supportedLocales: SUPPORTED_LOCALES,
                  fallbackLocale: FALLBACK_LOCALE,
                  locale: Get.deviceLocale,
                  title: LocaleKeys.appTitle.tr,
                  theme: ThemeProvider.of(context).light(),
                  initialRoute: Routes.HOME,
                  getPages: AppPages.pages,
                  defaultTransition: Transition.fadeIn,
                );
              },
            ),
          )),
    );
  }
}
