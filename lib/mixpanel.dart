import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixpanelManager {
  static Mixpanel? instance;

  static Future<Mixpanel> init() async {
    if (instance == null) {
      instance = await Mixpanel.init("1cd18214f64cdfbab48c581a67907a8b",
          optOutTrackingDefault: false, trackAutomaticEvents: true);
    }
    return instance!;
  }
}
