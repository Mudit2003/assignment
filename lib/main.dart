// ignore_for_file: prefer_const_constructors

import 'package:assignment/Util/colors.dart';
import 'package:assignment/Util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'on_off_button.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.pinkishColor, // Change the color as needed
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: ResponsiveClass(),
    );
  }
}

class ResponsiveClass extends StatefulWidget {
  const ResponsiveClass({super.key});

  @override
  State<ResponsiveClass> createState() => _ResponsiveClassState();
}

class _ResponsiveClassState extends State<ResponsiveClass> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Dimensions.update(constraints.biggest);

        return HomePage();
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("${Dimensions.screenHeight} , ${Dimensions.screenWidth}");
    return Scaffold(
      backgroundColor: AppColors.creamColor,
      body: Stack(
        children: [
          appBar(),
          SingleChildScrollView(
            padding: Dimensions.padding,
            child: Column(
              children: [
                appHeaderElement(),
                SizedBox(
                  height: Dimensions.responsiveHeight(30),
                ),
                grid1(),
                addSpace(),
                uploadPrescription(),
                addSpace(),
                reminder(),
                addSpace(),
                consultDoctor(),
                addSpace(),
                specialistContainer(),
                addSpace(),
                donorsContainer(),
                addSpace(),
                gridView(),
                addSpace(),
                gridView(),
                addSpace(),
                Container(
                  height: Dimensions.responsiveHeight(200),
                  child: Column(children: [
                    headingRow("Pharmacy", "View all"),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, item) => Container(
                          margin: EdgeInsets.only(right: 20),
                          width: Dimensions.responsiveWidth(120),
                          height: Dimensions.responsiveHeight(100),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        shrinkWrap: true,
                      ),
                    ),
                  ]),
                ),
                addSpace(),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: Dimensions.responsiveHeight(200),
                  // width: Dimensions.screenHeight - 2 * Dimensions.padding.left,
                  child: Column(children: [
                    headingRow("Hospital", "View all"),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, item) => Container(
                          margin: EdgeInsets.only(right: 20),
                          width: Dimensions.responsiveWidth(120),
                          height: Dimensions.responsiveHeight(100),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        shrinkWrap: true,
                      ),
                    ),
                  ]),
                ),
                addSpace(),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: Dimensions.responsiveHeight(200),
                  child: Column(children: [
                    headingRow("Trending Articles", "View all"),
                    Expanded(
                        child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, item) => Container(
                        margin: EdgeInsets.only(right: 20),
                        width: Dimensions.responsiveWidth(120),
                        height: Dimensions.responsiveHeight(100),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      shrinkWrap: true,
                      addAutomaticKeepAlives: true,
                    )),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget grid1() {
    return Container(
      height: Dimensions.responsiveHeight(450),
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.responsiveHeight(20),
        horizontal: Dimensions.responsiveWidth(20),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.responsiveWidth(20)),
        color: Colors.white,
      ),
      child: gridCreate(AppColors.greenishColor, AppColors.lightBeigeColor),
    );
  }

  Align appHeaderElement() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        // width: Dimensions.responsiveWidth(100),
        height: Dimensions.responsiveHeight(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: Dimensions.responsiveWidth(100),
                  width: Dimensions.responsiveHeight(100),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                ),
                SizedBox(
                  width: Dimensions.responsiveWidth(20),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      boldText("Mudit Rai"),
                      smallText("Welcome Back")
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: Dimensions.responsiveHeight(48),
                ))
          ],
        ),
      ),
    );
  }

  Container gridView() {
    return Container(
      height: Dimensions.responsiveHeight(400),
      child: Column(children: [
        headingRow("Health Checkups", "View all"),
        gridCreate(Colors.white, Colors.blueGrey),
      ]),
    );
  }

  Container donorsContainer() {
    return Container(
      child: Column(
        children: [
          headingRow("Top Donor", "View all"),
          textButtonRow("Country", "Local", "Recent"),
          Container(
            height: Dimensions.responsiveHeight(200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                personCard(100),
                personCard(140),
                personCard(100),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container specialistContainer() {
    return Container(
      child: Column(
        children: [
          headingRow("Specialists", "View all"),
          textButtonRow("Cardiologist", "Dentists", "General Physician"),
          addMinorSpace(),
          Container(
            height: Dimensions.responsiveHeight(200),
            width: Dimensions.screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textButtonRow(String button1, String button2, String buttonn) {
    return OnOffButton(buttonLabel: [button1, button2, buttonn]);
  }

  Container headingRow(String headingText, String buttonText) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          boldText(headingText),
          underlinedTextButton(buttonText),
        ],
      ),
    );
  }

  TextButton underlinedTextButton(String text) {
    return TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: AppColors.reddishColor,
          ),
        ));
  }

  Container textCard() {
    return Container(
      child: Column(children: [
        Row(
          children: [
            boldText("Health Checkups"),
          ],
        )
      ]),
    );
  }

  Container personCard(double cardRadius) {
    // an object of person model will be required as a parameter
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: Dimensions.responsiveHeight(cardRadius),
            width: Dimensions.responsiveWidth(cardRadius),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(
                  side: BorderSide(
                color: AppColors.reddishColor,
                width: 2.0,
              )),
            ),
          ),
          SizedBox(
            height: Dimensions.responsiveHeight(10),
          ),
          Text("Person 1"),
        ],
      ),
    );
  }

  Widget largeText(String text) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black, fontSize: Dimensions.responsiveHeight(20)),
    );
  }

  Widget smallText(String text, {Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Dimensions.screenWidth < Dimensions.screenHeight / 2
              ? Dimensions.responsiveWidth(12)
              : Dimensions.responsiveHeight(12),
          color: color,
          fontWeight: FontWeight.w400),
    );
  }

  Widget boldText(String text, {double size = 24}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Dimensions.screenWidth < Dimensions.screenHeight / 2
              ? Dimensions.responsiveWidth(20)
              : Dimensions.responsiveHeight(20),
          color: Colors.black,
          fontWeight: FontWeight.bold),
    );
  }

  Widget multiLineText(String text) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: Dimensions.screenWidth < Dimensions.screenHeight / 2
              ? Dimensions.responsiveWidth(14)
              : Dimensions.responsiveHeight(14),
          fontWeight: FontWeight.normal),
    );
  }

  ClipRRect bottomNavBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "hello"),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "hi"),
        ],
      ),
    );
  }

  Container reminder() {
    return Container(
      height: Dimensions.responsiveHeight(200),
      width: Dimensions.screenWidth,
      decoration: BoxDecoration(
          color: AppColors.greyColor,
          boxShadow: [
            BoxShadow(color: AppColors.greyColor, offset: Offset(-100, 0)),
            BoxShadow(color: AppColors.greyColor, offset: Offset(100, 0)),
            BoxShadow(
                color: AppColors.blackishColor.withOpacity(0.1),
                offset: Offset(-5, 3)),
            BoxShadow(
                color: AppColors.blackishColor.withOpacity(0.1),
                offset: Offset(5, 3)),
          ],
          borderRadius: BorderRadius.circular(Dimensions.responsiveWidth(20))),
      child: Center(child: largeText("Reminder")),
    );
  }

  Container uploadPrescription() {
    return Container(
      padding: Dimensions.widgetPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.responsiveWidth(10)),
        color: Colors.white,
      ),
      height: Dimensions.responsiveHeight(100),
      // width: Dimensions.responsiveWidth(500),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              largeText("Online Medicines"),
              Container(
                  width: Dimensions.responsiveWidth(120),
                  child: multiLineText("Medicines delivered at your doorstep")),
            ],
          ),
          Container(
            // width: Dimensions.responsiveWidth(160),
            child: TextButton(
              child: smallText(
                "Upload Prescription",
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.circular(Dimensions.circularBorderRadius)),
          )
        ],
      ),
    );
  }

  Container consultDoctor() {
    return Container(
      padding: Dimensions.widgetPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.responsiveWidth(10)),
        color: Colors.white,
      ),
      height: Dimensions.responsiveHeight(100),
      // width: Dimensions.responsiveWidth(500),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText("Consult With a doctor now!", size: 20),
              Container(
                  width: Dimensions.responsiveWidth(120),
                  child: multiLineText("From our top specialists near you")),
            ],
          ),
          Container(
            // width: Dimensions.responsiveWidth(160),
            child: TextButton(
              child: smallText(
                "Consult",
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.circular(Dimensions.circularBorderRadius)),
          )
        ],
      ),
    );
  }

  Widget gridCreate(Color primaryColor, Color secondaryColor) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: 6,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: Dimensions.responsiveHeight(140),
          width: Dimensions.responsiveWidth(100),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(Dimensions.responsiveWidth(5)),
            ),
          ),
        );
      },
    );
  }
}

Container appBar() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: Dimensions.responsiveHeight(50)),
    height: Dimensions.responsiveHeight(400),
    decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.only(
        bottomEnd: Radius.circular(Dimensions.responsiveWidth(100)),
        bottomStart: Radius.circular(Dimensions.responsiveWidth(100)),
      ),
      color: AppColors.pinkishColor,
    ),
  );
}

Widget addSpace() => SizedBox(
      height: Dimensions.responsiveHeight(20),
    );

Widget addMinorSpace() => SizedBox(
      height: Dimensions.responsiveHeight(10),
    );
