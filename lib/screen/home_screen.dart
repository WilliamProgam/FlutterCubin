import 'package:backend_flutter/models/user_model.dart';
import 'package:backend_flutter/screen/switch_screen.dart';
import 'package:backend_flutter/repository/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    final api = ApiService();

    return Scaffold(
      appBar: AppBar(
        title: Text("Data Users"),
      ),
      body: FutureBuilder<List<UserModel>>(future: api.getUsers(), builder: 

      (context, snapshot) {
        //Widget / tampilan yang akan muncul ketika get data sedang proses/loading
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        // Widget / tampilan yang akan muncul ketika get data error
        // ex: koneksi bermasalah. data yang di return berbeda dengan type yang diinginkan
        else if(snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }
        else {
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  child: ListTile(
                  title: Text("${user.name} | ${user.username}"),
                  subtitle: Text(user.email),
                  )
                );
              },
          );
        } 
      },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right),
        onPressed: () {
          Navigator.of(
            context
            ).push(CupertinoPageRoute(builder: (context) => SwitchScreen()));
        }
        ),
    );
  }
}