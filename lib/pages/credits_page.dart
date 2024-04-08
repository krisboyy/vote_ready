import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 24.spMin,
    );
    final TextStyle bodyStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      fontSize: 20.spMin,
    );

    double borderRadius = 0.05.sh;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Container(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 0.05.sh,
                ),
                Container(
                  height: 0.5.sh,
                  child: SingleChildScrollView(
                    dragStartBehavior: DragStartBehavior.down,
                    clipBehavior: Clip.none,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/images/rit.png"),
                        SizedBox(
                          height: 0.05.sh,
                        ),
                        Text(
                          "Developed by the team from Rajiv Gandhi Institute of Technology, Kottayam",
                          style: titleStyle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 0.05.sh,
                        ),
                        Text(
                          "Advisory Team",
                          style: titleStyle.copyWith(decoration: TextDecoration.underline),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Smt. V. Vigneshwari",
                          style: bodyStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "District Collector & District Magistrate\nKottayam, Kerala State",
                          style: bodyStyle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 0.05.sh,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 0.5.sw,
                              child: Column(
                                children: [
                                  Text(
                                    "Prof. Shibu Kumar K.B.",
                                    style: bodyStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Assistant Professor\nRIT, Kottayam",
                                    style: bodyStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 0.5.sw,
                              child: Column(
                                children: [
                                  Text(
                                    "Prof. Pillai Praveen Thulasidharan",
                                    style: bodyStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Assistant Professor\nRIT, Kottayam",
                                    style: bodyStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.05.sh,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Development Team",
                                  style: titleStyle.copyWith(decoration: TextDecoration.underline),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Aby Pious Vinoy\nArjun C Vinod\nAthira Vijayan\nNikhil Krishnan\nSreeraj K",
                                  style: bodyStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Art Team",
                                  style: titleStyle.copyWith(decoration: TextDecoration.underline),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Dona Johnson\nEaswari Nair\nMegha Joy\nRahul K\n",
                                  style: bodyStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
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
          ],
        ),
      ),
    );
  }
}
