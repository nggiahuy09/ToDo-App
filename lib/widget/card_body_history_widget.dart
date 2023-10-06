import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard({
    Key? key,
    required String this.content
  }) : super(key : key);

  late String content;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 280,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                content,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }

}