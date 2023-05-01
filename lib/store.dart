import 'package:katalog/models/cart.dart';
import 'package:katalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModle cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModle();
    cart.catalog = catalog;
  }
}
