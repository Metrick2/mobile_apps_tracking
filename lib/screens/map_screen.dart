import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_apps_tracking/config/constant.dart';
import 'package:mobile_apps_tracking/widgets/custom_app_bar.dart';

class MapScreen extends StatefulWidget {
  //const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Set<Marker> _markers = {};
  final LatLng _currentPosition = LatLng(-6.170166, 106.831375);

  @override
  void initState() {
    _markers.add(
      Marker(
        markerId: MarkerId("-6.170166, 106.831375"),
        position: _currentPosition,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: <Widget>[
          // TextField(
          //     //decoration: InputDecoration(hintText: 'Seacrh Location'),
          //     ),
          Container(
            height: 500.0,
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _currentPosition,
                zoom: 14,
              ),
              markers: _markers,
              onTap: (position) {
                setState(() {
                  _markers.add(
                    Marker(
                      markerId: MarkerId(
                          "${position.latitude}, ${position.longitude}"),
                      position: position,
                      icon: BitmapDescriptor.defaultMarker,
                    ),
                  );
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 10, right: 20),
            height: 245,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 240, 241, 241),
                  Color.fromARGB(255, 214, 214, 235),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nearest covid-19 service ',
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Rumah Sakit Gatot Subroto\n",
                            style: kTitleTextstyle,
                          ),
                          TextSpan(
                            text:
                                "Address: Jl. Abdul Rahman Saleh Raya No.24,\nRT.10/RW.5,\nSenen, Kec. Senen, Kota Jakarta Pusat",
                            style: TextStyle(
                              fontSize: 12,
                              color: kTextLightColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See details",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "RSUD Kemayoran\n",
                            style: kTitleTextstyle,
                          ),
                          TextSpan(
                            text:
                                "Address : Jl. Serdang Baru I No.3, Serdang, \nKec. Kemayoran, Kota Jakarta Pusat",
                            style: TextStyle(
                              fontSize: 12,
                              color: kTextLightColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See details",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
