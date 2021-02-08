import 'package:flutter/material.dart';
import 'package:personal_site/hyperlink.dart';
import 'package:personal_site/text_span.dart';
import 'package:personal_site/two_col_content.dart';

const goalteryxText = """At this point in my life I would call goalteryx my magnum opus.  It is the intersecting point of so many elements of my life and is one of the few things I allow myself to take a bit of pride in.

If you are asking what goalteryx is, it is an SDK for building custom Alteryx tools in Go.  If existing built-in tools cannot do something, you can build the functionality yourself by coding a new tool.  Alteryx provides a C API and the first SDKs were for C++ and .NET.  Then, in 2018, about the same time I was heavily using Alteryx, Alteryx released the Python SDK.  I fell in love with the idea of building tools and finally found my reason to learn Python.

My journey with programming languages started in 2010 with VBA, and shortly thereafter with VB.NET.  Since that time my journey has taken me to PHP, C#, Dart, Python, and finally Go.  With Go I found the language I want to specialize in.  I am always trying out new languages and I use Python and Dart quite frequently, but Go is my rock.

I have been a data analyst since the start of my career in 2010.  Since that time I have been trying to find a way to combine my love of data with my love of programming.  goalteryx represents that long sought-after union.

Now you know a bit about the backstory of goalteryx.  To learn more about it and how to use it, you can visit its GitHub repository.  Try it out, submit any issues you find, and let me know how I can improve it.  I hope you enjoy building tools with it as much as I have enjoyed making it.""";

class GoAlteryxPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TwoColumnContent(
          Image.asset("images/goalteryx_icon.png", width: 300),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSelectableText("goalteryx"),
              SizedBox(height: 30),
              Hyperlink("https://github.com/tlarsen7572/goalteryx", label: "goalteryx on GitHub"),
              SizedBox(height: 30),
              StyledSelectableText(goalteryxText),
            ],
          ),
        ),
      ],
    );
  }
}
