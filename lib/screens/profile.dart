import '../menu/edit_profile.dart';
import 'package:flutter/material.dart';
import '../global.dart'as global;
import 'package:shared_preferences/shared_preferences.dart';


class Profile extends StatefulWidget{
  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>ProfileState();
}

class ProfileState extends State<Profile>{

  bool isNight=global.currentTheme.isDarkMode();
  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];


  void setPref(bool val)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme', val);
  }

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
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.check,color: Theme.of(context).primaryColor,size: 14,),
                                    ),
                                  ),
                                ],
                              ),
                              const Text('Chris Evennett',style: TextStyle(color:Colors.white,fontSize: 25)),
                              Text('traveller/blogger'.toUpperCase(),style: TextStyle(fontSize: 13,color: Colors.white.withOpacity(0.5)),),
                              TextButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>EditProfile()));
                                },
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
                              height: 120,
                              padding: const EdgeInsets.only(top: 70,right: 10,left: 10),
                              alignment: Alignment.center,
                             // padding: EdgeInsets.only(left: 10,right: 10),
                              width: double.infinity,
                              color: global.currentTheme.isDarkMode()?Colors.black:global.whiteShade,
                              //color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Night mode',style: Theme.of(context).textTheme.headline2,),
                                      Text('DISABLED',style: TextStyle(color: global.iconColor,fontSize: 12),),
                                    ],
                                  ),
                                  Switch(
                                    onChanged: (value){
                                      setState(() {
                                        isNight=value;
                                        setPref(isNight);
                                        global.currentTheme.switchTheme();
                                      });
                                    },
                                    value: isNight,
                                    activeColor: Theme.of(context).primaryColor,
                                    activeTrackColor: Colors.grey.shade300,
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey.shade300,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(top: 20,right: 20,left: 10),
                              color: global.currentTheme.isDarkMode()?global.blackShade:const Color(0xFFeeeeee),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children:  [
                                 Text('about me'.toUpperCase(),style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text('Name',style: TextStyle(fontSize: 12,color: global.iconColor),),
                                  TextFormField(
                                    initialValue: "Test Name",
                                    readOnly: true,
                                    style: Theme.of(context).textTheme.headline4,
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: const InputDecoration(
                                      hintText: 'Name',
                                      hintStyle: TextStyle(color: Color(0xFF93969b)),
                                      suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                                      suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        )
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Text('UserName',style: TextStyle(fontSize: 12,color: global.iconColor),),
                                  TextFormField(
                                    readOnly: true,
                                    initialValue: "Test UserName",
                                    style: Theme.of(context).textTheme.headline4,
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: const InputDecoration(
                                      hintText: 'UserName',
                                      hintStyle: TextStyle(color: Color(0xFF93969b)),
                                      suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                                      suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        )
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Text('Email',style: TextStyle(fontSize: 12,color: global.iconColor),),
                                  TextFormField(
                                    readOnly: true,
                                    initialValue: "test@gmail.com",
                                    style: Theme.of(context).textTheme.headline4,
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: const InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(color: Color(0xFF93969b)),
                                      suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                                      suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        )
                                    ),
                                  ),
                                  const SizedBox(height: 30,),
                                ],
                              ),
                            ),

                            // const SizedBox(height: 20,),
                            // Container(
                            //   //height: 400,
                            //   padding: const EdgeInsets.only(left: 10,right: 10),
                            //   width: double.infinity,
                            //   color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       const SizedBox(height: 20,),
                            //       Text('My Photos',style: Theme.of(context).textTheme.headline2,),
                            //       const SizedBox(height: 20,),
                            //       Row(
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         children: [
                            //           ClipRRect(
                            //             borderRadius: BorderRadius.all(Radius.circular(15)),
                            //             child: Image.network('https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',height: 160,width: MediaQuery.of(context).size.width*0.45,fit: BoxFit.fill,),
                            //           ),
                            //           const SizedBox(width: 10,),
                            //           Column(
                            //             crossAxisAlignment: CrossAxisAlignment.start,
                            //             children: [
                            //               ClipRRect(
                            //                 borderRadius: BorderRadius.all(Radius.circular(15)),
                            //                 child: Image.network('https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
                            //                   height: 75,width: MediaQuery.of(context).size.width*0.45,
                            //                   fit: BoxFit.fill,
                            //                 ),
                            //               ),
                            //               SizedBox(height: 10,),
                            //               Row(
                            //                 children: [
                            //                   ClipRRect(
                            //                     borderRadius: BorderRadius.all(Radius.circular(15)),
                            //                     child: Image.network('https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
                            //                       height: 75,
                            //                       width: MediaQuery.of(context).size.width*0.21,
                            //                       fit: BoxFit.fill,
                            //                     ),
                            //                   ),
                            //                   const SizedBox(width: 10,),
                            //                   InkWell(
                            //                     onTap: (){
                            //                      // ImageGallery
                            //                       Navigator.of(context).push(MaterialPageRoute(builder:(context)=> const ImageGallery()));
                            //                     },
                            //                     child: Container(
                            //                       height: 75,
                            //                       width: MediaQuery.of(context).size.width*0.21,
                            //                      decoration: BoxDecoration(
                            //                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                            //                          image: DecorationImage(
                            //                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.colorBurn),
                            //                          fit: BoxFit.fill,
                            //                          image: const NetworkImage(
                            //                            'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
                            //                          ),
                            //                        ),
                            //                      ),
                            //                       child: const Icon(Icons.arrow_forward,size: 30,color: Colors.white,),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ],
                            //           ),
                            //         ],
                            //       ),
                            //       const SizedBox(height: 20,),
                            //     ],
                            //   ),
                            // ),
                            const SizedBox(height: 80,),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 250,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width*0.9,
                      // alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(left: 10,right: 10,bottom: 190),
                      decoration: const BoxDecoration(
                        //color: Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Card(
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
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
                            const SizedBox(width: 5,),
                            SizedBox(
                                height: 40,
                                child: VerticalDivider(color: global.iconColor,)),
                            const SizedBox(width: 5,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('1.7K',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold),),
                                Text('follwing'.toUpperCase(),style: TextStyle(fontSize: 13,color: global.iconColor,letterSpacing: 1),),
                              ],
                            ),
                            const SizedBox(width: 5,),
                            SizedBox(
                                height: 40,
                                child: VerticalDivider(color: global.iconColor,)),
                            const SizedBox(width: 5,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('48',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold),),
                                Text('trips'.toUpperCase(),style: TextStyle(fontSize: 13,color: global.iconColor,letterSpacing: 1),),
                              ],
                            ),
                            const SizedBox(width: 5,),
                          ],
                        ),
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