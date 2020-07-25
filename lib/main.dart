import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_site/goalteryx_page.dart';
import 'package:personal_site/constants.dart';
import 'package:personal_site/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tom Larsen',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return PageTransition<Widget>(
                type: PageTransitionType.fade,
                child: StandardPage(
                  page: SelectedPage.Home,
                  bannerText: "Data analyst and Alteryx toolmaker",
                  bannerImage: Container(
                    color: Colors.blueGrey,
                  ),
                  content: HomePage(),
                ),
            );
          case "/goalteryx":
            return PageTransition<Widget>(
                type: PageTransitionType.fade,
                child: StandardPage(
                  page: SelectedPage.GoAlteryx,
                  bannerText: "goalteryx",
                  bannerImage: Container(
                    color: Colors.blueGrey,
                  ),
                  content: GoAlteryxPage(),
                ),
            );
          default:
            return null;
        }
      },
    );
  }
}

class PageWidthLayout extends StatelessWidget {
  PageWidthLayout({this.child});
  final Widget child;

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxPageWidth),
        child: this.child,
        margin: EdgeInsets.all(20),
      ),
    );
  }
}

class StandardBanner extends StatelessWidget {
  StandardBanner({this.text, this.image});
  final String text;
  final Widget image;

  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: TextStyle(fontSize: 24, color: backgroundColor),
          ),
        ),
        Expanded(
          flex: 2,
          child: image,
        ),
      ],
    );
  }
}

class StandardPage extends StatelessWidget {
  StandardPage({this.page, this.bannerText, this.bannerImage, this.content});
  final SelectedPage page;
  final String bannerText;
  final Widget bannerImage;
  final Widget content;

  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            StandardPageHeader(
              child: StandardBanner(
                text: bannerText,
                image: bannerImage,
              ),
            ),
            NavButtons(selectedPage: page),
            this.content,
          ],
        ),
      ),
    );
  }
}

class StandardPageHeader extends StatelessWidget {
  StandardPageHeader({this.child});
  final Widget child;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          height: 300,
          child: PageWidthLayout(child: this.child),
        ),
        Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, backgroundColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        )
      ],
    );
  }
}

class NavButtons extends StatelessWidget {
  NavButtons({this.selectedPage});
  final SelectedPage selectedPage;

  Widget build(BuildContext context) {
    return Wrap(
      children: [
        FlatButton(
          child: Column(
            children: [
              Text("Home"),
              SelectedPageIndicator(selectedPage == SelectedPage.Home),
            ],
          ),
          onPressed: ()=>Navigator.of(context).pushNamed("/"),
        ),
        FlatButton(
          child: Column(
            children: [
              Text("goalteryx"),
              SelectedPageIndicator(selectedPage == SelectedPage.GoAlteryx),
            ],
          ),
          onPressed: ()=>Navigator.of(context).pushNamed("/goalteryx"),
        ),
      ],
    );
  }
}

class SelectedPageIndicator extends StatelessWidget {
  SelectedPageIndicator(this.selected);
  final bool selected;
  Widget build(BuildContext context) {
    var widget = Container(
      height: 5,
      width: 80,
      color: selected ? Colors.blue : null,
    );
    if (selected) {
      return Hero(
        tag: 'selection',
        child: widget,
      );
    }
    return widget;
  }
}
