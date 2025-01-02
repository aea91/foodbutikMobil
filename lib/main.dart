import 'package:auth/utils/injection_contatiner.dart';
import 'package:core/theme/theme.dart';
import 'package:dashboard/utils/injection_contatiner.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mycontacts/product/go_routes.dart';
import 'package:mycontacts/product/injection_contatiner.dart';
import 'package:welcome/utils/injection_contatiner.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialization'ları bekleyelim
  await Future.wait([
    mainInit(),
    getItWelcomeInit(),
    getItAuthInit(),
    getItDashboardInit(),
  ]);

  // FCM'i en son başlatalım
  await _initializeFCM();

  runApp(const MyApp());
}

Future<void> _initializeFCM() async {
  try {
    final messaging = FirebaseMessaging.instance;

    await Future.delayed(const Duration(seconds: 1)); // Kısa bir bekleme ekleyelim

    // Token'ı al
    final token = await messaging.getToken();
    print('FCM Token: $token');

    // İzinleri iste
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Mesaj dinleyicilerini ayarla
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
    });
  } catch (e) {
    print('FCM initialization error: $e');
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App Test Case',
      debugShowCheckedModeBanner: false,
      theme: ContactTheme,
      routerConfig: router,
    );
  }
}
