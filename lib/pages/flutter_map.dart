import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';


class FlutterMapLocation extends StatefulWidget {
  const FlutterMapLocation({super.key});

  @override
  State<FlutterMapLocation> createState() => _FlutterMapLocationState();
}

class _FlutterMapLocationState extends State<FlutterMapLocation> {
  late MapZoomPanBehavior _zoomPanBehavior;
  @override
  void initState() {
    _zoomPanBehavior = MapZoomPanBehavior();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LocationData?>(
      future: _currentLocation(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapchat) {
        if (snapchat.hasData) {
          final LocationData currentLocation = snapchat.data;
          return Scaffold(
              body: SfMaps(
            layers: [
              MapTileLayer(
                zoomPanBehavior: _zoomPanBehavior,
                initialFocalLatLng: MapLatLng(
                    currentLocation.latitude!, currentLocation.longitude!),
                initialZoomLevel: 5,
                initialMarkersCount: 1,
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                markerBuilder: (BuildContext context, int index) {
                  return MapMarker(
                    latitude: currentLocation.latitude!,
                    longitude: currentLocation.longitude!,
                    size: const Size(20, 20),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red[800],
                    ),
                  );
                },
              ),
            ],
          ));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
Future<LocationData?> _currentLocation() async {
  bool serviceEnabled;
  PermissionStatus permissionGranted;

  Location location = Location();

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return null;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }
  return await location.getLocation();
}
