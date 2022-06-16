
import 'package:AANTOUR/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../global.dart'as global;
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState()=>LoginState();
}

class LoginState extends State<Login>{

  bool isSwitched=false;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/loginimg.jpg"),
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
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20,right: 20,top: 50,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: ()=>Navigator.of(context).pop(),
                                    child: const Icon(Icons.close,color: Colors.white54,)),
                                const Text('Sign in',style: TextStyle(color: Colors.white54),),
                                const Text(''),
                              ],
                            ),
                          ),
                          Container(
                            //alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            //padding: EdgeInsets.only(right: ),
                            color: const Color(0xFFf2f2f2).withOpacity(0.2),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Sign in',style: TextStyle(color: Colors.black,fontSize: 20),),
                                TextField(
                                  style: Theme.of(context).textTheme.headline3,
                                  cursorColor: Theme.of(context).primaryColor,
                                    decoration: InputDecoration(
                                      hintText: 'UserName',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: global.textFiledBorderColor),
                                      ),
                                      hintStyle: TextStyle(color:global.textFiledBorderColor),
                                      suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                                      suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                                    ),
                                ),
                                const SizedBox(height: 5,),
                                TextField(
                                  style: Theme.of(context).textTheme.headline3,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration:  InputDecoration(
                                    hintText: 'Password',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: global.textFiledBorderColor),
                                    ),
                                    hintStyle: TextStyle(color:global.textFiledBorderColor),
                                  suffixIcon: Icon(Icons.check,),
                                    suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                                   ),
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Keep me logged in',style: TextStyle(color: Colors.black54)),
                                    Switch(
                                      onChanged: (value){
                                        setState(() {
                                          isSwitched=value;
                                        });
                                      },
                                      value: isSwitched,
                                      activeColor: Theme.of(context).primaryColor,
                                      activeTrackColor: Colors.grey.shade300,
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: Colors.grey.shade300,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>TabScreen()));
                                  },
                                  child: Card(
                                    elevation: 15,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:BorderRadius.circular(25),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      height: 50,
                                      // padding: const EdgeInsets.all(15),
                                      child: const Text('Login',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
                                      decoration: BoxDecoration(
                                        gradient:  LinearGradient(colors: [global.topColor,global.bottomColor,global.bottomColor],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          //stops:[0.5,0.0,0.0],
                                          //tileMode: TileMode.decal,
                                        ),
                                        borderRadius:BorderRadius.circular(25),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20,right: 20,bottom: 50),
                            child: Column(
                              children: const [
                                Divider(color: Colors.white30,thickness: 2,),
                                // const SizedBox(height: 5,),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children:  [
                                //     const Text('Not a user? ',style: TextStyle(color: Colors.white54),),
                                //     // ignore: prefer_const_constructors
                                //     InkWell(
                                //         onTap: (){
                                //           Navigator.of(context).push(MaterialPageRoute(builder:(context)=> SignUp()));
                                //         },
                                //         child: const Text('Sign up',style: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),)),
                                //   ],
                                // ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        ),
         );
  }

}