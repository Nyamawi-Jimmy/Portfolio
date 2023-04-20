import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../Widgets/download.dart';
import '../../../constants.dart';
import 'area_info_text.dart';
import 'coding.dart';
import 'knowledges.dart';
import 'my_info.dart';
import 'skills.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      child: SafeArea(
        child: Column(
          children: [
            MyInfo(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    AreaInfoText(
                      title: "Residence",
                      text: "Kenya",
                    ),
                    AreaInfoText(
                      title: "City",
                      text: "Malindi",
                    ),
                    AreaInfoText(
                      title: "Age",
                      text: "22",
                    ),
                    Skills(),
                    SizedBox(height: defaultPadding),
                    Coding(),
                    Knowledges(),
                    Divider(),
                    SizedBox(height: defaultPadding / 2),
                    Container(
                      margin: EdgeInsets.only(top: defaultPadding),
                      color: Color(0xFF24242E),
                      child: Row(
                        children: [
                          Spacer(),
                          IconButton(
                            onPressed: () async {
                              final message = 'Hello!';
                              final phone = '+254718845069';
                              final url = 'whatsapp://send?phone=$phone&text=$message';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            icon: SvgPicture.asset("assets/icons/whatsapp.svg",color: Colors.grey,),
                          ),
                          IconButton(
                            onPressed: () {
                              launch("https://github.com/Nyamawi-Jimmy");
                            },
                            icon: SvgPicture.asset("assets/icons/github.svg"),
                          ),
                          GestureDetector(
                            onTap: () {
                              launch("tel:+254718845069");
                            },
                            child: Text(
                              "+254718845069",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.grey.withOpacity(1),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
