library merge_conflict_detector;

import 'github_provider.dart';
import 'package:github/server.dart';

class GitHubController {
  final String _repositoryOwner;
  final String _repositoryName;
  final GitHubProvider _gitHubProvider;

  GitHubController(
      this._repositoryOwner, this._repositoryName, this._gitHubProvider);

  List<PullRequest> RetrieveOpenPullRequests() async {
    var client = this._gitHubProvider.CreateGitHubClient();

    var pulls = client.pullRequests
        .list(new RepositorySlug(this._repositoryOwner, this._repositoryName));

    var result = await pulls.toList();

    return result;
  }
}