import 'package:flutter/material.dart';

class ModalBottom extends StatefulWidget {
  ModalBottom({
    Key? key,
    required this.addTask,
  }) : super(key: key);

  final Function addTask;

  @override
  State<ModalBottom> createState() => _ModalBottomState();
}

class _ModalBottomState extends State<ModalBottom> {
  // String textValue = '';  // cách 1
  TextEditingController controller = TextEditingController();

  void _handleOnClick(BuildContext context, DateTime date, TimeOfDay time) {
    final name = controller.text;
    if (name.isEmpty) {
      return;
    }
    widget.addTask(name, date, time);
    Navigator.pop(context);
  }

  // create date time variable
  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();

  // show date picker method
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  void _showTimerPicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 8.0),
              child: Text(
                'Name\'s Task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.done,
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your task here',
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 15.0, 0, 5.0),
              child: Text(
                'Deadline\'s Task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _showDatePicker,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: 170,
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}",
                        ),
                        Icon(Icons.calendar_month_outlined),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _showTimerPicker,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: 170,
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${_timeOfDay.hour}:${_timeOfDay.minute}",
                        ),
                        Icon(Icons.timer_outlined),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => _handleOnClick(context, _dateTime, _timeOfDay),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 10, 182, 171),
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
