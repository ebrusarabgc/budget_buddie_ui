import '../theme/colors.dart';
import 'package:flutter/material.dart';
import '../json/suggestions_json.dart';

class SuggestionsPage extends StatefulWidget {
  const SuggestionsPage({Key? key}) : super(key: key);

  @override
  _SuggestionsPageState createState() => _SuggestionsPageState();
}

class _SuggestionsPageState extends State<SuggestionsPage> {
  int activeDay = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color5.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {

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
                        "Suggestions",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
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
                children: List.generate(suggestions.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: suggestions[index]['color'],
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
                          suggestions[index]['title'],
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          suggestions[index]['text'],
                          style: const TextStyle(
                            fontSize: 15,
                            color: color5,
                          ),
                          textAlign:TextAlign.left,
                        ),
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
