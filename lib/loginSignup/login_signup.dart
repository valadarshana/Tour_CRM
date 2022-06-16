import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../global.dart'as global;
import 'package:flutter_svg/flutter_svg.dart';

import 'login.dart';

class LoginSignUp extends StatefulWidget{
  const LoginSignUp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState()=>LoginSignUpState();
}

class LoginSignUpState extends State<LoginSignUp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Container(
            //height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/homeimg.jpg"),
                fit:BoxFit.fill,
              //  colorFilter: ColorFilter.mode([Colors.black,Colors.black], BlendMode.softLight)
              ),
            ),
            child: Container(
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    global.topColor.withOpacity(1),
                    global.middleColor.withOpacity(0.7),
                    global.bottomColor.withOpacity(0.7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Container(
           //height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.only(bottom: 35),
                  //color: Colors.white,
                  // decoration: const BoxDecoration(
                  //   borderRadius: BorderRadius.all(Radius.elliptical(25, 25)),
                  //   color: Colors.white,
                  // ),
                  child: Card(
                    elevation: 30,
                    color: Colors.white,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(32,32)),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      //margin: EdgeInsets.only(bottom: 10),
                      child: Image.asset("assets/images/map.png"),
                      // child: SvgPicture.asset(
                      //   "assets/svg/map.svg",
                      //   fit: BoxFit.cover,
                      //   semanticsLabel: 'No post',
                      //   width: 10,
                      //   height: 10,
                      // ),
                    ),
                    ),
                  ),
                Text('AANTOUR',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 25,letterSpacing: 7.0),),
                Text('Blisful Travel',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 45,),),
                SizedBox(height: 10,),
                Container(
                    width: 35,
                    child: const Divider(color: Colors.white,thickness: 5,)),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15,right: 15,bottom: 100),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder:(context)=> Login()));
                          },
                          //borderRadius: BorderRadius.circular(15),
                          child: Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(25),
                            ),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              height: 50,
                              // padding: const EdgeInsets.all(15),
                              child: Text('Log in',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18,letterSpacing: 2),textAlign: TextAlign.center,),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [Colors.white,Colors.white],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  //stops:[0.5,0.0,0.0],
                                  tileMode: TileMode.decal,
                                ),
                                borderRadius:BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                              child: Divider(color: Colors.white60,thickness: 2,),
                            ),
                            SizedBox(width: 10,),
                            Text('OR',style: TextStyle(color: Colors.white,letterSpacing: 2),),
                            SizedBox(width: 10,),
                            Expanded(child: Divider(color: Colors.white60,thickness: 2,)),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white60,width: 2),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: OutlinedButton(
                            onPressed: null,
                            style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                side: BorderSide(color: Colors.white,width: 0,),
                                ),
                            ),
                            ),
                            child: const Text("Create an account",style: TextStyle(color:Colors.white,fontSize: 18,letterSpacing: 2),textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
  }

}