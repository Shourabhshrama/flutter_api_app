import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_app/model/Restaurant.dart';

import '../ApiProvider.dart';
import 'Restaurant_Menu.dart';

class RestaurantScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RestaurantState();

}

class RestaurantState extends State<RestaurantScreen> {
  var wifiBSSID;
  var wifiIP;
  var wifiName;
  bool iswificonnected = false;
  bool isInternetOn = true;
  var items = ApiProvider().getRestaurant("4", "");

  @override
  void initState() {
    getConnect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Colors.white,

      ),
      body:  ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          isInternetOn
              ? iswificonnected
              ? _widgetDAta
              : _widgetDAta
              : buildAlertDialog(),
        ],
      )

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  get _widgetDAta =>
      Container(
          child: FutureBuilder<List<Restaurant>>(
            future: items,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Restaurant> data = snapshot.data;
                return _jobsListView(data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ));

  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: Text(
        "You are not Connected to Internet",
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }


  Center ShowWifi() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            child: Text('AH'),
          ),
          CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            child: Text('AH'),
          ),
          Text(
              " Your are connected to ${iswificonnected
                  ? "WIFI"
                  : "MOBILE DATA"}"),
          Text(iswificonnected ? "$wifiBSSID" : "Not Wifi"),
          Text("$wifiIP"),
          Text("$wifiName")
        ],
      ),
    );
  }

  Center ShowMobile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(" Your are Connected to  MOBILE DATA"),
        ],
      ),
    );
  }

  void getConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isInternetOn = false;
      });
    } else if (connectivityResult == ConnectivityResult.mobile) {
      iswificonnected = false;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      iswificonnected = true;
      setState(() async {
        wifiBSSID = await (Connectivity().getWifiBSSID());
        wifiIP = await (Connectivity().getWifiIP());
        wifiName = await (Connectivity().getWifiName());
      });
    }
  }

  ListTile _tile(String title, String subtitle, String icon) =>
      ListTile(
        contentPadding: EdgeInsets.all(0),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:  (context) => RestaurantMenuScreen(),));
        },
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
        leading: Padding(
          child: Image.network(
            icon,
          ),
          padding: EdgeInsets.all(8.0),
        ),
      );

  Widget _jobsListView(List<Restaurant> data) {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),

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
          Expanded(

            child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    margin: EdgeInsets.all(4.0),
                    child: _tile(
                        data
                            .elementAt(index)
                            .storeName,
                        "${data
                            .elementAt(index)
                            .startTime} : ${data
                            .elementAt(index)
                            .endTime}",
                        data
                            .elementAt(index)
                            .storeLogo),
                  ),
                );
              }),
          ),

      ],
    );
  }

  Widget slider() {
    return CarouselSlider(
        items: [
          Image.asset('assets/images/slider.png', fit: BoxFit.cover),
          Image.asset('assets/images/slidertwo.png', fit: BoxFit.cover)
        ],
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
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
    );
  }
}