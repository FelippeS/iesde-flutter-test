import 'dart:async';
import 'package:processo_selecao_iesde/blocs/catalog_event.dart';
import 'package:processo_selecao_iesde/blocs/catalog_state.dart';
import 'package:processo_selecao_iesde/models/catalog.dart';


class CatalogBloc {

  final StreamController<CatalogEvent> _inputCatalogControlller =
  StreamController<CatalogEvent>();

  final StreamController<CatalogState> _outputCatalogController =
  StreamController<CatalogState>();

  Sink<CatalogEvent> get inputCatalog => _inputCatalogControlller.sink;
  Stream<CatalogState> get outputCatalog => _outputCatalogController.stream;

  catalogBloc() {
    _inputCatalogControlller.stream.listen(_mapEventToState);

  }

  void _mapEventToState(CatalogEvent event) {
    List<String> items = [];

    _outputCatalogController.add(CatalogLoadingState());

    if(event is LoadCatalogEvent) {
      items = CatalogModel.itemNames;
    }

    _outputCatalogController.add(CatalogLoadedState(items: items));

  }

}


