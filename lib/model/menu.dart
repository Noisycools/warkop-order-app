import 'package:flutter/material.dart';
import 'package:warkop_order_app/menu_icon_icons.dart';

class Menu {
  String category;
  String namaMenu;
  String harga;
  String imagePath;
  IconData icon;

  Menu({
    this.category = '',
    this.icon = Icons.food_bank,
    this.namaMenu = '',
    this.harga = '',
    this.imagePath = '',
  });
}

var menuList = [
  /* MAKANAN */
  [
    // Mie Instan [0]
    [
      Menu(
        namaMenu: 'Indomie SD',
        harga: '10k',
        imagePath: 'images/makanan/mie_instan/indomie_sd.jpg',
      ),
      Menu(
        namaMenu: 'Indomie SMP',
        harga: '13k',
        imagePath: 'images/makanan/mie_instan/indomie_smp.jpg',
      ),
      Menu(
        namaMenu: 'Indomie SMA',
        harga: '15k',
        imagePath: 'images/makanan/mie_instan/indomie_sma.png',
      ),
      Menu(
        namaMenu: 'Indomie Kuliah',
        harga: '18k',
        imagePath: 'images/makanan/mie_instan/indomie_kuliah.jpg',
      ),
      Menu(
        namaMenu: 'Indomie Kantoran',
        harga: '20k',
        imagePath: 'images/makanan/mie_instan/indomie_kantoran.jpg',
      ),
    ],
    // Snack [1]
    [
      Menu(
        namaMenu: 'Chicken Wings',
        harga: '20k',
        imagePath: 'images/makanan/snack/chicken_wings.jpg',
      ),
      Menu(
        namaMenu: 'French Fries',
        harga: '17k',
        imagePath: 'images/makanan/snack/french_fries.jpg',
      ),
      Menu(
        namaMenu: 'Jamur Crispy',
        harga: '17k',
        imagePath: 'images/makanan/snack/jamur_crispy.jpg',
      ),
      Menu(
        namaMenu: 'Roti Bakar',
        harga: '20k',
        imagePath: 'images/makanan/snack/roti_bakar.jpg',
      ),
      Menu(
        namaMenu: 'Sosis BBQ',
        harga: '17k',
        imagePath: 'images/makanan/snack/sosis_bbq.jpg',
      )
    ],
    // Menu Utama [2]
    [
      Menu(
        namaMenu: 'Dori Sambal Matah',
        harga: '28k',
        imagePath: 'images/makanan/menu_utama/dori_sambal_matah.jpg',
      ),
      Menu(
        namaMenu: 'Nasi Gila',
        harga: '25k',
        imagePath: 'images/makanan/menu_utama/nasi_gila.jpg',
      ),
      Menu(
        namaMenu: 'Nasi Goreng Sambal Matah',
        harga: '25k',
        imagePath: 'images/makanan/menu_utama/nasi_goreng_sambal_matah.jpg',
      ),
    ],
    // Western [3]
    [
      Menu(
        namaMenu: 'Beef Teriyaki',
        harga: '30k',
        imagePath: 'images/makanan/menu_utama/beef_teriyaki.jpg',
      ),
      Menu(
        namaMenu: 'Chicken Salted Egg',
        harga: '25k',
        imagePath: 'images/makanan/menu_utama/chicken_salted_egg.jpg',
      ),
      Menu(
        namaMenu: 'Nasi Goreng Hongkong',
        harga: '25k',
        imagePath: 'images/makanan/menu_utama/nasi_goreng_hongkong.jpg',
      ),
    ],
  ],
  /* MINUMAN */
  [
    // Minuman Panas [0]
    [
      Menu(
        namaMenu: 'Cappucino Panas',
        harga: '7k',
        imagePath: 'images/minuman/minuman_panas/cappucino.jpg',
      ),
      Menu(
        namaMenu: 'Energen',
        harga: '7k',
        imagePath: 'images/minuman/minuman_panas/energen.jpg',
      ),
      Menu(
        namaMenu: 'Kopi Hitam',
        harga: '7k',
        imagePath: 'images/minuman/minuman_panas/kopi_bubuk.jpg',
      ),
      Menu(
        namaMenu: 'Kopi Jahe',
        harga: '7k',
        imagePath: 'images/minuman/minuman_panas/kopi_jahe.jpg',
      ),
      Menu(
        namaMenu: 'Kopi Susu',
        harga: '7k',
        imagePath: 'images/minuman/minuman_panas/kopi_susu.jpg',
      ),
      Menu(
        namaMenu: 'Milo Panas',
        harga: '7k',
        imagePath: 'images/minuman/minuman_panas/milo.jpg',
      ),
      Menu(
        namaMenu: 'Teh Panas',
        harga: '5k',
        imagePath: 'images/minuman/minuman_panas/teh.jpg',
      ),
    ],
    // Minuman Dingin [1]
    [
      Menu(
        namaMenu: 'Es Cappucino',
        harga: '8k',
        imagePath: 'images/minuman/minuman_dingin/cappucino.jpg',
      ),
      Menu(
        namaMenu: 'Es Kopi Susu',
        harga: '10k',
        imagePath: 'images/minuman/minuman_dingin/kopi_susu.jpg',
      ),
      Menu(
        namaMenu: 'Es Milo',
        harga: '8k',
        imagePath: 'images/minuman/minuman_dingin/milo.jpg',
      ),
      Menu(
        namaMenu: 'Es Teh',
        harga: '5k',
        imagePath: 'images/minuman/minuman_dingin/teh.jpg',
      )
    ],
  ],
];

var categoryMenuList = [
  // Makanan [0]
  [
    Menu(category: 'Mie Instan', icon: MenuIcon.food),
    Menu(category: 'Snack', icon: MenuIcon.fast_food),
    Menu(category: 'Menu Utama', icon: MenuIcon.food_1),
    Menu(category: 'Western', icon: Icons.food_bank),
  ],
  // Minuman [1]
  [
    Menu(category: 'Minuman Panas', icon: MenuIcon.coffee),
    Menu(category: 'Minuman Dingin', icon: MenuIcon.beer),
  ],
];
