import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

// Для авторизации
  String userName = '0123456789';
  String userPass = '1234';

  String? _userStoredName;
  String? _userStoredPass;

  bool _checkAuthorization() { // валидатор сравнения
    if ((_userStoredName == userName)&&(_userStoredPass == userPass)) {
      return true;
    }
    return false;
  }
// Для авторизации (закончено)

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 130,),
                  const Text('Введите логин и пароль',
                    style: TextStyle(fontSize: 18, color: Color(0xFF000000)),
                    textAlign: TextAlign.center, // Расположение текста по центру
                  ),
                  const SizedBox(height: 20,),
                  // Поле для ввода телефона
                  TextFormField(
                    controller: userController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      labelText: 'Введите номер телефона',
                      hintText: '10 цифр в формате: 9991234567',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Обязательное поле';
                      } else if (value.length !=10){
                        return 'Пожалуйста, 10 цифр номера телефона';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: 'Введите пароль',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Обязательное поле';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            _userStoredName = userController.text;
                            _userStoredPass = passController.text;
                            if (_checkAuthorization()) {
                              Navigator.pushNamed(context, '/users');
                            } else {
                              _userStoredName = '';
                              _userStoredPass = '';
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content:
                                Text('Вы не авторизованы. Введите корректно логин и пароль.'),
                                    duration: Duration(seconds: 4)),
                              );
                            }
                          }
                          setState(() {});
                        },
                        child: const Text('Вход'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Демо-доступ:'),
                  Text('Тел: $userName'),
                  Text('Пароль: $userPass'),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }