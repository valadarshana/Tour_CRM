import 'package:flutter/material.dart';
import '../../global.dart'as global;


class PersonProfile extends StatefulWidget{
  const PersonProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>PersonProfileState();
}

class PersonProfileState extends State<PersonProfile>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints constraints){
        return SingleChildScrollView(
          child: Container(
            color: global.currentTheme.isDarkMode()?Colors.black:Color(0xFFeeeeee),
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Stack(
              alignment: Alignment.center,
              //fit: StackFit.expand,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/profileimage.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child:Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [global.topColor.withOpacity(0.8),global.middleColor.withOpacity(0.8),global.bottomColor.withOpacity(0.8)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children:[
                                Card(
                                  elevation: 15,
                                  shadowColor: Colors.black54,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                                    child: Image.asset("assets/images/user.jpg",height: 80,width: 80,fit: BoxFit.fill,),
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  right: 0,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    //padding: EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.check,color: Theme.of(context).primaryColor,size: 14,),
                                  ),
                                ),
                              ],
                            ),
                            Text('Chris Evennett',style: TextStyle(color:Colors.white,fontSize: 25)),
                            Text('traveller/blogger'.toUpperCase(),style: TextStyle(fontSize: 13,color: Colors.white.withOpacity(0.5)),),
                            TextButton(
                              onPressed: null,
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),side: BorderSide(color: Colors.white,)),),

                              ),
                              child:  Text("+ Edit",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 12),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 60,right: 20,left: 10),
                            color: global.currentTheme.isDarkMode()?Colors.black:Color(0xFFeeeeee),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children:  [
                                Text('about me'.toUpperCase(),style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text('Nunc justo eros. vehicula vel vehicula ut, lacinia a erat. Nam frngilla eros... Nullam aliquam interdum ipsum et tempor. Phasellus odio fells, sceleriqu eu purus quis.',
                                  style: TextStyle(fontSize: 16,color: global.iconColor),),
                                SizedBox(height: 30,),
                              ],
                            ),
                          ),
                          Container(
                            height: 70,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 10,right: 10),
                            width: double.infinity,
                            color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [global.topColor,global.middleColor,global.bottomColor],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.location_on,size: 18,color: Colors.white,),
                                    ),
                                    SizedBox(width: 20,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:  [
                                        Text('Swizerland',style: Theme.of(context).textTheme.headline2,),
                                        Text('227Km AWAY',style: TextStyle(color: global.iconColor,fontSize: 12),),
                                      ],)
                                  ],
                                ),
                                const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 20,),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Container(
                            height: 100,
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            width: double.infinity,
                            color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('My Photos',style: Theme.of(context).textTheme.headline2,),
                              ],
                            ),
                          ),
                          const SizedBox(height: 100,),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 100,
                  // alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(left: 10,right: 10,bottom: 190),
                  decoration: const BoxDecoration(
                    //color: Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: const BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('12K',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold),),
                            Text('followers'.toUpperCase(),style: TextStyle(fontSize: 13,color: global.iconColor,letterSpacing: 1),),
                          ],
                        ),
                        SizedBox(width: 5,),
                        Container(
                            height: 40,
                            child: VerticalDivider(color: global.iconColor,)),
                        SizedBox(width: 5,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('1.7K',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold),),
                            Text('follwing'.toUpperCase(),style: TextStyle(fontSize: 13,color: global.iconColor,letterSpacing: 1),),
                          ],
                        ),
                        SizedBox(width: 5,),
                        Container(
                            height: 40,
                            child: VerticalDivider(color: global.iconColor,)),
                        SizedBox(width: 5,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('48',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold),),
                            Text('trips'.toUpperCase(),style: TextStyle(fontSize: 13,color: global.iconColor,letterSpacing: 1),),
                          ],
                        ),
                        SizedBox(width: 5,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}