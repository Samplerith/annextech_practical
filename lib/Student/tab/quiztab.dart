import 'package:annextech_practical/Student/StudentData.dart';
import 'package:flutter/material.dart';

class QuizTabPage extends StatelessWidget {
  const QuizTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: h * 0.02),
      itemCount: studentData.length,
      itemBuilder: (context, index) {
        var s = studentData[index];
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: studentData[index]['scores'].length,
            itemBuilder: (context, index1) {
              return studentData[index]['scores'][1]['score'] >= 35
                  ? Card(
                      child: ListTile(
                        title: Text('Name: ${s['name']}'),
                        subtitle: Text(
                          'Score:  ${studentData[index]['scores'][1]['score']}',
                        ),
                      ),
                    )
                  : const SizedBox();
            });
      },
    );
  }
}
