// To parse required this JSON data, do
//
//     final recentlyPlayedModel = recentlyPlayedModelFromMap(jsonString);

import 'dart:convert';

class RecentlyPlayedModel {
    RecentlyPlayedModel({
        required this.items,
        required this.next,
        required this.cursors,
        required this.limit,
        required this.href,
    });

    List<Item> items;
    String next;
    Cursors cursors;
    int limit;
    String href;

    factory RecentlyPlayedModel.fromJson(String str) => RecentlyPlayedModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RecentlyPlayedModel.fromMap(Map<String, dynamic> json) => RecentlyPlayedModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        next: json["next"],
        cursors: Cursors.fromMap(json["cursors"]),
        limit: json["limit"],
        href: json["href"],
    );

    Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "next": next,
        "cursors": cursors.toMap(),
        "limit": limit,
        "href": href,
    };
}

class Cursors {
    Cursors({
        required this.after,
        required this.before,
    });

    String after;
    String before;

    factory Cursors.fromJson(String str) => Cursors.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cursors.fromMap(Map<String, dynamic> json) => Cursors(
        after: json["after"],
        before: json["before"],
    );

    Map<String, dynamic> toMap() => {
        "after": after,
        "before": before,
    };
}

class Item {
    Item({
        required this.track,
        required this.playedAt,
        required this.context,
    });

    Track track;
    DateTime playedAt;
    dynamic context;

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        track: Track.fromMap(json["track"]),
        playedAt: DateTime.parse(json["played_at"]),
        context: json["context"],
    );

    Map<String, dynamic> toMap() => {
        "track": track.toMap(),
        "played_at": playedAt.toIso8601String(),
        "context": context,
    };
}

class Track {
    Track({
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

    Album album;
    List<Artist> artists;
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
    String type;
    String uri;

    factory Track.fromJson(String str) => Track.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Track.fromMap(Map<String, dynamic> json) => Track(
        album: Album.fromMap(json["album"]),
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromMap(x))),
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
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: json["type"],
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
        "type": type,
        "uri": uri,
    };
}

class Album {
    Album({
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

    String albumType;
    List<Artist> artists;
    List<String> availableMarkets;
    ExternalUrls externalUrls;
    String href;
    String id;
    List<Image> images;
    String name;
    String releaseDate;
    String releaseDatePrecision;
    int totalTracks;
    String type;
    String uri;

    factory Album.fromJson(String str) => Album.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Album.fromMap(Map<String, dynamic> json) => Album(
        albumType: json["album_type"],
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromMap(x))),
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        name: json["name"],
        releaseDate: json["release_date"],
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toMap() => {
        "album_type": albumType,
        "artists": List<dynamic>.from(artists.map((x) => x.toMap())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "external_urls": externalUrls.toMap(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "name": name,
        "release_date": releaseDate,
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "type": type,
        "uri": uri,
    };
}

class Artist {
    Artist({
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.name,
        required this.type,
        required this.uri,
    });

    ExternalUrls externalUrls;
    String href;
    String id;
    String name;
    String type;
    String uri;

    factory Artist.fromJson(String str) => Artist.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Artist.fromMap(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toMap() => {
        "external_urls": externalUrls.toMap(),
        "href": href,
        "id": id,
        "name": name,
        "type": type,
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
        height: json["height"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toMap() => {
        "height": height,
        "url": url,
        "width": width,
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
