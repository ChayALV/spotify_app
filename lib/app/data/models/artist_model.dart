// To parse required this JSON data, do
//
//     final artistModel = artistModelFromMap(jsonString);

import 'dart:convert';

class ArtistModel {
    ArtistModel({
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
    String type;
    String uri;

    factory ArtistModel.fromJson(String str) => ArtistModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ArtistModel.fromMap(Map<String, dynamic> json) => ArtistModel(
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        followers: Followers.fromMap(json["followers"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: json["type"],
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

class Followers {
    Followers({
        required this.href,
        required this.total,
    });

    dynamic href;
    int total;

    factory Followers.fromJson(String str) => Followers.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Followers.fromMap(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
    );

    Map<String, dynamic> toMap() => {
        "href": href,
        "total": total,
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
