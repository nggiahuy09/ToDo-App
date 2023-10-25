import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../modal/items.dart';

class CardBody extends StatelessWidget {
  CardBody({
    Key? key,
    // required this.index,
    required this.item,
    required this.handleDelete,
    required this.handleDone,
  }) : super(key: key);

  late DataItems item;
  // var index;
  bool isChecked = false;
  final Function handleDelete;
  final Function handleDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: ((context) {
                handleDone(item.id);
              }),
              icon: Icons.done,
              foregroundColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 10, 182, 171),
              borderRadius: BorderRadius.circular(8),
            )
          ],
        ),
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: ((context) {
              handleDelete(item.id);
            }),
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(8),
          )
        ]),
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                     "${item.time.hour}:${item.time.minute}" ,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "${item.date.day}/${item.date.month}/${item.date.year}",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
