import 'package:flutter/material.dart';
import '../global.dart'as global;

class Reservation extends StatefulWidget{
  const Reservation({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState()=>ReservationState();
}

class ReservationState extends State<Reservation>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Reservation',style: Theme.of(context).textTheme.headline2,),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Builder(
            builder: (context) =>InkWell(
              onTap: ()=>Navigator.of(context).pop(),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.arrow_back,color: global.iconColor,),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset("assets/images/deluxeroom.jpg",fit: BoxFit.cover,width: double.infinity,height: 200,),
                ),
                const Positioned(
                    bottom: 0,
                    left: 0,
                    child: Padding(
                        padding: EdgeInsets.only(left: 20,bottom: 20),
                        child: Text('Mt. Catlin Hotel',style: TextStyle(color: Colors.white,fontSize: 18),))),
              ],
            ),
            const SizedBox(height: 30,),
            Text('5 Night',style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),),
            SizedBox(height: 10,),
            Text('Deluxe Room',style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18)),
            SizedBox(height: 10,),
            Text('2 Adult',style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18)),
            SizedBox(height: 10,),
            Text('15 jan to 20 jan',style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18)),
            const SizedBox(height: 10,),
            Divider(color: global.iconColor,),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$1200',style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold),),
                const Icon(Icons.check,size:20,color: Colors.green,),
              ],
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                //Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Reservation()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                //padding: const EdgeInsets.only(left: 15,right: 15),
                child: const Text('Complete',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
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
            ),
          ],
        ),
      ),
    );
  }
}