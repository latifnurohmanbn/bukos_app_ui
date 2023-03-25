import 'package:bukos_ui/pages/error_page.dart';
import 'package:bukos_ui/theme.dart';
import 'package:bukos_ui/widgets/facility_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    // Future<void> _launchUrl(String uri) async {
    //   final Uri _url = Uri.parse(uri);
    //   if (!await launchUrl(_url)) {
    //     throw Exception('Could not launch $_url');
    //   }
    // }
    Future<void> _launchUrl(String uri) async {
      final Uri _url = Uri.parse(uri);
      if (await canLaunchUrl(_url)) {
        await launchUrl(_url);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    Future<void> launchPhone(String phoneNumber) async {
      final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
      if (!await launchUrl(callUri)) {
        throw Exception('Could not launch $callUri');
      }
    }

    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Confirmation',
                style: blackTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[Text('Are you sure to call ?')],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    launchPhone('+6281249013633');
                  },
                )
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset(
            'assets/thumbnail.png',
            width: MediaQuery.of(context).size.width,
            height: 350,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              SizedBox(
                height: 328,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    // NOTE : TITLE
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kuratakeso Hott',
                                style: blackTextStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text.rich(TextSpan(
                                  text: '\$52',
                                  style: purpleTextStyle.copyWith(fontSize: 16),
                                  children: [
                                    TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 16))
                                  ])),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                                color: Color(0xff989BA1),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // NOTE : MAIN FACILITIES
                    Padding(
                      padding: EdgeInsets.only(left: edge),
                      child: Text(
                        'Main Facilities',
                        style: regularTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FacilityItem('Kitchen', 'assets/icon_kitchen.png', 2),
                          FacilityItem('Bedroom', 'assets/icon_bedroom.png', 3),
                          FacilityItem(
                              'Big Lemari', 'assets/icon_cupboard.png', 3),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    // NOTE : PHOTO
                    Padding(
                      padding: EdgeInsets.only(left: edge),
                      child: Text(
                        'Photo',
                        style: regularTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 88,
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                        SizedBox(
                          width: edge,
                        ),
                        Image.asset(
                          'assets/photo1.png',
                          width: 110,
                          height: 88,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Image.asset(
                          'assets/photo2.png',
                          width: 110,
                          height: 88,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Image.asset(
                          'assets/photo3.png',
                          width: 110,
                          height: 88,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Image.asset(
                          'assets/photo1.png',
                          width: 110,
                          height: 88,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Image.asset(
                          'assets/photo2.png',
                          width: 110,
                          height: 88,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Image.asset(
                          'assets/photo3.png',
                          width: 110,
                          height: 88,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: edge,
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // NOTE : LOCATION(),
                    Padding(
                      padding: EdgeInsets.only(left: edge),
                      child: Text(
                        'Location',
                        style: regularTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 213,
                            height: 44,
                            child: Text(
                              'Jl. Kapuas Raya Tengah No. 25, Surabaya Utara, Jawa Timur',
                              style: greyTextStyle,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // _launchUrl('https://goo.gl/maps/Lm3KJRyiEB9K8LCN8');
                              _launchUrl('qwertyuiop');
                            },
                            child: Image.asset(
                              'assets/btn_map.png',
                              width: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: edge),
                      width: MediaQuery.of(context).size.width - (2 * edge),
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          showConfirmation();
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17))),
                        child: Text(
                          'Book Now',
                          style: whiteTextStyle.copyWith(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 40)
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/btn_back.png',
                    width: 40,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isClicked = !isClicked;
                    });
                  },
                  child: Image.asset(
                    isClicked
                        ? 'assets/btn_wishlist_filled.png'
                        : 'assets/btn_wishlist.png',
                    width: 40,
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
