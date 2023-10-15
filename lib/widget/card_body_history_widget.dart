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
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 10, 182, 171),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                content,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

}