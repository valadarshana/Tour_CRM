import '../travel/hotel_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../global.dart'as global;


class FeatureWidget extends StatefulWidget{
  const FeatureWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>FeatureWidgetState();
}

class FeatureWidgetState extends State<FeatureWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder:(context)=> HotelDetail()));
      },
      child: Card(
        elevation: 15,
        shadowColor: Colors.black45,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                shadowColor: Colors.black,
                elevation: 15,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft:  Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset("assets/images/signupimg.jpg",height: 80,width:100,fit: BoxFit.fill,),
                ),
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
                            Text('Hotel Blue Lagoon',style: Theme.of(context).textTheme.headline2),
                            const SizedBox(height: 3,),
                            Row(children: [
                              Text('\$234',style: TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.5):Colors.black.withOpacity(0.50)),),
                              SizedBox(width: 10,),
                              Text('\$1285',style: TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.25):Colors.black.withOpacity(0.25),decoration: TextDecoration.lineThrough),),
                            ],),
                          ],
                        ),
                        Icon(Icons.more_vert,color: global.iconColor,),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children:  [
                            Icon(Icons.location_on_outlined,size: 18,color: global.iconColor,),
                            Text('Chicago',style: TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.75):Colors.black.withOpacity(0.75)),),
                          ],
                        ),
                        const SizedBox(width: 12,),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.favorite_outline_rounded,size: 18,color: global.iconColor,),
                                SizedBox(width: 3,),
                                Text('4k',style: TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.75):Colors.black.withOpacity(0.75)),),
                              ],
                            ),
                            const SizedBox(width: 10,),
                            Row(
                              children:  [
                                Icon(Icons.message,size: 18,color: global.iconColor,),
                                SizedBox(width: 3,),
                                Text('766',style: TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.75):Colors.black.withOpacity(0.75)),),
                              ],
                            )
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
    );
  }

}