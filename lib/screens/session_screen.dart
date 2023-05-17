import 'package:flutter/material.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();

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
              onPressed: () {},
              child: const Text(
                'Save',
              ),
            ),
          ],
        );
      },
    );
  }
}
