import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapDetail extends StatefulWidget {
  MapDetail({Key? key, required this.address}) : super(key: key);
  String address;

  @override
  State<MapDetail> createState() => _MapDetailState();
}

class _MapDetailState extends State<MapDetail> {
  Future<Location> getAddress(String address) async {
    List<Location> location = await locationFromAddress(address);
    var first = location.first;
    return first;
  }

  @override
  Widget build(BuildContext context) {
    var address = getAddress(widget.address);
    return FutureBuilder<Location>(
        future: address, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<Location> snapshot) {
          if (snapshot.hasData) {
            var initCam = CameraPosition(
                target:
                    LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                zoom: 18);
            return Scaffold(
              body: GoogleMap(
                markers: {
                  Marker(
                      markerId: const MarkerId("initialMarker"),
                      position: LatLng(
                          snapshot.data!.latitude, snapshot.data!.longitude))
                },
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: initCam,
              ),
            );
          } else {
            return const Scaffold(
              body: Text("Erreur lors du chargement de la Map"),
            );
          }
        });
  }
}
