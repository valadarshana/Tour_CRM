import 'package:AANTOUR/booking/bookingDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../global.dart'as global;
import 'dart:ui' as ui;

class TripeWidget extends StatefulWidget{
  const TripeWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>TripeWidgetState();
}

class TripeWidgetState extends State<TripeWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>BookingDetail()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text('EW387756',style: Theme.of(context).textTheme.headline2),
            ),
            Card(
              elevation: 15,
              shadowColor: Colors.black54,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [global.topColor.withOpacity(0.3),global.bottomColor.withOpacity(0.3)],
                          tileMode: TileMode.mirror,
                        ),
                         // color: Theme.of(context).primaryColor.withOpacity(0.2),
                          shape: BoxShape.circle),
                          child: Icon(Icons.airplanemode_active,color: Theme.of(context).primaryColor,),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Test Name',style: Theme.of(context).textTheme.headline2),
                                  const SizedBox(height: 3,),
                                  Row(children: [
                                    Text('28 Oct, 2018',style: TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.5):Colors.black.withOpacity(0.50)),),
                                    SizedBox(width: 10,),
                                    SizedBox(width:20,child: Divider(color: global.iconColor,)),
                                    SizedBox(width: 10,),
                                    Text('11:00 AM',style: TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.5):Colors.black.withOpacity(0.50))),
                                  ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Booking',style: Theme.of(context).textTheme.headline2),
                                          Icon(Icons.arrow_forward,size: 20,color: global.iconColor,),
                                          Text('Done',style:TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.5):Colors.black.withOpacity(0.50))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Paid',style:TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.5):Colors.black.withOpacity(0.50))),
                                  const SizedBox(height: 30,),
                                  Text('15.00',style: Theme.of(context).textTheme.headline2),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}