import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:katalog/models/cart.dart';
import 'package:katalog/store.dart';
import 'package:katalog/utills/routes.dart';
import 'package:katalog/widgets/home_widgets/catalog_list.dart';
import "package:velocity_x/velocity_x.dart";
import '../models/catalog.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widgets/home_widgets/catalog_header.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    final catalogJson =
        await rootBundle.loadString("katalog_stuff/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["product"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (BuildContext context, store, VxStatus? status) =>
            FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRouts.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
                color: Vx.pink400,
                size: 20,
                count: _cart.items.length,
                textStyle: TextStyle(
                    color: Colors.black26, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),

      // appBar: AppBar(
      //   title: Text("Katalog App"),
      // ),
      // body: Padding(
      //     padding: const EdgeInsets.all(18.0),
      //     child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
      //         ? GridView.builder(
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 2,
      //                 mainAxisSpacing: 16,
      //                 crossAxisSpacing: 16),
      //             itemBuilder: (context, index) {
      //               final item = CatalogModel.items[index];
      //               return Card(
      //                 clipBehavior: Clip.antiAlias,
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(10)),
      //                 child: GridTile(
      //                   header: Container(
      //                     child: Text(
      //                       item.name,
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                     padding: const EdgeInsets.all(12),
      //                     decoration: BoxDecoration(
      //                       color: Colors.deepOrange,
      //                     ),
      //                   ),
      //                   child: Image.network(item.image),
      //                   footer: Container(
      //                     child: Text(
      //                       item.price.toString(),
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                     padding: const EdgeInsets.all(12),
      //                     decoration: BoxDecoration(
      //                       color: Colors.blueGrey,
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             },
      //             itemCount: CatalogModel.items.length,
      //           )
      //         // ? ListView.builder(
      //         //     itemCount: CatalogModel.items.length,
      //         //     itemBuilder: (context, index) => ItemWidget(
      //         //       item: CatalogModel.items[index],
      //         //     ),
      //         //   )
      //         : Center(
      //             child: CircularProgressIndicator(),
      //           )),
      // drawer: MyDrawer(),
    );
  }
}
