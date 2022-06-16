import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../global.dart'as global;

class ExploreFeature extends StatefulWidget{
  const ExploreFeature({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>ExploreFeatureState();
}

class ExploreFeatureState extends State<ExploreFeature>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      child: Card(
        color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Card(
                    elevation: 15,
                    shadowColor: Colors.black54,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.asset("assets/images/signupimg.jpg",height: 100,width:double.infinity,fit: BoxFit.fill,),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      SizedBox(
                          width: MediaQuery.of(context).size.width*0.30,
                          child: Text('New York Art new me nn',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,)),
                           Icon(Icons.more_vert,color: global.iconColor,),
                    ],
                  ),
                  const SizedBox(height: 3,),
                  Row(
                    children: [
                       Text('\$967',style: TextStyle(color: global.iconColor,fontSize: 12),),
                      const SizedBox(width: 10,),
                      SvgPicture.asset(
                        "assets/svg/circle.svg",
                        color: global.iconColor,
                        //color:global.pageIndex==0?Theme.of(context).primaryColor:const Color(0xFFADB4BD),
                        semanticsLabel: 'No post',
                        width: 5,
                        height: 5,
                      ),
                      const SizedBox(width: 10,),
                       Text('New York',style: TextStyle(color: global.iconColor,fontSize: 12),),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const Icon(Icons.wb_sunny_outlined,size: 30,color: Colors.grey,),
                      const SizedBox(width: 5,),
                      Column(
                        children: [
                          Text('26\u00B0',style: TextStyle(fontSize: 20,color: global.currentTheme.isDarkMode()?Colors.white:Colors.black,fontWeight: FontWeight.bold),),
                          Text('Sunny',style: TextStyle(fontSize: 15,color: global.iconColor,),),
                        ],
                      ),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          children: [
                             SizedBox(
                                width: 140,
                                child: Divider(color: global.iconColor,thickness: 2,)),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.favorite_outline_rounded,size: 18,color: global.iconColor,),
                                    SizedBox(width: 3,),
                                    Text('4k',style: TextStyle(fontSize: 12,color: global.iconColor,),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}