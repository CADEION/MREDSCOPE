// To parse this JSON data, do
//
//     final repoModel = repoModelFromJson(jsonString);

import 'dart:convert';

List<RepoModel> repoModelFromJson(String str) => List<RepoModel>.from(json.decode(str).map((x) => RepoModel.fromJson(x)));

String repoModelToJson(List<RepoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RepoModel {
    String? url;
    String? forksUrl;
    String? commitsUrl;
    String? id;
    String? nodeId;
    String? gitPullUrl;
    String? gitPushUrl;
    String? htmlUrl;
    Map<String, FileValue>? files;
    bool? public;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? description;
    int? comments;
    dynamic user;
    String? commentsUrl;
    Owner? owner;
    bool? truncated;

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
        url: json["url"],
        forksUrl: json["forks_url"],
        commitsUrl: json["commits_url"],
        id: json["id"],
        nodeId: json["node_id"],
        gitPullUrl: json["git_pull_url"],
        gitPushUrl: json["git_push_url"],
        htmlUrl: json["html_url"],
        files: Map.from(json["files"]!).map((k, v) => MapEntry<String, FileValue>(k, FileValue.fromJson(v))),
        public: json["public"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        description: json["description"],
        comments: json["comments"],
        user: json["user"],
        commentsUrl: json["comments_url"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        truncated: json["truncated"],
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
        "files": Map.from(files!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
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
    String? filename;
    FileType? type;
    String? language;
    String? rawUrl;
    int? size;

    FileValue({
        this.filename,
        this.type,
        this.language,
        this.rawUrl,
        this.size,
    });

    factory FileValue.fromJson(Map<String, dynamic> json) => FileValue(
        filename: json["filename"],
        type: fileTypeValues.map[json["type"]]!,
        language: json["language"],
        rawUrl: json["raw_url"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "filename": filename,
        "type": fileTypeValues.reverse[type],
        "language": language,
        "raw_url": rawUrl,
        "size": size,
    };
}

enum FileType {
    APPLICATION_XML,
    APPLICATION_X_PYTHON,
    APPLICATION_X_SH,
    TEXT_CSS,
    TEXT_MARKDOWN,
    TEXT_PLAIN
}

final fileTypeValues = EnumValues({
    "application/xml": FileType.APPLICATION_XML,
    "application/x-python": FileType.APPLICATION_X_PYTHON,
    "application/x-sh": FileType.APPLICATION_X_SH,
    "text/css": FileType.TEXT_CSS,
    "text/markdown": FileType.TEXT_MARKDOWN,
    "text/plain": FileType.TEXT_PLAIN
});

class Owner {
    String? login;
    int? id;
    String? nodeId;
    String? avatarUrl;
    String? gravatarId;
    String? url;
    String? htmlUrl;
    String? followersUrl;
    String? followingUrl;
    String? gistsUrl;
    String? starredUrl;
    String? subscriptionsUrl;
    String? organizationsUrl;
    String? reposUrl;
    String? eventsUrl;
    String? receivedEventsUrl;
    OwnerType? type;
    UserViewType? userViewType;
    bool? siteAdmin;

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
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: ownerTypeValues.map[json["type"]]!,
        userViewType: userViewTypeValues.map[json["user_view_type"]]!,
        siteAdmin: json["site_admin"],
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
        "type": ownerTypeValues.reverse[type],
        "user_view_type": userViewTypeValues.reverse[userViewType],
        "site_admin": siteAdmin,
    };
}

enum OwnerType {
    USER
}

final ownerTypeValues = EnumValues({
    "User": OwnerType.USER
});

enum UserViewType {
    PUBLIC
}

final userViewTypeValues = EnumValues({
    "public": UserViewType.PUBLIC
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
