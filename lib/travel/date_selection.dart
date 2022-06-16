import 'package:AANTOUR/travel/room.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../global.dart'as global;

class DateSelection extends StatefulWidget{
  const DateSelection({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>DateSelectionState();
}

class DateSelectionState extends State<DateSelection>{

  DateTime fromSelectedDay =DateTime.now();
  DateTime toSelectedDay =DateTime.now();
  DateTime focusDay = DateTime.now();
  List<String> disableDate=["2022-05-31","2022-06-01","2022-06-03"];
  List<DateTime>? disableDateConvert=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disableDate.forEach((element) {
      disableDateConvert!.add(DateTime.parse(element));
     // disableDateConvert!.add(DateTime.parse(element));
    });
    print('disable data ${disableDateConvert}');
  }

  @override
  Widget build(BuildContext context) {

    String _selectedDate = '';
    String _dateCount = '';
    String _range = '';
    String _rangeCount = '';
    String bdate='2022-05-31';


    /// The method for [DateRangePickerSelectionChanged] callback, which will be
    /// called whenever a selection changed on the date picker widget.
    void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      /// The argument value will return the changed date as [DateTime] when the
      /// widget [SfDateRangeSelectionMode] set as single.
      ///
      /// The argument value will return the changed dates as [List<DateTime>]
      /// when the widget [SfDateRangeSelectionMode] set as multiple.
      ///
      /// The argument value will return the changed range as [PickerDateRange]
      /// when the widget [SfDateRangeSelectionMode] set as range.
      ///
      /// The argument value will return the changed ranges as
      /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
      /// multi range.


      setState(() {
        if (args.value is PickerDateRange) {
          if(false){
            _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
                ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
            _selectedDate=args.value.startDate.toString();
          }

          print('date is ${args.value.startDate}');
        } else if (args.value is DateTime) {
          print('date time ${args.value}');
          _selectedDate= DateFormat('dd/MM/yyyy').format(args.value);
         // print('selected date $_selectedDate');
          //_selectedDate = args.value.startDate.toString();
        } else if (args.value is List<DateTime>) {
          print('list of date time');
          _dateCount = args.value.length.toString();
        } else {
          print('else');
          _rangeCount = args.value.length.toString();
        }
        // print('_range $_range');
        // print('_selectedDate $_selectedDate');
        // print('_dateCount $_dateCount');
        // print('_rangeCount $_rangeCount');
      });
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
       // backgroundColor: global.currentTheme.isDarkMode()?global.blackShade:global.whiteShade,
        title:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: const [
              SizedBox(height: 30,),
              Text('Select Date',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
            ],
          ),
        ),
        elevation: 15,
        shadowColor: Colors.black54,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Icon(Icons.close,color: global.iconColor,),
            ],
          ),
        ),
      ),
      body: Column(
        children:[
            Expanded(
              child: SfDateRangePicker(
                selectableDayPredicate: (date){
                  print('Today ${date}');
                  print(DateTime.parse(DateFormat('yyyy-MM-dd').format(date))==DateTime.parse(bdate));
                  print(DateTime.parse(DateFormat('yyyy-MM-dd').format(date)));
                  print('31st ${DateTime.parse(DateFormat('yyyy-MM-dd').format(date))}');
                  print(disableDateConvert!.contains(date));
                  //if(DateTime.parse(DateFormat('yyyy-MM-dd').format(date))==DateTime.parse(bdate)){
                  if(disableDateConvert!.contains(date)){
                    return false;
                  } else if(!DateTime.now().isAfter(date)||(DateTime.now().day==date.day&&DateTime.now().month==date.month&&DateTime.now().year==date.year))
                      return true;
                  else
                    return false;

                    // if (date.weekday == 6 || date.weekday == 7) {
                  //   return false;
                  // }
                  // return true;
                },
                onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.single,
                selectionColor: const Color(0xFFf45d62),
              // startRangeSelectionColor: const Color(0xFFf45d62),
              // endRangeSelectionColor: const Color(0xFFf45d62),
              // rangeSelectionColor: const Color(0xFFf45d62),
                todayHighlightColor: const Color(0xFFf15369),
                // initialSelectedRange: PickerDateRange(
                //     DateTime.now().subtract(const Duration(days: 0)),
                //     DateTime.now().add(const Duration(days: 0))),
              ),
            ),
            InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const Room()));
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20,),
              //padding: const EdgeInsets.only(left: 15,right: 15),
              child: const Text('Select',style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,),
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
          ),
          ],
        ),
    );
  }
}

