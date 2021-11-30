import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:la_plaza_app/model/producto.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen(this.producto);

  final Producto producto;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState(this.producto);
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final Producto product;
  int _productQuantity = 0;

  _ProductDetailsScreenState(this.product);
  void incrementQuantity(){
    setState(() {
      _productQuantity++;
    });
  }

  void decreaseQuantity(){
    if(_productQuantity > 0){
      setState(() {
        _productQuantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        title: Text(product.descripcion,
        style: const TextStyle(
          color: Colors.black
        ),
        ),
        backgroundColor: Colors.white70,
      ),
      body: ListView(
        children: [
          Center(
              child: Padding(
                  padding:  const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 30
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.network(product.imagen),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        height: 75,
                        width: 75,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(product.imagen),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5.0,
                              )
                            ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Product Name',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Icon(Icons.favorite_border)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                              child: Text(
                                product.descripcion,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Text('\$ ' + formatToDecimal(int.parse(product.precio)) + ' COP',
                              style: const TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                '\$ ' +formatToDecimal((int.parse(product.precio) - (int.parse(product.precio) * (int.parse(product.valorPromo)/100))).round())+ ' COP',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: decreaseQuantity,
                                    child: const Icon(Icons.arrow_drop_down),
                                  ),

                                  Text(_productQuantity.toString()),

                                  GestureDetector(
                                    onTap: incrementQuantity,
                                    child: const Icon(Icons.arrow_drop_up),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              child: Container(
                                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Icon(Icons.shopping_basket_outlined,
                                          color: Colors.white,),
                                        Text('Añadir al carrito',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                          ),)
                                      ],
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
              )
          )
        ],
      )
    );
  }
}

String formatToDecimal(int number){
  final formatter = NumberFormat("###,###.00");
  String newNumber = formatter.format(number);
  return newNumber;
}
