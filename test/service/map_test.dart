import 'package:flutter_test/flutter_test.dart';
import 'package:state_managament_in_life/feature/maps/model/map_model.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;
  setUp(() {
    // ignore: prefer_void_to_null
    networkManager = NetworkManager<Null>(
        options:
            BaseOptions(baseUrl: "https://fluttertr-ead5c.firebaseio.com/"));
  });
  test('Fetch all map data', () async {
    final response = await networkManager.send<MapsModel, List<MapsModel>>(
        "maps.json",
        parseModel: MapsModel(),
        method: RequestType.GET);
    expect(response.data, isNotNull);
  });
}
