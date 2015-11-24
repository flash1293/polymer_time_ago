@HtmlImport('time_ago.html')
library time_ago.time_ago;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('time-ago')
class TimeAgo extends PolymerElement {
  TimeAgo.created() : super.created();

  @Property(observer: 'paramChanged')
  int timestamp = null;

  @reflectable
  void paramChanged(int newParam, int oldParam) {
    this.set('calculatedTime', getTimeAgo(newParam));
  }

  static String getTimeAgo(int timestamp) {
    DateTime now = new DateTime.now();
    DateTime then = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    Duration difference = now.difference(then);
    if(difference.inDays >= 365) {
      int val = (difference.inDays / 365).floor();
      return buildAgoString("year", val);
    } else if(difference.inDays >= 30) {
      int val = (difference.inDays / 30).floor();
      return buildAgoString("month", val);
    } else if(difference.inDays >= 7) {
      int val = (difference.inDays / 7).floor();
      return buildAgoString("week", val);
    } else if(difference.inDays >= 1) {
      int val = difference.inDays.floor();
      return buildAgoString("day", val);
    } else if(difference.inHours >= 1) {
      int val = difference.inHours.floor();
      return buildAgoString("hour", val);
    } else if(difference.inMinutes >= 1) {
      int val = difference.inMinutes.floor();
      return buildAgoString("minute", val);
    } else if(difference.inSeconds >= 1) {
      int val = difference.inSeconds.floor();
      return buildAgoString("second", val);
    } else  {
      return "just now";
    }
  }

  static String buildAgoString(String unit, int value) {
    return value.toString() + " " + unit + (value != 1 ? "s": "") + " ago";
  }
}
