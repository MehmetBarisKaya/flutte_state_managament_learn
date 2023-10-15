import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:state_managament_in_life/feature/maps/model/map_model.dart';
import 'package:state_managament_in_life/feature/maps/service/map_service.dart';
part 'map_view_model.g.dart';

class MapViewModel = _MapViewModelBase with _$MapViewModel;

abstract class _MapViewModelBase with Store {
  late final IMapService mapService;
  _MapViewModelBase(this.mapService);

  @observable
  bool isLoading = false;

  @observable
  List<MapsModel> mapModelItems = [];

  @observable
  int selectedIndex = 0;

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchAllMaps() async {
    _changeLoading();
    final response = await mapService.fetchMapItem();
    _changeLoading();

    mapModelItems = response ?? [];
    inspect(mapModelItems);
  }

  @action
  void changeIndex(int index) {
    selectedIndex = index;
  }
}
