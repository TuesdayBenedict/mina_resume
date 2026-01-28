import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingFooter extends StatelessWidget {
  const LandingFooter({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final width = constraints.maxWidth;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: width < 600
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Mina Resume © 2025',
                  style: GoogleFonts.inter(color: Color(0xff94a3b8)),
                ),
                const SizedBox(height: 30),
                width < 400 ? verticalButtonBar() : horizontalButtonBar(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mina Resume © 2025',
                  style: GoogleFonts.inter(color: Color(0xff94a3b8)),
                ),
                const SizedBox(height: 30),
                horizontalButtonBar(),
              ],
            ),
    );
  }

  Row horizontalButtonBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Privacy Policy',
            style: GoogleFonts.inter(color: Color(0xff94a3b8)),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Terms of Service',
            style: GoogleFonts.inter(color: Color(0xff94a3b8)),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Support',
            style: GoogleFonts.inter(color: Color(0xff94a3b8)),
          ),
        ),
      ],
    );
  }

  Column verticalButtonBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Privacy Policy',
            style: GoogleFonts.inter(color: Color(0xff94a3b8)),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Terms of Service',
            style: GoogleFonts.inter(color: Color(0xff94a3b8)),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Support',
            style: GoogleFonts.inter(color: Color(0xff94a3b8)),
          ),
        ),
      ],
    );
  }
}
