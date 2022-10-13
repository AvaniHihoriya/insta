import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta/utils/Dimensions.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  final String titile;
  final Color backgroundcolor;
  const Customappbar(
      {Key? key, required this.titile, required this.backgroundcolor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final Utils utils = Utils(context);
    // final theme = utils.getTheme;
    // Size size =Utils(context).getScreenSize;
    // final Color color = Utils(context).color;
    return AppBar(
      leading: Icon(
        Icons.camera_alt_outlined,
        color: Colors.black45,
        size: 30,
      ),
      // centerTitle: true ,
      // flexibleSpace: Container(
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
      //       color: Colors.white70
      //       )
      //
      // ),
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 3,
      title: Text(titile,
          style: GoogleFonts.dancingScript(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.w900)),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search_sharp,
            color: Colors.black87,
            size: Dimension.iconsize24,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon:Image.asset("assets/images/message.png",
          height: 30,
          width: 30,
          color: Colors.black87,),
          onPressed: () {},
        ),
      ],


    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
