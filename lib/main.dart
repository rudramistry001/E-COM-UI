import 'package:e_com_ui/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Global key to keep track of the navigator state.
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// Global key to manage displaying snack bars.
final GlobalKey<ScaffoldMessengerState> snackBarKey =
    GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Set the preferred orientation to portrait
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp, // Portrait up mode
      DeviceOrientation.portraitDown, // Portrait down mode (optional)
    ],
  );
  runApp(const MyApp());
}

// MyApp class which represents the root of our application.
class MyApp extends StatelessWidget {
  // Constructor with an optional key parameter.
  const MyApp({
    super.key,
  });

  // The build method is used to describe how to display the widget in terms of other, lower-level widgets.
  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit is used for setting up screen size dependencies for responsive UI.
    return ScreenUtilInit(
        designSize: const Size(360, 690), // Design size for UI elements.
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          // Builder function to return MaterialApp.
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor:
                  Colors.white, // Set white as the default background color
              appBarTheme: AppBarTheme(
                backgroundColor: Colors
                    .white, // Optional: Ensure AppBar matches the background
              ),
            ),
            color: Colors.white,
            title: 'D COM', // Title of the application.
            navigatorKey: navigatorKey, // Setting the navigator key.
            scaffoldMessengerKey:
                snackBarKey, // Setting the scaffold messenger key for snack bars.z
            debugShowCheckedModeBanner:
                false, // Disabling the debug banner on UI.
            home: const DashboardScreen(),
          );
        });
  }
}
