import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({
    Key? key,
    required this.addTask,
  }) : super(key: key);

  final Function addTask;

  // String textValue = '';  // cách 1
  // cách 2: sử dụng TextEditingController

  TextEditingController controller = TextEditingController();

  void _handleOnClick(BuildContext context) {
    final name = controller.text;
    if (name.isEmpty) {
      return;
    }
    addTask(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              // cách 1: sử dụng trường onChanged
              // onChanged: (text) {
              //   textValue = text;
              // },
              // cách 2
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.done,
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Task',
              ),

            ),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                    onPressed: () => _handleOnClick(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 201, 200, 198),
                      ),
                    child: const Text('Add Task'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
