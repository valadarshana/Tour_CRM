import 'package:flutter/material.dart';
import '../screens/profile.dart';
import '../screens/saved.dart';
import 'traveling.dart';
import '/global.dart'as global;
import 'package:flutter_svg/flutter_svg.dart';


class TabScreen extends StatefulWidget{
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>TabScreenState();
}

class TabScreenState extends State<TabScreen>{

  Widget mainWidget=const Traveling();
  int pageIndex=0;
  bool search=false;
  bool notification=true;
  String appBarTitle="Traveling";

  void selectPages(int index){
    setState(() {
      global.pageIndex=index;
      pageIndex=index;
      if(pageIndex==0){
        mainWidget=const Traveling();
        appBarTitle="Traveling";
      } else if(pageIndex==1) {
        mainWidget=const Saved();
        appBarTitle="Saved";
      } else if(pageIndex==2){
        mainWidget=const Profile();
        appBarTitle="Profile";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: appBarTitle=="Profile"?null:AppBar(
        //backgroundColor: Colors.white,
        centerTitle: true,
        elevation: appBarTitle=="Explore"?0:25,
        shadowColor:appBarTitle=="Explore"?Colors.transparent:Colors.black54,
        //bottomOpacity: 0.9,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Builder(
            builder: (context) =>InkWell(
              onTap: ()=>Scaffold.of(context).openDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(
                  "assets/svg/sidelist.svg",
                  // color:Colors.black,
                  color: global.iconColor,
                  semanticsLabel: 'No post',
                  width: 1,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
        // actions: [
        //   InkWell(
        //     borderRadius: BorderRadius.all(Radius.circular(10)),
        //     onTap: (){
        //       setState(() {
        //         notification=true;
        //         search=false;
        //       });
        //     },
        //     child: Padding(
        //       padding: EdgeInsets.only(right: 16,top: 20),
        //       child: Column(
        //         children: [
        //           SvgPicture.asset(
        //             "assets/svg/activity.svg",
        //             // color:Colors.black,
        //             semanticsLabel: 'No post',
        //             color: global.iconColor,
        //             width: 20,
        //             height: 20,
        //           ),
        //           if(notification)
        //             const SizedBox(height: 5,),
        //           if(notification)
        //             SvgPicture.asset(
        //               "assets/svg/circle.svg",
        //               color:Theme.of(context).primaryColor,
        //               semanticsLabel: 'No post',
        //               width: 5,
        //               height: 5,
        //             ),
        //         ],
        //       ),
        //     ),
        //   ),
        //   InkWell(
        //     onTap: (){
        //       setState(() {
        //         search=true;
        //         notification=false;
        //
        //       });
        //     },
        //     borderRadius: BorderRadius.all(Radius.circular(20)),
        //     child: Padding(
        //       padding:  EdgeInsets.only(right: 16,top: 20),
        //       child: Column(
        //         children: [
        //           SvgPicture.asset(
        //             "assets/svg/search.svg",
        //             // color:Colors.black,
        //             color: global.iconColor,
        //             semanticsLabel: 'No post',
        //             width: 20,
        //             height: 20,
        //           ),
        //           if(search)
        //             const SizedBox(height: 5,),
        //           if(search)
        //             SvgPicture.asset(
        //               "assets/svg/circle.svg",
        //               color:Theme.of(context).primaryColor,
        //               semanticsLabel: 'No post',
        //               width: 5,
        //               height: 5,
        //             ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ],
        title: Text(appBarTitle,style: TextStyle(fontSize: 17,),),
      ),
      //drawer: const DrawerWidget(),
      body:mainWidget,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: selectPages,
          currentIndex: global.pageIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: ShaderMask(shaderCallback: (Rect bounds) {
                return  RadialGradient(
                  center: Alignment.topCenter,
                  radius: 0.5,
                  colors: <Color>[
                    global.topColor,
                    //global.middleColor,
                    //global.bottomColor,
                    global.bottomColor,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/travels.svg",
                     // color:global.pageIndex==0?Theme.of(context).primaryColor:const Color(0xFFADB4BD),
                      semanticsLabel: 'No post',
                      width: 20,
                      height: 20,
                    ),
                    if(global.pageIndex==0)
                      const SizedBox(height: 5,),
                    if(global.pageIndex==0)
                      SvgPicture.asset(
                        "assets/svg/circle.svg",
                        //color:global.pageIndex==0?Theme.of(context).primaryColor:const Color(0xFFADB4BD),
                        semanticsLabel: 'No post',
                        width: 7,
                        height: 7,
                      ),
                  ],
                ),
              ),
              label: '',
              icon: Column(
                children: [
                  SvgPicture.asset(
                    "assets/svg/travels.svg",
                    color:global.pageIndex==0?Theme.of(context).primaryColor:const Color(0xFFADB4BD),
                    semanticsLabel: 'No post',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),


            BottomNavigationBarItem(
              activeIcon: ShaderMask(shaderCallback: (Rect bounds) {
                return  RadialGradient(
                  center: Alignment.topCenter,
                  radius: 0.5,
                  colors: <Color>[
                    global.topColor,
                    //global.middleColor,
                    //global.bottomColor,
                    global.bottomColor,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/saved.svg",
                      // color:global.pageIndex==0?Theme.of(context).primaryColor:const Color(0xFFADB4BD),
                      semanticsLabel: 'No post',
                      width: 20,
                      height: 20,
                    ),
                    if(global.pageIndex==1)
                      const SizedBox(height: 5,),
                    if(global.pageIndex==1)
                      SvgPicture.asset(
                        "assets/svg/circle.svg",
                        //color:global.pageIndex==0?Theme.of(context).primaryColor:const Color(0xFFADB4BD),
                        semanticsLabel: 'No post',
                        width: 7,
                        height: 7,
                      ),
                  ],
                ),
              ),
              label: '',
              icon:  Column(
                children: [
                  SvgPicture.asset(
                    "assets/svg/saved.svg",
                    color:global.pageIndex==1?Theme.of(context).primaryColor:const Color(0xFFADB4BD),
                    semanticsLabel: 'No post',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: ShaderMask(shaderCallback: (Rect bounds) {
                return  RadialGradient(
                  center: Alignment.topCenter,
                  radius: 0.5,
                  colors: <Color>[
                    global.topColor,
                    //global.middleColor,
                    //global.bottomColor,
                    global.bottomColor,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/profile.svg",
                      // color:global.pageIndex==0?Theme.of(context).primaryColor:const Color(0xFFADB4BD),
                      semanticsLabel: 'No post',
                      width: 20,
                      height: 20,
                    ),
                    if(global.pageIndex==2)
                      const SizedBox(height: 5,),
                    if(global.pageIndex==2)
                      SvgPicture.asset(
                        "assets/svg/circle.svg",
                        //color:global.pageIndex==0?Theme.of(context).primaryColor:const Color(0xFFADB4BD),
                        semanticsLabel: 'No post',
                        width: 7,
                        height: 7,
                      ),
                  ],
                ),
              ),
              label: '',
              icon:  Column(
                children: [
                  SvgPicture.asset(
                    "assets/svg/profile.svg",
                    color:global.pageIndex==2?Theme.of(context).primaryColor:const Color(0xFFADB4BD),
                    semanticsLabel: 'No post',
                    width: 20,
                    height: 20,
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