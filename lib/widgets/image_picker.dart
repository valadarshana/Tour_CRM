import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget{

  final imageNetworkPath;
  final onSelectedImageChanged;
  final noCache;

  @override
  State<StatefulWidget> createState()=>ImagePickerWidgetState();

  ImagePickerWidget({this.imageNetworkPath,this.onSelectedImageChanged,this.noCache});
}

class ImagePickerWidgetState extends State<ImagePickerWidget>
{
    File? _image;
   Future<File>? profileImg;
  final  picker=ImagePicker();

    _imgFromCamera() async {

    final image = await ImagePicker().getImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image=File(image!.path);
      //_image = image as File;
      widget.onSelectedImageChanged(_image);
    });
  }

  _imgFromGallery() async {
    final image = await  ImagePicker().getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image=File(image!.path);
     // _image = image as File;
        widget.onSelectedImageChanged(_image);
    });
  }

  @override
  void initState() {

    super.initState();
      print(_image);
      print(widget.imageNetworkPath);
      print(widget.noCache);
      if(widget.noCache!=null) {
        imageCache?.clearLiveImages();
        imageCache?.clear();
      }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showPicker(context) {
     showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return AlertDialog(
            actions: [
              Container(
              child: Wrap(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 3),
                      child: Text('Add Photo!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                  Container(
                    height: 40,
                    child: ListTile(
                        //leading: new Icon(Icons.photo_library),
                        title: Text('Choose from Gallery'),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                  ),
                  Container(
                    height: 50,
                    child: ListTile(
                      //leading: new Icon(Icons.photo_camera),
                      title: Text('Take Photo'),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),],
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _showPicker(context);
        },
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.transparent,
          child: _image != null
              ? Card(
                elevation: 15,
                shadowColor: Colors.black54,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Image.file(_image!,height: 80,width: 80,fit: BoxFit.fill,),
                ),
              )
              :Stack(
            children:[
              Card(
                elevation: 15,
                shadowColor: Colors.black54,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Image.asset("assets/images/user.jpg",height: 80,width: 80,fit: BoxFit.cover,),
                ),
              ),
              Positioned(
                bottom: 15,
                right: 0,
                child: Container(
                  height: 25,
                  width: 25,
                  //padding: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Icons.camera_alt_outlined,color: Colors.white,size: 14,),
                ),
              ),
            ],
          ),


              // : CircleAvatar(
              // radius: 50,
              // backgroundColor: Theme.of(context).primaryColorLight,
              //     child: ClipRRect(
              //     borderRadius: BorderRadius.circular(50),
              //     child: widget.imageNetworkPath!=null?
              //
              //       FadeInImage.assetNetwork(
              //         image:widget.imageNetworkPath,
              //         placeholder: "assets/images/avtar.png",
              //         imageErrorBuilder:(context, error, stackTrace) {return Image.asset('assets/images/avtar.png',height: 300,width: 200,fit: BoxFit.fill,);},
              //         height:300,
              //          width: 200,
              //       fit: BoxFit.fill,):
              //       Icon(
              //        Icons.camera_alt,
              //        color: Colors.grey[800],
              //       ),
              //   ),
              // ),
        ),
      ),
    );
  }
}