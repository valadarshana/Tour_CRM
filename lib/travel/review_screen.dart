import '../widgets/comment_widget.dart';
import 'package:flutter/material.dart';
import '../global.dart'as global;
import 'dart:math' as math;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Review extends StatefulWidget{
  const Review({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=> ReviewState();
}

class ReviewState extends State<Review>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       backgroundColor: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
       title:  Padding(
         padding: EdgeInsets.all(8.0),
         child: Column(
           children: const [
             SizedBox(height: 30,),
             Text('Reviews',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
           ],
         ),
       ),
       elevation: 0,
       leading: InkWell(
         onTap: (){
           Navigator.of(context).pop();
         },
         child: Column(
           children: [
             const SizedBox(height: 30,),
             Icon(Icons.close,color: global.iconColor,),
           ],
         ),
       ),
     ),
     body: SingleChildScrollView(
       child: SizedBox(
         width: double.infinity,
         child: Column(
           children: [
             Container(
               width: double.infinity,
               color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
               padding: const EdgeInsets.only(top: 10,right: 20,left: 20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           Text('8.4',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                           Text('+6K Votes',style: TextStyle(color: global.iconColor,fontSize: 14),),
                         ],
                       ),
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
                       SizedBox(
                           width: 150,
                           child: Divider(color: Theme.of(context).primaryColor,thickness: 2,))
                     ],
                   ),
                   SizedBox(
                       height: 45,
                       width: 80,
                       child:
                       Stack(
                         children: [
                           for(double i=0, j=0;i<3;i++,j+=20)
                             Positioned(left:i==0?0:j,
                                 child:Container(
                                   padding: EdgeInsets.all(1),
                                   height: 35,
                                   width: 35,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.all(Radius.circular(40)),
                                       color: global.currentTheme.isDarkMode()?Colors.black:Colors.white,
                                       border: Border.all(width: 1,color: Colors.white)
                                   ),
                                   child:  CircleAvatar(
                                     radius: 15,
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.circular(15),
                                       child: Image.asset(
                                         "assets/images/map.png",
                                         // placeholder: 'assets/images/place_holder.jpg',
                                         height: 35,
                                         width: 35,
                                         fit: BoxFit.fill,
                                       ),
                                     ),
                                   ),
                                 )
                             )
                         ],
                       )
                   ),
                 ],
               ),
             ),
             const SizedBox(height: 10,),
             ListView.builder(
                 shrinkWrap: true,
                 physics: ClampingScrollPhysics(),
                 itemCount: 4,
                 itemBuilder: (ctx,index){
               return Column(
                 children: [
                   SizedBox(height: 10,),
                   CommentWidget(),
                 ],
               );
             })
           ],
         ),
       ),
     ),
   );
  }

}