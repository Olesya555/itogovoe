import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:itogovoe/nav_app.dart';
import 'package:itogovoe/classi.dart';
import 'package:http/http.dart' as http;
import 'package:itogovoe/user_list.dart';

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

ListView _usersListView1(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Scaffold(
          body: Container(height: 200,
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
            // subtitle: Row(
            //   children: [
            //     const Text('Email: ',
            //       style: TextStyle(fontSize: 12,),
            //     ),
            //     Text('${data[index].email}',
            //       style: const TextStyle(
            //         fontSize: 14,
            //       ),),
            //   ],
            // ),
            // leading: Text('ID: ${data[index].id}'),


          ),
          ),
        );
      });
}


// Класс "Детальная информация" пока еще пустой
class DetInfo extends StatefulWidget {
  const DetInfo({Key? key}) : super(key: key);

  @override
  _DetInfoState createState() => _DetInfoState();
}

class _DetInfoState extends State<DetInfo> {
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
                  return _usersListView1(usersListData);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              })
      ),
    );
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

