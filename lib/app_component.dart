import 'dart:html';
import 'package:angular/angular.dart';
import 'dialog_thing.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: const []
)
class AppComponent {
  var name = 'Angular';

  var items = ['foo', 'bar'];

  void closeWindow(MouseEvent e) {}
}
