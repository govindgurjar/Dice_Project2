import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import '../simpleFunctions.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List fakeData = ['S', 'U', 'M', 'I', 'T', 'P', 'A', 'N', 'W', 'A', 'R'];
  List suffledAnswerList = [];
  List answerList = [];

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      suffledAnswerList = List.from(fakeData);
      suffledAnswerList.shuffle();
    });
    super.initState();
  }

  makeNameToQuizData() {
    String fullName = 'Sumit Panwar';

    print(fullName.split(''));
  }

  checkAnswer() {
    List plainAnswerList = [];

    answerList.forEach((item) {
      plainAnswerList.add(item['title']);
    });
    // check if answers is right or wrong
    if (listEquals(plainAnswerList, fakeData)) {
      // Call when anwer is RIGHT
      for (var i = 0; i < fakeData.length; i++) {
        if (fakeData[i] == plainAnswerList[i]) {
          setState(() {
            answerList[i]['color'] = Colors.green;
          });
        } else {
          setState(() {
            answerList[i]['color'] = Colors.red;
          });
        }
      }
    } else {
      // Call when anwer is WRONG
      for (var i = 0; i < fakeData.length; i++) {
        if (fakeData[i] == plainAnswerList[i]) {
          setState(() {
            answerList[i]['color'] = Colors.green;
          });
        } else {
          setState(() {
            answerList[i]['color'] = Colors.red;
          });
        }
      }
      // print(plainAnswerList);
      // print(suffledAnswerList);
      // print(fakeData);
      print('false');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color(0xff8480FF),
        child: Column(
          children: [
            // Quiz text and right wron question status box
            Container(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Question 02',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        '/07',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: returnQuestionState(),
                  )
                ],
              ),
            ),

            // Image and Quick Buttons
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFFC7E5D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: kElevationToShadow[4],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Button below image container
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    // height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () {
                                checkAnswer();
                              },
                              child: Container(
                                height: 50,
                                width: 60,
                                child: Icon(Icons.ac_unit),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () {
                                makeNameToQuizData();
                              },
                              child: Container(
                                height: 50,
                                width: 60,
                                child: Icon(Icons.ac_unit),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: 60,
                                child: Icon(Icons.ac_unit),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: 60,
                                child: Icon(Icons.ac_unit),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // word box for fill and word boxs section
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  // Section For Fill Box For words
                  Container(
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      alignment: WrapAlignment.center,
                      children: giveTextFilledBoxs(),
                    ),
                  ),
                  // Section For Word Box
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: giveTextBoxs(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Method that return TEXT Box of Answer
  List<Widget> giveTextBoxs() {
    List<Widget> listDatt = [];

    List fackData = suffledAnswerList;

    for (var i = 0; i < fackData.length; i++) {
      listDatt.add(
        fackData[i] != '*'
            ? Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    // add taped text box data to anwer boxs
                    if (fackData.length != answerList.length) {
                      setState(() {
                        // answerList.add(fackData[i]);
                        answerList.add({
                          'title': fackData[i],
                          'index': i,
                          'color': Color(0xff4849A6)
                        });
                        fackData[i] = '*';
                      });
                    }
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    child: Center(
                      child: Text(
                        fackData[i],
                        style: TextStyle(
                          color: Color(0xff4849A6),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xff4849A6),
                ),
              ),
      );

      // fackData.removeAt(fackData.length - 1);
    }

    return listDatt;
  }

  // Method that return Blank Text Box and Filled to
  List<Widget> giveTextFilledBoxs() {
    List<Widget> listDatt = [];

    List fackData = suffledAnswerList;

    for (var i = 0; i < fackData.length; i++) {
      listDatt.add(
        answerList.length <= i
            ? Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Color(0xff4849A6),
                  borderRadius: BorderRadius.circular(5),
                ),
              )
            : Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    // onTap(fackData[i]);

                    setState(() {
                      suffledAnswerList.removeAt(answerList[i]['index']);
                      suffledAnswerList.insert(
                        answerList[i]['index'],
                        answerList[i]['title'],
                      );

                      answerList.removeAt(i);
                    });
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    child: Center(
                      child: Text(
                        answerList[i]['title'],
                        style: TextStyle(
                          color: answerList[i]['color'],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      );
    }

    return listDatt;
  }

  // Method that return questions state ( TOP OF THE PAGE )
  List<Widget> returnQuestionState() {
    List<Widget> returnData = [];

    List faclist = [
      1,
      0,
      1,
      1,
      2,
      2,
      2
    ]; // 0 = FALSE, 1 = TRUE, 2 = NOT ANSWERD

    for (var i = 0; i < faclist.length; i++) {
      if (faclist[i] == 1) {
        // return RIGHT icon if answer is true
        returnData.add(
          Expanded(
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 43, 230, 102),
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.symmetric(horizontal: 2.5, vertical: 10),
            ),
          ),
        );
      } else if (faclist[i] == 0) {
        // return WRONG icon if answer is false
        returnData.add(
          Expanded(
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 253, 75, 78),
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.symmetric(horizontal: 2.5),
            ),
          ),
        );
      } else {
        // return EMPTY icon if answer is not played
        returnData.add(
          Expanded(
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.symmetric(horizontal: 2.5),
            ),
          ),
        );
      }
    }

    return returnData;
  }
}

// Method for Suffling the List
List giveMeShuffledList(List listData) {
  listData.shuffle();

  return listData;
}
