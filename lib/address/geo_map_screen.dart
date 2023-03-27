import 'package:flutter/material.dart';
import 'package:furniture_shop/address/add_address_scrn.dart';
import 'package:furniture_shop/model/address.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  static const route = '/mapsScreen';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  CameraPosition? _initialCameraPosition;
  final Set<Marker> _markers = <Marker>{};
  final latLng1 = const LatLng(30.157458, 71.5249154); //Mtn

  Position? _currentPosition;
  String? _currentAddress;
  Address? address;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = position;
      // _mapController?.animateCamera(CameraUpdate.zoomIn());
      _initialCameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14.0,
      );

      _markers.add(
        Marker(
          markerId: const MarkerId("Current Location"),
          position: LatLng(position.latitude, position.longitude),
        ),
      );
    });

    _getAddressFromLatLng();
  }

  Future<void> _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = placemarks[0];

      String addresss =
          "${place.name}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea} ${place.postalCode}, ${place.country}";

      address = Address(
        name: 'hafeez',
        address: place.name!,
        city: place.locality!,
        zipCode: place.postalCode!,
        country: place.country!,
      );
      // AddressController.saveRequestTemp(address!, context);

      setState(() {
        _currentAddress = addresss;
        debugPrint('address: ${address!.city}');
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Map"),
      ),
      body: _currentPosition != null
          ? GoogleMap(
              initialCameraPosition: _initialCameraPosition!,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: _markers,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            context.push(AddAdressScreen.route, extra: address);
          },
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Go back'),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
