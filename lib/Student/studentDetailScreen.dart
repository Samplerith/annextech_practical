import 'package:annextech_practical/Student/StudentData.dart';
import 'package:annextech_practical/model/Studentmodel.dart';
import 'package:flutter/material.dart';

class StudentDetailScreen extends StatelessWidget {
  const StudentDetailScreen({
    this.id,
    required this.imgpath,
    required this.name,
    this.scores,
  });

  final String? id;
  final String name;
  final scores;
  final String imgpath;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    print('defefef $scores');
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          Container(
            height: h * 0.5,
            width: w,
            padding: const EdgeInsets.all(7),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imgpath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: scores.length,
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.045, vertical: h * 0.02),
              itemBuilder: ((context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${scores[index]['type']}: ${scores[index]['score']}'),
                    SizedBox(
                      height: h * 0.02,
                    )
                  ],
                );
              }))
        ],
      ),
    );
  }
}
