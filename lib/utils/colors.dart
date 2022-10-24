import 'package:flutter/material.dart';

extension myColor on Colors {
    static const mainColor = Color(0xff7296C8);
    static const textHintColor = Color(0xff8AA7CF);
    static const hintColor = Color(0xffC4C4C4);
    static const secondColor = Color(0xffEEF9FF);
    static const errorColor = Color(0xfff26671);

    static Map<int, Color> colors =
    {
        50:const Color.fromRGBO(114,150,200, .1),
        100:const Color.fromRGBO(114,150,200, .2),
        300:const Color.fromRGBO(114,150,200, .4),
        400:const Color.fromRGBO(114,150,200, .5),
        200:const Color.fromRGBO(114,150,200, .3),
        500:const Color.fromRGBO(114,150,200, .6),
        600:const Color.fromRGBO(114,150,200, .7),
        700:const Color.fromRGBO(114,150,200, .8),
        800:const Color.fromRGBO(114,150,200, .9),
        900:const Color.fromRGBO(114,150,200, 1),
    };
}