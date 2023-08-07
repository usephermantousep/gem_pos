import 'package:flutter/material.dart';
import 'package:gem_pos/models/models.dart';

class AppConstant {
  static const double defaultPadding = 16;
  static const List<BoxShadow> defaultBoxShadow = [
    BoxShadow(
      blurRadius: 10,
      color: Color.fromRGBO(0, 0, 0, 0.15),
    ),
  ];
}

final List<HomeMenu> menusInit = [
  HomeMenu(
    icon: const Icon(Icons.payment_rounded),
    ontap: () {},
    title: 'Transaksi',
  ),
  HomeMenu(
    icon: const Icon(Icons.copy),
    ontap: () {},
    title: 'Histori Transaksi',
  ),
  HomeMenu(
    icon: const Icon(Icons.copy),
    ontap: () {},
    title: 'Laporan Mingguan',
  ),
  HomeMenu(
    icon: const Icon(Icons.people),
    ontap: () {},
    title: 'User',
  ),
  HomeMenu(
    icon: const Icon(Icons.shopping_bag_outlined),
    ontap: () {},
    title: 'Item',
  ),
];
