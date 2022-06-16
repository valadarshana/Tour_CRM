import '../travel/reservation.dart';
import 'package:flutter/material.dart';
import '../global.dart'as global;

class PaymentMethod extends StatefulWidget{
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>PaymentMethodState();
}

class PaymentMethodState extends State<PaymentMethod>{
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
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft:  Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Image.asset("assets/images/signupimg.jpg",height: 80,width:100,fit: BoxFit.fill,),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mt. catlin Hotel',style: Theme.of(context).textTheme.headline2),
                          const SizedBox(height: 3,),
                          Text('Deluxe Room',style: TextStyle(color: global.iconColor,fontSize: 14,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text('15 jan to 20 jan | 2 Adult',style: TextStyle(fontSize: 14,color: Theme.of(context).primaryColor),),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Divider(color: global.iconColor,),
                SizedBox(height: 10,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$234 * 5 Nights',style: TextStyle(color: global.iconColor,fontSize: 16),),
                        Text('\$1170',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Service Fee',style: TextStyle(color: global.iconColor,fontSize: 16),),
                        Text('\$30',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Divider(color: global.iconColor,),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',style:Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold)),
                    Text('\$30',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10,),
                Divider(color: global.iconColor,),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Other Method',style:Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold)),
                    //Icon(Icons.arrow_forward_ios,color: global.iconColor,size: 16,),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
           bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: (){
                // PaymentMethod
                //Reservation
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const Reservation()));
              },
              child: Container(
               margin: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                alignment: Alignment.center,
                height: 50,
                //padding: const EdgeInsets.only(left: 15,right: 15),
                child: const Text('Pay',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
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
          ),
        ],
      ),
    );
  }

}