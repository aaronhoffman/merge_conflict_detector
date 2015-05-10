library merge_conflict_detector;

import 'package:github/server.dart';

class GitHubProvider {
  final String _gitHubAccessToken;

  GitHubProvider(this._gitHubAccessToken);

  GitHub CreateGitHubClient() {
    return createGitHubClient(auth: new Authentication.withToken(this._gitHubAccessToken));
  }
}
