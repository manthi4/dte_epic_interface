import 'package:dte_epic_interface/components/bigButton.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:dte_epic_interface/components/bottomBar.dart';
import 'package:dte_epic_interface/user.dart';
import 'package:dte_epic_interface/components/addDataPopup.dart';
import 'package:dte_epic_interface/components/editDataPopup.dart';


///TODO: Use the daily Brazier Scale and make it zoomable
///TODO: implement the get Data methods in the user.dart and pull that data to here
///TODO change 2017 to the start/earliest date :)
///TODO: call the popup for editing data :)
///TODO: call the popup for adding data
/// remember, the user does not really need controle of the start/end date. They can see what they want with
/// the graph scroll/zoom functions

class graphPage extends StatelessWidget {
  static final route = "graph";
  @override
  Widget build(BuildContext context) {
    //sets the start and end dates of the graph
    final fromDate = DateTime(2017, 05, 22);
    final toDate = DateTime.now();


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child:  Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                child: BezierChart(

                  fromDate: fromDate,
                  bezierChartScale: BezierChartScale.WEEKLY,
                  toDate: toDate,
                  selectedDate: toDate,

                  series: [
                    BezierLine(
                      //sets the colors
                      lineColor: Colors.black,
                      dataPointStrokeColor: Colors.black,
                      dataPointFillColor: Colors.black,
                      label: "Duty",
                      onMissingValue: (dateTime) {
                        return 0.0;
                      },

                      data: User.getSampleData(),

                    ),
                  ],

                  config: BezierChartConfig(

                    verticalIndicatorStrokeWidth: 3.0,
                    showVerticalIndicator: true,

                    xAxisTextStyle: TextStyle(color: Colors.black),
                    yAxisTextStyle: TextStyle(color: Colors.black),

                    verticalIndicatorColor: Colors.black26,
                    verticalIndicatorFixedPosition: false,
                    backgroundColor: Colors.white,
                    //sets the height of the dates below the graph, less than 30 cuts off
                    footerHeight: 30.0,

                    displayYAxis: true,
                    displayLinesXAxis: true,
                    stepsYAxis: 20,
                    ///TODO change to max/10

                  ),
                ),
              ),
          ),
          Container(
            height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                //calls the edit popup when button pressed
              onPressed: (){
                    EditDataPopup(context);
                    print("Editing");//
                    // TODO: add units for all vital

                  },
                  child: Text("Edit Log", style: TextStyle(color: Colors.black),),
                  color: Colors.white,
                  height: 50,
                  minWidth: 150,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.black),
                  ),
              ),
              FlatButton(
                //calls the add popup when button pressed
                onPressed: (){
                  print("Adding");
                  AddDataPopup(context);
                  // TODO: add units for all vital

                },
                child: Text("Add Log", style: TextStyle(color: Colors.white),),
                color: Colors.black,
                height: 50,
                minWidth: 150,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.white),
                ),
              ),
            ],
          ),),
        ]
      ),

      //inserts the bottom bar
      bottomNavigationBar: bottomBar(),
    );
  }
}


