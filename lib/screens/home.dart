import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final FirebaseUser user;

  const Home({Key key, @required this.user}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-3684818662534238~1976184007")
        .then((response) {
      myBanner
        ..load()
        ..show();
    });

    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Column(
          children: <Widget>[
            Text(
              'Welcome ${widget.user.email}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            widget.user.email.startsWith("a")
                ? Text('you are admin and you will not get any ads')
                : Text('you are not admin and you will get the ads'),
          ],
        ));
  }
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['games', 'pubg'],
  contentUrl: 'https://flutter.io',
  // birthday: DateTime.now(),
  childDirected: false,
  //designedForFamilies: false,
  //gender:
  //  MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);
BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: "ca-app-pub-3684818662534238/8489621469",
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

// InterstitialAd myInterstitial = InterstitialAd(
//   // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//   // https://developers.google.com/admob/android/test-ads
//   // https://developers.google.com/admob/ios/test-ads
//   adUnitId: InterstitialAd.testAdUnitId,
//   targetingInfo: targetingInfo,
//   listener: (MobileAdEvent event) {
//     print("InterstitialAd event is $event");
//   },
// );
