import 'package:AANTOUR/travel/room.dart';
import 'package:flutter/services.dart';

import '../travel/review_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../global.dart'as global;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import 'date_selection.dart';
import 'map_screen.dart';

class HotelDetail extends StatefulWidget{
  const HotelDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>HotelDetailState();
}

class HotelDetailState extends State<HotelDetail>{

  bool wifi=false;
  bool hotel=false;
  bool swimmingPool=false;
  bool bar=false;
  bool parking=false;
  bool club=false;
  List<String>  beforeGo=["Payment at checkout","WI-FI Network is off by 12:00pm","No swimming after 10:00pm","No more than 2 bags of luggage"
  ,"No singing while showering","No refunds"];


  Widget amenties({String? text,IconData? icon}){
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              setState(() {
                wifi=!wifi;
              });
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(shape: BoxShape.circle,
                //color:wifi?Theme.of(context).primaryColor:Colors.grey,
                gradient: LinearGradient(
                  colors: wifi?[global.topColor,global.middleColor,global.bottomColor]:[Colors.grey,Colors.grey,Colors.grey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Icon(icon,color: wifi?Colors.white:Colors.black54,),
            ),
          ),
          SizedBox(height: 5,),
          Container(
              width: MediaQuery.of(context).size.width*0.19,
              alignment: Alignment.center,
              child: Text('$text',textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: global.iconColor),),),
        ],
      ),
    );
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }


  @override
  Widget build(BuildContext context) {

     // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
     //  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
     //   // statusBarColor: Colors.white,               // Only honored in Android M and above
     //    statusBarIconBrightness: Brightness.light // Only honored in Android M and above
     //   // statusBarBrightness: Brightness.light,      // Only honored in iOS
     //  ));

    // TODO: implement build
    return Scaffold(
          body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 400,
                             child: Image.asset(
                               'assets/images/building.jpg',
                               fit: BoxFit.fill,
                             ),
                              // child: Swiper(
                              //   itemBuilder: (BuildContext context, int index) {
                              //     return Image.asset(
                              //       'assets/images/building.jpg',
                              //       fit: BoxFit.fill,
                              //     );
                              //   },
                              //   indicatorLayout: PageIndicatorLayout.COLOR,
                              //   autoplay: true,
                              //   itemCount: 6,
                              //   pagination:  SwiperPagination(
                              //     builder: SwiperCustomPagination(
                              //         builder: (BuildContext context, config){
                              //           return ConstrainedBox(
                              //             child: Row(
                              //               children: <Widget>[
                              //                 Expanded(
                              //                   child: Align(
                              //                     // alignment: Alignment.centerRight,
                              //                     child:  DotSwiperPaginationBuilder(
                              //                         color: global.iconColor,
                              //                         activeColor: Colors.white,
                              //                         size: 7.0,
                              //                         activeSize: 7.0)
                              //                         .build(context, config),
                              //                   ),
                              //                 )
                              //               ],
                              //             ),
                              //             constraints: new BoxConstraints.expand(height: 50.0),
                              //           );
                              //         }
                              //     ),
                              //   ),
                              //   control: const SwiperControl(size: 0),
                              // ),
                            ),
                          Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 10,top: 20,right: 10),
                                    //margin: EdgeInsets.only(left: 10,top: 20,right: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Mt. Catlin Hotel',style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 25),),
                                        Row(
                                          children: [
                                            const Text('\$967',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w500),),
                                            const SizedBox(width: 10,),
                                            SvgPicture.asset(
                                              "assets/svg/circle.svg",
                                              color:  global.iconColor,
                                              //color:global.pageIndex==0?Theme.of(context).primaryColor:const Color(0xFFADB4BD),
                                              semanticsLabel: 'No post',
                                              width: 5,
                                              height: 5,
                                            ),
                                            const SizedBox(width: 10,),
                                            const Text('New York',style: TextStyle(color: Colors.grey,fontSize: 12),),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Divider(color: global.iconColor,),
                                        SizedBox(height: 10,),
                                        Text('about mt. catlin'.toUpperCase(),style: Theme.of(context).textTheme.headline2,),
                                        SizedBox(height: 5,),
                                        Text('Nunc justo eros, vehicula vel vehicula ut, lacinia a eart Nam friglla eros... Nullam aliquam interdum ipsum et tempor. Phasellus odio felis, scelerisque eu purus quis.',
                                          style: TextStyle(fontSize: 14,color: global.iconColor),
                                        ),
                                        const SizedBox(height: 20,),
                                      ],
                                    )),
                                // Container(
                                //   padding: const EdgeInsets.all(10),
                                //   color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Row(
                                //         children: [
                                //           Icon(Icons.wb_sunny_outlined,size: 35,color: global.iconColor,),
                                //           const SizedBox(width: 5,),
                                //           Column(
                                //             crossAxisAlignment: CrossAxisAlignment.start,
                                //             children:  [
                                //               SizedBox(height: 10,),
                                //               Text('22\u00B0',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                //               Text('sunny',style: TextStyle(color: global.iconColor,fontSize: 14),),
                                //               SizedBox(height: 10,),
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //       SizedBox(
                                //           height: 30,
                                //           child: VerticalDivider(color: global.iconColor,thickness: 1.5,)),
                                //       InkWell(
                                //         onTap: (){
                                //           showModalBottomSheet(
                                //               isScrollControlled: true,
                                //               context: context,
                                //               builder: (BuildContext context) {
                                //                 return Review();
                                //               }
                                //           );
                                //         },
                                //         child: Row(
                                //           children: [
                                //             Column(
                                //               crossAxisAlignment: CrossAxisAlignment.start,
                                //               children: [
                                //                 Row(
                                //                   children: [
                                //                     Text('8.4',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                //                     Text('+6K Votes',style: TextStyle(color: global.iconColor,fontSize: 14),),
                                //                   ],
                                //                 ),
                                //                 RatingBar.builder(
                                //                   updateOnDrag: false,
                                //                   onRatingUpdate: (val){
                                //
                                //                   },
                                //                   tapOnlyMode: true,
                                //                   initialRating: 4,
                                //                   itemSize: 15,
                                //                   minRating: 1,
                                //                   direction: Axis.horizontal,
                                //                   allowHalfRating: true,
                                //                   itemCount: 5,
                                //                   itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                                //                   itemBuilder: (context, _) => Icon(
                                //                     Icons.star,
                                //                     color: Colors.amber,
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //             SizedBox(width: 10,),
                                //             Container(
                                //                 height: 45,
                                //                 width: 80,
                                //                 child:
                                //                 Stack(
                                //                   children: [
                                //                     for(double i=0, j=0;i<3;i++,j+=20)
                                //                       Positioned(left:i==0?0:j,
                                //                           child:Container(
                                //                             padding: EdgeInsets.all(1),
                                //                             height: 35,
                                //                             width: 35,
                                //                             decoration: BoxDecoration(
                                //                                 borderRadius: BorderRadius.all(Radius.circular(40)),
                                //                                 color: global.currentTheme.isDarkMode()?Colors.black:Colors.white,
                                //                                 border: Border.all(width: 1,color: Colors.white)
                                //                             ),
                                //                             child:  CircleAvatar(
                                //                               radius: 15,
                                //                               child: ClipRRect(
                                //                                 borderRadius: BorderRadius.circular(15),
                                //                                 child: Image.asset(
                                //                                   "assets/images/map.png",
                                //                                   // placeholder: 'assets/images/place_holder.jpg',
                                //                                   height: 35,
                                //                                   width: 35,
                                //                                   fit: BoxFit.fill,
                                //                                 ),
                                //                               ),
                                //                             ),
                                //                           )
                                //                       )
                                //                   ],
                                //                 )
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                const SizedBox(height: 10,),
                                // Container(
                                //   padding: const EdgeInsets.all(10),
                                //   // width: double.infinity,
                                //   alignment: Alignment.center,
                                //   color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Text('Amenities',style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold),),
                                //       SizedBox(height: 20,),
                                //       Row(
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         children: [
                                //           SizedBox(
                                //             height: 100,
                                //             child: Column(
                                //               mainAxisAlignment: MainAxisAlignment.start,
                                //               crossAxisAlignment: CrossAxisAlignment.center,
                                //               children: [
                                //                 InkWell(
                                //                   onTap: (){
                                //                     setState(() {
                                //                       wifi=!wifi;
                                //                     });
                                //                   },
                                //                   child: Container(
                                //                     height: 50,
                                //                     width: 50,
                                //                     decoration: BoxDecoration(shape: BoxShape.circle,
                                //                       //color:wifi?Theme.of(context).primaryColor:Colors.grey,
                                //                       gradient: LinearGradient(
                                //                         colors: wifi?[global.topColor,global.middleColor,global.bottomColor]:[Colors.grey,Colors.grey,Colors.grey],
                                //                         begin: Alignment.topCenter,
                                //                         end: Alignment.bottomCenter,
                                //                       ),
                                //                     ),
                                //                     child:Padding(
                                //                       padding: const EdgeInsets.all(12.0),
                                //                       child: SvgPicture.asset(
                                //                         "assets/svg/wifi.svg",
                                //                         color:wifi?Colors.white :Colors.black54,
                                //                         semanticsLabel: 'No post',
                                //                         width: 5,
                                //                         height: 5,
                                //                       ),
                                //                     ), //Icon(Icons.close,color: wifi?Colors.white:Colors.black54,),
                                //                   ),
                                //                 ),
                                //                 SizedBox(height: 5,),
                                //                 Container(
                                //                   width: MediaQuery.of(context).size.width*0.19,
                                //                   alignment: Alignment.center,
                                //                   child: Text('WI-FI',textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: global.iconColor),),),
                                //               ],
                                //             ),
                                //           ),
                                //           SizedBox(width: 30,),
                                //           SizedBox(
                                //             height: 100,
                                //             child: Column(
                                //               mainAxisAlignment: MainAxisAlignment.start,
                                //               crossAxisAlignment: CrossAxisAlignment.center,
                                //               children: [
                                //                 InkWell(
                                //                   onTap: (){
                                //                     setState(() {
                                //                       hotel=!hotel;
                                //                     });
                                //                   },
                                //                   child: Container(
                                //                     height: 50,
                                //                     width: 50,
                                //                     decoration: BoxDecoration(shape: BoxShape.circle,
                                //                       //color:wifi?Theme.of(context).primaryColor:Colors.grey,
                                //                       gradient: LinearGradient(
                                //                         colors: hotel?[global.topColor,global.middleColor,global.bottomColor]:[Colors.grey,Colors.grey,Colors.grey],
                                //                         begin: Alignment.topCenter,
                                //                         end: Alignment.bottomCenter,
                                //                       ),
                                //                     ),
                                //                     child:Padding(
                                //                       padding: const EdgeInsets.all(12.0),
                                //                       child: SvgPicture.asset(
                                //                         "assets/svg/hotel.svg",
                                //                         color:hotel?Colors.white :Colors.black54,
                                //                         semanticsLabel: 'No post',
                                //                         width: 5,
                                //                         height: 5,
                                //                       ),
                                //                     ),// Icon(Icons.close,color: hotel?Colors.white:Colors.black54,),
                                //                   ),
                                //                 ),
                                //                 SizedBox(height: 5,),
                                //                 Container(
                                //                   width: MediaQuery.of(context).size.width*0.19,
                                //                   alignment: Alignment.center,
                                //                   child: Text('Hotel Restau',textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: global.iconColor),),),
                                //               ],
                                //             ),
                                //           ),
                                //           SizedBox(width: 30,),
                                //           SizedBox(
                                //             height: 100,
                                //             child: Column(
                                //               mainAxisAlignment: MainAxisAlignment.start,
                                //               crossAxisAlignment: CrossAxisAlignment.center,
                                //               children: [
                                //                 InkWell(
                                //                   onTap: (){
                                //                     setState(() {
                                //                       swimmingPool=!swimmingPool;
                                //                     });
                                //                   },
                                //                   child: Container(
                                //                     height: 50,
                                //                     width: 50,
                                //                     decoration: BoxDecoration(shape: BoxShape.circle,
                                //                       //color:wifi?Theme.of(context).primaryColor:Colors.grey,
                                //                       gradient: LinearGradient(
                                //                         colors: swimmingPool?[global.topColor,global.middleColor,global.bottomColor]:[Colors.grey,Colors.grey,Colors.grey],
                                //                         begin: Alignment.topCenter,
                                //                         end: Alignment.bottomCenter,
                                //                       ),
                                //                     ),
                                //                     child:Padding(
                                //                       padding: const EdgeInsets.all(12.0),
                                //                       child: SvgPicture.asset(
                                //                         "assets/svg/swimming.svg",
                                //                         color:swimmingPool?Colors.white :Colors.black54,
                                //                         semanticsLabel: 'No post',
                                //                         width: 5,
                                //                         height: 5,
                                //                       ),
                                //                     ),// Icon(Icons.close,color: swimmingPool?Colors.white:Colors.black54,),
                                //                   ),
                                //                 ),
                                //                 SizedBox(height: 5,),
                                //                 Container(
                                //                   width: MediaQuery.of(context).size.width*0.19,
                                //                   alignment: Alignment.center,
                                //                   child: Text('Swimming Pools',textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: global.iconColor),),),
                                //               ],
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //       Row(
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         children: [
                                //           SizedBox(
                                //             height: 100,
                                //             child: Column(
                                //               mainAxisAlignment: MainAxisAlignment.start,
                                //               crossAxisAlignment: CrossAxisAlignment.center,
                                //               children: [
                                //                 InkWell(
                                //                   onTap: (){
                                //                     setState(() {
                                //                       bar=!bar;
                                //                     });
                                //                   },
                                //                   child: Container(
                                //                     height: 50,
                                //                     width: 50,
                                //                     decoration: BoxDecoration(shape: BoxShape.circle,
                                //                       //color:wifi?Theme.of(context).primaryColor:Colors.grey,
                                //                       gradient: LinearGradient(
                                //                         colors: bar?[global.topColor,global.middleColor,global.bottomColor]:[Colors.grey,Colors.grey,Colors.grey],
                                //                         begin: Alignment.topCenter,
                                //                         end: Alignment.bottomCenter,
                                //                       ),
                                //                     ),
                                //                     child: Padding(
                                //                       padding: const EdgeInsets.all(12.0),
                                //                       child: SvgPicture.asset(
                                //                         "assets/svg/drinks.svg",
                                //                         color:bar?Colors.white :Colors.black54,
                                //                         semanticsLabel: 'No post',
                                //                         width: 5,
                                //                         height: 5,
                                //                       ),
                                //                     ),// Icon(Icons.close,color: swimmingPool?Colors.white:Colors.black54,),
                                //                     //Icon(Icons.close,color: bar?Colors.white:Colors.black54,),
                                //                   ),
                                //                 ),
                                //                 SizedBox(height: 5,),
                                //                 Container(
                                //                   width: MediaQuery.of(context).size.width*0.19,
                                //                   alignment: Alignment.center,
                                //                   child: Text('Inn-Bar',textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: global.iconColor),),),
                                //               ],
                                //             ),
                                //           ),
                                //           SizedBox(width: 30,),
                                //           SizedBox(
                                //             height: 100,
                                //             child: Column(
                                //               mainAxisAlignment: MainAxisAlignment.start,
                                //               crossAxisAlignment: CrossAxisAlignment.center,
                                //               children: [
                                //                 InkWell(
                                //                   onTap: (){
                                //                     setState(() {
                                //                       parking=!parking;
                                //                     });
                                //                   },
                                //                   child: Container(
                                //                     height: 50,
                                //                     width: 50,
                                //                     decoration: BoxDecoration(shape: BoxShape.circle,
                                //                       //color:wifi?Theme.of(context).primaryColor:Colors.grey,
                                //                       gradient: LinearGradient(
                                //                         colors: parking?[global.topColor,global.middleColor,global.bottomColor]:[Colors.grey,Colors.grey,Colors.grey],
                                //                         begin: Alignment.topCenter,
                                //                         end: Alignment.bottomCenter,
                                //                       ),
                                //                     ),
                                //                     child: Padding(
                                //                       padding: const EdgeInsets.all(12.0),
                                //                       child: SvgPicture.asset(
                                //                         "assets/svg/parking.svg",
                                //                         color:parking?Colors.white :Colors.black54,
                                //                         semanticsLabel: 'No post',
                                //                         width: 5,
                                //                         height: 5,
                                //                       ),
                                //                     ),//Icon(Icons.close,color: parking?Colors.white:Colors.black54,),
                                //                   ),
                                //                 ),
                                //                 SizedBox(height: 5,),
                                //                 Container(
                                //                   width: MediaQuery.of(context).size.width*0.19,
                                //                   alignment: Alignment.center,
                                //                   child: Text('Parking Spot',textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: global.iconColor),),),
                                //               ],
                                //             ),
                                //           ),
                                //           SizedBox(width: 30,),
                                //           SizedBox(
                                //             height: 100,
                                //             child: Column(
                                //               mainAxisAlignment: MainAxisAlignment.start,
                                //               crossAxisAlignment: CrossAxisAlignment.center,
                                //               children: [
                                //                 InkWell(
                                //                   onTap: (){
                                //                     setState(() {
                                //                       club=!club;
                                //                     });
                                //                   },
                                //                   child: Container(
                                //                     height: 50,
                                //                     width: 50,
                                //                     decoration: BoxDecoration(shape: BoxShape.circle,
                                //                       //color:wifi?Theme.of(context).primaryColor:Colors.grey,
                                //                       gradient: LinearGradient(
                                //                         colors: club?[global.topColor,global.middleColor,global.bottomColor]:[Colors.grey,Colors.grey,Colors.grey],
                                //                         begin: Alignment.topCenter,
                                //                         end: Alignment.bottomCenter,
                                //                       ),
                                //                     ),
                                //                     child: Padding(
                                //                       padding: const EdgeInsets.all(12.0),
                                //                       child: SvgPicture.asset(
                                //                         "assets/svg/nightclub.svg",
                                //                         color:club?Colors.white :Colors.black54,
                                //                         semanticsLabel: 'No post',
                                //                         width: 5,
                                //                         height: 5,
                                //                       ),
                                //                     ),//Icon(Icons.close,color: club?Colors.white:Colors.black54,),
                                //                   ),
                                //                 ),
                                //                 SizedBox(height: 5,),
                                //                 Container(
                                //                   width: MediaQuery.of(context).size.width*0.19,
                                //                   alignment: Alignment.center,
                                //                   child: Text('Night Club',textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: global.iconColor),),),
                                //               ],
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                //const SizedBox(height: 10,),
                                Container(
                                  height: 200,
                                  padding: EdgeInsets.all(20),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/map.jpg'),
                                        fit: BoxFit.cover,
                                      )
                                  ),
                                  //color: global.currentTheme.isDarkMode()?Color(0xFF333333):Color(0xFFf2f2f2),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Where is that',style: TextStyle(fontSize: 18,fontFamily: 'Rubik',color: Colors.black,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 20,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          RippleAnimation(
                                            repeat: true,
                                            color: const Color(0xFFf45566),
                                            minRadius: 20,
                                            ripplesCount: 6,
                                            child: Container(
                                                decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.grey,),
                                                child: Icon(Icons.circle,color: Color(0xFFf45566),size: 15,)),
                                          ),
                                          SizedBox(width: 20,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('address'.toUpperCase(),style: TextStyle(fontSize: 16,fontFamily: 'Rubik',color: Colors.black,),),
                                              const SizedBox(height: 5,),
                                              SizedBox(
                                                  width: MediaQuery.of(context).size.width*0.75,
                                                  child: Text('1529 Taylor street, new york NYC 10011, united state',style: TextStyle(fontSize: 16,color: global.iconColor),)),
                                              // InkWell(
                                              //   onTap: (){
                                              //     Navigator.of(context).push(MaterialPageRoute(builder:(context)=> MapScreen()));
                                              //   },
                                              //   child: Card(
                                              //     elevation: 10,
                                              //     shape: const RoundedRectangleBorder(
                                              //       borderRadius: BorderRadius.all(Radius.circular(20)),
                                              //     ),
                                              //     child:  Container(
                                              //       alignment: Alignment.center,
                                              //       height: 40,
                                              //       padding: const EdgeInsets.only(left: 15,right: 15),
                                              //       child: Row(
                                              //         children: const [
                                              //           Text('Check it',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
                                              //           SizedBox(width: 5,),
                                              //           Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.white60,),
                                              //         ],
                                              //       ),
                                              //       decoration: BoxDecoration(
                                              //         gradient: LinearGradient(
                                              //           colors: [global.topColor,global.middleColor,global.bottomColor],
                                              //           begin: Alignment.topCenter,
                                              //           end: Alignment.bottomCenter,
                                              //         ),
                                              //         //color: Theme.of(context).primaryColor,
                                              //         borderRadius:BorderRadius.circular(20),
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Before you go',style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold),),
                                          //SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Column(
                                              children: [
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  physics: ClampingScrollPhysics(),
                                                  itemBuilder: (ctx,index){

                                                    return Column(
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children:  [
                                                            SizedBox(width:15,child: Divider(color: global.iconColor,thickness: 2,)),
                                                            SizedBox(width: 10,),
                                                            Text('${beforeGo[index]}',style: TextStyle(color: global.iconColor,fontSize: 18)),
                                                          ],
                                                        ),
                                                        SizedBox(height: 5,),
                                                      ],
                                                    );
                                                  },
                                                  itemCount: beforeGo.length,
                                                ),
                                                const SizedBox(height: 25,),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        //PaymentMethod
                                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DateSelection()));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 40,
                                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 245),
                                        //padding: const EdgeInsets.only(left: 15,right: 15),
                                        child: const Text('Book Now',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
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
                                  ],
                                ),
                                const SizedBox(height: 20,),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors:global.currentTheme.isDarkMode()?[
                              Colors.black.withOpacity(0.03),
                              Colors.black54,
                            ]:[
                                Colors.white.withOpacity(0.03),
                                Colors.white30,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  //padding: const EdgeInsets.only(top: 30,left: 5),
                                  child: IconButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    icon:const Icon(Icons.close,
                                        color: Colors.white),
                                  ),
                              ),
                              // Container(
                              //  // padding: const EdgeInsets.only(top: 30),
                              //   child: Row(
                              //     children: [
                              //       CupertinoButton(
                              //         padding: EdgeInsets.zero,
                              //         child:const Icon(Icons.card_travel_outlined,color: Colors.white,size: 20,),
                              //         onPressed: (){
                              //           //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TabScreen(widget: CartScreen(),index: 2,)));
                              //         },
                              //       ),
                              //       CupertinoButton(
                              //         padding: EdgeInsets.zero,
                              //         child:const Icon(Icons.share,color: Colors.white,size: 20,),
                              //         onPressed: (){
                              //           //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TabScreen(widget: CartScreen(),index: 2,)));
                              //         },
                              //       ),
                              //       CupertinoButton(
                              //         padding: EdgeInsets.zero,
                              //         child:const Icon(Icons.more_vert,color: Colors.white,size: 20,),
                              //         onPressed: (){
                              //           //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TabScreen(widget: CartScreen(),index: 2,)));
                              //         },
                              //       ),
                              //       // IconButton(
                              //       //   minSize: double.minPositive,
                              //       //   padding: EdgeInsets.zero,
                              //       //   iconSize: 20,
                              //       //   color: Colors.white,
                              //       //   onPressed: () {
                              //       //   },
                              //       //   icon: const Icon(Icons.favorite,color: Colors.white),
                              //       // ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        // Positioned(
                        //   top: 375,
                        //   right: 20,
                        //   child: Container(
                        //     height: 50,
                        //     width: 50,
                        //     padding: EdgeInsets.all(12),
                        //     decoration: const BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       color: Colors.white,
                        //     ),
                        //     child: SvgPicture.asset(
                        //   "assets/svg/ticket.svg",
                        //     fit: BoxFit.cover,
                        //     semanticsLabel: 'No post',
                        //     width: 25,
                        //     height: 25,
                        //   ),
                        //   ),
                        // ),
                        // Expanded(
                        //   child: Container(
                        //     height: 20,
                        //     width: 20,
                        //     padding: EdgeInsets.only(bottom: 30),
                        //     decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),),
                        // ),
                      ],
                    ),
                ],
              ),
            ),
    );
  }

}