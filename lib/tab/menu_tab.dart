import 'package:flutter/material.dart';
import 'package:warkop_order_app/home_screen.dart';
import 'package:warkop_order_app/model/menu.dart';
import 'package:warkop_order_app/widget/menu_list.dart';

class MenuTab extends StatelessWidget {
  final int menuIndex;
  final int categoryIndex;

  const MenuTab(
      {super.key, required this.menuIndex, required this.categoryIndex});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomeScreen(
                          selectedTab: 0, menuIndex: 0, categoryIndex: -1);
                    }));
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                const Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(''),
              ],
            ),
            CategorySwitch(menuIndex: menuIndex, categoryIndex: categoryIndex),
          ],
        ),
      ),
    );
  }
}

class CategorySwitch extends StatefulWidget {
  final int menuIndex;
  final int categoryIndex;

  const CategorySwitch(
      {Key? key, required this.menuIndex, required this.categoryIndex})
      : super(key: key);

  @override
  State<CategorySwitch> createState() => _CategorySwitchState();
}

class _CategorySwitchState extends State<CategorySwitch> {
  // isSwitched == false berarti MAKANAN
  // isSwitched == true berarti MINUMAN
  bool isSwitched = false;
  bool isSelected = false;

  late int menuIndex;
  late int categoryIndex;

  List<Widget> getListStack(selectedIndex, selectedIndex2) {
    List<Widget> childs = [];
    // index makanan = 0
    // index minuman = 0
    int categoryLength;
    if (selectedIndex2 >= 0) {
      categoryLength = selectedIndex2;
    } else {
      selectedIndex2 = 0;
      categoryLength = menuList[selectedIndex].length - 1;
    }
    for (var i = selectedIndex; i <= selectedIndex; i++) {
      for (var j = selectedIndex2; j <= categoryLength; j++) {
        for (var k = 0; k < menuList[i][j].length; k++) {
          childs.add(
            MenuList(
              namaMenu: menuList[i][j][k].namaMenu,
              imagePath: menuList[i][j][k].imagePath,
              harga: menuList[i][j][k].harga,
              menu: menuList[i][j][k],
            ),
          );
        }
      }
    }
    return childs;
  }

  @override
  void initState() {
    super.initState();
    menuIndex = widget.menuIndex;
    categoryIndex = widget.categoryIndex;
    if (widget.menuIndex == 1) {
      isSwitched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSwitched
                                ? Colors.transparent
                                : Theme.of(context).colorScheme.secondary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Makanan',
                              style: TextStyle(
                                fontWeight: isSwitched
                                    ? FontWeight.w400
                                    : FontWeight.w100,
                                color: isSwitched ? Colors.grey : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            if (widget.menuIndex == 0) {
                              isSwitched = isSwitched;
                            } else {
                              isSwitched = !isSwitched;
                            }
                            menuIndex = 0;
                            categoryIndex = -1;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSwitched
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Minuman',
                              style: TextStyle(
                                fontWeight: isSwitched
                                    ? FontWeight.w100
                                    : FontWeight.w400,
                                color: isSwitched ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            if (menuIndex == 1) {
                              isSwitched = isSwitched;
                            } else {
                              isSwitched = !isSwitched;
                            }
                            menuIndex = 1;
                            categoryIndex = -1;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            height: 72,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: isSwitched
                  ? categoryMenuList[1].length
                  : categoryMenuList[0].length,
              itemBuilder: (context, index) {
                final Menu menu = isSwitched
                    ? categoryMenuList[1][index]
                    : categoryMenuList[0][index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                        categoryIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        color: (() {
                          if (categoryIndex == index) {
                            return Theme.of(context).colorScheme.secondary;
                          }
                          return Theme.of(context).primaryColor;
                        }()),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
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
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: getListStack(menuIndex, categoryIndex),
          ),
        ),
      ],
    );
  }
}
