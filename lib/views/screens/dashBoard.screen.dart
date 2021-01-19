import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50,),
            Container(
                child: Center(
                  child: Text(
                    'CURRENT MONTH',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 20,
                  child: Container(
                    padding: EdgeInsets.only(top: 4),
                    height: 80,
                    width: MediaQuery.of(context).size.width/2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.cyan,
                        blurRadius: 1
                      )]
                    ),
                    child: Column(
                      children: [
                        Text('PEK CHHUAH', textAlign: TextAlign.start, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                        SizedBox(height:15),
                        Text('Rs 2000', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: Colors.red[700]),)
                      ],
                    ),
                  ),
                ),
                Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.only(top: 4),
                    height: 80,
                    width: MediaQuery.of(context).size.width/2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.cyan,
                        blurRadius: 1
                      )]
                    ),
                    child: Column(
                        children: [
                          Text('LAKLUH', textAlign: TextAlign.start, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          SizedBox(height:15),
                          Text('Rs 5000', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: Colors.green[800]),)
                        ],
                      ),
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Categories(),
            Divider(color: Colors.black,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('CLD Enterprise', textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                  Text('Rs 5000', textAlign: TextAlign.right, style: TextStyle(color:Colors.green, fontSize: 15, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            Divider(color: Colors.grey,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Rics Technology', textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                  Text('Rs 9000', textAlign: TextAlign.right, style: TextStyle(color:Colors.green, fontSize: 15, fontWeight: FontWeight.w500),),
                ],
              ),
            )
          ],
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
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal:5),
        child: MaterialButton(
          onPressed: navigateCategories(),
          child: Container(
            width: 115,
            decoration: BoxDecoration(
              color: selectedIndex == index ? Colors.teal[50] : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: selectedIndex == index ? Colors.teal : Colors.grey)
            ),
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
      ),
    );
  }
  navigateCategories(){
    if (selectedIndex == 0)
      return rLedgerDashboard;
    else if (selectedIndex == 1)
      return rNewTransaction;
    else if (selectedIndex == 2)
      return rLedgerDashboard;
  }
}