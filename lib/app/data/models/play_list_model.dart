// ignore_for_file: constant_identifier_names

import 'dart:convert';

class PlayListModel {
    PlayListModel({
        required this.href,
        required this.items,
        required this.limit,
        required this.next,
        required this.offset,
        required this.previous,
        required this.total,
    });

    String? href;
    List<Item> items;
    int limit;
    String next;
    int offset;
    dynamic previous;
    int total;

    factory PlayListModel.fromJson(String str) => PlayListModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PlayListModel.fromMap(Map<String, dynamic> json) => PlayListModel(
        href: json["href"],
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
    );

    Map<String, dynamic> toMap() => {
        "href": href,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
    };
}

class Item {
    Item({
        required this.collaborative,
        required this.description,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.images,
        required this.name,
        required this.owner,
        required this.primaryColor,
        required this.public,
        required this.snapshotId,
        required this.tracks,
        required this.type,
        required this.uri,
    });

    bool collaborative;
    String description;
    ExternalUrls externalUrls;
    String href;
    String id;
    List<Image> images;
    String name;
    Owner owner;
    dynamic primaryColor;
    bool public;
    String snapshotId;
    Tracks tracks;
    ItemType? type;
    String uri;

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        collaborative: json["collaborative"],
        description: json["description"],
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        name: json["name"],
        owner: Owner.fromMap(json["owner"]),
        primaryColor: json["primary_color"],
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks: Tracks.fromMap(json["tracks"]),
        type: itemTypeValues.map[json["type"]],
        uri: json["uri"],
    );

    Map<String, dynamic> toMap() => {
        "collaborative": collaborative,
        "description": description,
        "external_urls": externalUrls.toMap(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "name": name,
        "owner": owner.toMap(),
        "primary_color": primaryColor,
        "public": public,
        "snapshot_id": snapshotId,
        "tracks": tracks.toMap(),
        "type": itemTypeValues.reverse[type],
        "uri": uri,
    };
}


class ExternalUrls {
    ExternalUrls({
        required this.spotify,
    });

    String spotify;

    factory ExternalUrls.fromJson(String str) => ExternalUrls.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ExternalUrls.fromMap(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
    );

    Map<String, dynamic> toMap() => {
        "spotify": spotify,
    };
}

class Image {
    Image({
        required this.height,
        required this.url,
        required this.width,
    });

    int height;
    String url;
    int width;

    factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Image.fromMap(Map<String, dynamic> json) => Image(
        height: json["height"] ?? 0,
        url: json["url"],
        width: json["width"] ?? 0,
    );

    Map<String, dynamic> toMap() => {
        "height": height,
        "url": url,
        "width": width,
    };
}

class Owner {
    Owner({
        required this.displayName,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.type,
        required this.uri,
    });

    DisplayName? displayName;
    ExternalUrls? externalUrls;
    String href;
    Id? id;
    OwnerType? type;
    String? uri;

    factory Owner.fromJson(String str) => Owner.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Owner.fromMap(Map<String, dynamic> json) => Owner(
        displayName: displayNameValues.map[json["display_name"]],
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: idValues.map[json["id"]],
        type: ownerTypeValues.map[json["type"]],
        uri: json["uri"],
    );

    Map<String, dynamic> toMap() => {
        "display_name": displayNameValues.reverse[displayName],
        "external_urls": externalUrls,
        "href": href,
        "id": idValues.reverse[id],
        "type": ownerTypeValues.reverse[type],
        "uri": uri,
    };
}

enum DisplayName { SPOTIFY, GABRIEL_ISAAC, GABRIEL_ISAAC_CHAY, CUCO }

final displayNameValues = EnumValues({
    "Cuco": DisplayName.CUCO,
    "Gabriel Isaac": DisplayName.GABRIEL_ISAAC,
    "Gabriel Isaac Chay": DisplayName.GABRIEL_ISAAC_CHAY,
    "Spotify": DisplayName.SPOTIFY
});

enum Id { SPOTIFY, H1_NE7_FH4_NNG3_J4_QUCW12_K0_E59, ESCORCIA78, TRAPPEDINDEATHSTAR }

final idValues = EnumValues({
    "escorcia78": Id.ESCORCIA78,
    "h1ne7fh4nng3j4qucw12k0e59": Id.H1_NE7_FH4_NNG3_J4_QUCW12_K0_E59,
    "spotify": Id.SPOTIFY,
    "trappedindeathstar": Id.TRAPPEDINDEATHSTAR
});

enum OwnerType { USER }

final ownerTypeValues = EnumValues({
    "user": OwnerType.USER
});

class Tracks {
    Tracks({
        required this.href,
        required this.total,
    });

    String href;
    int total;

    factory Tracks.fromJson(String str) => Tracks.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Tracks.fromMap(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        total: json["total"],
    );

    Map<String, dynamic> toMap() => {
        "href": href,
        "total": total,
    };
}

enum ItemType { PLAYLIST }

final itemTypeValues = EnumValues({
    "playlist": ItemType.PLAYLIST
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        // ignore: prefer_conditional_assignment
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => MapEntry(v, k));
        }
        return reverseMap!;
    }
}
