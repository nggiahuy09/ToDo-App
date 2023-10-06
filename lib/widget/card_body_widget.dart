import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody({
    Key? key,
    required this.index,
    required this.item,
    required this.handleDelete,
    required this.handleDone,
  }) : super(key: key);

  var item;
  var index;
  bool isChecked = false;
  final Function handleDelete;
  final Function handleDone;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: (index % 2 == 0) ? Color.fromARGB(255, 134, 168, 207) : Color.fromARGB(255, 225, 205, 183),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  return handleDone(item.id);
                },
                child: Icon(
                  Icons.done_outline_sharp,
                  size: 25,
                ),
              ),
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
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
                  size: 25,
                ),
              ),
            ],
          ),
        ));
  }
}
