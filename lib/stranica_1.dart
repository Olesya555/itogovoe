import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

  String userTelephone = '9041234567';
  String userPassword = 'Demo1234';

class _AuthPageState extends State<AuthPage> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Авторизация')),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 70,),
                  const Text('Введите логин и пароль',
                    style: TextStyle(fontSize: 18, color: Color(0xFF000000)),
                    textAlign: TextAlign.center, // Расположение текста по центру
                  ),
                  const SizedBox(height: 20,),
                  // Поле для ввода телефона
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                        labelText: 'Введите номер телефона',
                        hintText: '10 цифр в формате: 9991234567'
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  // Поле для ввода телефона
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.vpn_key),
                        labelText: 'Введите пароль',
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text('Demo-доступ:'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




// Выдвижная панель навигации, отображается на экранах
// Подключается по ссылке -  drawer: navDrawer(context),
Widget navDrawer(context) => Drawer(
  child: ListView(padding: EdgeInsets.zero, children: [
    // Задаем оформление
    DrawerHeader(decoration: const BoxDecoration(
      color: Colors.blue,
    ),
      child: Container(
        height: 100,
        child: Column(
          // параметры выравнивания
          // главная ось mainAxisAlignment - вертикальная, задаём выравнивание по центру
          mainAxisAlignment: MainAxisAlignment.center,
          // вторая ось crossAxisAlignment - горизонтальная, задаём выравнивание по центру
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ // прописываем состав колонки Container и Text
            Container(
              height: 110, width: 250, // прописываем размер
              child: const Image(image: AssetImage('assets/dart-logo.png'), // Прописываем картинку
                fit: BoxFit.cover, // Настраиваем расположение изображения - здесь cover - покрыть весь экран
              ),
            ),
            const Text('Навигация по приложению', style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,),
          ],
        ),
      ),
    ),

    // Прописываем дочерние элементы NavigationDrawer
    ListTile( // первая текст-кнопка
      leading: const Icon(Icons.one_k),
      title: const Text('Список пользователей'),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4), // уменьшаем ширину элемента, чтобы список был "подтянутым"
      onTap: () { // прописан корневой маршрут - метод обработки нажатий onTap: имя маршрута указываем в виде строковой константы
        //Navigator.pop(context); - а возвратный метод надо писать не здесь, а там куда мы переходим, оттуда мы и делаем возврат
        Navigator.pushNamed(context, '/');
      },
    ),

    const Divider(color: Colors.black38, thickness: 2,), // Разделитель

    ListTile( // вторая тект-кнопка
      leading: const Icon(Icons.two_k),
      title: const Text('Информация о приложении'),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      onTap: () { // прописан метод обработки нажатий onTap: имя маршрута указываем в виде строковой константы
        Navigator.pushNamed(context, '/second');
      },
    ),

    const Divider(color: Colors.black38, thickness: 2,), // Разделитель
  ]),
);


// Класс "Список пользователей" пока еще пустой
class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


// Класс "Детальная информация" пока еще пустой
class DetInfo extends StatefulWidget {
  const DetInfo({Key? key}) : super(key: key);

  @override
  _DetInfoState createState() => _DetInfoState();
}

class _DetInfoState extends State<DetInfo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


// Класс "Информация о приложении" пока еще пустой
class InfoMP extends StatelessWidget {
  const InfoMP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

