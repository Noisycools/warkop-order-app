import 'package:flutter/material.dart';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:warkop_order_app/home_screen.dart';
import 'package:warkop_order_app/model/menu.dart';
import 'package:warkop_order_app/model/promo.dart';
import 'package:warkop_order_app/widget/menu_list.dart';

class HomeTab extends StatelessWidget {
  final String nama;

  const HomeTab({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
/* HEADER SECTION (GREETINGS MESSAGE) */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selamat Pagi,',
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        nama,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mail_outline_rounded),
                  ),
                ),
              ],
            ),
/* HEADER SECTION (GREETINGS MESSAGE) */

/* IMAGE SLIDER (PROMO) */
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: CarouselSlider.builder(
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  final Promo promo = promoList[itemIndex];
                  return Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(promo.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: const EdgeInsets.all(18.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.black,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Lihat selengkapnya',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: promoList.length,
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                ),
              ),
            ),
/* IMAGE SLIDER (PROMO) */

/* MINUMAN SECTION */
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Minuman',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const HomeScreen(
                                selectedTab: 1,
                                menuIndex: 1,
                                categoryIndex: -1);
                          }));
                        },
                        style: TextButton.styleFrom(
                          primary: Theme.of(context).colorScheme.secondary,
                        ),
                        child: const Text('Lihat semua'),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: MenuCategory(category: 1),
                  ),
                ],
              ),
            ),
/* MINUMAN SECTION */

/* MAKANAN SECTION */
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Makanan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const HomeScreen(
                                selectedTab: 1,
                                menuIndex: 0,
                                categoryIndex: -1);
                          }));
                        },
                        style: TextButton.styleFrom(
                          primary: Theme.of(context).colorScheme.secondary,
                        ),
                        child: const Text('Lihat semua'),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: MenuCategory(category: 0),
                  ),
                ],
              ),
            ),
/* MAKANAN SECTION */

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final random = Random();
                  // ambil menu secara acak
                  var randomIndex = random.nextInt(menuList.length);
                  var randomIndex2 =
                      random.nextInt(menuList[randomIndex].length);
                  var randomIndex3 = random
                      .nextInt(menuList[randomIndex][randomIndex2].length);
                  var distinctMenuList = menuList.toSet().toList();
                  var element =
                      distinctMenuList[randomIndex][randomIndex2][randomIndex3];
                  return MenuList(
                    namaMenu: element.namaMenu,
                    imagePath: element.imagePath,
                    harga: element.harga,
                    menu: element,
                  );
                },
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCategory extends StatelessWidget {
  final int category;

  const MenuCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 0.7,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        final Menu menu = categoryMenuList[category][index];
        return InkWell(
          onTap: () {
            if (category == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreen(
                    selectedTab: 1, menuIndex: 0, categoryIndex: index);
              }));
            }
            if (category == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreen(
                    selectedTab: 1, menuIndex: 1, categoryIndex: index);
              }));
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(menu.icon),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60.0,
                    child: Text(
                      menu.category,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: categoryMenuList[category].length,
    );
  }
}
