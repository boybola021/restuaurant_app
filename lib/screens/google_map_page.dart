import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';



class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _marker = {};
  MapType _mapType = MapType.normal;
  final Set<Polyline> _polyline = {};
  final CameraPosition _position = const CameraPosition(
      target: LatLng(41.29409806639359, 69.27053411630216),
      zoom: 15
  );



  Future<Position> getUserCurrentLocation()async{
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {

      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  void initState() {
    _marker.add(
      /// Location bosganda ustuda chiqadigan Maker
      Marker(
        markerId: MarkerId("1".toString()),
        position: const LatLng(41.29409806639359, 69.27053411630216),
        infoWindow: const InfoWindow(
          title: 'Istanbul',
          snippet: 'Tashkent Mirobod 35',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.pink,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BasePages()));
          },
          icon:  Icon(Icons.arrow_back,size: 25.sp,),
        ),
        title:  CustomTextWidget(
          text: CustomString.istanbulRestaurant,
          fontSize: 24.sp,
        ),
        actions: [
          IconButton(
              onPressed: (){
                _mapType = _mapType == MapType.normal? MapType.hybrid : MapType.normal;
                setState(() {});
              },
              icon:  Icon(Icons.map,size: 30.sp,color: Colors.white,),
          ),
          const SizedBox(width: 15,)
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            /// #boshlangich joylashuv
            initialCameraPosition: _position,
            /// my location nni kursatmaydi true bulganda
            myLocationEnabled: false,
            /// my location bosilmaydi false bulganda
            myLocationButtonEnabled: true,
            mapType: _mapType,
            polylines: _polyline,
            markers: _marker,
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: IconButton(
              onPressed: (){
                getUserCurrentLocation().then((value)async{
                  _marker.add(
                    Marker(
                      markerId: MarkerId("2".toString()),
                      position: LatLng(value.latitude,value.longitude),
                      infoWindow: const InfoWindow(
                        title: 'Men Shottman',
                      ),
                      icon: BitmapDescriptor.defaultMarker,
                    ),
                  );
                  CameraPosition cameraPosition = CameraPosition(
                    target: LatLng(value.latitude,value.longitude),
                    zoom: 14,
                  );

                  final GoogleMapController controller = await _controller.future;
                  controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                  setState(() {});
                });
              },
              icon: Container(
                height: 40.h,
                width: 40.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(Icons.my_location_outlined,color: Colors.grey,size: 25.sp,),
              ),
            ),
          )
        ],
      ),
    );
  }
}

