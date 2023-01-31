import 'mixpanel.dart';
import 'package:flutter/material.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:google_tag_manager/google_tag_manager.dart' as gtm;

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late final Mixpanel mixpanel;

  @override
  void initState() {
    super.initState();
    initMixpanel();
  }

  Future<void> initMixpanel() async {
    // 로그인 시 유저 ID 식별 적용
    mixpanel = await MixpanelManager.init();
    mixpanel.identify('[User ID]');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, color: Colors.white,),
          onTap: () {
            // 적용 예시입니다.
            gtm.pushEvent('topbar_click_back', data: {
              "from_screen": "PRODUCT",
              "from_url": "https://magicplus.skmagic.com",
              "back_screen": "STORY",
              "back_url": "https://magicplus.skmagic.com"
            });
            mixpanel.track("[공통] Top Bar - Back 클릭", properties: {
              "from_screen": "PRODUCT",
              "from_url": "https://magicplus.skmagic.com",
              "back_screen": "STORY",
              "back_url": "https://magicplus.skmagic.com"
            });
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: TextButton(
          style: null,
          child: Text('Go to MAIN'),
          onPressed: () {
            // 적용 예시입니다.
            gtm.pushEvent('product_click_main', data: {
              "from_screen": "PRODUCT",
              "from_url": "https://magicplus.skmagic.com",
              "back_screen": "STORY",
              "back_url": "https://magicplus.skmagic.com"
            });
            mixpanel.track("[PRODUCT] MAIN 클릭", properties: {
              "from_screen": "PRODUCT",
              "from_url": "https://magicplus.skmagic.com",
              "back_screen": "STORY",
              "back_url": "https://magicplus.skmagic.com"
            });
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
