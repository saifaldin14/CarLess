import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:goldenhack/charts/progress.dart';
import 'package:goldenhack/directions_model.dart';
import 'package:goldenhack/directions_repository.dart';
import 'package:goldenhack/pages/games.dart';
import 'package:goldenhack/pages/profile.dart';
import 'package:goldenhack/pages/profileAvatar.dart';
import 'package:goldenhack/slidingView.dart';
import 'package:goldenhack/pages/stats.dart';
import 'package:goldenhack/themes.dart';
import 'package:goldenhack/utils/user_preferences.dart';
import 'package:goldenhack/widget/appbar_header_widget.dart';
import 'package:goldenhack/widget/appbar_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    final myTheme = user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme;
    return ThemeProvider(
      initTheme: myTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: myTheme,
          title: 'CarLess',
          home: MapScreen(),
        ),
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;
  Directions _info;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBarHeader(context, 'CarLess'),
          body: SlidingUpPanel(
            parallaxEnabled: true,
            maxHeight: 600,
            panel: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) => Profile()));
                          },
                          iconSize: 40,
                          icon: Icon(Icons.person)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "Type in your text",
                                fillColor: Colors.white70),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Stats()),
                                  );
                                },
                                child: Text(
                                  'Current Level: 5',
                                  style: TextStyle(fontSize: 20.0),
                                )),
                            ProgressBarGradient(),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '600 / 750 points',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]))),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                'Favourite Places',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              SlidingView()
                            ],
                          ))),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                'Games from Chinatown to Union Square',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => Games()));
                                  },
                                  icon: Icon(Icons.add),
                                  iconSize: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ))),
                ],
              ),
            ),
            body: Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: _initialCameraPosition,
                  onMapCreated: (controller) =>
                      _googleMapController = controller,
                  markers: {
                    if (_origin != null) _origin,
                    if (_destination != null) _destination
                  },
                  polylines: {
                    if (_origin != null && _destination != null)
                      Polyline(
                        polylineId: const PolylineId('overview_polyline'),
                        color: Colors.red,
                        width: 5,
                        points: [
                          _origin.position,
                          _destination.position,
                        ],
                      ),
                  },
                  onLongPress: _addMarker,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.black,
            onPressed: () => _googleMapController.animateCamera(
              _info != null
                  ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
                  : CameraUpdate.newCameraPosition(_initialCameraPosition),
            ),
            child: const Icon(Icons.center_focus_strong),
          ),
        ),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        // Reset destination
        _destination = null;

        // Reset info
        _info = null;
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions
      final directions = await DirectionsRepository()
          .getDirections(origin: _origin.position, destination: pos);
      setState(() => _info = directions);
    }
  }
}
