import '../travel/payment_method.dart';
import 'package:flutter/material.dart';
import '../global.dart'as global;

class PaymentDetail extends StatefulWidget{
  const PaymentDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>PaymentDetailState();
}


class PaymentDetailState extends State<PaymentDetail>{

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30,right: 30,top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('First Name',style: TextStyle(fontSize: 12,color: global.iconColor),),
                  TextFormField(
                    initialValue: "Test Name",
                    keyboardType: TextInputType.text,
                    style: Theme.of(context).textTheme.headline4,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                      hintStyle: TextStyle(color: Color(0xFF93969b)),
                      suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                      suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text('Last Name',style: TextStyle(fontSize: 12,color: global.iconColor),),
                  TextFormField(
                    initialValue: "Test Name",
                    keyboardType: TextInputType.text,
                    style: Theme.of(context).textTheme.headline4,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                      hintStyle: TextStyle(color: Color(0xFF93969b)),
                      suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                      suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text('Email',style: TextStyle(fontSize: 12,color: global.iconColor),),
                  TextFormField(
                    initialValue: "test@gmail.com",
                    keyboardType: TextInputType.emailAddress,
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
                  Text('Address',style: TextStyle(fontSize: 12,color: global.iconColor),),
                  TextFormField(
                    initialValue: "Test address street",
                    keyboardType: TextInputType.text,
                    style: Theme.of(context).textTheme.headline4,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                      hintText: 'address',
                      hintStyle: TextStyle(color: Color(0xFF93969b)),
                      suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                      suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text('Post code',style: TextStyle(fontSize: 12,color: global.iconColor),),
                  TextFormField(
                    initialValue: "364290",
                    keyboardType: TextInputType.number,
                    style: Theme.of(context).textTheme.headline4,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                      hintText: 'Country code',
                      hintStyle: TextStyle(color: Color(0xFF93969b)),
                      suffixIcon: true?Icon(Icons.check,size: 0,):Icon(Icons.check,),
                      suffixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text('Country',style: TextStyle(fontSize: 12,color: global.iconColor),),
                  SizedBox(
                     width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      items: <String>['india', 'india', 'india', 'india'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const SizedBox(height: 30,),
                  InkWell(
                    onTap: (){
                     // PaymentMethod
                      //Reservation
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>PaymentMethod()));
                    },
                    child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    //padding: const EdgeInsets.only(left: 15,right: 15),
                    child: const Text('Go To Payment',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
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
          ],
        ),
      ),
    );
  }

}