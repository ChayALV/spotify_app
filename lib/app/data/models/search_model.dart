// ignore_for_file: constant_identifier_names

import 'dart:convert';

class SearchModel {
    SearchModel({
        required this.albums,
        required this.artists,
        required this.tracks,
        required this.playlists,
    });

    Albums albums;
    Artists artists;
    Tracks tracks;
    Playlists playlists;

    factory SearchModel.fromJson(String str) => SearchModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SearchModel.fromMap(Map<String, dynamic> json) => SearchModel(
        albums: Albums.fromMap(json["albums"]),
        artists: Artists.fromMap(json["artists"]),
        tracks: Tracks.fromMap(json["tracks"]),
        playlists: Playlists.fromMap(json["playlists"]),
    );

    Map<String, dynamic> toMap() => {
        "albums": albums.toMap(),
        "artists": artists.toMap(),
        "tracks": tracks.toMap(),
        "playlists": playlists.toMap(),
    };
}

class Albums {
    Albums({
        required this.href,
        required this.items,
        required this.limit,
        required this.next,
        required this.offset,
        required this.previous,
        required this.total,
    });

    String href;
    List<AlbumElement> items;
    int limit;
    String? next;
    int offset;
    dynamic previous;
    int total;

    factory Albums.fromJson(String str) => Albums.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Albums.fromMap(Map<String, dynamic> json) => Albums(
        href: json["href"],
        items: List<AlbumElement>.from(json["items"].map((x) => AlbumElement.fromMap(x))),
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

class AlbumElement {
    AlbumElement({
        required this.albumType,
        required this.artists,
        required this.availableMarkets,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.images,
        required this.name,
        required this.releaseDate,
        required this.releaseDatePrecision,
        required this.totalTracks,
        required this.type,
        required this.uri,
    });

    AlbumTypeEnum? albumType;
    List<Owner> artists;
    List<String> availableMarkets;
    ExternalUrls externalUrls;
    String href;
    String id;
    List<Image> images;
    String name;
    String releaseDate;
    ReleaseDatePrecision? releaseDatePrecision;
    int totalTracks;
    AlbumTypeEnum? type;
    String uri;

    factory AlbumElement.fromJson(String str) => AlbumElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AlbumElement.fromMap(Map<String, dynamic> json) => AlbumElement(
        albumType: albumTypeEnumValues.map[json["album_type"]],
        artists: List<Owner>.from(json["artists"].map((x) => Owner.fromMap(x))),
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        name: json["name"],
        releaseDate: json["release_date"],
        releaseDatePrecision: releaseDatePrecisionValues.map[json["release_date_precision"]],
        totalTracks: json["total_tracks"],
        type: albumTypeEnumValues.map[json["type"]],
        uri: json["uri"],
    );

    Map<String, dynamic> toMap() => {
        "album_type": albumTypeEnumValues.reverse[albumType],
        "artists": List<dynamic>.from(artists.map((x) => x.toMap())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "external_urls": externalUrls.toMap(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "name": name,
        "release_date": releaseDate,
        "release_date_precision": releaseDatePrecisionValues.reverse[releaseDatePrecision],
        "total_tracks": totalTracks,
        "type": albumTypeEnumValues.reverse[type],
        "uri": uri,
    };
}

enum AlbumTypeEnum { ALBUM, SINGLE }

final albumTypeEnumValues = EnumValues({
    "album": AlbumTypeEnum.ALBUM,
    "single": AlbumTypeEnum.SINGLE
});

class Owner {
    Owner({
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.name,
        required this.type,
        required this.uri,
        required this.displayName,
    });

    ExternalUrls externalUrls;
    String href;
    String id;
    String name;
    OwnerType? type;
    String uri;
    String displayName;

    factory Owner.fromJson(String str) => Owner.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Owner.fromMap(Map<String, dynamic> json) => Owner(
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"] ?? '',
        type: ownerTypeValues.map[json["type"]],
        uri: json["uri"],
        displayName: json["display_name"] ?? '',
    );

    Map<String, dynamic> toMap() => {
        "external_urls": externalUrls.toMap(),
        "href": href,
        "id": id,
        "name": name,
        "type": ownerTypeValues.reverse[type],
        "uri": uri,
        "display_name": displayName,
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

enum OwnerType { ARTIST, USER }

final ownerTypeValues = EnumValues({
    "artist": OwnerType.ARTIST,
    "user": OwnerType.USER
});

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
        width:json["width"] ?? 0,
    );

    Map<String, dynamic> toMap() => {
        "height": height,
        "url": url,
        "width": width,
    };
}

enum ReleaseDatePrecision { DAY, YEAR }

final releaseDatePrecisionValues = EnumValues({
    "day": ReleaseDatePrecision.DAY,
    "year": ReleaseDatePrecision.YEAR
});

class Artists {
    Artists({
        required this.href,
        required this.items,
        required this.limit,
        required this.next,
        required this.offset,
        required this.previous,
        required this.total,
    });

    String href;
    List<ArtistsItem> items;
    int limit;
    String? next;
    int offset;
    dynamic previous;
    int total;

    factory Artists.fromJson(String str) => Artists.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Artists.fromMap(Map<String, dynamic> json) => Artists(
        href: json["href"],
        items: List<ArtistsItem>.from(json["items"].map((x) => ArtistsItem.fromMap(x))),
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

class ArtistsItem {
    ArtistsItem({
        required this.externalUrls,
        required this.followers,
        required this.genres,
        required this.href,
        required this.id,
        required this.images,
        required this.name,
        required this.popularity,
        required this.type,
        required this.uri,
    });

    ExternalUrls externalUrls;
    Followers followers;
    List<String> genres;
    String href;
    String id;
    List<Image> images;
    String name;
    int popularity;
    OwnerType? type;
    String uri;

    factory ArtistsItem.fromJson(String str) => ArtistsItem.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ArtistsItem.fromMap(Map<String, dynamic> json) => ArtistsItem(
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        followers: Followers.fromMap(json["followers"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: ownerTypeValues.map[json["type"]],
        uri: json["uri"],
    );

    Map<String, dynamic> toMap() => {
        "external_urls": externalUrls.toMap(),
        "followers": followers.toMap(),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "name": name,
        "popularity": popularity,
        "type": ownerTypeValues.reverse[type],
        "uri": uri,
    };
}

class Followers {
    Followers({
        required this.href,
        required this.total,
    });

    String href;
    int total;

    factory Followers.fromJson(String str) => Followers.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Followers.fromMap(Map<String, dynamic> json) => Followers(
        href: json["href"] ?? '',
        total: json["total"],
    );

    Map<String, dynamic> toMap() => {
        "href": href,
        "total": total,
    };
}

class Playlists {
    Playlists({
        required this.href,
        required this.items,
        required this.limit,
        required this.next,
        required this.offset,
        required this.previous,
        required this.total,
    });

    String href;
    List<PlaylistsItem> items;
    int limit;
    String? next;
    int offset;
    dynamic previous;
    int total;

    factory Playlists.fromJson(String str) => Playlists.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Playlists.fromMap(Map<String, dynamic> json) => Playlists(
        href: json["href"],
        items: List<PlaylistsItem>.from(json["items"].map((x) => PlaylistsItem.fromMap(x))),
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

class PlaylistsItem {
    PlaylistsItem({
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
    dynamic public;
    String snapshotId;
    Followers tracks;
    PurpleType? type;
    String uri;

    factory PlaylistsItem.fromJson(String str) => PlaylistsItem.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PlaylistsItem.fromMap(Map<String, dynamic> json) => PlaylistsItem(
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
        tracks: Followers.fromMap(json["tracks"]),
        type: purpleTypeValues.map[json["type"]],
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
        "type": purpleTypeValues.reverse[type],
        "uri": uri,
    };
}

enum PurpleType { PLAYLIST }

final purpleTypeValues = EnumValues({
    "playlist": PurpleType.PLAYLIST
});

class Tracks {
    Tracks({
        required this.href,
        required this.items,
        required this.limit,
        required this.next,
        required this.offset,
        required this.previous,
        required this.total,
    });

    String href;
    List<TracksItem> items;
    int limit;
    String? next;
    int offset;
    dynamic previous;
    int total;

    factory Tracks.fromJson(String str) => Tracks.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Tracks.fromMap(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        items: List<TracksItem>.from(json["items"].map((x) => TracksItem.fromMap(x))),
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

class TracksItem {
    TracksItem({
        required this.album,
        required this.artists,
        required this.availableMarkets,
        required this.discNumber,
        required this.durationMs,
        required this.explicit,
        required this.externalIds,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.isLocal,
        required this.name,
        required this.popularity,
        required this.previewUrl,
        required this.trackNumber,
        required this.type,
        required this.uri,
    });

    AlbumElement album;
    List<Owner> artists;
    List<String> availableMarkets;
    int discNumber;
    int durationMs;
    bool explicit;
    ExternalIds externalIds;
    ExternalUrls externalUrls;
    String href;
    String id;
    bool isLocal;
    String name;
    int popularity;
    String previewUrl;
    int trackNumber;
    FluffyType? type;
    String uri;

    factory TracksItem.fromJson(String str) => TracksItem.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TracksItem.fromMap(Map<String, dynamic> json) => TracksItem(
        album: AlbumElement.fromMap(json["album"]),
        artists: List<Owner>.from(json["artists"].map((x) => Owner.fromMap(x))),
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalIds: ExternalIds.fromMap(json["external_ids"]),
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"] ?? '',
        trackNumber: json["track_number"],
        type: fluffyTypeValues.map[json["type"]],
        uri: json["uri"],
    );

    Map<String, dynamic> toMap() => {
        "album": album.toMap(),
        "artists": List<dynamic>.from(artists.map((x) => x.toMap())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_ids": externalIds.toMap(),
        "external_urls": externalUrls.toMap(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": fluffyTypeValues.reverse[type],
        "uri": uri,
    };
}

class ExternalIds {
    ExternalIds({
        required this.isrc,
    });

    String isrc;

    factory ExternalIds.fromJson(String str) => ExternalIds.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ExternalIds.fromMap(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
    );

    Map<String, dynamic> toMap() => {
        "isrc": isrc,
    };
}

enum FluffyType { TRACK }

final fluffyTypeValues = EnumValues({
    "track": FluffyType.TRACK
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
