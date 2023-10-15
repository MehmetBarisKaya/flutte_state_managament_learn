import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:state_managament_in_life/feature/maps/model/map_model.dart';

extension MApMarkerExtension on List<MapsModel> {
  Set<Marker> toMarkers(int selectedIndex) {
    return Set.of(this.map((e) => Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(this[selectedIndex] == e
            ? BitmapDescriptor.hueGreen
            : BitmapDescriptor.hueAzure),
        markerId: MarkerId(e.lat.toString()),
        position: e.latlong)));
  }
}
