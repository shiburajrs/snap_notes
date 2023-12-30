import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_notes_app/screens/dashboard/Dashboard.dart';
import 'package:snap_notes_app/themes/ThemeManager.dart';
import 'package:snap_notes_app/themes/ThemeNotifier.dart';
import 'package:snap_notes_app/utils/ColorUtils.dart';
import 'package:snap_notes_app/utils/FontUtils.dart';

void main() {
  runApp( ChangeNotifierProvider(
    create: (context) => ThemeNotifier(),
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {

   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        Future.delayed(Duration(seconds: 3),(){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Dashboard()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(backgroundColor: ColorUtils.appHighLogoColor,
      body: Container(height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          ColorUtils.appLogoColor.withOpacity(0.8),ColorUtils.appHighLogoColor
        ],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child: Align(alignment: Alignment.bottomCenter,
                child: Image.asset("assets/images/app_logo.png",height: 100,fit: BoxFit.cover,)),
            height: 200,width: 250,),
            SizedBox(height: 25,),
            CustomText(
              text: 'Snap Notes',
              fontSize: 25.0,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              textAlign: TextAlign.center,
            ),],
        ),
      ),
    );
  }
}
