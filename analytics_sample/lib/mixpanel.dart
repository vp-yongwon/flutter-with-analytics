import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixpanelManager {
  static Mixpanel? instance;

  static Future<Mixpanel> init() async {
    if (instance == null) {
      instance = await Mixpanel.init("e8cd199affd47e5d756b68711b428abc",
          optOutTrackingDefault: false, trackAutomaticEvents: true);
    }
    return instance!;
  }
}
