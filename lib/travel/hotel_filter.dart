import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../global.dart'as global;
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class HotelFilter extends StatefulWidget{
  const HotelFilter({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>HotelFilterState();
}


class HotelFilterState extends State<HotelFilter>{


  var priceVal=RangeValues(0,0);
  double max=0;
  double min=0;
  double distance=0;
  DateTime fromSelectedDay =DateTime.now();
  DateTime toSelectedDay =DateTime.now();
  DateTime focusDay = DateTime.now();
  String selected="";
  final month=[
    "January", "February", "March", "April", "May","June","July","August","September","October",
    "November", "December"];


  List<Map<String,Object>> feature=[{"title":"WI_FI","value":false,"icon":"wifi.svg"},
    {"title":"Hotel Restua","value":false,"icon":"hotel.svg"},
    {"title":"Swimming pools","value":false,"icon":"swimming.svg"},
    {"title":"Inn-Bar","value":false,"icon":"drinks.svg"},
    {"title":"Parking Spot","value":false,"icon":"parking.svg"},
    {"title":"Night-Club","value":false,"icon":"nightclub.svg"}];
    List<bool> fetureBool=[false,false,false,false,false,false,];
    int _AdultsCurrentIntValue = 1;
  int _MinorCurrentIntValue = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 25,
        shadowColor: Colors.black54,
        //bottomOpacity: 0.9,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Builder(
            builder: (context) => InkWell(
              child: Icon(Icons.close,color: global.iconColor,),
             // onTap: ()=>Scaffold.of(context).openDrawer(),
             //  child: SvgPicture.asset(
             //    "assets/svg/menu.svg",
             //    // color:Colors.black,
             //    color: Color(0xFFaaaaaa),
             //    semanticsLabel: 'No post',
             //    width: 5,
             //    height: 5,
             //  ),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        title: Text('Filter by',style: TextStyle(fontSize: 17,),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10,right: 10,top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Time period',style:Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  Text('FROM',style: TextStyle(fontSize: 12,color: global.iconColor),),
                  const SizedBox(height: 10,),
                  TableCalendar(
                    // selectedDayPredicate: (date){
                    //   if(!DateTime.now().isAfter(date)||(DateTime.now().day==date.day&&DateTime.now().month==date.month&&DateTime.now().year==date.year))
                    //     return true;
                    //   else
                    //     return false;
                    // },
                    firstDay: DateTime.utc(2010, 10, 16),
                    currentDay: DateTime.now(),
                    lastDay: DateTime.utc(2030, 3, 14),

                    onDaySelected: (DateTime selectDay,DateTime focusday){
                      setState(() {
                        if(!DateTime.now().isAfter(selectDay)||(DateTime.now().year==focusday.year&&DateTime.now().month==focusday.month&&DateTime.now().day==focusday.day)){
                          fromSelectedDay=selectDay;
                          focusDay=focusday;
                        }
                      });

                    },
                    focusedDay: DateTime.now(),
                    rowHeight: 35,
                    headerStyle:  const HeaderStyle(
                      //titleTextFormatter: (date, locale) => DateFormat.yMMMM(locale).format(date).toUpperCase(),
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                       dowTextFormatter: (date, locale) => DateFormat.E(locale).format(date)[0],
                    ),
                    calendarStyle:  CalendarStyle(
                      canMarkersOverflow: true,
                      todayDecoration:  BoxDecoration(
                        color: global.iconColor,
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: TextStyle(color: global.iconColor,fontSize: 12),
                      weekendTextStyle: TextStyle(color: global.iconColor,fontSize: 12),
                      markerSize: 10,
                      selectedDecoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          global.topColor,
                          global.bottomColor,
                        ],
                        begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: TextStyle(color: Colors.black,fontSize: 12),
                    ),
                    calendarBuilders:  CalendarBuilders(
                      defaultBuilder:(context, date, events)=>fromSelectedDay.compareTo(date)==0?
                      Container(
                          margin: const EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [global.topColor,global.bottomColor],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Text(
                            date.day.toString(),
                            style: const TextStyle(color: Colors.white,fontSize: 12),
                          )):
                      Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: global.iconColor),
                          ),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(color: global.iconColor,fontSize: 12),
                          )),
                    ),
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    calendarFormat: CalendarFormat.week,
                  ),
                  SizedBox(height: 10,),
                  Container(
                    margin: const EdgeInsets.only(left: 10,right: 10),
                      child: Divider(color: global.iconColor,thickness: 2,)),
                  const SizedBox(height: 10,),
                  Text('TO',style: TextStyle(fontSize: 12,color: global.iconColor),),
                  const SizedBox(height: 10,),
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    onDaySelected: (DateTime selectDay,DateTime focusday){
                      setState(() {
                        if(!DateTime.now().isAfter(selectDay)){
                          toSelectedDay=selectDay;
                          focusDay=focusday;
                        }
                      });
                    },
                    focusedDay: DateTime.now(),
                    rowHeight: 35,
                    headerStyle:  const HeaderStyle(
                      //titleTextFormatter: (date, locale) => DateFormat.yMMMM(locale).format(date).toUpperCase(),
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      dowTextFormatter: (date, locale) => DateFormat.E(locale).format(date)[0],
                    ),
                    calendarStyle:  CalendarStyle(
                      canMarkersOverflow: true,
                      todayDecoration:  BoxDecoration(
                        color: global.iconColor,
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: TextStyle(color: global.iconColor,fontSize: 12),
                      weekendTextStyle: TextStyle(color: global.iconColor,fontSize: 12),
                      markerSize: 10,
                      selectedDecoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          global.topColor,
                          global.bottomColor,
                        ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: TextStyle(color: Colors.black,fontSize: 12),
                    ),
                    calendarBuilders:  CalendarBuilders(
                      defaultBuilder:(context, date, events)=>toSelectedDay.compareTo(date)==0?
                      Container(
                          margin: const EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [global.topColor,global.bottomColor],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Text(
                            date.day.toString(),
                            style: const TextStyle(color: Colors.white,fontSize: 12),
                          )):
                      Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: global.iconColor),
                          ),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(color: global.iconColor,fontSize: 12),
                          )),
                    ),
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    calendarFormat: CalendarFormat.week,
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Features',style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Container(
                      color: Colors.transparent,
                      height: 100,//MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: feature.length,
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 360,
                          childAspectRatio: 1.60, //width
                          //crossAxisCount: 2, //width
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                        itemBuilder: (BuildContext context, int index){
                            Map<String,Object> data=feature[index];
                          //print(data['image']);
                          //  Map<String,Object> rate=data['rating'];
                          return SizedBox(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      fetureBool[index]=!fetureBool[index];
                                     // wifi=!wifi;
                                      //data['value']=!data['value']as bool;
                                    });
                                  },
                                  child: Card(
                                    elevation: 15,
                                    shadowColor: Colors.black45,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(shape: BoxShape.circle,
                                        //color:wifi?Theme.of(context).primaryColor:Colors.grey,
                                        gradient: LinearGradient(
                                          colors: fetureBool[index]?[global.topColor,global.middleColor,global.bottomColor]:[Colors.grey,Colors.grey,Colors.grey],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: SvgPicture.asset(
                                          "assets/svg/${data['icon']}",
                                          color:fetureBool[index]?Colors.white :Colors.black54,
                                          semanticsLabel: 'No post',
                                          width: 5,
                                          height: 5,
                                        ),
                                      ),
                                      //Icon(Icons.ac_unit,color: fetureBool[index]?Colors.white:Colors.black54,),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.15,
                                  alignment: Alignment.center,
                                  child: Text('${data['title']}',textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: global.iconColor),),),
                              ],
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price Range',style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold),),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      Text('0',style: TextStyle(color: global.iconColor),),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              //thumbColor: Colors.transparent,
                              rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 3,),
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10)),
                          child: RangeSlider(
                            values: priceVal,
                            onChanged: (newRate){
                              setState((){
                                priceVal=newRate;
                                //print(priceVal.end.toStringAsFixed(2).toString()=="");
                                print('${priceVal.end.toStringAsFixed(2).toString()=="0.00"}');
                                print(priceVal.end.toStringAsFixed(2));
                              });
                            },
                            min: 0,
                            max: 10,
                            divisions: 100,
                            labels: RangeLabels("${priceVal.start.toStringAsFixed(2)}","${priceVal.end.toStringAsFixed(2)}"),
                          ),
                        ),
                      ),
                      Text('5K',style: TextStyle(color: global.iconColor),),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Distance from you',style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 25,),
                  Row(
                    children: [
                      Text('0km',style: TextStyle(color: global.iconColor),),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            //thumbColor: Colors.transparent,
                              //rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 3,),
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 3)),
                          child: Slider(
                           // values: priceVal,
                            label: distance.toStringAsFixed(2),
                            onChanged: (newRate){
                              setState((){
                                distance=newRate;
                                //priceVal=newRate;
                                //print(priceVal.end.toStringAsFixed(2).toString()=="");
                                print('${priceVal.end.toStringAsFixed(2).toString()=="0.00"}');
                                print(priceVal.end.toStringAsFixed(0));
                              });
                            },
                            min: 0,
                            max: 400,
                            divisions: 100,
                            //labels: RangeLabels("${priceVal.start.toStringAsFixed(2)}","${priceVal.end.toStringAsFixed(2)}"),
                            value: distance,
                          ),
                        ),
                      ),
                      Text('400km',style: TextStyle(color: global.iconColor),),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Stack(
              children:[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                color: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Room',style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ADULTS',style: TextStyle(fontSize: 12,color: global.iconColor),),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IgnorePointer(
                                    child: NumberPicker(
                                      value: _AdultsCurrentIntValue,
                                      itemWidth: 60,
                                      itemHeight: 30,
                                      minValue: 0,
                                      decoration: BoxDecoration(
                                          border: Border(top: BorderSide(color: global.iconColor, width: 2),bottom:BorderSide(color:  global.iconColor, width: 2),)
                                      ),
                                      selectedTextStyle: TextStyle(fontSize: 16,color: global.currentTheme.isDarkMode()?Colors.white:Colors.black,fontWeight: FontWeight.bold,),
                                      textStyle: TextStyle(fontSize: 16,color: global.iconColor),
                                      maxValue: 10,
                                      step: 1,
                                      haptics: true,
                                      onChanged: (value) => setState(() => _AdultsCurrentIntValue = value),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              final newValue = _AdultsCurrentIntValue + 1;
                                              _AdultsCurrentIntValue = newValue.clamp(0, 10);
                                            });
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                colors: [global.topColor,global.middleColor,global.bottomColor],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              ),
                                            ),
                                            child: Icon(Icons.add,size: 14,color: Colors.white,),
                                          ),
                                        ),
                                        SizedBox(height: 4,),
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              final newValue = _AdultsCurrentIntValue - 1;
                                              _AdultsCurrentIntValue = newValue.clamp(0, 10);
                                            });
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: global.blackShade,
                                            ),
                                            child: Icon(Icons.remove,size: 14,color: global.iconColor,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 50,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('MINORS',style: TextStyle(fontSize: 12,color: global.iconColor),),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IgnorePointer(
                                    child: NumberPicker(
                                      value: _MinorCurrentIntValue,
                                      itemWidth: 60,
                                      itemHeight: 30,
                                      minValue: 0,
                                      decoration: BoxDecoration(
                                          border: Border(top: BorderSide(color: global.iconColor, width: 2),bottom:BorderSide(color:  global.iconColor, width: 2),)
                                      ),
                                      selectedTextStyle: TextStyle(fontSize: 16,color: global.currentTheme.isDarkMode()?Colors.white:Colors.black,fontWeight: FontWeight.bold,),
                                      textStyle: TextStyle(fontSize: 16,color: global.iconColor),
                                      maxValue: 10,
                                      step: 1,
                                      haptics: true,
                                      onChanged: (value) => setState(() => _MinorCurrentIntValue = value),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              final newValue = _MinorCurrentIntValue + 1;
                                              _MinorCurrentIntValue = newValue.clamp(0, 10);
                                            });
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                colors: [global.topColor,global.middleColor,global.bottomColor],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              ),
                                            ),
                                            child: Icon(Icons.add,size: 14,color: Colors.white,),
                                          ),
                                        ),
                                        SizedBox(height: 4,),
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              final newValue = _MinorCurrentIntValue - 1;
                                              _MinorCurrentIntValue = newValue.clamp(0, 10);
                                            });
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: global.blackShade,
                                            ),
                                            child: Icon(Icons.remove,size: 14,color: global.iconColor,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 40,
                margin: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 150),
                //padding: const EdgeInsets.only(left: 15,right: 15),
                child: Text('Filter',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [global.topColor,global.middleColor,global.bottomColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  //color: Theme.of(context).primaryColor,
                  borderRadius:BorderRadius.circular(20),
                ),
              ),
              ]
            ),

          ],
        ),
      ),
    );
  }

}