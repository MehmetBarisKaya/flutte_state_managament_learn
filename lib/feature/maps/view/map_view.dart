// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:state_managament_in_life/feature/maps/service/map_service.dart';
import 'package:state_managament_in_life/feature/maps/viewmodel/map_view_model.dart';
import 'package:state_managament_in_life/product/extension/map_model_markers.dart';
import 'package:state_managament_in_life/product/init/network/network_product.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MapSelectView extends StatefulWidget {
  const MapSelectView({super.key});

  @override
  State<MapSelectView> createState() => _MapSelectViewState();
}

class _MapSelectViewState extends State<MapSelectView> {
  late final MapViewModel _viewModel;
  GoogleMapController? _controller;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel =
        MapViewModel(MapsService(NetworkProduct.instance.networkManager));
    _viewModel.fetchAllMaps();
  }

  @override
  Widget build(BuildContext context) {
    final double _cardSize = 200;
    return Scaffold(
        body: Stack(
      children: [
        _buildGoogleMaps(),
        Positioned(
            height: _cardSize,
            right: 0,
            left: 0,
            bottom: kToolbarHeight,
            child: _pageViewAnimals())
      ],
    ));
  }

  Observer _pageViewAnimals() {
    return Observer(builder: (_) {
      return PageView.builder(
        itemCount: _viewModel.mapModelItems.length,
        controller: PageController(viewportFraction: 0.8),
        onPageChanged: (value) {
          _viewModel.changeIndex(value);
          _controller?.animateCamera(
              CameraUpdate.newLatLng(_viewModel.mapModelItems[value].latlong));
        },
        itemBuilder: (context, index) => Card(
          child: Image.network(
              _viewModel.mapModelItems[index].detail?.photoUrl ?? ""),
        ),
      );
    });
  }

  Observer _buildGoogleMaps() {
    return Observer(
      builder: (context) => _viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (controller) {
                _controller = controller;
              },
              markers:
                  _viewModel.mapModelItems.toMarkers(_viewModel.selectedIndex),
              initialCameraPosition: CameraPosition(
                target: _viewModel.mapModelItems.first.latlong,
                zoom: 12,
              )),
    );
  }
}
