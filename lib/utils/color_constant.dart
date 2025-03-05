import 'package:flutter/material.dart';


mixin ColorConstant {
  static Color appColor = Colors.transparent;
  // static Color bottomNavigationBarcolor= Color(hexColor('020B37'));
  static Color splashColor = const Color(0xFFB2DFDB);
  static Color selectedTextColor = const Color(0xFF424242);
  static Color white = Colors.white;
  static Color buttoncolor =  Color(0xffC9A358);
  static Color gd1 =  Color(0xffC9A358);
  static Color gd2 =  Color(0xffC9A358);
  static Color gd3 = const Color(0xFF904E22);
  static Color yellow =  Color(0xffC9A358);
  static Color bg = const Color(0x0ff7f7f8);
  static Color lightblue= const Color(0xFDFE5F4);

  static Color purpleclr= const Color(0xff6F2394);

  static Color lightGreen= const Color (0xff32D2B5);
  static Color purplecolor= const Color (0xff9F32D2);

  static Color boxbgclr = const Color (0xfDFE5F4);
  static Color product_bgclr = const Color(0xFF04205A);
  static Color boxbgclrproduct= const Color(0xFF04205A);
  static Color product_bgclrsg = const Color(0xFF04205A);
  static Color bottomNavigationBarcolor = const Color(0xff020B37);
  static Color product_bg_clor = const Color (0xFF133691);
  // static Color nevigationcolor = const Color(#020B37);
  static Color myblack = const Color(0xFF0E0E0E);
  static Color macounticonclr = const Color(0xffC9A358);
  static Color lightwhite = const Color(0xfF2F4F9);
  static Color buttonColor= const Color(0xffC9A358);
}


mixin btnbordercolor {


  static Color gd1 = const Color(0xFFFAE27F);
  static Color gd2 = const Color(0xFFDA9828);
  static Color gd3 = const Color(0xFF904E22);
  static Color yellow = const Color(0xffD18F27);

}




// mixin btnbordercolor {
//
//
//   static Color gd1 = const Color(0xFFFAE27F);
//   static Color gd2 = const Color(0xFFDA9828);
//   static Color gd3 = const Color(0xFF904E22);
//   static Color yellow = const Color(0xffD18F27);
//
// }





mixin Textcolor {

  static Color rajnigandhatextclr = const  Color(0xFFDA9828);
  static Color businessclubtextclr = const  Color(0xFFDA9828);

}


mixin Palette {
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF00AA88,
    <int, Color>{
      50: Color(0xFF00AA88), //10%
      100: Color(0xFF00AA88), //20%
      200: Color(0xFF00AA88), //30%
      300: Color(0xFF00AA88), //40%
      400: Color(0xFF00AA88), //50%
      500: Color(0xFF00AA88), //60%
      600: Color(0xFF00AA88), //70%
      700: Color(0xFF00AA88), //80%
      800: Color(0xFF00AA88), //90%
      900: Color(0xFF00AA88), //100%
    },
  );

  static LinearGradient gradientBaseBg = const LinearGradient(
    colors: [
               Color(0xFF2F2F2F),
               Color(0xFF2F2F2F),
               Color(0xFF0E0E0E)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.5, 1],
  );



}
mixin gredientColorCollection{


  static LinearGradient myGredientColor=   LinearGradient(
    colors: [ColorConstant.gd1,
      ColorConstant.gd2,
      ColorConstant.gd3], // Define your gradient colors
    begin: Alignment.topCenter, // Define the beginning of the gradient
    end: Alignment.bottomCenter,
    // Define the end of the gradient
  );
}