import 'package:flutter/widgets.dart';

class TwoColumnContent extends StatelessWidget {
  TwoColumnContent(this.leftContent, this.rightContent, {this.leftIsFlex=false});

  final Widget leftContent;
  final Widget rightContent;
  final bool leftIsFlex;

  Widget build(BuildContext context) {
    var leftContent = this.leftIsFlex ? Expanded(child: this.leftContent) : this.leftContent;
    var rightContent = this.leftIsFlex ? this.rightContent : Expanded(child: this.rightContent);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        leftContent,
        Container(width: 30),
        rightContent,
      ],
    );
  }
}