import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomuser/custom/useritem.dart';
import 'package:randomuser/models/user_model.dart';
import 'package:randomuser/providers/random_user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RandomUserProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home: UsersScreen(),
      ),
    );
  }
}

class UsersScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final obj = context.read<RandomUserProvider>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {obj.requestusers()},
        child: Icon(Icons.refresh, color: Colors.blue),
      ),
      appBar: AppBar(backgroundColor: Colors.purple),
      body: Consumer<RandomUserProvider>(
        builder: (context, value, child) {
          final data = value.user?.users;
          if (data == null) {
            value.requestusers();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Custom(user: data[index]),
            );
          }
        },
      ),
    );
  }
}

class Details extends StatelessWidget {
  UserModel userModel;
  Details({required this.userModel, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Details"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              ),
              icon: Icon(Icons.back_hand),
            ),
          ],
        ),
        body: Center(
          child: SizedBox(
            width: 400,
            height: 300,
            child: Card(
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  Image.network(userModel.url),
                  Text(userModel.name),
                  Text(userModel.email),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
