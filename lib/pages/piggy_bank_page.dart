import '../json/piggy_bank_json.dart';
import '../theme/colors.dart';
import 'package:flutter/material.dart';

class PiggyBankPage extends StatefulWidget {
  const PiggyBankPage({Key? key}) : super(key: key);

  @override
  _PiggyBankPageState createState() => _PiggyBankPageState();
}

class _PiggyBankPageState extends State<PiggyBankPage> {
  int activeDay = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color5.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    num ratio = 0;
    num percentage = 0;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: color5.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 20, left: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "My Piggy Banks",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(Icons.edit),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
                children: List.generate(myPiggyBankJson.length, (index) {
                  ratio = myPiggyBankJson[index]['saving']/myPiggyBankJson[index]['amount'];
                  percentage = (ratio*100).toInt();
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: color5.withOpacity(0.01),
                          spreadRadius: 10,
                          blurRadius: 3,
                          // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 25, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          myPiggyBankJson[index]['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: const Color(0xff67727d).withOpacity(0.6)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  myPiggyBankJson[index]['saving'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Text(
                                    "%$percentage",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: const Color(0xff67727d)
                                            .withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                myPiggyBankJson[index]['amount'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: const Color(0xff67727d)
                                        .withOpacity(0.6)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: (size.width - 40),
                              height: 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      const Color(0xff67727d).withOpacity(0.1)),
                            ),
                            Container(
                              width: (size.width * percentage) / 100,
                              height: 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: myPiggyBankJson[index]['color']),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            })),
          )
        ],
      ),
    );
  }
}
