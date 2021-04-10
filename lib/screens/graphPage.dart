import 'package:dte_epic_interface/components/bigButton.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:dte_epic_interface/components/bottomBar.dart';
import 'package:dte_epic_interface/user.dart';

///TODO: Use the daily Brazier Scale and make it zoomable
///TODO: implement the get Data methods in the user.dart and pull that data to here
/// remember, the user does not really need controle of the start/end date. They can see what they want with
/// the graph scroll/zoom functions
class graphPage extends StatelessWidget {
  static final route = "graph";
  @override
  Widget build(BuildContext context) {
    final fromDate = DateTime(2017, 05, 22);
    ///TODO change 2017 to the start/earliest date
    final toDate = DateTime.now();
    final date1 = DateTime.now().subtract(Duration(days: 2));
    final date2 = DateTime.now().subtract(Duration(days: 3));
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
                  //xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
                  /*
                  series: const [
                    BezierLine(
                      lineColor: Colors.black,
                      dataPointStrokeColor: Colors.black,
                      dataPointFillColor: Colors.black,
                      data: const [
                        DataPoint<double>(value: 10, xAxis: 0),
                        DataPoint<double>(value: 130, xAxis: 5),
                        DataPoint<double>(value: 50, xAxis: 10),
                        DataPoint<double>(value: 150, xAxis: 15),
                        DataPoint<double>(value: 75, xAxis: 20),
                        DataPoint<double>(value: 0, xAxis: 25),
                        DataPoint<double>(value: 5, xAxis: 30),
                        DataPoint<double>(value: 45, xAxis: 35),
                      ],
                    ),
                  ],
                  */

                  series: [
                    BezierLine(
                      lineColor: Colors.black,
                      dataPointStrokeColor: Colors.black,
                      dataPointFillColor: Colors.black,
                      label: "Duty",
                      onMissingValue: (dateTime) {
                        return 0.0;
                      },
                        /*
                        if (dateTime.day.isEven) {
                          return 10.0;
                        }
                        return 5.0;
                      },
                      */

                      data: User.getSampleData(),
                      /*

                      data: [
                        DataPoint<DateTime>(value: 10, xAxis: date1),
                        DataPoint<DateTime>(value: 50, xAxis: date2),
                      ],

                       */
                    ),
                  ],


                  config: BezierChartConfig(
                    /*
                    verticalIndicatorStrokeWidth: 3.0,
                    showVerticalIndicator: true,
                    //contentWidth: MediaQuery.of(context).size.width * 2, /// Dont set this when using chart scale weeks

                    xAxisTextStyle: TextStyle(color: Colors.black),
                    yAxisTextStyle: TextStyle(color: Colors.black),

                    snap: false,
                    pinchZoom: true,
                    displayYAxis: true,
                    displayLinesXAxis: true,
                    stepsYAxis: 10,
                    */
                    verticalIndicatorStrokeWidth: 3.0,
                    showVerticalIndicator: true,

                    xAxisTextStyle: TextStyle(color: Colors.black),
                    yAxisTextStyle: TextStyle(color: Colors.black),

                    //verticalIndicatorColor: Colors.black26,
                    verticalIndicatorColor: Colors.black26,
                    verticalIndicatorFixedPosition: false,
                    backgroundColor: Colors.white,
                    footerHeight: 30.0,

                    displayYAxis: true,
                    displayLinesXAxis: true,
                    stepsYAxis: 50,
                    ///TODO cahnge to max/10

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
                  onPressed: (){
                    ///TODO: call the popup for editing data
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
                onPressed: (){
                  ///TODO: call the popup for adding data
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

      bottomNavigationBar: bottomBar(),
    );
  }
}


