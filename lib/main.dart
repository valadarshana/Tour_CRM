import 'package:flutter/material.dart';
import 'loginSignup/login_signup.dart';
import 'package:flutter/services.dart';
import 'global.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MyTheme();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    //systemNavigationBarColor: Colors.blue
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentTheme.addListener(() {
      print("theme change");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'AANTOUR',
      theme: ThemeData(
        fontFamily: 'Rubik',
        backgroundColor: Colors.white,
        accentColor: Colors.grey,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
        scaffoldBackgroundColor: const Color(0xFFeeeeee),

        brightness: Brightness.light,
        primaryColor: const Color(0xFFd23078),

        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 18,fontFamily: 'Rubik',color: Colors.black,fontWeight: FontWeight.w500),
          headline2: TextStyle(fontSize: 16,fontFamily: 'Rubik',color: Colors.black,),
          headline3: TextStyle(fontSize: 14,fontFamily: 'Rubik',color: Colors.black,),
          headline4: TextStyle(fontSize: 14,fontFamily: 'Rubik',color: Colors.black,),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.black54,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),

        primarySwatch: createMaterialColor(Color(0xFFd23078)),
      ),

      darkTheme: ThemeData(
        fontFamily: 'Rubik',
        brightness: Brightness.dark,
        accentColor: Colors.grey,
        backgroundColor: Colors.black,
        primaryColor: const Color(0xFFd23078),
        primarySwatch: createMaterialColor(Color(0xFFd23078)),
        scaffoldBackgroundColor: Colors.black,
        cardColor: Color(0xFF333333),

        appBarTheme: const AppBarTheme(
          color: Color(0xFF333333),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.black54,
          labelStyle: TextStyle(color: Colors.black54),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 18,fontFamily: 'Rubik',color: Colors.white,fontWeight: FontWeight.w500),
          headline2: TextStyle(fontSize: 16,fontFamily: 'Rubik',color: Colors.white,),
          headline3: TextStyle(fontSize: 14,fontFamily: 'Rubik',color: Colors.black,),
          headline4: TextStyle(fontSize: 14,fontFamily: 'Rubik',color: Colors.white,),//textcolor of textfield
        ),
      ),
      themeMode:currentTheme.currentTheme(),
      home: const LoginSignUp(),//YourActivity(),//LoginSignUp(),//LoginSignUp(),//TravelMain(),
    );
  }
}

class MyTheme extends ChangeNotifier{

  static bool _isDark=false;

  void getPref()async{
    final prefs = await SharedPreferences.getInstance();

    if(prefs.getBool("theme")==null){
      _isDark=false;
    }else{
      _isDark=prefs.getBool("theme")!;
    }
    print('is dark ${_isDark}');
  }

  MyTheme(){
    getPref();
    // final brightness = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).platformBrightness;
    // _isDark = brightness == Brightness.dark;
  }

  bool isDarkMode(){
    return _isDark;
  }

  ThemeMode currentTheme(){
    print('current ${_isDark}');
    return _isDark ?ThemeMode.dark:ThemeMode.light;
  }

  void switchTheme(){
    _isDark = ! _isDark;
    notifyListeners();
  }
}
