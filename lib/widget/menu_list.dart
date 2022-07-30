import 'package:flutter/material.dart';
import 'package:warkop_order_app/detail_screen.dart';
import 'package:warkop_order_app/model/menu.dart';

class MenuList extends StatelessWidget {
  final String namaMenu;
  final String imagePath;
  final String harga;
  final Menu menu;

  const MenuList(
      {super.key,
      required this.namaMenu,
      required this.imagePath,
      required this.harga,
      required this.menu});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(menu: menu);
        }));
      },
      child: Stack(
        children: [
          Hero(
            tag: namaMenu,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 1,
                ),
                child: Text(
                  'Rp. $harga',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.all(12.0),
              width: 135,
              child: Text(
                namaMenu,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
