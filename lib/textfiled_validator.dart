
class TextFieldValidator{

  bool? eIdValidator(String value)
  {
    String pattern =r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
    RegExp regex = RegExp(pattern);

    if(value.isEmpty)
      return false;
    else if(regex.hasMatch(value))
      return false;

    return null;
  }
  bool? nameValidator(String value)
  {
    // Pattern pattern =r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
    //RegExp regex = new RegExp(pattern);

    if(value.isEmpty) {
      return false;
    } else if(value.length<2) {
      return false;
    }
    // else if(regex.hasMatch(value))
    // return 'Username Can\'t be a Number.';

    return true;
  }
  String? addressValidator(String value)
  {
    if(value.isEmpty)
      return 'Address can\'t be Empty.';
    else if(value.length<5)
      return 'Address must be 5 character long.';
    return null;
  }


  // String? aadharValidator(String value)
  // {
  //   if(value.isEmpty){
  //     return 'Aadhar Number can\'t Empty...';
  //   }else if(value.length<12)
  //     return 'Aadhar  card  length  can\'t  be  less  than  12.';
  //   // ignore: unnecessary_null_comparison, deprecated_member_use
  //   else if(!(double.parse(value,(e)=>null)!=null)) {
  //     return 'Please Enter Proper Aadhar Number.';
  //   }
  //   return null;
  // }

  String? emailValidator(String value)
  {
    String pattern =
        r"^[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value.isEmpty)
      return 'Enter a valid email address.';
    return null;

  }
  String? timeInsect(String value)
  {
    if(value.isEmpty)
      return 'Time of Inspection cant\'t  be  Empty.';
    return null;
  }
  String? odoValidator(String value)
  {
    if(value.isEmpty)
      return 'ODO Number cant\'t  be  Empty.';
    return null;
  }
  String? mobileNumberValidator(String value)
  {
    if(value.isEmpty)
      return 'Mobile Number cant\'t  be  Empty.';
    else if(value.length<10)
      return 'Number Must be 10 Digit Long.';
    else if(value.length!=10)
      return 'Mobile Number Must be 10 Digit.';
    return null;
  }

  String? panNumberValidator(String value)
  {

    String pattern =
        "[A-Z a-z]{5}[0-9]{4}[A-Z a-z]{1}";
    RegExp regex = new RegExp(pattern);
    if(!regex.hasMatch(value) || value.isEmpty)
      return 'Enter Proper Pan Number.';
    else if(value.length<10)
      return 'Pan Number must be 10 character long.';
    return null;
  }

  String? passwordValidator(String value)
  {
    if(value.isEmpty)
      return 'Password cant\'t  be  Empty.';
    else if(value.length<6)
      return 'Password Must be 6 character Long.';
    return null;
  }

  String? educationValidator(String value)
  {
    if(value.isEmpty)
      return 'Education cant\'t  be  Empty.';
    return null;
  }
  String? policyNumberValidator(String value)
  {
    if(value.isEmpty)
      return 'Policy Number cant\'t  be  Empty.';
    return null;
  }
}