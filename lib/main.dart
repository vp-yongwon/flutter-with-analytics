import 'mixpanel.dart';
import 'product.dart';
import 'package:flutter/material.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:google_tag_manager/google_tag_manager.dart' as gtm;

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analytics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/product': (context) => ProductScreen()
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Mixpanel mixpanel;

  @override
  void initState() {
    super.initState();
    initMixpanel();
  }

  Future<void> initMixpanel() async {
    mixpanel = await MixpanelManager.init();
    // mixpanel.track('App Initialize');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story'),
      ),
      body: Center(
        child: TextButton(
          style: null,
          child: Text('Go to PRODUCT'),
          onPressed: () {
            // 적용 예시입니다.
            gtm.pushEvent('main_click_product', data: {
              "from_screen": "STORY",
              "from_url": "https://magicplus.skmagic.com",
              "to_screen": "PRODUCT",
              "to_url": "https://magicplus.skmagic.com"
            });
            mixpanel.track("[MAIN] PRODUCT 클릭", properties: {
              "from_screen": "STORY",
              "from_url": "https://magicplus.skmagic.com",
              "to_screen": "PRODUCT",
              "to_url": "https://magicplus.skmagic.com"
            });
            Navigator.pushNamed(context, '/product');
          },
        ),
      ),
    );
  }
}
