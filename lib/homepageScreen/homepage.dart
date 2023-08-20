import 'dart:developer';

import 'package:annextech_practical/Student/StudentData.dart';
import 'package:annextech_practical/Student/tab/examtab.dart';
import 'package:annextech_practical/Student/tab/homeworktab.dart';
import 'package:annextech_practical/Student/tab/quiztab.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> newArray = [];
  @override
  void initState() {
    super.initState();
    getHttp();
    _tabController = TabController(length: 3, vsync: this);
    getnewarray();
    log('cwefewfewf ${newArray}');
  }

  getnewarray() {
    for (int idx = 0; idx < studentData.length; idx++) {
      String imgpath = "assets/${idx.toString().padLeft(5, '0')}.png";
      Map<String, dynamic> newObj = Map.from(studentData[idx]);
      newObj["imgpath"] = imgpath;
      newArray.add(newObj);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Students List'),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'EXAM',
              ),
              Tab(
                text: 'QUIZ',
              ),
              Tab(
                text: 'HOMEWORK',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child: ExamTabpage(newarraye: newArray),
                ),
                const Center(
                  child: QuizTabPage(),
                ),
                const Center(
                  child: HomeworkTabPage(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  final dio = Dio();

  void getHttp() async {
    final response = await dio.get(
        'https://drive.google.com/drive/folders/1TCXA8qIEHxoDhcpARlUFBIuJH3AQ-v2t');
    print('ftytvug ${response}');
  }
}
