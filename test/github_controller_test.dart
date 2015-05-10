import 'package:merge_conflict_detector/github_controller.dart';
import 'package:merge_conflict_detector/github_provider.dart';
import 'package:unittest/unittest.dart';

main() {
  group('GitHubController', () {
    test('temporary test harness', () {
      var accessToken = '445b794f5b1dcfbee707a4e5a7f0e1149a0d6e13';

      var gitHubProvider = new GitHubProvider(accessToken);

      var sut = new GitHubController(
          'johnpryan', 'merge_conflict_detector', gitHubProvider);

      var pulls = sut.RetrieveOpenPullRequests();
    });
  });
}
