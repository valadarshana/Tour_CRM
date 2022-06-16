import '../travel/showBookingDetail.dart';

import '../travel/payment_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../global.dart'as global;
import 'hotel_filter.dart';
import 'package:numberpicker/numberpicker.dart';



class Room extends StatefulWidget{
  const Room({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>RoomState();

}

class RoomState extends State<Room>{

  List<String> chipList= [
    "AC","Non AC","Popular","Other","Hotels","Trips"
  ];
  int _AdultsCurrentIntValue = 1;
  int _MinorCurrentIntValue = 1;
  int _selectedIndex=0;
  List<String> image=["deluxeroom","premiumroom","specialroom","deluxeroom","premiumroom","specialroom"];


  Widget QuantityWidget({val}){
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IgnorePointer(
            child: NumberPicker(
              value: val,
              itemWidth: 60,
              itemHeight: 30,
              minValue: 0,
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: global.iconColor, width: 2),bottom:BorderSide(color:  global.iconColor, width: 2),)
              ),
              selectedTextStyle: TextStyle(fontSize: 16,color: global.currentTheme.isDarkMode()?Colors.white:Colors.black,fontWeight: FontWeight.bold,),
              textStyle: TextStyle(fontSize: 16,color: global.iconColor),
              maxValue: 10,
              step: 1,
              haptics: true,
              onChanged: (value) => setState(() => val = value),
            ),
          ),
          SizedBox(width: 10,),
          Container(
            padding: EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      final newValue = _MinorCurrentIntValue + 1;
                      _MinorCurrentIntValue = newValue.clamp(0, 10);
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [global.topColor,global.middleColor,global.bottomColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: const Icon(Icons.add,size: 14,color: Colors.white,),
                  ),
                ),
                const SizedBox(height: 4,),
                InkWell(
                  onTap: (){
                    setState(() {
                      final newValue = _MinorCurrentIntValue - 1;
                      _MinorCurrentIntValue = newValue.clamp(0, 10);
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: global.blackShade,
                    ),
                    child: Icon(Icons.remove,size: 14,color: global.iconColor,),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Icon(Icons.close,color: global.iconColor,),
            ],
          ),
        ),
        title: Text('Booking',style: Theme.of(context).textTheme.headline2,),
      ),
      body: Container(
       height: MediaQuery.of(context).size.height-90,
        //margin: const EdgeInsets.only(left: 10,right: 10,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HotelFilter()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Text('Date: ',style: Theme.of(context).textTheme.headline1),
                    Text('7 June 2022',style: TextStyle(color: global.iconColor),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: 35,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: chipList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx,index){
                    String title =chipList[index];
                    return  InkWell(
                     onTap: (){
                       setState(() {
                         _selectedIndex=index;
                       });
                     },
                      child: Container(
                       margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 7,bottom: 7),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              colors: index==_selectedIndex?[Colors.transparent,Colors.transparent,Colors.transparent]:[global.topColor,global.middleColor,global.bottomColor],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            border: Border.all(color: index==_selectedIndex?Color(0xFFf15369):Colors.transparent,width: 1)
                        ),
                        child: Text('$title',style: TextStyle(fontSize: 14,color:index==_selectedIndex?Color(0xFFf15369):Colors.white),),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.all(5),
              color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Booking',style:Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Ticket Type',style: TextStyle(fontSize: 12,color: global.iconColor),),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 40),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       IgnorePointer(
                            //         child: NumberPicker(
                            //           value: _AdultsCurrentIntValue,
                            //           itemWidth: 60,
                            //           itemHeight: 30,
                            //           minValue: 0,
                            //           decoration: BoxDecoration(
                            //               border: Border(top: BorderSide(color: global.iconColor, width: 2),bottom:BorderSide(color:  global.iconColor, width: 2),)
                            //           ),
                            //           selectedTextStyle: TextStyle(fontSize: 16,color: global.currentTheme.isDarkMode()?Colors.white:Colors.black,fontWeight: FontWeight.bold,),
                            //           textStyle: TextStyle(fontSize: 16,color: global.iconColor),
                            //           maxValue: 10,
                            //           step: 1,
                            //           haptics: true,
                            //           onChanged: (value) => setState(() => _AdultsCurrentIntValue = value),
                            //         ),
                            //       ),
                            //       SizedBox(width: 10,),
                            //       Container(
                            //         padding: EdgeInsets.all(4),
                            //         decoration: const BoxDecoration(
                            //           color: Colors.black54,
                            //           borderRadius: BorderRadius.all(Radius.circular(15)),
                            //         ),
                            //         child: Column(
                            //           children: [
                            //             InkWell(
                            //               onTap: (){
                            //                 setState(() {
                            //                   final newValue = _AdultsCurrentIntValue + 1;
                            //                   _AdultsCurrentIntValue = newValue.clamp(0, 10);
                            //                 });
                            //               },
                            //               child: Container(
                            //                 height: 20,
                            //                 width: 20,
                            //                 decoration: BoxDecoration(
                            //                   shape: BoxShape.circle,
                            //                   gradient: LinearGradient(
                            //                     colors: [global.topColor,global.middleColor,global.bottomColor],
                            //                     begin: Alignment.topCenter,
                            //                     end: Alignment.bottomCenter,
                            //                   ),
                            //                 ),
                            //                 child: Icon(Icons.add,size: 14,color: Colors.white,),
                            //               ),
                            //             ),
                            //             SizedBox(height: 4,),
                            //             InkWell(
                            //               onTap: (){
                            //                 setState(() {
                            //                   final newValue = _AdultsCurrentIntValue - 1;
                            //                   _AdultsCurrentIntValue = newValue.clamp(0, 10);
                            //                 });
                            //               },
                            //               child: Container(
                            //                 height: 20,
                            //                 width: 20,
                            //                 decoration: BoxDecoration(
                            //                   shape: BoxShape.circle,
                            //                   color: global.blackShade,
                            //                 ),
                            //                 child: Icon(Icons.remove,size: 14,color: global.iconColor,),
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            const SizedBox(height: 25,),
                            Column(
                              children: const [
                                Text('Adult( 15)'),
                                Text('+18'),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 50,),
                      SizedBox(
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Quantity',style: TextStyle(fontSize: 12,color: global.iconColor),),
                            QuantityWidget(val: _MinorCurrentIntValue),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',style: Theme.of(context).textTheme.headline1),
                  Text('0.00',style: TextStyle(color: global.iconColor),),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20,),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ShowBookingDetail()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  //padding: const EdgeInsets.only(left: 15,right: 15),
                  child: const Text('Next',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [global.topColor,global.middleColor,global.bottomColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    //color: Theme.of(context).primaryColor,
                    borderRadius:BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            // ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: 5,
            //     physics: ClampingScrollPhysics(),
            //     itemBuilder: (ctx,index){
            //       String img=image[index];
            //   return Column(
            //     children: [
            //       ClipRRect(
            //           child: Image.asset("assets/images/$img.jpg",width: double.infinity,)
            //       ),
            //       const SizedBox(height: 5,),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Deluxe Room',style: Theme.of(context).textTheme.headline1!.copyWith(fontSize:25),),
            //               const SizedBox(height: 5,),
            //               Text('\$ 235 /per Night',style: TextStyle(fontSize: 16,color: global.iconColor)),
            //             ],
            //           ),
            //           InkWell(
            //             onTap: (){
            //               //PaymentMethod
            //               Navigator.of(context).push(MaterialPageRoute(builder:(context)=> PaymentDetail()));
            //             },
            //             child: Card(
            //               elevation: 10,
            //               shape: const RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.all(Radius.circular(20)),
            //               ),
            //               child:  Container(
            //                 alignment: Alignment.center,
            //                 height: 40,
            //                 width: 130,
            //                 padding: const EdgeInsets.only(left: 15,right: 15),
            //                 child: Text('Book',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
            //                 decoration: BoxDecoration(
            //                   gradient: LinearGradient(
            //                     colors: [global.topColor,global.middleColor,global.bottomColor],
            //                     begin: Alignment.topCenter,
            //                     end: Alignment.bottomCenter,
            //                   ),
            //                   //color: Theme.of(context).primaryColor,
            //                   borderRadius:BorderRadius.circular(20),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(height: 10,),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text('Sleeps 3 People',style: TextStyle(fontSize: 16,color: global.iconColor)),
            //           Row(
            //             children: [
            //               Text('Room Details',style: TextStyle(fontSize: 16,color: global.iconColor),),
            //               Icon(Icons.arrow_forward_ios,size: 18,color: global.iconColor,),
            //             ],
            //           ),
            //         ],
            //       ),
            //       SizedBox(height: 10,),
            //     ],
            //   );
            // }),
          ],
        ),
      ),
    );
  }


}