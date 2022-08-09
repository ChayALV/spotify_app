// To parse required this JSON data, do
//
//     final albumsOfArtistModel = albumsOfArtistModelFromMap(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

class AlbumsOfArtistModel {
    AlbumsOfArtistModel({
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
    String? next;
    int offset;
    dynamic previous;
    int total;

    factory AlbumsOfArtistModel.fromJson(String str) => AlbumsOfArtistModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AlbumsOfArtistModel.fromMap(Map<String, dynamic> json) => AlbumsOfArtistModel(
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
        required this.albumGroup,
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

    AlbumGroup? albumGroup;
    AlbumGroup? albumType;
    List<Artist> artists;
    List<String> availableMarkets;
    ExternalUrls externalUrls;
    String href;
    String id;
    List<Image> images;
    String name;
    String releaseDate;
    ReleaseDatePrecision? releaseDatePrecision;
    int totalTracks;
    AlbumGroup? type;
    String uri;

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        albumGroup: albumGroupValues.map[json["album_group"]],
        albumType: albumGroupValues.map[json["album_type"]],
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromMap(x))),
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        name: json["name"],
        releaseDate: json["release_date"],
        releaseDatePrecision: releaseDatePrecisionValues.map[json["release_date_precision"]],
        totalTracks: json["total_tracks"],
        type: albumGroupValues.map[json["type"]],
        uri: json["uri"],
    );

    Map<String, dynamic> toMap() => {
        "album_group": albumGroupValues.reverse[albumGroup],
        "album_type": albumGroupValues.reverse[albumType],
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
        "type": albumGroupValues.reverse[type],
        "uri": uri,
    };
}

enum AlbumGroup { ALBUM }

final albumGroupValues = EnumValues({
    "album": AlbumGroup.ALBUM
});

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
    Name? name;
    Type? type;
    Uri? uri;

    factory Artist.fromJson(String str) => Artist.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Artist.fromMap(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: idValues.map[json["id"]],
        name: nameValues.map[json["name"]],
        type: typeValues.map[json["type"]],
        uri: uriValues.map[json["uri"]],
    );

    Map<String, dynamic> toMap() => {
        "external_urls": externalUrls.toMap(),
        "href": href,
        "id": idValues.reverse[id],
        "name": nameValues.reverse[name],
        "type": typeValues.reverse[type],
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

enum Id { THE_0_TN_OYI_SBD1_XYR_BK9_MYASEG, THE_6_R_FJBX_ELOWF_XV54_T6_CCU_RZ }

final idValues = EnumValues({
    "0TnOYISbd1XYRBk9myaseg": Id.THE_0_TN_OYI_SBD1_XYR_BK9_MYASEG,
    "6RFjbxELOWFXv54t6ccuRZ": Id.THE_6_R_FJBX_ELOWF_XV54_T6_CCU_RZ
});

enum Name { PITBULL, JORGE_GOMEZ }

final nameValues = EnumValues({
    "Jorge Gomez": Name.JORGE_GOMEZ,
    "Pitbull": Name.PITBULL
});

enum Type { ARTIST }

final typeValues = EnumValues({
    "artist": Type.ARTIST
});

enum Uri { SPOTIFY_ARTIST_0_TN_OYI_SBD1_XYR_BK9_MYASEG, SPOTIFY_ARTIST_6_R_FJBX_ELOWF_XV54_T6_CCU_RZ }

final uriValues = EnumValues({
    "spotify:artist:0TnOYISbd1XYRBk9myaseg": Uri.SPOTIFY_ARTIST_0_TN_OYI_SBD1_XYR_BK9_MYASEG,
    "spotify:artist:6RFjbxELOWFXv54t6ccuRZ": Uri.SPOTIFY_ARTIST_6_R_FJBX_ELOWF_XV54_T6_CCU_RZ
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

enum ReleaseDatePrecision { DAY, YEAR }

final releaseDatePrecisionValues = EnumValues({
    "day": ReleaseDatePrecision.DAY,
    "year": ReleaseDatePrecision.YEAR
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
