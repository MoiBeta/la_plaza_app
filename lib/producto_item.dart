import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:la_plaza_app/model/producto.dart';
import 'package:la_plaza_app/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final Producto producto;

  ProductItem(this.producto);

  void selectProduct(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return ProductDetailsScreen(producto);
    },),);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectProduct(context),
      splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
            ),
          ]
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: ClipRRect(
                        child: Stack(
                          children: [
                            Image.network(
                                producto.imagen,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(child: CircularProgressIndicator());
                              },
                            ),
                            Positioned(
                              bottom: 0,
                                left: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                      producto.valorPromo + '%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                  ),),
                                )
                            )
                          ],
                        ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Text(
                    producto.nombre,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 17
                    ),
                  ),
                  Text('\$ ' + formatToDecimal(int.parse(producto.precio)) + ' COP',
                    style: const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.bold
                    ),),
                  Text(
                      '\$ ' +formatToDecimal((int.parse(producto.precio) - (int.parse(producto.precio) * (int.parse(producto.valorPromo)/100))).round())+ ' COP',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("assets/images/heart.png"),
                        Image.asset("assets/images/basket.png")
                      ],
                    ),
                  ),
                ],
              )
          ),
      ),
    );
  }
}

String formatToDecimal(int number){
  final formatter = NumberFormat("###,###.00");
  String newNumber = formatter.format(number);
  return newNumber;
}
