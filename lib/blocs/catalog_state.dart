abstract class CatalogState {
  final List<String> items;

  CatalogState({required this.items});
}

class CatalogInitialState extends CatalogState {
  CatalogInitialState() : super(items: []);
}

class CatalogLoadingState extends CatalogState {
  CatalogLoadingState() : super(items: []);
}

class CatalogLoadedState extends CatalogState {
  CatalogLoadedState({required List<String> items}) : super(items: items);
}

class CatalogErrorState extends CatalogState {
  final Exception exception;

  CatalogErrorState({required this.exception}) : super(items: []);
}