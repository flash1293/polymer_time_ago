# polymer_time_ago

A small polymer-component providing the same functionality as `Time from now` of the moment.js library: http://momentjs.com/docs/#/displaying/fromnow/.
There is only an english locale so far.

## Usage

Include this package as dependency in your pubspec-file and include the time_ago-file: `import 'package:polymer_time_ago/time_ago.dart';` You are now able to use the `<time-ago timestamp="..." />`-Element in your Templates or `TimeAgo.getTimeAgo(int timestamp)` in your dartfile.

## Example

foo.dart:
```dart
import 'dart:async';
import 'package:polymer/polymer.dart';
import 'package:polymer_time_ago/time_ago.dart';

Future main() async {
  await initPolymer();
}
```

foo.html:
```html
<!DOCTYPE html>
<html>
  <head>
    <script async type="application/dart" src="foo.dart"></script>
    <script src="packages/browser/dart.js"></script>    
  </head>
  <body>
    <table>
      <tr><td>linux epoch</td><td><time-ago timestamp="0" /></td></tr>
      <tr><td>nearly now</td><td><time-ago timestamp="1448342676000" /></td></tr>
      <tr><td>two hours ago</td><td><time-ago timestamp="1448335476000" /></td></tr>
      <tr><td>two days ago</td><td><time-ago timestamp="1448162676000" /></td></tr>
      <tr><td>two months ago</td><td><time-ago timestamp="1442892276000" /></td></tr>
    </table>
  </body>
</html>
```


Output:
```
linux epoch	45 years ago
nearly now	3 minutes ago
two hours ago	2 hours ago
two days ago	2 days ago
two months ago	2 months ago
```