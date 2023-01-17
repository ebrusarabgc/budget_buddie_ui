import '../json/create_piggy_bank_json.dart';
import '../theme/colors.dart';
import 'package:flutter/material.dart';

class CreateBudgetPage extends StatefulWidget {
  const CreateBudgetPage({Key? key}) : super(key: key);

  @override
  _CreateBudgetPageState createState() => _CreateBudgetPageState();
}

// root copy paste

class _CreateBudgetPageState extends State<CreateBudgetPage> {
  int activeCategory = 0;
  final TextEditingController _piggyBankName =
  TextEditingController(text: "Travelling");
  final TextEditingController _piggyBankPrice = TextEditingController(text: "₺1500.00");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color5.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        "Create Piggy Bank",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Spacer(),
                      Icon(
                        Icons.check,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Text(
              "Choose category",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: black.withOpacity(0.5)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(createPiggyBankJson.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        activeCategory = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        width: 150,
                        height: 170,
                        decoration: BoxDecoration(
                            color: white,
                            border: Border.all(
                                width: 2,
                                color: activeCategory == index
                                    ? primary
                                    : Colors.transparent),
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
                              left: 25, right: 25, top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: color5.withOpacity(0.15)),
                                  child: Center(
                                    child: Icon(
                                      createPiggyBankJson[index]['icon'],
                                      size: 30,
                                      color: createPiggyBankJson[index]['color'],
                                    ),
                                  )),
                              Text(
                                createPiggyBankJson[index]['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Budget Name",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff67727d)),
                ),
                TextField(
                  controller: _piggyBankName,
                  cursorColor: black,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: black),
                  decoration: const InputDecoration(
                      hintText: "Enter Budget Name", border: InputBorder.none),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (size.width - 140),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Enter budget",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Color(0xff67727d)),
                          ),
                          TextField(
                            controller: _piggyBankPrice,
                            cursorColor: black,
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: black),
                            decoration: const InputDecoration(
                                hintText: "Enter Budget",
                                border: InputBorder.none),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}