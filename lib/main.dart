import 'package:asdf_logbook/models/user_auth_model.dart';
import 'package:asdf_logbook/pages/home/wrapper.dart';
import 'package:asdf_logbook/providers/theme_provider.dart';
import 'package:asdf_logbook/utils/shared/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "",
        projectId: "",
        messagingSenderId: "",
        appId: "",
      )
  );
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return StreamProvider<UserAuthModel?>.value(
      value: UserAuthService().user,
      initialData: null,
      catchError: (context, e) {
        debugPrint('Error in User Service: ${e.toString()}');
        return null;
      },
      child: MaterialApp(
        title: 'Asdf Logbook',
        debugShowCheckedModeBanner: false,
        themeMode: themeProvider.themeMode,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        home: const Wrapper(),
      ),
    );
  }
}


