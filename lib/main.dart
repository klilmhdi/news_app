import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_app/screens/layout_screen.dart';
import 'package:news_app/share/cubit/app_cubit/app_cubit.dart';
import 'package:news_app/share/cubit/bloc_observer.dart';
import 'package:news_app/share/cubit/news_cubit/news_cubit.dart';
import 'package:news_app/share/cubit/theme_cubit/theme_cubit.dart';
import 'package:news_app/share/cubit/theme_cubit/theme_cubit.dart';
import 'package:news_app/share/remote/dio_helper.dart';
import 'dart:io';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // enable blocobserver
  Bloc.observer = MyBlocObserver();
  // enable dio helper in app
  DioHelper.init();
  // bloc's in app
  AppCubit;
  NewsCubit;
  ThemeCubit;
  // for webivew in flutter
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      AndroidServiceWorkerController serviceWorkerController =
          AndroidServiceWorkerController.instance();

      await serviceWorkerController
          .setServiceWorkerClient(AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          print(request);
          return null;
        },
      ));
    }
  }
  // for native splash in flutter
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  // run app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (BuildContext context) => AppCubit()),
        BlocProvider<NewsCubit>(create: (BuildContext context) => NewsCubit()),
        BlocProvider<ThemeCubit>(create: (BuildContext context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: ThemeData(
                useMaterial3: true,
                scaffoldBackgroundColor: Color(0xFFF4F8F6),
                brightness: Brightness.light,
                appBarTheme: AppBarTheme(
                    backgroundColor: Color(0xFFF4F8F6),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarBrightness: Brightness.light,
                        statusBarIconBrightness: Brightness.dark,
                        statusBarColor: Colors.white))),
            darkTheme: ThemeData(
                useMaterial3: true,
                brightness: Brightness.dark,
                appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.light,
                ))),
            themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
            home: LayoutPage(),
          );
        },
      ),
    );
  }
}
