import 'dart:convert';

List<RepoModel> repoModelFromJson(String str) => List<RepoModel>.from(
    json.decode(str).map((x) => RepoModel.fromJson(x)));

String repoModelToJson(List<RepoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RepoModel {
  final String? url;
  final String? forksUrl;
  final String? commitsUrl;
  final String? id;
  final String? nodeId;
  final String? gitPullUrl;
  final String? gitPushUrl;
  final String? htmlUrl;
  final Map<String, FileValue>? files;
  final bool? public;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? description;
  final int? comments;
  final dynamic user;
  final String? commentsUrl;
  final Owner? owner;
  final bool? truncated;

  RepoModel({
    this.url,
    this.forksUrl,
    this.commitsUrl,
    this.id,
    this.nodeId,
    this.gitPullUrl,
    this.gitPushUrl,
    this.htmlUrl,
    this.files,
    this.public,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.comments,
    this.user,
    this.commentsUrl,
    this.owner,
    this.truncated,
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) => RepoModel(
        url: json["url"] as String?,
        forksUrl: json["forks_url"] as String?,
        commitsUrl: json["commits_url"] as String?,
        id: json["id"] as String?,
        nodeId: json["node_id"] as String?,
        gitPullUrl: json["git_pull_url"] as String?,
        gitPushUrl: json["git_push_url"] as String?,
        htmlUrl: json["html_url"] as String?,
        files: json["files"] == null
            ? null
            : Map<String, FileValue>.from(json["files"]!.map(
                (key, value) => MapEntry(key, FileValue.fromJson(value)))),
        public: json["public"] as bool?,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"] as String),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"] as String),
        description: json["description"] as String?,
        comments: json["comments"] as int?,
        user: json["user"],
        commentsUrl: json["comments_url"] as String?,
        owner: json["owner"] == null
            ? null
            : Owner.fromJson(json["owner"] as Map<String, dynamic>),
        truncated: json["truncated"] as bool?,
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "forks_url": forksUrl,
        "commits_url": commitsUrl,
        "id": id,
        "node_id": nodeId,
        "git_pull_url": gitPullUrl,
        "git_push_url": gitPushUrl,
        "html_url": htmlUrl,
        "files": files?.map((key, value) => MapEntry(key, value.toJson())),
        "public": public,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "description": description,
        "comments": comments,
        "user": user,
        "comments_url": commentsUrl,
        "owner": owner?.toJson(),
        "truncated": truncated,
      };
}

class FileValue {
  final String? filename;
  final String? type;
  final String? language;
  final String? rawUrl;
  final int? size;

  FileValue({
    this.filename,
    this.type,
    this.language,
    this.rawUrl,
    this.size,
  });

  factory FileValue.fromJson(Map<String, dynamic> json) => FileValue(
        filename: json["filename"] as String?,
        type: json["type"] as String?,
        language: json["language"] as String?,
        rawUrl: json["raw_url"] as String?,
        size: json["size"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "filename": filename,
        "type": type,
        "language": language,
        "raw_url": rawUrl,
        "size": size,
      };
}

class Owner {
  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final String? userViewType;
  final bool? siteAdmin;

  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.userViewType,
    this.siteAdmin,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"] as String?,
        id: json["id"] as int?,
        nodeId: json["node_id"] as String?,
        avatarUrl: json["avatar_url"] as String?,
        gravatarId: json["gravatar_id"] as String?,
        url: json["url"] as String?,
        htmlUrl: json["html_url"] as String?,
        followersUrl: json["followers_url"] as String?,
        followingUrl: json["following_url"] as String?,
        gistsUrl: json["gists_url"] as String?,
        starredUrl: json["starred_url"] as String?,
        subscriptionsUrl: json["subscriptions_url"] as String?,
        organizationsUrl: json["organizations_url"] as String?,
        reposUrl: json["repos_url"] as String?,
        eventsUrl: json["events_url"] as String?,
        receivedEventsUrl: json["received_events_url"] as String?,
        type: json["type"] as String?,
        userViewType: json["user_view_type"] as String?,
        siteAdmin: json["site_admin"] as bool?,
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "user_view_type": userViewType,
        "site_admin": siteAdmin,
      };
}