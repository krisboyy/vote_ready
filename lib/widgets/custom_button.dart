import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Add more params if required like stroke width, button size
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.headerStyle,
    required this.fontColor,
    required this.backgroundColor,
    required this.text,
    required this.strokeColor,
    this.onPressed,
    required this.buttonSize,
  });

  final TextStyle headerStyle;
  final Color fontColor;
  final Color backgroundColor;
  final String text;
  final Color strokeColor;
  final void Function()? onPressed;
  final double buttonSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        side: MaterialStatePropertyAll(
          BorderSide(
            color: strokeColor,
            width: 0.8.spMax,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: headerStyle.copyWith(
          color: fontColor,
          fontSize: buttonSize.spMax,
        ),
      ),
    );
  }
}

class CustomFAB extends StatelessWidget {
  const CustomFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderRadius = 0.05.sh;
    return Container(
      child: Positioned(
        top: 6,
        right: -22,
        child: Container(
          width: 0.15.sw,
          height: 0.15.sh,
          // color: Colors.blueAccent,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              // bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 0.01.sw,
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(0.01.sw),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.5.spMin, 2.5.spMin),
                  ),
                ]),
            child: IconButton.filledTonal(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.surface),
                fixedSize: MaterialStatePropertyAll(
                  Size(
                    0.025.sw,
                    0.025.sw,
                  ),
                ),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                      0.01.sw,
                    )),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('LevelSelector'),
                );
              },
              icon: Image.asset("assets/images/back.png"),
            ),
          ),
        ),
      ),
    );
  }
}

class BackForLvl extends StatelessWidget {
  const BackForLvl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderRadius = 0.05.sh;
    return Container(
      child: Positioned(
        top: 6,
        right: -22,
        child: Container(
          width: 0.15.sw,
          height: 0.15.sh,
          // color: Colors.blueAccent,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              // bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 0.01.sw,
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(0.01.sw),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.5.spMin, 2.5.spMin),
                  ),
                ]),
            child: IconButton.filledTonal(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.surface),
                fixedSize: MaterialStatePropertyAll(
                  Size(
                    0.025.sw,
                    0.025.sw,
                  ),
                ),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                      0.01.sw,
                    )),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              icon: Image.asset("assets/images/back.png"),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBack extends StatelessWidget {
  const CustomBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderRadius = 0.05.sh;
    return Container(
      child: Positioned(
        top: 6,
        right: -22,
        child: Container(
          width: 0.15.sw,
          height: 0.15.sh,
          // color: Colors.blueAccent,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              // bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 0.01.sw,
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(0.01.sw),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.5.spMin, 2.5.spMin),
                  ),
                ]),
            child: IconButton.filledTonal(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.surface),
                fixedSize: MaterialStatePropertyAll(
                  Size(
                    0.025.sw,
                    0.025.sw,
                  ),
                ),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                      0.01.sw,
                    )),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset("assets/images/back.png"),
            ),
          ),
        ),
      ),
    );
  }
}
