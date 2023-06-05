import 'package:plantilla_usuarios/provider/user_provider.dart';
import 'package:plantilla_usuarios/screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppState());
}

// Creamos un widget que retorne el multiprovider
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lista de usuarios',
        initialRoute: 'home',
        routes: {
          //'login':(BuildContext context) => LoginScreen(),
          'home': (BuildContext context) => HomeScreen(),
          'create': (BuildContext context) => CreateUserScreen(),
        },
        theme: ThemeData.light()
            .copyWith(appBarTheme: AppBarTheme(color: Colors.blueAccent)));
  }
}
