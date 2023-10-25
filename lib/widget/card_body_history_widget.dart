import 'package:flutter/material.dart';

import '../modal/items.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard({Key? key, required DataItems this.item}) : super(key: key);

  late DataItems item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${item.time.hour}:${item.time.minute}",
                      ),
                      Text(
                        "${item.date.day}/${item.date.month}/${item.date.year}",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
