import 'package:flutter_traning_app_1/pages/profile_page.dart';
import 'package:flutter_traning_app_1/pages/settings_page.dart';
import 'package:flutter_traning_app_1/pages/training_page.dart';
import 'package:flutter_traning_app_1/utils/dimensions_util.dart';
import 'package:flutter_traning_app_1/utils/library.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

import 'dart:async';

import '../app_icons.dart';
import '../data/get_url.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> bottomBarLabels = [
    'Training',
    'Profile',
    'Settings',
  ];

  final List<Widget> _pages = <Widget>[
    const TrainingPage(),
    const ProfilePage(),
    const SettingsPage(),
  ];

  /// Index
  int _selectedBottomBarIndex = 0;

  final double iconSize = Dimensions.height10 * 3;

  String? _advertisingId = '';
  // bool? _isLimitAdTrackingEnabled;
  String _timezone = 'Unknown';
  // String? _url = '';
  List<String> _availableTimezones = <String>[];

  // late final WebViewController _controller;
  final cookieManager = WebviewCookieManager();

  /// Init widget state
  /// (get advertisingId and timezone)
  @override
  initState() {
    super.initState();
    initPlatformState();
    _initTimeZone();
  }

  /// Get advertisingId
  initPlatformState() async {
    String? advertisingId;
    bool? isLimitAdTrackingEnabled;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      advertisingId = await AdvertisingId.id(true);
      print(advertisingId);
    } on PlatformException {
      advertisingId = 'Failed to get platform version.';
    }
    try {
      isLimitAdTrackingEnabled = await AdvertisingId.isLimitAdTrackingEnabled;
    } on PlatformException {
      isLimitAdTrackingEnabled = false;
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _advertisingId = advertisingId;
      // _isLimitAdTrackingEnabled = isLimitAdTrackingEnabled;
    });
  }

  /// Get timezone
  Future<void> _initTimeZone() async {
    try {
      _timezone = await FlutterNativeTimezone.getLocalTimezone();
      print(_timezone);
    } catch (e) {
      print('Could not get the local timezone');
    }
    try {
      _availableTimezones = await FlutterNativeTimezone.getAvailableTimezones();
      _availableTimezones.sort();
    } catch (e) {
      print('Could not get available timezones');
    }
    if (mounted) {
      setState(() {});
    }
  }

  /// Get cookies
  void getCookies(String url) async {
    final gotCookies = await cookieManager.getCookies(url);
    for (var item in gotCookies) {
      print(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //                 body: SafeArea(
    //                   child: Column(
    //                     children: [
    //                       Expanded(
    //                           child: Center(
    //                               child: _pages.elementAt(_selectedBottomBarIndex)))
    //                     ],
    //                   ),
    //                 ),
    //
    //                 /// Bottom navigation bar
    //                 bottomNavigationBar: BottomNavigationBar(
    //                   selectedIconTheme:
    //                       IconThemeData(size: Dimensions.height10 * 3),
    //                   selectedFontSize: Dimensions.height10 * 1.8,
    //                   unselectedFontSize: Dimensions.height10 * 1.2,
    //                   backgroundColor: Colors.grey[200],
    //                   currentIndex: _selectedBottomBarIndex,
    //                   onTap: _onItemTapped,
    //                   items: [
    //                     /// Training page tab
    //                     BottomNavigationBarItem(
    //                         label: bottomBarLabels[0],
    //                         icon: Icon(
    //                           MyFlutterApp.exercise,
    //                           size: iconSize,
    //                         )),
    //
    //                     /// Profile page tab
    //                     BottomNavigationBarItem(
    //                         label: bottomBarLabels[1],
    //                         icon: Icon(MyFlutterApp.profile, size: iconSize)),
    //
    //                     /// Settings page tab
    //                     BottomNavigationBarItem(
    //                         label: bottomBarLabels[2],
    //                         icon: Icon(MyFlutterApp.settings, size: iconSize)),
    //                   ],
    //                 ),
    //               );


    return SafeArea(
      child: FutureBuilder(
          future: GetUrl()
              .getHttp(advertisingId: _advertisingId!, timezone: _timezone),
          builder: (context, snapshot) {
            /// URL
            String url = snapshot.data ?? '';
            String _url = url;
            /// CHANGE HERE
            if (_url == '123') {
              /// Controller for webview
              WebViewController controller = WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setBackgroundColor(const Color(0x00000000))
                ..setNavigationDelegate(
                  NavigationDelegate(
                    onProgress: (int progress) {
                      // Update loading bar.
                    },
                    onPageStarted: (String url) {},
                    onPageFinished: (String url) {},
                    onWebResourceError: (WebResourceError error) {},
                    // onNavigationRequest: (NavigationRequest request) {
                    //   if (request.url.startsWith(url)) {
                    //     return NavigationDecision.prevent;
                    //   }
                    //   return NavigationDecision.navigate;
                    // },
                  ),
                )
                ..addJavaScriptChannel(
                  'Toaster',
                  onMessageReceived: (JavaScriptMessage message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message.message)),
                    );
                  },
                )
                ..loadRequest(Uri.parse(url!));
              // _controller = controller;

              /// Get cookies
              getCookies(url);

              /// Webview widget
              return Scaffold(
                  body:

                      /// Webview widget
                      WillPopScope(
                          onWillPop: () async => false,
                          child: WebViewWidget(controller: controller)));
            } else {
              /// My app
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                          child: Center(
                              child: _pages.elementAt(_selectedBottomBarIndex)))
                    ],
                  ),
                ),

                /// Bottom navigation bar
                bottomNavigationBar: BottomNavigationBar(
                  selectedIconTheme:
                      IconThemeData(size: Dimensions.height10 * 3),
                  selectedFontSize: Dimensions.height10 * 1.8,
                  unselectedFontSize: Dimensions.height10 * 1.2,
                  backgroundColor: Colors.grey[200],
                  currentIndex: _selectedBottomBarIndex,
                  onTap: _onItemTapped,
                  items: [
                    /// Training page tab
                    BottomNavigationBarItem(
                        label: bottomBarLabels[0],
                        icon: Icon(
                          MyFlutterApp.exercise,
                          size: iconSize,
                        )),

                    /// Profile page tab
                    BottomNavigationBarItem(
                        label: bottomBarLabels[1],
                        icon: Icon(MyFlutterApp.profile, size: iconSize)),

                    /// Settings page tab
                    BottomNavigationBarItem(
                        label: bottomBarLabels[2],
                        icon: Icon(MyFlutterApp.settings, size: iconSize)),
                  ],
                ),
              );

              // /// Advertising id and timezone
              // return Scaffold(
              //   body: Center(
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text(_advertisingId!),
              //         Text(_timezone),
              //       ],
              //     ),
              //   ),
              // );
            }
          }),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedBottomBarIndex = index;
    });
  }
}
