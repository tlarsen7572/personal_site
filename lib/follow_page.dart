import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

const followMeText = """You can follow my work on a variety of platforms.  All of my open source code (which is most of my code) is available on GitHub.  I provide status updates on LinkedIn and Twitter.  When inspiration seizes me I write longer pieces of work on Medium.""";

class FollowPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(followMeText),
        Container(height: 20),
        ContactRow('GitHub: ', 'https://github.com/tlarsen7572'),
        ContactRow('LinkedIn: ', 'https://www.linkedin.com/in/thomas-larsen-304b7a13'),
        ContactRow('Twitter: ', 'https://twitter.com/tlarsendataguy'),
        ContactRow('Medium: ', 'https://medium.com/@larsenthomasj'),
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
        Text(text),
        Hyperlink(link),
      ],
    );
  }
}

class Hyperlink extends StatelessWidget {
  Hyperlink(this.link);
  final String link;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launch(link),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          link,
          style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
        ),
      ),
    );
  }
}