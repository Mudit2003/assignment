import 'package:assignment/Util/dimensions.dart';
import 'package:flutter/material.dart';

class OnOffButton extends StatefulWidget {
  OnOffButton({
    super.key,
    required this.buttonLabel,
  });

  final List<String> buttonLabel;
  int activeButton = 0;

  @override
  State<OnOffButton> createState() => _OnOffButtonState();
}

class _OnOffButtonState extends State<OnOffButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var buttonLabel = widget.buttonLabel;
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(buttonLabel.length, (index) {
            return GestureDetector(
              onTap: () => setState(() => widget.activeButton = index),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.responsiveHeight(5),
                    horizontal: Dimensions.responsiveWidth(10)),
                child: Text(buttonLabel[index],
                    style: TextStyle(
                      color: widget.activeButton == index
                          ? Colors.white
                          : Colors.black,
                    )),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.circularBorderRadius),
                  color: widget.activeButton == index
                      ? Colors.red
                      : Colors.transparent,
                ),
              ),
            );
          })),
    );
  }
}
