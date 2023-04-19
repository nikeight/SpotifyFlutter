import 'package:flutter/material.dart';
import 'package:praxis_flutter/design_system/spotify_button.dart';
import 'package:praxis_flutter/design_system/spotify_text.dart';
import 'package:praxis_flutter/design_system/spotify_text_input.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        children: [
          SpotifyText.headingOne('Design System'),
          verticalSpaceSmall,
          const Divider(),
          verticalSpaceSmall,
          ...buttonWidgets,
          ...textWidgets,
          ...inputFields,
        ],
      ),
    );
  }

  List<Widget> get textWidgets => [
        SpotifyText.headline('Text Styles'),
        verticalSpaceMedium,
        SpotifyText.headingOne('Heading One'),
        verticalSpaceMedium,
        SpotifyText.headingTwo('Heading Two'),
        verticalSpaceMedium,
        SpotifyText.headingThree('Heading Three'),
        verticalSpaceMedium,
        SpotifyText.headline('Headline'),
        verticalSpaceMedium,
        SpotifyText.subHeading('This will be a sub heading to the headling'),
        verticalSpaceMedium,
        SpotifyText.bodyText(
            'Body Text that will be used for the general body'),
        verticalSpaceMedium,
        SpotifyText.captionText(
            'This will be the caption usually for smaller details'),
        verticalSpaceMedium,
      ];

  List<Widget> get buttonWidgets => [
        SpotifyText.headline('Buttons Testing'),
        verticalSpaceMedium,
        SpotifyText.bodyText('Body Text'),
        verticalSpaceSmall,
        const SpotifyButton(
          title: 'Sign In',
        ),
        verticalSpaceSmall
      ];

  List<Widget> get inputFields => [
        SpotifyText.headline('Input Field Test'),
        verticalSpaceSmall,
        SpotifyText.captionText('Caption Text'),
        verticalSpaceSmall,
        SpotifyTextField(
          controller: TextEditingController(),
          placeholder: 'Enter Password',
        ),
        verticalSpaceSmall,
      ];
}

Widget verticalSpaceSmall = const SizedBox(height: 8);
Widget verticalSpaceMedium = const SizedBox(height: 16);
