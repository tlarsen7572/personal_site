import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_site/hyperlink.dart';
import 'package:personal_site/text_span.dart';

const followMeText = """You can follow my work on a variety of platforms.  All of my open source code (which is most of my code) is available on GitHub.  I provide status updates on LinkedIn and Twitter.  When inspiration seizes me I write longer pieces of work on Medium.""";

class FollowPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSelectableText("Follow me"),
        SizedBox(height: 30),
        StyledSelectableText(followMeText),
        SizedBox(height: 30),
        ContactRow('GitHub: tlarsen7572', 'https://github.com/tlarsen7572'),
        ContactRow('LinkedIn ', 'https://www.linkedin.com/in/thomas-larsen-304b7a13'),
        ContactRow('Twitter: @tlarsendataguy', 'https://twitter.com/tlarsendataguy'),
        ContactRow('Medium: @larsenthomasj', 'https://medium.com/@larsenthomasj'),
      ],
    );
  }
}

class ContactRow extends StatelessWidget {
  ContactRow(this.text, this.link);
  final String text;
  final String link;

  Widget build(BuildContext context) {
    return Row(
      children: [
        Hyperlink(link, label: this.text),
      ],
    );
  }
}
