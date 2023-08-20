import 'dart:developer';

import 'package:annextech_practical/Student/StudentData.dart';
import 'package:annextech_practical/Student/studentDetailScreen.dart';
import 'package:annextech_practical/model/Studentmodel.dart';

import 'package:flutter/material.dart';

class ExamTabpage extends StatelessWidget {
  final newarraye;
  const ExamTabpage({super.key, this.newarraye});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: h * 0.02),
      itemCount: newarraye.length,
      itemBuilder: (context, index) {
        var s = newarraye[index];
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: newarraye[index]['scores'].length,
            itemBuilder: (context, index1) {
              return newarraye[index]['scores'][0]['score'] >= 35
                  ? Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return StudentDetailScreen(
                                scores: s['scores'],
                                id: s['id'],
                                name: s['name'],
                                imgpath: s['imgpath'],
                              );
                            },
                          ));
                        },
                        title: Text('Name: ${s['name']}'),
                        subtitle: Text(
                          'Score:  ${s['scores'][0]['score']}',
                        ),
                      ),
                    )
                  : const SizedBox();
            });
      },
    );
  }
}
