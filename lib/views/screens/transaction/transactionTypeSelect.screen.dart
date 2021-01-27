import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';

import 'package:account_manager/views/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class TransactionTypeSelect extends StatelessWidget {
  final TransactionTypeSelectViewModel _model =
      serviceLocator<TransactionTypeSelectViewModel>();
  TransactionTypeSelect() {
    _model.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Consumer<TransactionTypeSelectViewModel>(
          builder: (context, transactionTypeSelect, child) {
            transactionTypeSelect.countTransactionTypeList();
            return SafeArea(
                child: Column(children: [
                  SearchBar(),
                  Expanded(
                    child: CustomScrollView(
                    slivers: [                      
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        floating: true,
                        pinned: false,
                        toolbarHeight: 50,
                        expandedHeight: 50,
                        backgroundColor: Colors.white,
                        flexibleSpace: FlexibleSpaceBar(
                          title: Text(
                            'Please Select Transaction Type',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ),
                      // SliverFilip(
                      //   child: Container(
                      //     color: Colors.red,
                      //     height: 100,
                      //     child: Text(
                      //       'hi',
                      //     ),
                      //   ),
                      // ),
                      // SliverList(
                      //   delegate: SliverChildBuilderDelegate(
                      //     (context, index) {
                      //       return Container(
                      //         height: 50,
                      //         alignment: Alignment.center,
                      //         color: Colors.orange[100 * (index % 9)],
                      //         child: Text('orange $index'),
                      //       );
                      //     },
                      //     childCount: 30,
                      //   ),
                      // ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                          if (transactionTypeSelect.checkTransactionTypeForSelection(
                              transactionTypeSelect.transactionTypeList[index].id)) {
                            return GestureDetector(
                              onTap: () {
                                transactionTypeSelect.deSelectTransactionType(
                                    transactionTypeSelect.transactionTypeList[index].id);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade300,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(transactionTypeSelect
                                          .transactionTypeList[index].name),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else return GestureDetector(
                            onTap: () {
                              transactionTypeSelect.setTransactionType(
                                  transactionTypeSelect.transactionTypeList[index].id);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(transactionTypeSelect
                                        .transactionTypeList[index].name),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: transactionTypeSelect.transactionTypeList.length
                        )
                      ),
                    ],
                  ),
                ),
                // Positioned(
                //   left: 10,
                //   right: 10,
                //   height: 46,
                //   // width: MediaQuery.of(context).size.width,
                //   top: 70,
                //   child: Container(
                //     padding: EdgeInsets.symmetric(
                //       horizontal: 20,
                //       vertical: 5,
                //     ),
                //     decoration: BoxDecoration(
                //         color: Colors.grey[400],
                //         borderRadius: BorderRadius.circular(10)),
                //     child: TextField(
                //         cursorColor: Colors.white,
                //         style: TextStyle(color: Colors.white),
                //         decoration: InputDecoration(
                //             enabledBorder: InputBorder.none,
                //             focusedBorder: InputBorder.none,
                //             icon: Icon(
                //               Icons.search,
                //               color: Colors.white,
                //             ),
                //             hintText: 'Search',
                //             hintStyle: TextStyle(color: Colors.white))),
                //   ),
                // )
              ]),
            );
          },
        ),
      ),
    );
  }
}

// class SliverFilip extends SingleChildRenderObjectWidget {
//   SliverFilip({Widget child, Key key}) : super(child: child, key: key);

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return RenderSliverFilip();
//   }
// }

// class RenderSliverFilip extends RenderSliverSingleBoxAdapter {
//   RenderSliverFilip({
//     RenderBox child,
//   }) : super(child: child);

//   @override
//   void performLayout() {
//     if (child == null) {
//       geometry = SliverGeometry.zero;
//       return;
//     }
//     child.layout(constraints.asBoxConstraints(), parentUsesSize: true);
//     double childExtent;
//     switch (constraints.axis) {
//       case Axis.horizontal:
//         childExtent = child.size.width;
//         break;
//       case Axis.vertical:
//         childExtent = child.size.height;
//         break;
//     }
//     assert(childExtent != null);
//     constraints.
//     // final double paintedChildSize =
//     //     calculatePaintOffset(constraints, from: 0.0, to: childExtent);
//     // final double cacheExtent =
//     //     calculateCacheOffset(constraints, from: 0.0, to: childExtent);

//     // assert(paintedChildSize.isFinite);
//     // assert(paintedChildSize >= 0.0);
//     geometry = SliverGeometry(
//       scrollExtent: childExtent,
//       paintExtent: 90,
//       // cacheExtent: cacheExtent,
//       maxPaintExtent: childExtent,
//       // hitTestExtent: paintedChildSize,
//       hasVisualOverflow: childExtent > constraints.remainingPaintExtent ||
//           constraints.scrollOffset > 0.0,
//     );
//     setChildParentData(child, constraints, geometry);
//   }
// }
