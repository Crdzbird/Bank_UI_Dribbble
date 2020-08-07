import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_bank_dribbble/src/utils.dart';
import 'package:online_bank_dribbble/src/widgets/dash_line.dart';
import 'package:online_bank_dribbble/src/widgets/days_selector.dart';
import 'package:online_bank_dribbble/src/widgets/radial_progress.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          _background(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(size, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Online Banking',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Torin',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              _dashboard(size, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dashboard(Size size, BuildContext context) {
    return Expanded(
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 15.0),
                width: 100.0,
                child: DashedLine(
                  color: Color.fromRGBO(239, 240, 245, 1.0),
                  height: 3.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      color: Color.fromRGBO(57, 74, 109, 0.8),
                      fontWeight: FontWeight.w600,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              DaysSelector(),
              SizedBox(
                height: 45.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RadialProgress(
                    width: 170,
                    height: 170,
                  ),
                  Container(
                    width: size.width * 0.4,
                    height: size.height * 0.17,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          isThreeLine: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          visualDensity: VisualDensity.compact,
                          leading: Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(78, 62, 200, 1.0),
                              borderRadius: BorderRadius.circular(
                                100.0,
                              ),
                            ),
                          ),
                          title: Text(
                            '\$1334',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(57, 74, 109, 1.0),
                            ),
                          ),
                          subtitle: Text('Shopping'),
                        ),
                        ListTile(
                          isThreeLine: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          visualDensity: VisualDensity.compact,
                          leading: Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(246, 128, 89, 1.0),
                              borderRadius: BorderRadius.circular(
                                100.0,
                              ),
                            ),
                          ),
                          title: Text(
                            '\$434',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(57, 74, 109, 1.0),
                            ),
                          ),
                          subtitle: Text('Total'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              _history(size, context),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                height: size.height * 0.025,
                child: Divider(
                  color: Color.fromRGBO(240, 241, 250, 1.0),
                  height: 1,
                  thickness: 0.7,
                ),
              ),
              _listHistoric(size, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listHistoric(Size size, BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          _childList(
            size,
            context,
            '23.05.18, 3:33 PM',
            'McDonalds',
            '~\$4500',
            Icons.shopping_basket,
            Color.fromRGBO(78, 62, 200, 0.8),
          ),
          Divider(
            color: Color.fromRGBO(240, 241, 250, 1.0),
            height: 50.0,
            thickness: 0.7,
          ),
          _childList(
            size,
            context,
            '12.07.18 15:09 PM',
            'Market',
            '~\$2300',
            Icons.restaurant_menu,
            Color.fromRGBO(246, 128, 89, 0.8),
          ),
        ],
      ),
    );
  }

  Widget _childList(Size size, BuildContext context, String datetime,
      String title, String price, IconData icon, Color color) {
    return Container(
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: color,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(57, 74, 109, 1.0),
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                datetime,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(172, 166, 181, 1.0),
                  fontSize: 17.0,
                  fontFamily: 'Torin',
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            price,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(57, 74, 109, 1.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _history(Size size, BuildContext context) {
    return Row(
      children: [
        Text(
          'History',
          style: TextStyle(
            color: Color.fromRGBO(57, 74, 109, 1.0),
            fontWeight: FontWeight.w600,
            fontSize: 25.0,
          ),
        ),
        Spacer(),
        Text(
          '****',
          style: TextStyle(
            color: Color.fromRGBO(172, 166, 181, 1.0),
            fontSize: 17.0,
          ),
        ),
        Text(
          ' 8344',
          style: TextStyle(
            color: Color.fromRGBO(172, 166, 181, 1.0),
            fontSize: 17.0,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Icon(FontAwesomeIcons.ccMastercard),
      ],
    );
  }

  Widget _header(Size size, BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListTile(
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          trailing: SvgPicture.asset(
            menuPath,
            color: Colors.white,
            semanticsLabel: 'Bank Menu',
            height: size.height * 0.03,
          ),
        ),
      ),
    );
  }

  Widget _background() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            fromBlue,
            toBlue,
          ],
        ),
      ),
    );
  }
}
