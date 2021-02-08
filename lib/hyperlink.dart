import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hyperlink extends StatelessWidget {
  Hyperlink(this.link, {this.label});
  final String link;
  final String label;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launch(link),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          label == null ? link : label,
          style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue, fontSize: 18),
        ),
      ),
    );
  }
}
