import 'package:bukos_ui/models/city.dart';
import 'package:bukos_ui/models/space.dart';
import 'package:bukos_ui/models/tips.dart';
import 'package:bukos_ui/theme.dart';
import 'package:bukos_ui/widgets/bottom_navbar_item.dart';
import 'package:bukos_ui/widgets/city_card.dart';
import 'package:bukos_ui/widgets/space_card.dart';
import 'package:bukos_ui/widgets/tips_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            // NOTE : HEADER
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Find Cozy Homestay',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE : POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: edge,
                  ),
                  CityCard(
                    City(1, 'Jakarta', 'assets/city1.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(2, 'Bandung', 'assets/city2.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(3, 'Surabaya', 'assets/city3.png', isPopular: true),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(4, 'Semarang', 'assets/city1.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(5, 'Yogyakarta', 'assets/city2.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(6, 'Solo', 'assets/city3.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(7, 'Palembang', 'assets/city4.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(8, 'Aceh', 'assets/city5.png', isPopular: true),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(9, 'Bogor', 'assets/city6.png'),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE : RECOMMENDED SPACE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recomended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  SpaceCard(Space(1, 'Kuratakeso Hott', 'assets/space1.png', 52,
                      'Bandung', 'Indonesia', 4)),
                  SizedBox(height: 30),
                  SpaceCard(Space(2, 'Rumah Cantik', 'assets/space2.png', 11,
                      'London', 'England', 5)),
                  SizedBox(height: 30),
                  SpaceCard(Space(3, 'Red Chili House', 'assets/space3.png', 20,
                      'Paris', 'France', 5)),
                  SizedBox(height: 30),
                  SpaceCard(Space(4, 'Green Land', 'assets/space1.png', 50,
                      'Banyuwangi', 'East Java', 5)),
                ],
              ),
            ),
            SizedBox(height: 30),
            // NOTE : TIPS AND GUIDANCE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips and Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(
                    Tips(1, 'City Guidelines', 'assets/tips1.png', '20 Apr'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(2, 'Jakarta Fairship', 'assets/tips2.png', '11 Dec'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 95),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem('assets/icon_home.png', true),
            BottomNavbarItem(
              'assets/icon_email.png',
              false,
            ),
            BottomNavbarItem('assets/icon_card.png', false),
            BottomNavbarItem('assets/icon_love.png', false)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
