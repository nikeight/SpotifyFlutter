import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praxis_flutter/design_system/text_style.dart';

class SpotifyText extends StatelessWidget {
  final String textData;
  final TextStyle textStyle;

  // Headings
  SpotifyText.headingOne(this.textData)
      : textStyle = GoogleFonts.openSans(textStyle: heading1Style);

  SpotifyText.headingTwo(this.textData)
      : textStyle = GoogleFonts.openSans(textStyle: heading2Style);

  SpotifyText.headingThree(this.textData)
      : textStyle = GoogleFonts.openSans(textStyle: heading3Style);

  // Headline
  SpotifyText.headline(this.textData)
      : textStyle = GoogleFonts.openSans(textStyle: headlineStyle);

  SpotifyText.subHeading(this.textData)
      : textStyle = GoogleFonts.openSans(textStyle: subHeadlineStyle);

  // Others
  SpotifyText.bodyText(this.textData)
      : textStyle = GoogleFonts.openSans(textStyle: bodyStyle);

  SpotifyText.captionText(this.textData)
      : textStyle = GoogleFonts.openSans(textStyle: captionStyle);

  @override
  Widget build(BuildContext context) {
    return Text(
      textData,
      style: textStyle,
    );
  }
}
