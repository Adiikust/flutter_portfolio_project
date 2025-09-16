import 'package:firebase_core/firebase_core.dart';

import 'core/constants/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB5Hiwo2qoQEGlN_TdfR5htOr6ICkdyL4E",
      authDomain: "portfolioproject-813b0.firebaseapp.com",
      projectId: "portfolioproject-813b0",
      storageBucket: "portfolioproject-813b0.firebasestorage.app",
      messagingSenderId: "686652364508",
      appId: "1:686652364508:web:139da5ee6829d3ceb5c619",
      measurementId: "G-85X1WCBH1T",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Muhammad Adnan Hameed',
        home: HomeView(),
      ),
    );
  }
}
