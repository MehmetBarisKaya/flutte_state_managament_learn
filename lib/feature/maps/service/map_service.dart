import 'package:state_managament_in_life/feature/maps/model/map_model.dart';
import 'package:vexana/vexana.dart';

abstract class IMapService {
  final INetworkManager networkManager;

  IMapService(this.networkManager);

  Future<List<MapsModel>?> fetchMapItem();
}

class MapsService extends IMapService {
  MapsService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<MapsModel>?> fetchMapItem() async {
    final response = await networkManager.send<MapsModel, List<MapsModel>>(
        MapEndPoint.maps.rawValue,
        parseModel: MapsModel(),
        method: RequestType.GET);

    return response.data;
  }
}

enum MapEndPoint { maps }

extension MapEndPointExtension on MapEndPoint {
  String get rawValue => "$name.json";
}
