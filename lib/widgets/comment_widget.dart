import 'package:flutter/material.dart';
import '../global.dart'as global;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math'as math;

class CommentWidget extends StatefulWidget{
  const CommentWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=> CommentWidetState();
}

class CommentWidetState extends State<CommentWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
      padding: const EdgeInsets.only(top: 10,right: 20,left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 15,
            shadowColor: Colors.black54,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Image.asset("assets/images/user.jpg",height: 50,width: 50,fit: BoxFit.fill,),
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Steven Gerrad',style: Theme.of(context).textTheme.headline1),
                        const SizedBox(height: 3,),
                        Row(children: [
                          RatingBar.builder(
                            updateOnDrag: false,
                            onRatingUpdate: (val){

                            },
                            tapOnlyMode: true,
                            initialRating: 4,
                            itemSize: 15,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text('(22 Votes)',style: TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.25):Colors.black.withOpacity(0.25),fontWeight: FontWeight.bold),),
                        ],),
                      ],
                    ),
                    Text('52 min ago'.toUpperCase(),style: TextStyle(color: global.iconColor,fontSize: 13),)
                  ],
                ),
                const SizedBox(height: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.7,
                        child: Divider(color: global.iconColor,thickness: 2,)),
                    Text('Another Dimension!',style: Theme.of(context).textTheme.headline2,),
                    SizedBox(height: 5,),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.62,
                        child: Text('Nunc justo eros, vehicula vel vehicula ut, lacinia ut, lacinia a erat. Nam fringilla eros...',
                          style: TextStyle(fontSize: 14,color: global.iconColor),)),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children:  [
                            Icon(Icons.favorite_outline_rounded,size: 18,color: global.iconColor,),
                            SizedBox(width: 5,),
                            Text('271',style: TextStyle(fontSize: 12,color: global.currentTheme.isDarkMode()?Colors.white.withOpacity(0.7):Colors.black.withOpacity(0.7),fontWeight: FontWeight.bold),),
                          ],
                        ),
                        const SizedBox(width: 12,),
                        Transform.rotate(
                          angle: 180 * math.pi / 120,
                          child:  Icon(Icons.more_vert,color: global.iconColor,),),
                      ],
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}