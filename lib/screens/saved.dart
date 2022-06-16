import 'package:AANTOUR/widgets/tripe_widget.dart';

import 'package:flutter/material.dart';
import '../global.dart'as global;

class Saved extends StatefulWidget{
  const Saved({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>SavedState();
}

class SavedState extends State<Saved>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 70),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:   [
                      const Text('Bookings',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                      Text('72 ITEMS',style: TextStyle(fontSize: 12,letterSpacing: 2,color: global.iconColor),),
                    ],
                  ),
                  // InkWell(
                  //   onTap: (){
                  //     //HotelFilter
                  //    // Navigator.of(context).push(MaterialPageRoute(builder:(context)=> HotelFilter()));
                  //     //Navigator.of(context).push(Material)
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
                  //           Icon(Icons.add,size: 20,color: Colors.white60,),
                  //           SizedBox(width: 5,),
                  //           Text('Filters',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
                  //         ],
                  //       ),
                  //       decoration: BoxDecoration(
                  //         gradient: LinearGradient(
                  //           colors: [global.topColor,global.middleColor,global.topColor],
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
              ),
              const SizedBox(height: 20,),
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (ctx,index){
                    return TripeWidget();
                  }
              ),
              // Container(
              //   width: double.infinity,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     physics: ClampingScrollPhysics(),
              //     itemBuilder: (ctx,index){
              //       return Column(
              //         children: const [
              //           SavedWidget(),
              //           SizedBox(height: 5,),
              //         ],
              //       );
              //     },
              //     itemCount: 5,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

}