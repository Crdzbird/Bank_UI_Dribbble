import 'package:flutter/material.dart';
import 'package:online_bank_dribbble/src/utils.dart';

class DaysSelector extends StatefulWidget {
  @override
  _DaysSelectorState createState() => _DaysSelectorState();
}

class _DaysSelectorState extends State<DaysSelector> {
  int selectedPosition = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width,
      alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _dateSelect(index, dates[index]);
        },
        itemCount: 3,
      ),
    );
  }

  Widget _dateSelect(int position, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPosition = position;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: (selectedPosition == position)
              ? Color.fromRGBO(240, 241, 250, 1.0)
              : Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 35.0,
            vertical: 8.0,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: (selectedPosition == position)
                  ? Color.fromRGBO(57, 74, 109, 1.0)
                  : Color.fromRGBO(160, 154, 171, 1.0),
              fontWeight: (selectedPosition == position)
                  ? FontWeight.w700
                  : FontWeight.w400,
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}
