import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelText extends StatelessWidget {
  final String name;

  const LabelText(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$name",
      style: GoogleFonts.montserrat(
          color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w400),
    );
  }
}

class LabelTextDetail extends StatelessWidget {
  final String name;

  const LabelTextDetail(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$name",
      style: GoogleFonts.montserrat(
          color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w300),
    );
  }
}

class TextDegree extends StatelessWidget {
  final String name;

  const TextDegree(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$name",
      style: GoogleFonts.montserrat(
          color: Colors.white, fontSize: 80.0, fontWeight: FontWeight.w400),
    );
  }
}
