import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:itogovoe/nav_app.dart';
import 'package:itogovoe/classi.dart';
import 'package:itogovoe/det_info.dart';

// Класс "Список пользователей"
//Загрузка данных
Future<List<User>> _fetchUsersList() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else { // Обработка ошибки
    throw Exception('Failed to load users from API');
  }
}

ListView _usersListView(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Row(
              children: [
                const Text('Имя: ',
                  style: TextStyle(fontSize: 16,),
                ),
                Text('${data[index].name}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Poppins'
                  ),),
              ],
            ),
            subtitle: Row(
              children: [
                const Text('Email: ',
                  style: TextStyle(fontSize: 12,),
                ),
                Text('${data[index].email}',
                  style: const TextStyle(
                      fontSize: 14,
                  ),),
              ],
            ),
            leading: Text('ID: ${data[index].id}'),

            onTap: () async {
              Navigator.pushNamed(context, '/info');
                  //arguments: User.fromJson(data[index].id));
            },
          ),
        );
      });
}


class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late Future<List<User>> futureUsersList;
  late List<User> usersListData;

  @override
  void initState() {
    super.initState();
    futureUsersList = _fetchUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: appBar(),
          drawer: navDrawer(context),
          body: FutureBuilder<List<User>>(
              future: futureUsersList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  usersListData = snapshot.data!;
                  return _usersListView(usersListData);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              })
          ),
    );
  }
}




