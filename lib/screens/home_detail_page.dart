import 'package:flutter/material.dart';
import 'package:katalog/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH4,
          children: [
            "\$${catalog.price}".text.bold.xl4.red500.make(),
            AddToCart(
              catalog: catalog,
            ).wh(120, 40)
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            catalog.name.text.bold.xl
                                .color(context.accentColor)
                                .make(),
                            catalog.description.text
                                .textStyle(context.captionStyle)
                                .make(),
                            10.heightBox,
                            "Exercitation labore aliquip ut ipsum exercitation ut nisi. Nisi cnostrud laboris lorem-ipsum proident nulla sit. Proident ad ex voluptate ea velit dolore."
                                .text
                                .textStyle(context.captionStyle)
                                .make()
                                .p4()
                          ],
                        ).py64(),
                      ),
                    )))
          ],
        ).p16(),
      ),
    );
  }
}
