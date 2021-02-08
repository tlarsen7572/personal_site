

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyledSelectableText extends StatelessWidget {
  StyledSelectableText(this.text);

  final String text;

  Widget build(BuildContext context) {
    return SelectableText(this.text, style: TextStyle(fontSize: 18));
  }
}

class HeaderSelectableText extends StatelessWidget {
  HeaderSelectableText(this.text);

  final String text;

  Widget build(BuildContext context) {
    return SelectableText(this.text, style: TextStyle(fontSize: 36));
  }
}
