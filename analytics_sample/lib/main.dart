import 'mixpanel.dart';
import 'profile.dart';
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
        '/profile': (context) => ProfileScreen()
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
        title: Text('Home'),
      ),
      body: Center(
        child: TextButton(
          style: null,
          child: Text('Go to Profile'),
          onPressed: () {
            gtm.pushEvent('click_profile_button_at_HOME');
            mixpanel.track("[Home Screen] - Pressed Profile Screen Button");
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ),
    );
  }
}