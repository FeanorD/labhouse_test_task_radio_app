import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'src/config/di/injection.dart';
import 'src/core/bloc/global_blocs_provider.dart';
import 'src/modules/home/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: false,
    androidStopForegroundOnPause: false,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const RadioApp());
}

class RadioApp extends StatelessWidget {
  const RadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xffC0D0C6),
      brightness: Brightness.dark,
    );

    return GlobalBlocsProvider(
      child: MaterialApp(
        title: 'Radio Stations App',
        theme: ThemeData(
          colorScheme: colorScheme,
          useMaterial3: true,
          navigationBarTheme: const NavigationBarThemeData(
            elevation: 2,
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            elevation: 2,
            shape: RoundedRectangleBorder(),
          ),
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(244, 186, 97, 1),
          ),
          // colorSchemeSeed: Color(0xFF061A29),
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
