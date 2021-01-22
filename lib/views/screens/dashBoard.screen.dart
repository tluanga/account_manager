import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  final String title;
  DashBoard({this.title});

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int theriGroupVakue = 0;

  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Text("Ledgers"),
    1: Text("Transactions"),
    2: Text("Parties")
  };

  static Widget giveCenter(String yourText) {
    return Center(
      child: Text(
        "Text: $yourText",
        style: TextStyle(color: Colors.blue, fontSize: 20.0),
      ),
    );
  }

  List<Widget> bodies = [
    // First(),
    giveCenter("Home Page"),
    giveCenter("Search Page"),
    giveCenter("Chat Room")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodies[theriGroupVakue],
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Current Month",
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 75.0),
          child: Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container(
                      //     child: Center(
                      //       child: Text(
                      //         'CURRENT MONTH',
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.w500,
                      //           fontSize: 16,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Container(
                              //   padding: EdgeInsets.only(top: 4),
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.cyan, blurRadius: 0.5)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Pek Chhuah',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Rs 2000',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.red[700]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.only(top: 4),
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.cyan, blurRadius: 0.5)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Lakluh',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Rs 5000',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.green[800]),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      CupertinoSegmentedControl(
                        //  borderColor: Colors.red,
                        groupValue: theriGroupVakue,
                        onValueChanged: (changeFromGroupValue) {
                          setState(() {
                            theriGroupVakue = changeFromGroupValue;
                          });
                        },
                        children: logoWidgets,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Ledgers", "Transactions", "Parties"];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
        child: Container(
          width: 115,
          decoration: BoxDecoration(
              color:
                  selectedIndex == index ? Colors.teal[50] : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: selectedIndex == index ? Colors.teal : Colors.grey)),
          child: Center(
            child: Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: selectedIndex == index ? Colors.teal : Colors.grey[600],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
