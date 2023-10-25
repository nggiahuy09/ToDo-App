import 'package:flutter/material.dart';
import 'package:to_do_app/widget/card_body_history_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../modal/items.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({
    Key? key,
    required this.hisItems,
  }) : super(key: key);

  late List<DataItems> hisItems = [];

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState(hisItems: hisItems);
}

class _DrawerWidgetState extends State<DrawerWidget> {
  _DrawerWidgetState({
    required this.hisItems,
  });

  late List<DataItems> hisItems = [];
  void _deletePermanently(String id) {
    setState(() {
      hisItems.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            child: Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(255, 21, 21, 21),
            child: DrawerHeader(
              child: Column(
                children: [
                  Text(
                    'FINISHED',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 245, 245, 245),
                    ),
                  ),
                  Text(
                    '(Slide right to Delete)',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 245, 245, 245),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(255, 31, 31, 31),
            child: ListView.builder(
              itemCount: widget.hisItems.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                  child: Slidable(
                    startActionPane:
                      ActionPane(
                        motion: StretchMotion(), 
                        children: [
                          SlidableAction(
                            borderRadius: BorderRadius.circular(8),
                            icon: Icons.delete,
                            onPressed: ((context) {
                              _deletePermanently(hisItems[index].id);
                            }),
                          )
                        ]
                      ),
                    child: HistoryCard(item: widget.hisItems[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    )));
  }
}
