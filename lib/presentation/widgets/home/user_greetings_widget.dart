import 'package:flutter/material.dart';

class UserGreetings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subtitleTextStyle = TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.w500);
    final titleTextStyle = TextStyle(
        color: Theme.of(context).primaryColorDark,
        fontSize: 28.0,
        fontWeight: FontWeight.w600);
    return SizedBox(
      height: 120.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.0),
                bottomRight: Radius.circular(32.0))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 74.0,
                height: 74.0,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
              ),
              SizedBox(
                width: 12.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem vindo(a)',
                    style: subtitleTextStyle,
                  ),
                  Text(
                    'Raquel da Silva!',
                    style: titleTextStyle,
                  )
                ],
              )
            ]),
      ),
    );
  }
}
