import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:la_plaza_app/model/producto.dart';
import 'package:la_plaza_app/producto_item.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatelessWidget{
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:  const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 40
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset("assets/images/logo_plaza.png"),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                height: 50,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                    ),
                  ]
                ),
                child: const TextField(
                  onChanged: ,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Buscar',
                    suffixIcon: Icon(Icons.search),
                    enabledBorder: InputBorder.none
                  ),

                )
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 0, 10),
              child: const Text(
                "Todos los productos",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23
                ),
              ),
            ),
            Flexible(
              child:  FutureBuilder(
                future: getProductsFromJson(),
                builder: (context, AsyncSnapshot<List<Producto>> snapshot) {
                  if(snapshot.hasError){
                    return Center(
                        child: Text(snapshot.error.toString())
                    );
                  } else if (snapshot.hasData){
                    return GridView(
                      padding: const EdgeInsets.all(5),
                      children: snapshot.data!
                          .map((productData) => ProductItem(
                          productData
                      ))
                          .toList(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.6
                      ),
                    );
                  } else{
                    return const Center(
                    child: CircularProgressIndicator(),
                    );
                  }
                },

              )
              )
          ],
        ),
      )
    );
  }
}

Future<List<Producto>> getProductsFromJson() async{
  final response = await http.get(Uri.parse('https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0/'));

  List<Producto> list = [];

  if(response.statusCode == 200){
    final jsonData = jsonDecode(response.body);
    for(var item in jsonData["data"]){
      list.add(
          Producto(
            nombre: item["nombre"],
            descripcion: item["descripcion"],
            id: item["id"],
            precio: item["precio"],
            valorPromo: item["valor_promo"],
            imagen: item["imagen"]
          )
      );
    }
    return list;
  } else{
    throw Exception("Falló la conexión");
  }
}