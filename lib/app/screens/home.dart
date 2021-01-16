
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_app/app/routes/ScreenArguments.dart';
import 'package:flutter_api_app/app/screens/restaurant_screen.dart';


import 'package:flutter_api_app/widget/CartWidget.dart';
import 'package:flutter_api_app/widget/Search.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Position _currentPosition;
  String _currentAddress="";
  int _currentIndex = 0;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;



  get _location => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text("Indore",style: TextStyle(color: Colors.black),),
  );



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      // calls getconnect method to check which type if connection it
    _getCurrentLocation();
  }
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  void _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
        print("address"+_currentAddress);
      });
    } catch (e) {
      print(e);
    }
  }




  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Container(
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          backgroundColor: Colors.white,
           actions: [  _location, search(),cart()],
        ),

        body:    ListView(

          children: [

          SizedBox(
            height: 20,
          ),


            CarouselSlider(
                items: [
                  Image.asset('assets/images/slider.png', fit: BoxFit.cover ),
                  Image.asset('assets/images/slidertwo.png',fit: BoxFit.cover )
                ],
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,

                  scrollDirection: Axis.horizontal,
                )
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                Row(  mainAxisAlignment: MainAxisAlignment.spaceAround,children: [ Expanded(flex: 1,child: serviceData("Meal Service", Image.asset('assets/images/meal.png', width: 100.0, height: 100.0))),  Expanded(flex: 1,child:serviceData("Food", Image.asset('assets/images/food.png', width: 100.0, height: 100.0)))], ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [ Expanded(flex: 1,child:serviceData("Food & Vegetables",Image.asset('assets/images/vegetable.png', width: 100.0, height: 100.0))),Expanded(flex: 1,child:serviceData("Medicines",Image.asset('assets/images/medicens.png', width: 100.0, height: 100.0)))], ),
                serviceData("Dairy",Image.asset('assets/images/milk.png', width: 100.0, height: 100.0))
              ],
            ),)

          ],
        )

         // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }


 Widget serviceData(String title,Image icon){
    return Card(
     margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      child: GestureDetector(

        onTap:  () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantScreen( ),
            ),
          );
        },
        child: Padding(
        padding: EdgeInsets.all(16.0),
          child: Column(
             children: [
               icon,
               SizedBox(height: 20,),
               Text(title,style: GoogleFonts.lato(fontStyle: FontStyle.normal ),)
             ],

          ),

    ),
      )
    );
  }







    _onCardClick(String title ) {

    switch(title){
      case  "Meal Service":{

       // Navigator.push(context, MaterialPageRoute(settings: RouteSettings(arguments: ScreenArguments("service_type","1")),builder:  (context) => RestaurantScreen(),));
        break;
      }
      case "Food":{
      //  Navigator.push(context, MaterialPageRoute(settings: RouteSettings(arguments: ScreenArguments("service_type","2")),builder:  (context) => RestaurantScreen(),));



        break;
      }
      case "Food & Vegetables":{
       // Navigator.push(context, MaterialPageRoute(settings: RouteSettings(arguments: ScreenArguments("service_type","3")),builder:  (context) => RestaurantScreen(),));
        break;
      }
      case "Medicines":{
       // Navigator.push(context, MaterialPageRoute(settings: RouteSettings(arguments: ScreenArguments("service_type","4")),builder:  (context) => RestaurantScreen(),));
        break;
      }
      case "Dairy":{
      //  Navigator.push(context, MaterialPageRoute(settings: RouteSettings(arguments: ScreenArguments("service_type","5")),builder:  (context) => RestaurantScreen(),));
        break;
      }

    }

  }


}

