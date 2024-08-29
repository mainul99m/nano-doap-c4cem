import 'package:get/get.dart';
import 'package:mapsforge_flutter/core.dart';
import 'package:mapsforge_flutter/maps.dart';
import 'package:mapsforge_flutter/marker.dart';
import 'package:flutter/services.dart';
import '../views/weather_map_screen.dart';

class WeatherMapScreenController extends GetxController {
  final displayModel = DisplayModel(deviceScaleFactor: 2);
  final symbolCache = FileSymbolCache();
  final MarkerDataStore markerDataStore = MarkerDataStore();

  @override
  void onClose() {
    symbolCache.dispose();
    markerDataStore.dispose();
    super.onClose();
  }

  void showMapBtnClicked() {
    Get.to(() => WeatherMapScreen());
  }

  Future<MapModel> createMapModel() async {
    // Load the mapfile which holds the openstreetmap® data. Use either MapFile.from() or load it into memory first (small files only) and use MapFile.using()
    ByteData content = await rootBundle.load('assets/maps/world.map');
    final mapFile = await MapFile.using(content.buffer.asUint8List(), null, null);

    // Create the render theme which specifies how to render the informations
    // from the mapfile.
    final renderTheme = await RenderThemeBuilder.create(
      displayModel,
      'assets/maps/default_renderer.xml',
    );
    // Create the Renderer
    final jobRenderer = //DatastoreViewRenderer(
    //datastore: mapFile, renderTheme: renderTheme, symbolCache: symbolCache);
    MapDataStoreRenderer(mapFile, renderTheme, symbolCache, true);

    // Glue everything together into two models, the mapModel here and the viewModel below.
    MapModel mapModel = MapModel(
      displayModel: displayModel,
      renderer: jobRenderer,
    );

    // Bonus: Add MarkerDataStore to hold added markers
    mapModel.markerDataStores.add(markerDataStore);
    return mapModel;
  }

  Future<ViewModel> createViewModel() async {
    ViewModel viewModel = ViewModel(displayModel: displayModel);
    // set the initial position
    viewModel.setMapViewPosition(20.620602, 92.323231);
    // set the initial zoomlevel
    viewModel.setZoomLevel(13);
    // // bonus feature: listen for long taps and add/remove a marker at the tap-positon
    // viewModel.addOverlay(_MarkerOverlay(
    //   viewModel: viewModel,
    //   markerDataStore: markerDataStore,
    //   symbolCache: symbolCache,
    //   displayModel: displayModel,
    // ));
    return viewModel;
  }
}