import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/screens/Home/components/agenda.dart';
import 'package:todo_app/screens/Home/components/button.dart';
import 'package:todo_app/screens/Home/components/caroussel.dart';
import 'package:todo_app/screens/Home/components/header_with_seachbox.dart';
import 'package:todo_app/screens/Home/components/title_with_more_bbtn.dart';
import 'package:intl/intl.dart';
import '../../../components/bottom_nav_bar.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../../Profil/facultes.dart';
import '../../Signup/components/or_divider.dart';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class BodyHome extends StatefulWidget {
  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  final imgUrl =
      "https://fsea.univ-oran1.dz/images/pedagogie20212022/er_s2_2022/er_s2_dpt_info.pdf";
  var dio = Dio();
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.yMMMMd().format(DateTime.now()),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Aujourd'hui",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyButton(
                      label: "Agenda >",
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Agenda()),
                        ),
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding),
          SizedBox(height: kDefaultPadding),
          TitleWithMoreBtn(
            title: "L'actualité",
            press: () async {
              final url =
                  'https://www.univ-oran1.dz/index.php/homepage/actualite';
              openBrowserURL(url: url, inApp: true);
            },
          ),
          Caroussel(),
          SizedBox(height: kDefaultPadding),
          SizedBox(height: kDefaultPadding),
          TitleWithMoreBtn(
            title: "Planning",
            press: () async {
              final url = 'https://fsea.univ-oran1.dz/';
              openBrowserURL(url: url, inApp: true);
            },
          ),
          SizedBox(height: kDefaultPadding),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: Color.fromARGB(255, 43, 43, 43), width: 3))),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: introIcon,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        "ER Département d'Informatique",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => openFile(
                        url:
                            'https://fsea.univ-oran1.dz/images/pedagogie20212022/er_s2_2022/er_s2_dpt_info.pdf',
                        fileName: 'edt.pdf',
                      ),
                      child: Icon(
                        Icons.download,
                        color: introIcon,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: Color.fromARGB(255, 43, 43, 43), width: 3))),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: introIcon,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        "EF département Physique",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.download,
                        color: introIcon,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: Color.fromARGB(255, 43, 43, 43), width: 3))),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: introIcon,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        "EDT Licence 3 Informatique",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.download,
                        color: introIcon,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding),
          SizedBox(height: kDefaultPadding),
          SizedBox(height: kDefaultPadding),
          TitleWithMoreBtn(title: "Restaurants", press: () {}),
          SizedBox(height: kDefaultPadding),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/restouniv.jpg"),
                      ),
                    ),
                    Text("Rest. Univ."),
                    Text(
                      "1,2 km",
                      style: TextStyle(fontSize: 10, color: introIcon),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/foodlover.jpg"),
                      ),
                    ),
                    Text("Food lover"),
                    Text(
                      "2,5 km",
                      style: TextStyle(fontSize: 10, color: introIcon),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/leprince.jpg"),
                      ),
                    ),
                    Text("Le prince"),
                    Text(
                      "3 km",
                      style: TextStyle(fontSize: 10, color: introIcon),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/foodh.jpg"),
                      ),
                    ),
                    Text("Food H"),
                    Text(
                      "0,6 km",
                      style: TextStyle(fontSize: 10, color: introIcon),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/swagfood.jpg"),
                      ),
                    ),
                    Text("Swag food"),
                    Text(
                      "6 km",
                      style: TextStyle(fontSize: 10, color: introIcon),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/tayba.jpg"),
                      ),
                    ),
                    Text("Tayba"),
                    Text(
                      "1,9 km",
                      style: TextStyle(fontSize: 10, color: introIcon),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding),
          SizedBox(height: kDefaultPadding),
          TitleWithMoreBtn(
            title: "Transport",
            press: () async {
              final url = 'http://dou-bireldjir.dz/les-services/transport/';
              openBrowserURL(url: url, inApp: true);
            },
          ),
          SizedBox(height: kDefaultPadding),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    final url =
                        'http://dou-bireldjir.dz/les-services/transport/';
                    openBrowserURL(url: url, inApp: true);
                  },
                  child: Card(
                    color: introBg,
                    margin: EdgeInsets.all(10),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/bus.svg",
                            width: 50,
                            height: 30,
                            color: introTitle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Bus",
                            style: TextStyle(
                              fontSize: 12,
                              color: introTitle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final url =
                        'https://web.facebook.com/setramoran/?_rdc=1&_rdr';
                    openBrowserURL(url: url, inApp: true);
                  },
                  child: Card(
                    color: introBg,
                    margin: EdgeInsets.all(10),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/tram.svg",
                            width: 50,
                            height: 30,
                            color: introTitle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Tramway",
                            style: TextStyle(
                              fontSize: 12,
                              color: introTitle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    color: introBg,
                    margin: EdgeInsets.all(10),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/vtc.svg",
                            width: 50,
                            height: 30,
                            color: introTitle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "VTC",
                            style: TextStyle(
                              fontSize: 12,
                              color: introTitle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }

  Future openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!);

    if (file == null) return;

    print('Path: ${file.path}');

    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');

    final response = await Dio().get(url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ));

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return file;
  }
}
