import 'package:flutter/material.dart';
import 'package:personal_site/text_span.dart';
import 'package:personal_site/two_col_content.dart';

String homeText = """I am a data analyst with over 10 years of experience.  My particular specialty is building modular components that can form repeatable systems.  My tool of choice for general data analytics is Alteryx, but I also bring a love of programming to data analytics.  This manifests itself not only by building custom analytic tools and SDKs (such as goalteryx) in code, but also by incorporating the disciplines I have acquired as I learned to code to build better workflows.

In my free time, when I'm not coding, I like to spend time with my wife and two daughters.  Seeing the world through my daughters' eyes has allowed me a chance to appreciate things I never stopped to consider before.  I also have a private pilot certificate and enjoy the wonders and tranquility of flight.

This site is meant to provide a human element to my public-facing projects and act as a central gateway to the things I have built.  Please explore and enjoy.""";

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return TwoColumnContent(
      Image.asset("images/Tom.jpeg"),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSelectableText("About me"),
          SizedBox(height: 30),
          StyledSelectableText(homeText),
        ],
      ),
    );
  }
}
