import 'package:flutter_test/flutter_test.dart';
import 'package:gorestapp/extension/string_extensions.dart';

void main() {
  test(
    'Given a string, '
    'when calculating initials,'
    'then it should give correct initials',
    () {
      expect('Shivani Bagal'.getInitials(), 'SB');
      expect('prathamesh jadhav'.getInitials(), 'PJ');
      expect('prathamesh Jadhav'.getInitials(), 'PJ');
      expect('Prathamesh jadhav'.getInitials(), 'PJ');
      expect(''.getInitials(), '');
      expect('10 prathamesh jadhav'.getInitials(), '1P');
      expect(' Mr prathamesh jadhav'.getInitials(), 'MP');
      expect('prathamesh'.getInitials(), 'P');
      expect(' '.getInitials(), '');
    },
  );
}
