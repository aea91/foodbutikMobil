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

  await _initializeFCM();

  runApp(const MyApp());
}

Future<void> _initializeFCM() async {
  try {
    final messaging = FirebaseMessaging.instance;

    await Future.delayed(const Duration(seconds: 1));

    final token = await messaging.getToken();

    // İzinleri iste
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        // Show local notification
        showDialog(
          context: router.routerDelegate.navigatorKey.currentContext!,
          builder: (context) => AlertDialog(
            title: Text(message.notification!.title ?? 'New Message'),
            content: Text(message.notification!.body ?? ''),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
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
