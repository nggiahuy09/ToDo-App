import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody({
    Key? key,
    // required this.index,
    required this.item,
    required this.handleDelete,
    required this.handleDone,
  }) : super(key: key);

  var item;
  // var index;
  bool isChecked = false;
  final Function handleDelete;
  final Function handleDone;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          // color: (index % 2 == 0) ? Color.fromARGB(255, 134, 168, 207) : Color.fromARGB(255, 225, 205, 183),
          color: Color.fromARGB(255, 31, 31, 31),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      return handleDone(item.id);
                    },
                    child: Icon(
                      Icons.done_outline_sharp,
                      size: 20,
                      color: Color.fromARGB(255, 245, 245, 245),
                    ),
                  ),
                  SizedBox(width: 28,),
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 245, 245, 245),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () async {
                  if (await confirm(context)) {
                    return handleDelete(item.id);
                  } else {
                    return;
                  }
                },
                child: const Icon(
                  Icons.delete_outline,
                  size: 20,
                  color: Color.fromARGB(255, 245, 245, 245),
                ),
              )
            ],
          ),
        ));
  }
}
