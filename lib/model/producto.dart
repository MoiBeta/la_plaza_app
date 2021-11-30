import 'package:flutter/material.dart';

class Producto {
  //final String categoria;
  //final String cliente;
  //final String colores;
  final String descripcion;
  //final String disponible;
  //final String estado;
  //final String fechaCreacion;
  final String id;
  final String nombre;
  final String precio;
  //final String tallas;
  //final String video;
  //final String descripcionPromo;
  //final String idPromocion;
  final String valorPromo;
  //final String idProductoPromo;
  //final String fechaPromo;
  //final String estadoPromo;
  //final String likes;
  //final String megusta;
  //final String galeria;
  final String imagen;

  const Producto(
      {//required this.categoria,
        //required this.cliente,
        //required this.colores,
        required this.descripcion,
        //required this.disponible,
        //required this.estado,
        //required this.fechaCreacion,
        required this.id,
        required this.nombre,
        required this.precio,
        //required this.tallas,
       // required this.video,
        //required this.descripcionPromo,
        //required this.idPromocion,
        required this.valorPromo,
        //required this.idProductoPromo,
        //required this.fechaPromo,
        //required this.estadoPromo,
        //required this.likes,
        //required this.megusta,
        //required this.galeria,
        required this.imagen});

  Producto.fromJson(Map<String, dynamic> json):
    //categoria = json['categoria'],
    //cliente = json['cliente'],
    //colores = json['colores'],
    descripcion = json['descripcion'],
    //disponible = json['disponible'],
    //estado = json['estado'],
    //fechaCreacion = json['fecha_creacion'],
    id = json['id'],
    nombre = json['nombre'],
    precio = json['precio'],
    //tallas = json['tallas'],
    //video = json['video'],
    //descripcionPromo = json['descripcion_promo'],
    //idPromocion = json['id_promocion'],
    valorPromo = json['valor_promo'],
    //idProductoPromo = json['id_producto_promo'],
    //fechaPromo = json['fecha_promo'],
    //estadoPromo = json['estado_promo'],
    //likes = json['likes'],
    //megusta = json['megusa'],
    //galeria = json['galeria'],
    imagen = json['imagen'];
}


