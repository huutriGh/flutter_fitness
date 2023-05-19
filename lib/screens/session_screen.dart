import 'package:fitness_app/data/sp_helper.dart';
import 'package:fitness_app/models/session.dart';
import 'package:flutter/material.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SPHelper helper = SPHelper();

  @override
  void initState() {
    helper.init().then((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yours training Sessions'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showSessionDialog(context);
        },
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Insert Training Session'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: txtDescription,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                  ),
                ),
                TextField(
                  controller: txtDuration,
                  decoration: const InputDecoration(
                    hintText: 'Duration',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                txtDescription.text = '';
                txtDuration.text = '';
              },
              child: const Text(
                'Cancel',
              ),
            ),
            ElevatedButton(
              onPressed: saveSession,
              child: const Text(
                'Save',
              ),
            ),
          ],
        );
      },
    );
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    int id = 1;
    Session newSession = Session(
      id,
      today,
      txtDescription.text,
      int.tryParse(txtDuration.text) ?? 0,
    );
    helper.writeSession(newSession).then((_) {
      txtDescription.text = '';
      txtDuration.text = '';
      Navigator.pop(context);
    });
  }
}
