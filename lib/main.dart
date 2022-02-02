import 'package:flutter/material.dart';
import 'package:itogovoe/stranica_1.dart';

void main() {
  runApp(const NavigationPage());
}

// Класс для навигации
class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // инициализируем корневой каталог, наш "дом"
      routes: {
        '/': (context) => const AuthPage(), // прописываем маршруты
        '/users': (context) => const UserList(),
        '/info': (context) => const DetInfo(),
        '/imp': (context) => const InfoMP (),
      },
    );
  }
}