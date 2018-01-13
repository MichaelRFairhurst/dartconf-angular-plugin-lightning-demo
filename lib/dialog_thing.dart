import 'package:angular/angular.dart';
import 'dart:async';

@Component(
  selector: 'dialog-thing',
  template: '<h1>'
      '<ng-content select="dialog-header[bold],dialog-header[soft]"></ng-content>'
      '<ng-content select="dialog-body"></ng-content>'
      '<ng-content select="dialog-footer[left],dialog-footer[right]"></ng-content>'
      '</h1>',
)
class DialogThing {
  @Input()
  String title;

  @Output()
  Stream<String> titleChange;
}
