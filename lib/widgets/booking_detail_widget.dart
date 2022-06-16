import 'package:AANTOUR/booking/bookingDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../global.dart'as global;


class BookingDetailWidget extends StatefulWidget{
  const BookingDetailWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>BookingDetailWidgetState();
}

class BookingDetailWidgetState extends State<BookingDetailWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 5,bottom: 5,top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 105,
            width: MediaQuery.of(context).size.width*0.85,
            //margin: const EdgeInsets.only(right: 10,left: 10,top: 20,bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 15,
                  shadowColor: Colors.black54,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Container(
                        //   height: 60,
                        //   width: 60,
                        //   decoration: BoxDecoration(
                        //       color: Theme.of(context).primaryColor.withOpacity(0.2),
                        //       shape: BoxShape.circle),
                        //   child: Icon(Icons.airplanemode_active,color: Theme.of(context).primaryColor,),
                        // ),
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
                                        const SizedBox(width: 10,),
                                        SizedBox(width:20,child: Divider(color: global.iconColor,)),
                                        const SizedBox(width: 10,),
                                        Text('11:00 AM',style: TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.5):Colors.black.withOpacity(0.50))),
                                      ],),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Unit Price',style: Theme.of(context).textTheme.headline2),
                                              Icon(Icons.arrow_forward,size: 20,color: global.iconColor,),
                                              Text('15.00',style:TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.5):Colors.black.withOpacity(0.50))),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Adult',style:TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.5):Colors.black.withOpacity(0.50))),
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
          InkWell(
            onTap: (){

            },
            child: SizedBox(
              //margin: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width*0.1,
              child: Card(
                child: Icon(Icons.delete,color: global.iconColor,),
              ),
            ),
          )
        ],
      ),
    );
  }

}