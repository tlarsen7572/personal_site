import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_site/follow_page.dart';
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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return PageTransition<Widget>(
              settings: RouteSettings(name: '/'),
                type: PageTransitionType.fade,
                child: StandardPage(
                  page: SelectedPage.Home,
                  bannerText: "Data analyst and Alteryx toolmaker",
                  bannerImage: Image.asset('Tom.jpeg', alignment: Alignment.centerLeft),
                  content: HomePage(),
                ),
            );
          case "/goalteryx":
            return PageTransition<Widget>(
              settings: RouteSettings(name: '/goalteryx'),
              type: PageTransitionType.fade,
              child: StandardPage(
                page: SelectedPage.GoAlteryx,
                bannerText: "goalteryx",
                bannerImage: Image.asset('goalteryx_icon.png', alignment: Alignment.centerLeft),
                content: GoAlteryxPage(),
              ),
            );
          case "/follow":
            return PageTransition<Widget>(
              settings: RouteSettings(name: '/follow'),
              type: PageTransitionType.fade,
              child: StandardPage(
                page: SelectedPage.Follow,
                bannerText: "Follow me",
                bannerImage: Container(
                  color: Colors.black,
                ),
                content: FollowPage(),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavButtons(selectedPage: page),
            Container(height: 100),
            Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: maxPageWidth),
                padding: EdgeInsets.all(20),
                child: this.content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavButtons extends StatelessWidget {
  NavButtons({this.selectedPage});
  final SelectedPage selectedPage;

  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxPageWidth),
          child: Row(
            children: [
              Text("tlarsendataguy", textAlign: TextAlign.start, style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(primary: Colors.black, textStyle: TextStyle(fontSize: 18)),
                        child: Column(
                          children: [
                            Container(height: 40, width: 100, child: Align(child: Text("Home"), alignment: Alignment.center)),
                            SelectedPageIndicator(selectedPage == SelectedPage.Home),
                          ],
                        ),
                        onPressed: ()=>Navigator.of(context).pushNamed("/"),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(primary: Colors.black, textStyle: TextStyle(fontSize: 18)),
                        child: Column(
                          children: [
                            Container(height: 40, width: 100, child: Align(child: Text("goalteryx"), alignment: Alignment.center)),
                            SelectedPageIndicator(selectedPage == SelectedPage.GoAlteryx),
                          ],
                        ),
                        onPressed: ()=>Navigator.of(context).pushNamed("/goalteryx"),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(primary: Colors.black, textStyle: TextStyle(fontSize: 18)),
                        child: Column(
                          children: [
                            Container(height: 40, width: 100, child: Align(child: Text("Follow"), alignment: Alignment.center)),
                            SelectedPageIndicator(selectedPage == SelectedPage.Follow),
                          ],
                        ),
                        onPressed: ()=>Navigator.of(context).pushNamed("/follow"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
      color: selected ? Colors.indigo : null,
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
