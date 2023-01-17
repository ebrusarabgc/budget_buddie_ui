import '../json/monthly_budget_json.dart';
import '../theme/colors.dart';
import 'package:flutter/material.dart';

class MonthlyBudgetPlanPage extends StatefulWidget {
  const MonthlyBudgetPlanPage({Key? key}) : super(key: key);

  @override
  _MonthlyBudgetPlanPageState createState() => _MonthlyBudgetPlanPageState();
}

class _MonthlyBudgetPlanPageState extends State<MonthlyBudgetPlanPage> {
  int activeDay = 3;

  get total => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color5.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    num total = 0;

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
                        "Monthly Budget Plan",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(Icons.edit)
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
                children: List.generate(budget.length, (index) {
              total += budget[index]['price'];
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: (size.width - 40) * 0.7,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: color5.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Icon(
                                  budget[index]['icon'],
                                  color: budget[index]['color'],
                                  size: 30,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            SizedBox(
                              width: (size.width - 90) * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    budget[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: black,
                                        fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: (size.width - 40) * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "₺${budget[index]['price']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: color6),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 65, top: 8),
                    child: Divider(
                      thickness: 0.8,
                    ),
                  )
                ],
              );
            })),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 20),
                  child: Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 16,
                        color: black.withOpacity(0.4),
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "₺$total",
                  style: const TextStyle(
                      fontSize: 20, color: black, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
