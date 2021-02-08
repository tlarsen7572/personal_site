import 'package:flutter/widgets.dart';

class TwoColumnContent extends StatelessWidget {
  TwoColumnContent(this.leftContent, this.rightContent, {this.leftIsFlex=false});

  final Widget leftContent;
  final Widget rightContent;
  final bool leftIsFlex;

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext layoutContext, BoxConstraints constraints) {
        if (constraints.maxWidth < 700) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              this.leftContent,
              SizedBox(height: 30),
              this.rightContent,
            ],
          );
        }
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
    );
  }
}