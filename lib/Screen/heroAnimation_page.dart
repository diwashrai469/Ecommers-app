import 'package:demo_app/Model/api_model.dart';
import 'package:demo_app/constant/constants.dart';
import 'package:demo_app/widgets/ResuableWidgets/text_widget.dart';
import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
  ApiModel heroTag;
  HeroAnimation({super.key, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: ListView(
          children: [
            Padding(
              padding: mainPadding,
              child: Hero(
                tag: heroTag.id.toString(),
                child: Image(image: NetworkImage(heroTag.image.toString())),
              ),
            ),
            Padding(
              padding: mainPadding,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextWidget(
                        text: heroTag.title,
                        size: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextWidget(
                        text: heroTag.description,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextWidget(
                        text: "Category:" + heroTag.category.toString(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
