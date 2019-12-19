
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ScreenArguments {
  final String title;
  final String message;
  final List<String> _url;
  ScreenArguments(this.title, this.message, this._url);
}

class dispCrop extends StatelessWidget{
  static const routeName = '/extractArguments';
  final  _url= 'assets/images/close-up-of-leaf-326055.jpg';

  @override
  Widget build(BuildContext context){
    final MediaQueryData queryData = MediaQuery.of(context);

    final ScreenArguments args=ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child:AppBar(  title:Align(alignment: Alignment.bottomCenter,child:Text(args.title.toUpperCase())))

        ),body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[ScrollImage(queryData.size.height, queryData.size.width),AspectRatio( aspectRatio: 2/1,child:ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child:Text(args.message, style: TextStyle(fontSize: queryData.size.width*0.06))))],
        ));
  }

  Widget ScrollImage(double h,double w){
    return AspectRatio(
        aspectRatio: w/(h*0.5),
        child: Container(
            padding: EdgeInsets.all(20),
            child:Carousel(
              images: [ AssetImage(_url[0]), AssetImage(_url[1]), AssetImage(_url[2]), AssetImage(_url[3]),AssetImage(_url[4])],
              dotSize: 8.0,
              dotSpacing: 15.0,
              borderRadius: true,
              autoplay : true,
              animationDuration: Duration(milliseconds: 600),
            )
        ));
  }
}

