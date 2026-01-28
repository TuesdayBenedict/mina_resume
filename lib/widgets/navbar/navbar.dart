import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar navBar() {
  return AppBar(
    backgroundColor: Color(0xfffefefe),

    title: Row(
      children: [
        // logo
        Text(
          'Mina Resume',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w900,
            fontSize: 16,
            color: Color(0xff0d131c),
          ),
        ),
        Spacer(),

        // button
        SizedBox(
          height: 35,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff3d84f5),
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Log In',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
