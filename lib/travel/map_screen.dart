import 'package:flutter/material.dart';
import '../global.dart'as global;

class MapScreen extends StatefulWidget{
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>MapScreenState();
}

class MapScreenState extends State<MapScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.black54,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 50),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
               height: 350,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ClipRRect(
                              child: Image.asset("assets/images/building.jpg",fit: BoxFit.cover,width: double.infinity,height: 100,),
                            ),
                            Container(
                              height: 180,
                              color: Colors.white,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  const Text('Mt. Catlin Hotel',style: TextStyle(fontSize: 20,color: Colors.black,),),
                                  Text('1.2 km Away',style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.5),),),
                                  const SizedBox(height: 10,),
                                  const Divider(color: Colors.black54,),
                                  const SizedBox(height: 10,),
                                  const Text('ADDRESS',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),),
                                  const SizedBox(height: 3,),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.8,
                                      child: Text('1529 Taylor Street, New York NYC 10011, United States',style: TextStyle(fontSize: 16,color: global.iconColor))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 120,
                        child: Card(
                          elevation: 15,
                          shadowColor: Colors.black54,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(Icons.call,size: 20,color: Theme.of(context).primaryColor,),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 40,
                          //padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2,right: MediaQuery.of(context).size.width*0.2),
                          margin: EdgeInsets.only(left:20,right: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              colors: [global.topColor,global.middleColor,global.bottomColor],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter
                            )
                          ),
                          child: Text('Get Directions',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
              ),
            ),
          ),
        ],
      )
    );
  }

}