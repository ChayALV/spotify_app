// To parse required this JSON data, do
//
//     final albunModel = albunModelFromMap(jsonString);

// ignore_for_file: constant_identifier_names, prefer_conditional_assignment

import 'dart:convert';

class AlbumModel {
    AlbumModel({
        required this.albumType,
        required this.artists,
        required this.copyrights,
        required this.externalIds,
        required this.externalUrls,
        required this.genres,
        required this.href,
        required this.id,
        required this.images,
        required this.label,
        required this.name,
        required this.popularity,
        required this.releaseDate,
        required this.releaseDatePrecision,
        required this.totalTracks,
        required this.tracks,
        required this.type,
        required this.uri,
    });

    String albumType;
    List<Artist> artists;
    List<Copyright> copyrights;
    ExternalIds externalIds;
    ExternalUrls externalUrls;
    List<dynamic> genres;
    String href;
    String id;
    List<Image> images;
    String label;
    String? name;
    int popularity;
    String releaseDate;
    String releaseDatePrecision;
    int totalTracks;
    Tracks tracks;
    String type;
    String uri;

    factory AlbumModel.fromJson(String str) => AlbumModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AlbumModel.fromMap(Map<String, dynamic> json) => AlbumModel(
        albumType: json["album_type"],
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromMap(x))),
        copyrights: List<Copyright>.from(json["copyrights"].map((x) => Copyright.fromMap(x))),
        externalIds: ExternalIds.fromMap(json["external_ids"]),
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        genres: List<dynamic>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        label: json["label"],
        name: json["name"],
        popularity: json["popularity"],
        releaseDate:json["release_date"],
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        tracks: Tracks.fromMap(json["tracks"]),
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toMap() => {
        "album_type": albumType,
        "artists": List<dynamic>.from(artists.map((x) => x.toMap())),
        "copyrights": List<dynamic>.from(copyrights.map((x) => x.toMap())),
        "external_ids": externalIds.toMap(),
        "external_urls": externalUrls.toMap(),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "label": label,
        "name": name,
        "popularity": popularity,
        "release_date": releaseDate,
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "tracks": tracks.toMap(),
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
    Id? id;
    String name;
    ArtistType? type;
    Uri? uri;

    factory Artist.fromJson(String str) => Artist.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Artist.fromMap(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: idValues.map[json["id"]],
        name: json["name"],
        type: artistTypeValues.map[json["type"]],
        uri: uriValues.map[json["uri"]],
    );

    Map<String, dynamic> toMap() => {
        "external_urls": externalUrls.toMap(),
        "href": href,
        "id": idValues.reverse[id],
        "name": name,
        "type": artistTypeValues.reverse[type],
        "uri": uriValues.reverse[uri],
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

enum Id { THE_2_YE2_WGW4_GIM_LV2_E_A_KYK1_NB }

final idValues = EnumValues({
    "2ye2Wgw4gimLv2eAKyk1NB": Id.THE_2_YE2_WGW4_GIM_LV2_E_A_KYK1_NB
});

enum ArtistType { ARTIST }

final artistTypeValues = EnumValues({
    "artist": ArtistType.ARTIST
});

enum Uri { SPOTIFY_ARTIST_2_YE2_WGW4_GIM_LV2_E_A_KYK1_NB }

final uriValues = EnumValues({
    "spotify:artist:2ye2Wgw4gimLv2eAKyk1NB": Uri.SPOTIFY_ARTIST_2_YE2_WGW4_GIM_LV2_E_A_KYK1_NB
});

class Copyright {
    Copyright({
        required this.text,
        required this.type,
    });

    String text;
    String type;

    factory Copyright.fromJson(String str) => Copyright.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Copyright.fromMap(Map<String, dynamic> json) => Copyright(
        text: json["text"],
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "text": text,
        "type": type,
    };
}

class ExternalIds {
    ExternalIds({
        required this.upc,
    });

    String upc;

    factory ExternalIds.fromJson(String str) => ExternalIds.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ExternalIds.fromMap(Map<String, dynamic> json) => ExternalIds(
        upc: json["upc"],
    );

    Map<String, dynamic> toMap() => {
        "upc": upc,
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
    List<Item> items;
    int limit;
    dynamic next;
    int offset;
    dynamic previous;
    int total;

    factory Tracks.fromJson(String str) => Tracks.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Tracks.fromMap(Map<String, dynamic> json) => Tracks(
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
        required this.artists,
        required this.discNumber,
        required this.durationMs,
        required this.explicit,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.isLocal,
        required this.isPlayable,
        required this.name,
        required this.previewUrl,
        required this.trackNumber,
        required this.type,
        required this.uri,
    });

    List<Artist> artists;
    int discNumber;
    int durationMs;
    bool explicit;
    ExternalUrls externalUrls;
    String href;
    String id;
    bool isLocal;
    bool? isPlayable;
    String name;
    String? previewUrl;
    int trackNumber;
    ItemType? type;
    String uri;

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromMap(x))),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        isPlayable: json["is_playable"],
        name: json["name"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: itemTypeValues.map[json["type"]],
        uri: json["uri"],
    );

    Map<String, dynamic> toMap() => {
        "artists": List<dynamic>.from(artists.map((x) => x.toMap())),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_urls": externalUrls.toMap(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "is_playable": isPlayable,
        "name": name,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": itemTypeValues.reverse[type],
        "uri": uri,
    };
}

enum ItemType { TRACK }

final itemTypeValues = EnumValues({
    "track": ItemType.TRACK
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => MapEntry(v, k));
        }
        return reverseMap!;
    }
}
