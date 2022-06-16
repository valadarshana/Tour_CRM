import '../widgets/feature_widget.dart';
import 'package:flutter/material.dart';
import '../global.dart' as global;

class Traveling extends StatefulWidget{
  const Traveling({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>TravelingState();
}

class TravelingState extends State<Traveling>{

 bool wifi=false;
 List<String> chipList= [
   "Popular","Recently Added","New","Other","Hotels","Trips",
 ];
 int _selectedIndex=0;

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
                    children:  [
                      const Text('Featured',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                      Text('214 SPOTS',style: TextStyle(fontSize: 12,letterSpacing: 2,color: global.iconColor),),
                    ],
                  ),
                  //  InkWell(
                  //    onTap: (){
                  //      //HotelFilter
                  //      Navigator.of(context).push(MaterialPageRoute(builder:(context)=> HotelFilter()));
                  //      //Navigator.of(context).push(Material)
                  //    },
                  //    child: Card(
                  //     elevation: 10,
                  //     shape: const RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(20)),
                  //       ),
                  //     child:  Container(
                  //       alignment: Alignment.center,
                  //       height: 40,
                  //        padding: const EdgeInsets.only(left: 15,right: 15),
                  //       child: Row(
                  //         children: const [
                  //           Icon(Icons.add,size: 20,color: Colors.white60,),
                  //           SizedBox(width: 5,),
                  //           Text('Filters',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
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
                  // ),
                  //  ),
                ],
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: 35,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
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
              SizedBox(height: 10,),
              ListView.builder(
              shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (ctx,index){
                  return Column(
                    children: [
                      FeatureWidget(),
                      SizedBox(height: 5,),
                    ],
                  );
              },
              itemCount: 5,
              ),
              // RippleAnimation(
              //     repeat: true,
              //     color: Theme.of(context).primaryColor,
              //     minRadius: 20,
              //     ripplesCount: 6,
              //     child: Container(
              //       decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey,),
              //         child: Icon(Icons.circle,color: Theme.of(context).primaryColor,size: 15,)),
              // ),

              // InkWell(
              //   onTap: (){
              //     setState(() {
              //       wifi=!wifi;
              //     });
              //   },
              //   child: Container(
              //     height: 50,
              //     width: 50,
              //     decoration: BoxDecoration(shape: BoxShape.circle,color:wifi?Theme.of(context).primaryColor:Colors.grey,),
              //     child: Icon(Icons.wifi,color: wifi?Colors.white:Colors.black54,),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

}