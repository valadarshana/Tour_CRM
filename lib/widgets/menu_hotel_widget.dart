//import '../menu/booking_screen/booking_detail.dart';
import 'package:flutter/material.dart';
import '../global.dart'as global;


class MenuHotelWidget extends StatefulWidget{
  const MenuHotelWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>MenuHotelWidgetState();
}

class MenuHotelWidgetState extends State<MenuHotelWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        print('menu hotel ');
        //Navigator.of(context).push(BookingDetailRoute());
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10,right: 10,top: 5),
        child: Card(
          elevation: 15,
          shadowColor: Colors.black54,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset("assets/images/signupimg.jpg",height: 70,width:70,fit: BoxFit.fill,),
                ),
                // Container(
                //   height: 60,
                //   width: 60,
                //   decoration: BoxDecoration(
                //       color: Theme.of(context).primaryColor.withOpacity(0.2),
                //       shape: BoxShape.circle),
                //   child: Icon(Icons.home_work_outlined,color: Theme.of(context).primaryColor,),
                // ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hotel Blue Lagoon',style: Theme.of(context).textTheme.headline2),
                      const SizedBox(height: 5,),
                      Text('Nunc justo eros, vehicula vel vehicula ut, lacinia a eart Nam friglla eros',style: TextStyle(color: global.iconColor,fontSize: 14),),
                      const SizedBox(height: 5,),
                      Text('2021,Dec,05',style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}