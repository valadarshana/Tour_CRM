import 'dart:io';

import 'package:AANTOUR/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import '../global.dart'as global;
import 'package:card_swiper/card_swiper.dart';

class EditProfile extends StatefulWidget{
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>EditProfileState();

}

class EditProfileState extends State<EditProfile>{

  String? imageNetworkPath;
  File? selectedImageFile;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Edit Profile',style: Theme.of(context).textTheme.headline2,),
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Builder(
            builder: (context) =>InkWell(
              onTap: ()=>Navigator.of(context).pop(),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.arrow_back,color: global.iconColor,),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          // color: global.currentTheme.isDarkMode()?Color(0xFF333333):Color(0xFFeeeeee),
          height: MediaQuery.of(context).size.height,
          //width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImagePickerWidget(
                imageNetworkPath: imageNetworkPath,
                onSelectedImageChanged: (selectedImage){
                  selectedImageFile=selectedImage;
                },
                noCache: true,
              ),
              // Stack(
              //   children:[
              //     Card(
              //       elevation: 15,
              //       shadowColor: Colors.black54,
              //       shape: const RoundedRectangleBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(30)),
              //       ),
              //       child: ClipRRect(
              //         borderRadius: const BorderRadius.all(Radius.circular(30)),
              //         child: Image.asset("assets/images/user.jpg",height: 80,width: 80,fit: BoxFit.fill,),
              //       ),
              //     ),
              //     Positioned(
              //       bottom: 15,
              //       right: 0,
              //       child: Container(
              //         height: 25,
              //         width: 25,
              //         //padding: EdgeInsets.only(bottom: 20),
              //         decoration: BoxDecoration(
              //           color: Theme.of(context).primaryColor,
              //           shape: BoxShape.circle,
              //         ),
              //         alignment: Alignment.center,
              //         child: const Icon(Icons.camera_alt_outlined,color: Colors.white,size: 14,),
              //       ),
              //     ),
              //   ],
              // ),

              Text('Bernard Cerny',style: Theme.of(context).textTheme.headline1!.copyWith(letterSpacing: 1,),),
              const SizedBox(height: 5,),
              Text('dj/traveler'.toUpperCase(),style: const TextStyle(color: Colors.grey,fontSize: 12,letterSpacing: 1,fontWeight: FontWeight.bold),),
              const SizedBox(height: 5,),
              Container(
                margin: const EdgeInsets.only(left: 30,right: 30,top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name',style: TextStyle(fontSize: 12,color: global.iconColor),),
                    TextFormField(
                      initialValue: "Test Name",
                      style: Theme.of(context).textTheme.headline4,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Color(0xFF93969b)),
                        suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                        suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text('UserName',style: TextStyle(fontSize: 12,color: global.iconColor),),
                    TextFormField(
                      initialValue: "Test UserName",
                      style: Theme.of(context).textTheme.headline4,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: const InputDecoration(
                        hintText: 'UserName',
                        hintStyle: TextStyle(color: Color(0xFF93969b)),
                        suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                        suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text('Password',style: TextStyle(fontSize: 12,color: global.iconColor),),
                    TextFormField(
                      initialValue: "123456",
                      obscureText: true,
                      style: Theme.of(context).textTheme.headline4,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Color(0xFF93969b)),
                        suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                        suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text('Confirm Password',style: TextStyle(fontSize: 12,color: global.iconColor),),
                    TextFormField(
                      initialValue: "123456",
                      obscureText: true,
                      style: Theme.of(context).textTheme.headline4,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Color(0xFF93969b)),
                        suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                        suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text('Email',style: TextStyle(fontSize: 12,color: global.iconColor),),
                    TextFormField(
                      initialValue: "test@gmail.com",
                      style: Theme.of(context).textTheme.headline4,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Color(0xFF93969b)),
                        suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                        suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                      ),
                    ),
                    SizedBox(height: 10,),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //      SizedBox(
                    //         width: 100,
                    //         child: Text('Name',style: Theme.of(context).textTheme.headline2,)),
                    //     const SizedBox(width: 5,),
                    //     Expanded(
                    //       child: TextField(
                    //         style: Theme.of(context).textTheme.headline4,
                    //         cursorColor: Theme.of(context).primaryColor,
                    //         decoration: const InputDecoration(
                    //           hintText: 'Name',
                    //           hintStyle: TextStyle(color: Color(0xFF93969b)),
                    //           suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                    //           suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     SizedBox(
                    //         width: 100,
                    //         child: Text('UserName',style: Theme.of(context).textTheme.headline2,)),
                    //     const SizedBox(width: 5,),
                    //     Expanded(
                    //       child: TextField(
                    //         style: Theme.of(context).textTheme.headline4,
                    //         cursorColor: Theme.of(context).primaryColor,
                    //         decoration: const InputDecoration(
                    //           hintText: 'UserName',
                    //           hintStyle: TextStyle(color: Color(0xFF93969b)),
                    //
                    //           suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                    //           suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     SizedBox(
                    //         width: 100,
                    //         child: Text('Password',style: Theme.of(context).textTheme.headline2,)),
                    //     const SizedBox(width: 5,),
                    //     Expanded(
                    //       child: TextField(
                    //         style: Theme.of(context).textTheme.headline4,
                    //         cursorColor: Theme.of(context).primaryColor,
                    //         decoration: const InputDecoration(
                    //           hintText: 'Password',
                    //           hintStyle: TextStyle(color: Color(0xFF93969b)),
                    //           suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                    //           suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     SizedBox(
                    //         width: 100,
                    //         child: Text('Confirm Password',style: Theme.of(context).textTheme.headline2,)),
                    //     SizedBox(width: 5,),
                    //     Expanded(
                    //       child: TextField(
                    //         style: Theme.of(context).textTheme.headline4,
                    //         cursorColor: Theme.of(context).primaryColor,
                    //         decoration: const InputDecoration(
                    //           hintText: 'Confirm Password',
                    //           hintStyle: TextStyle(color: Color(0xFF93969b)),
                    //           suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                    //           suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     SizedBox(
                    //         width: 100,
                    //         child: Text('Email',style: Theme.of(context).textTheme.headline2,)),
                    //     SizedBox(width: 5,),
                    //     Expanded(
                    //       child: TextField(
                    //         style: Theme.of(context).textTheme.headline4,
                    //         cursorColor: Theme.of(context).primaryColor,
                    //         decoration: const InputDecoration(
                    //           hintText: 'Email',
                    //           hintStyle: TextStyle(color: Color(0xFF93969b)),
                    //           suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                    //           suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 30,),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      //padding: const EdgeInsets.only(left: 15,right: 15),
                      child: const Text('Save Change',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [global.topColor,global.middleColor,global.bottomColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        //color: Theme.of(context).primaryColor,
                        borderRadius:BorderRadius.circular(25),
                      ),
                    ),

                    // Swiper(
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return Image.network(
                    //       "https://via.placeholder.com/288x188",
                    //       fit: BoxFit.fill,
                    //     );
                    //   },
                    //   scrollDirection: Axis.horizontal,
                    //   itemCount: 10,
                    //   itemWidth: 300.0,
                    //   itemHeight: 300.0,
                    //   layout: SwiperLayout.TINDER,
                    // ),
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