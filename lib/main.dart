import 'package:flutter/material.dart';
import 'crop_details.dart';
import 'display_details_of_crops.dart';
import 'package:flutter/cupertino.dart';
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(MaterialApp(
    routes: {dispCrop.routeName: (context) => dispCrop()},
    theme: ThemeData(
  appBarTheme: AppBarTheme( color: Colors.lightGreen[800]),
  brightness: Brightness.light,
  primaryColor: Colors.lightGreen[800],
  accentColor: Colors.cyan[600],

// Define the default font family.
fontFamily: 'Montserrat',

),home: CropTile()));

class CropTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child:SafeArea(child:AppBar( backgroundColor: Colors.lightGreen,title: Align(alignment: Alignment.bottomCenter,child:Text('CROP DETAILS'))
        ))), body: myList()
    );
  }

  Widget myList() {
    return ListView.builder(
        itemCount: details.name.length,
        itemBuilder: (context, index) {
      final c = details.name, d=details.description;
      return AspectRatio(
          aspectRatio: 3 / 2,
          child:
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: InkWell(
                  splashColor: Colors.greenAccent,
                  onTap: () =>
                      Navigator.pushNamed(context, dispCrop.routeName,
                          arguments: ScreenArguments(c[index],d[index],details.MultiUrl[index])),

                  child: Stack(
                      children: <Widget>[Column(
                          children: [Expanded(
                              child: Opacity(
                                  opacity: 0.5,
                                  child: FadeInImage(
                                      placeholder: const AssetImage(
                                          'assets/images/close-up-of-leaf-326055.jpg'),
                                      image: AssetImage(
                                          details.SingleUrl[index])
                                  )
                              )
                          )
                          ])
                        , Center(

                          child: Text(c[index], style: TextStyle(
                              fontSize: 45.0, fontWeight: FontWeight.bold),),
                        )
                      ]))

          ));
    }

        );
  }

}