import 'dart:math';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_bank_dribbble/src/painters/radial_painter.dart';
import 'package:online_bank_dribbble/src/utils.dart';
import 'package:online_bank_dribbble/src/widgets/circle_clipper.dart';
import 'package:online_bank_dribbble/src/widgets/dash_line.dart';
import 'package:online_bank_dribbble/src/widgets/dotted_border.dart';

class HomePage extends StatelessWidget {
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
              _header(size),
              _balance(size),
              _bottomShape(size),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomShape(Size size) {
    return Expanded(
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
          color: Color.fromRGBO(240, 241, 250, 1.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 30.0,
                bottom: 20.0,
              ),
              child: ListTile(
                leading: Text(
                  'Send money to',
                  style: TextStyle(
                    color: Color.fromRGBO(57, 74, 109, 1.0),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 23.0,
                    letterSpacing: 1.3,
                  ),
                ),
                trailing: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(89, 101, 196, 1.0),
                    ),
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0),
                          child: Icon(
                            Icons.add,
                            size: 15.0,
                            color: Color.fromRGBO(89, 101, 196, 1.0),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: 'Add',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _contacts(size),
            SizedBox(
              height: 25.0,
            ),
            _totalTransfer(size),
          ],
        ),
      ),
    );
  }

  Widget _totalTransfer(Size size) {
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
              ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total:',
                      style: TextStyle(
                        color: Color.fromRGBO(181, 177, 190, 1.0),
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      '\$3,432',
                      style: TextStyle(
                        color: Color.fromRGBO(82, 96, 127, 1.0),
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Torin',
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.0),
                    color: Color.fromRGBO(240, 241, 250, 1.0),
                  ),
                  child: Icon(
                    FontAwesomeIcons.calculator,
                    color: Color.fromRGBO(106, 93, 208, 1.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListBody(
                  children: [
                    _buildListExpenses(size, false, 'Medicine', '~\$2,300'),
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
                    _buildListExpenses(size, true, 'Social', '~\$1,500'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListExpenses(
      Size size, bool isInverted, String title, String cost) {
    Widget containerRotation;
    if (isInverted) {
      containerRotation = RotatedBox(
        quarterTurns: 2,
        child: Transform(
          transform: Matrix4.rotationX(pi),
          alignment: Alignment.center,
          child: CustomPaint(
            painter: RadialPainter(
              progressRemoval: 0.7,
              color: Colors.green,
              paintingStyle: PaintingStyle.stroke,
              strokeCap: StrokeCap.round,
              strokeWidth: 2.0,
            ),
            child: Container(
              height: 60,
              width: 60,
              child: Center(
                child: Icon(FontAwesomeIcons.solidHandshake),
              ),
            ),
          ),
        ),
      );
    } else {
      containerRotation = CustomPaint(
        painter: RadialPainter(
          progressRemoval: 0.7,
          color: Colors.blue,
          paintingStyle: PaintingStyle.stroke,
          strokeCap: StrokeCap.round,
          strokeWidth: 2.0,
        ),
        child: Container(
          height: 60,
          width: 60,
          child: Center(
            child: Icon(Icons.ac_unit),
          ),
        ),
      );
    }

    return Row(
      children: [
        Column(
          children: [
            containerRotation,
          ],
        ),
        SizedBox(
          width: 25.0,
        ),
        Text(
          title,
          style: TextStyle(
            color: Color.fromRGBO(57, 74, 109, 1.0),
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        Spacer(),
        Text(
          cost,
          style: TextStyle(
            color: Color.fromRGBO(57, 74, 109, 1.0),
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    );
  }

  Widget _contacts(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      width: size.width,
      child: RowSuper(
        fitHorizontally: true,
        innerDistance: -23.0,
        invert: true,
        outerDistance: 8.0,
        children: [
          ...avatars.map(
            (e) {
              var position = avatars.indexOf(e);
              return ClipPath(
                clipper: CircleClipper(),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 6,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: avatarColors[position],
                  ),
                  child: ClipOval(
                    child: SvgPicture.asset(
                      e,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          DottedBorder(
            color: Colors.blue,
            borderType: BorderType.Circle,
            dashPattern: [8, 5, 5, 5],
            radius: Radius.circular(100.0),
            strokeCap: StrokeCap.round,
            strokeWidth: 1.5,
            child: Container(
              height: 54.0,
              width: 54.0,
              color: Colors.transparent,
              child: Icon(
                Icons.add,
                color: toBlue,
                size: 25.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(Size size) {
    return SafeArea(
      child: Container(
        child: ListTile(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,
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
          tileMode: TileMode.clamp,
          stops: [0.5, 0.5],
        ),
      ),
    );
  }

  _balance(Size size) {
    return Container(
      padding: EdgeInsets.only(
        left: 10.0,
        top: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Balance',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: size.height * 0.026,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '\$ 3,543',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: size.height * 0.05,
                  fontFamily: 'Torin',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '**** 8344',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontWeight: FontWeight.w600,
                  fontSize: size.height * 0.022,
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/images/men_question.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
