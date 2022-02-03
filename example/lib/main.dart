import 'package:flutter/material.dart';
import 'package:handy_dialogs/handy_dialogs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Handy Dialogs",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.amber[100],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              trailing: IconButton(
                  onPressed: () async {
                    await deleteConfirmation(context);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )), //Delete
              leading: IconButton(
                icon: Icon(
                  Icons.notifications_active_rounded,
                  color: Colors.amber[900],
                ),
                onPressed: () {
                  notificationDialog(
                      context, 'Notification dialog', '🦑🦑🦑🦑🦑🦑🦑🦑🦑');
                },
              ), //Notification
              title: TextButton(
                child: const Text('Display showText'),
                onPressed: () {
                  showText(context, 'Hi', '✨✨✨✨✨✨✨✨✨‍',
                      backgroundColor: Colors.teal[800]);
                },
              ), //ShowText
              subtitle: TextButton(
                child: const Text('Confirmation Dialog'),
                onPressed: () async {
                  if (await confirmationDialog(
                      context, 'Do you agree?', 'Agree', 'Cancel')) {
                    showText(context, 'Good!', '👍🏾',
                        backgroundColor: Colors.green[400]);
                  } else {
                    showText(context, 'Bad!', '👎🏾',
                        backgroundColor: Colors.red[400]);
                  }
                },
              ), //Confirmation
            ),
          ),
        ),
      ),
    );
  }
}
