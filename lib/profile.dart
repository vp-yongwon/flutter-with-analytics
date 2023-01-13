import 'mixpanel.dart';
import 'package:flutter/material.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:google_tag_manager/google_tag_manager.dart' as gtm;

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final Mixpanel mixpanel;

  @override
  void initState() {
    super.initState();
    initMixpanel();
  }

  Future<void> initMixpanel() async {
    mixpanel = await MixpanelManager.init();
    mixpanel.alias('New Alias', '[User ID]');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, color: Colors.white,),
          onTap: () {
            gtm.pushEvent('click_back_button_at_PROFILE');
            mixpanel.track("[Profile Screen] - Back Button");
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: TextButton(
          style: null,
          onPressed: () {
            gtm.pushEvent('click_home_button_at_PROFILE');
            mixpanel.track("[Profile Screen] - Home Screen Button");
            Navigator.pop(context);
          },
          child: Text('Go to Home'),
        ),
      ),
    );
  }
}
