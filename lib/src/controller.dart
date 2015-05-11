part of git_controller;

class GitController {
  EnsureAllRemotesExist(
      String repositoryDirectoryRoot, List<String> branchNames) {

    // todo: validate repositoryDirectoryRoot

    branchNames.forEach((branchName) =>
        EnsureRemoteExists(repositoryDirectoryRoot, branchName));
  }

  String EnsureRemoteExists(String repositoryDirectoryRoot, String branchName) {
    // todo: validate branchName. This currently assumes the format "owner/branchName" if this is from a fork.
    // If not from a fork, no remote needs to be added.
    if (!branchName.contains("/")) return "No Remote in branch name.";

    var remoteNameEndIndex = branchName.indexOf("/");

    var remoteName = branchName.substring(0, remoteNameEndIndex);

    var params = new List<string>();
    params.add("remote");
    params.add("add");
    params.add(remoteName);
    params.add("git@github.com" + branchName + ".git");

    var result = "";

    Process
        .run("git", params, workingDirectory: repositoryDirectoryRoot)
        .then((ProcessResult results) {
      if (results != null) {
        result = results.toString();
      }
    });

    return result;
  }
}
