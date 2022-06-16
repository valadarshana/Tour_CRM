import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../global.dart'as global;

class BookingDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>BookingDetailState();
}

class BookingDetailState extends State<BookingDetail>{


 List<String> title=[
   "Item Name",
   "Custom Ticket Name",
   "Original Ticket Item",
   "Booking Date",
   "Booking Status",
   "Booking Reference",
   "Provider",
   "Barcode",
   "Quantity",
   "Price",
 ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor:  global.currentTheme.isDarkMode()?Colors.black:global.whiteShade,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: global.currentTheme.isDarkMode()?Colors.black:global.whiteShade,
        title:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              SizedBox(height: 30,),
              Text('Booking Detail',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Icon(Icons.close,color: global.iconColor,),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 10),
          child: Column(
            children: [
              Card(
               // color: Theme.of(context).primaryColor,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft:  Radius.circular(10),
                      topRight:  Radius.circular(10),
                    )),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft:  Radius.circular(10),
                      topRight:  Radius.circular(10),),
                    gradient: LinearGradient(
                      colors: [
                        global.topColor.withOpacity(0.4),
                        //global.middleColor,
                        //global.bottomColor,
                        global.bottomColor.withOpacity(0.4),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  //margin: const EdgeInsets.only(left: 10,right: 10),
                  child: const Text('Sales Invoice',style: TextStyle(color: Colors.white),),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                    bottomRight:   Radius.circular(10),
                    bottomLeft:   Radius.circular(10),
                  )),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // listview 2
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: ListView.builder(scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (ctx,index){
                              //Color color=index==0?Colors.orange:Colors.blue;
                              // print('datatype ${valueList[index].runtimeType}');
                              // //print(valueList[index].runtimeType.toString()=='String');
                              // Map<String,Object> imageData;
                              // if(valueList[index].runtimeType.toString()!='String')
                              //   imageData=valueList[index];
                              // print('key is ${keysList[index]} data value is ${valueList[index]}');
                              // //print('image is ${imageData['image_name']}');
                              return Column(
                                children: [
                                  Row(
                                    //listview content.length (formData.length).
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context).size.width*0.40,
                                          child: Text('1',style: Theme.of(context).textTheme.headline2,overflow: TextOverflow.clip,)),
                                      Text(''),
                                      const SizedBox(width: 5,),
                                      if('String'=='String')
                                        Container(
                                            width: MediaQuery.of(context).size.width*0.45,
                                            child: Text('test1',style: Theme.of(context).textTheme.headline2,)),
                                    ],
                                  ),
                                  // if(index!=formData.length-1)
                                  //   Divider(color: Colors.black,),
                                ],
                              );
                            },itemCount: 3,),
                        ),
                        // listview 2 over.
                      ],
                    ),
                  ),
                ),
              ),
              Card(
               // color: Theme.of(context).primaryColor,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft:  Radius.circular(10),
                      topRight:  Radius.circular(10),
                    )),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft:  Radius.circular(10),
                      topRight:  Radius.circular(10),),
                    gradient: LinearGradient(
                      colors: [
                        global.topColor.withOpacity(0.4),
                        //global.middleColor,
                        //global.bottomColor,
                        global.bottomColor.withOpacity(0.4),
                      ],
                      tileMode: TileMode.mirror,

                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  //margin: const EdgeInsets.only(left: 10,right: 10),
                  child: const Text('Order Breakdown',style: TextStyle(color: Colors.white),),
                ),
              ),
              Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 10,right: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: title.length,
                    itemBuilder: (ctx,index){
                      return Column(
                        children: [
                          Row(
                            //listview content.length (formData.length).
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width*0.40,
                                  child: Text('${title[index]}',style:Theme.of(context).textTheme.headline2,overflow: TextOverflow.clip,)),
                              Text(' :',style: Theme.of(context).textTheme.headline2,),
                              const SizedBox(width: 5,),
                              if('String'=='String')
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.45,
                                    child: Text('test1',style: Theme.of(context).textTheme.headline2,)),
                            ],
                          ),
                          // if(index!=formData.length-1)
                          //   Divider(color: Colors.black,),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Card(
                // color: Theme.of(context).primaryColor,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft:  Radius.circular(10),
                      topRight:  Radius.circular(10),
                    )),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft:  Radius.circular(10),
                      topRight:  Radius.circular(10),),
                    gradient: LinearGradient(
                      colors: [
                        global.topColor.withOpacity(0.4),
                        //global.middleColor,
                        //global.bottomColor,
                        global.bottomColor.withOpacity(0.4),
                      ],
                      tileMode: TileMode.mirror,

                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  //margin: const EdgeInsets.only(left: 10,right: 10),
                  child: const Text('Customer Details',style: TextStyle(color: Colors.white),),
                ),
              ),
              Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 10,right: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: title.length,
                    itemBuilder: (ctx,index){
                      return SizedBox(
                          width: MediaQuery.of(context).size.width*0.40,
                          child: Text('${title[index]}',style:Theme.of(context).textTheme.headline2,overflow: TextOverflow.clip,));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}