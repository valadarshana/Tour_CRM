import 'package:AANTOUR/widgets/booking_detail_widget.dart';
import 'package:flutter/material.dart';
import '../global.dart'as global;
class ShowBookingDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>ShowBookingDetailState();
}

class ShowBookingDetailState extends State<ShowBookingDetail>{
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
        title: Text('Booking Detail',style: Theme.of(context).textTheme.headline2,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (ctx,index){
              return  BookingDetailWidget();
            },
            itemCount: 3,
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
              color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text('Sub Total',style: Theme.of(context).textTheme.headline2,),
                  Text('15.00',style: TextStyle(color: global.iconColor),),
                ],
              )
            ),
            const SizedBox(height: 10,),
            Container(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text('Total Amount',style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold),),
                    Text('15.00',style:Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold),),
                  ],
                ),
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20,),
                  child: InkWell(
                    onTap: (){
                      //Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ShowBookingDetail()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: MediaQuery.of(context).size.width*0.38,
                      //margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20,),
                      //padding: const EdgeInsets.only(left: 15,right: 15),
                      child: const Text('+ Add',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
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
                Container(
                  margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20,),
                  child: InkWell(
                    onTap: (){
                     // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ShowBookingDetail()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: MediaQuery.of(context).size.width*0.38,
                      //margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20,),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}