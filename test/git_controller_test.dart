import 'package:merge_conflict_detector/git_controller.dart';
import 'package:unittest/unittest.dart';

class MockGitController implements GitController {
  noSuchMethod(Invocation inv) {
    print('called ${inv.memberName}');
  }
}

main() {
  group('GitController', () {
    test('Ensure Remotes', () {
      var branchNames = new List<String>();
      branchNames.add('aaronhoffman/merge_conflict_detector');
      branchNames.add('StoneFinch/merge_conflict_detector');

      var sut = new GitController();

      sut.EnsureAllRemotesExist(
          '/Users/Aaron/Dev/Test/merge_conflict_detector', branchNames);
    });
  });
}
