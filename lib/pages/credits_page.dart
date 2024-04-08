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
      fontSize: 18.spMin,
    );
    final TextStyle bodyStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      fontSize: 16.spMin,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.1.sh),
        child: AppBar(
          clipBehavior: Clip.none,
          primary: true,
          title: null,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            Container(
              // margin: EdgeInsets.only(
              //   right: 0.025.sw,
              //   top: 0.075.sh,
              // ),
              child: IconButton.filledTonal(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary),
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
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close_rounded),
              ),
            ),
            SizedBox(
              width: 0.025.sw,
            )
          ],
        ),
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          children: [
            SizedBox(
              height: 0.05.sh,
            ),
            Container(
              height: 0.5.sh,
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                dragStartBehavior: DragStartBehavior.down,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/images/rit.png"),
                    Text(
                      "Developed by the team from Rajiv Gandhi Institute of Technology, Kottayam",
                      style: titleStyle,
                    ),
                    Text(
                      "Advisory Team",
                      style: titleStyle.copyWith(decoration: TextDecoration.underline),
                    ),
                    Text(
                      "Smt. V. Vigneshwari, District Collector & District Magistrate, Kottayam, Kerala State",
                      style: bodyStyle,
                    ),
                    Text(
                      "Prof. Shibu Kumar K.B., Assistant Professor, RIT Kottayam",
                      style: bodyStyle,
                    ),
                    Text(
                      "Prof. Pillai Praveen Thulasidharan, Assistant Professor, RIT Kottayam",
                      style: bodyStyle,
                    ),
                    Text(
                      "Development Team",
                      style: titleStyle.copyWith(decoration: TextDecoration.underline),
                    ),
                    Text(
                      "Aby Pious",
                      style: bodyStyle,
                    ),
                    Text(
                      "Arjun C Vinod",
                      style: bodyStyle,
                    ),
                    Text(
                      "Athira Vijayan",
                      style: bodyStyle,
                    ),
                    Text(
                      "Nikhil Krishnan",
                      style: bodyStyle,
                    ),
                    Text(
                      "Sreeraj K",
                      style: bodyStyle,
                    ),
                    Text(
                      "Art Team",
                      style: titleStyle.copyWith(decoration: TextDecoration.underline),
                    ),
                    Text(
                      "Dona Johnson",
                      style: bodyStyle,
                    ),
                    Text(
                      "Easwari Nair",
                      style: bodyStyle,
                    ),
                    Text(
                      "Megha Joy",
                      style: bodyStyle,
                    ),
                    Text(
                      "Rahul K",
                      style: bodyStyle,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
