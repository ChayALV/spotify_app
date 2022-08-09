import 'dart:convert';

class NowPlayedModel {
    NowPlayedModel({
        required this.device,
        required this.shuffleState,
        required this.repeatState,
        required this.timestamp,
        required this.context,
        required this.progressMs,
        required this.item,
        required this.currentlyPlayingType,
        required this.actions,
        required this.isPlaying,
    });

    Device device;
    bool shuffleState;
    String repeatState;
    int timestamp;
    dynamic context;
    int progressMs;
    Item item;
    String currentlyPlayingType;
    Actions actions;
    bool isPlaying;

    factory NowPlayedModel.fromJson(String str) => NowPlayedModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NowPlayedModel.fromMap(Map<String, dynamic> json) => NowPlayedModel(
        device: Device.fromMap(json["device"]),
        shuffleState: json["shuffle_state"],
        repeatState: json["repeat_state"],
        timestamp: json["timestamp"],
        context: json["context"],
        progressMs: json["progress_ms"],
        item: Item.fromMap(json["item"]),
        currentlyPlayingType: json["currently_playing_type"],
        actions: Actions.fromMap(json["actions"]),
        isPlaying: json["is_playing"],
    );

    Map<String, dynamic> toMap() => {
        "device": device.toMap(),
        "shuffle_state": shuffleState,
        "repeat_state": repeatState,
        "timestamp": timestamp,
        "context": context,
        "progress_ms": progressMs,
        "item": item.toMap(),
        "currently_playing_type": currentlyPlayingType,
        "actions": actions.toMap(),
        "is_playing": isPlaying,
    };
}

class Actions {
    Actions({
        required this.disallows,
    });

    Disallows disallows;

    factory Actions.fromJson(String str) => Actions.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Actions.fromMap(Map<String, dynamic> json) => Actions(
        disallows: Disallows.fromMap(json["disallows"]),
    );

    Map<String, dynamic> toMap() => {
        "disallows": disallows.toMap(),
    };
}

class Disallows {
    Disallows({
        required this.resuming,
        required this.togglingRepeatContext,
        required this.togglingRepeatTrack,
        required this.togglingShuffle,
    });

    bool? resuming;
    bool? togglingRepeatContext;
    bool? togglingRepeatTrack;
    bool? togglingShuffle;

    factory Disallows.fromJson(String str) => Disallows.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Disallows.fromMap(Map<String, dynamic> json) => Disallows(
        resuming: json["resuming"] ?? false,
        togglingRepeatContext: json["toggling_repeat_context"],
        togglingRepeatTrack: json["toggling_repeat_track"],
        togglingShuffle: json["toggling_shuffle"],
    );

    Map<String, dynamic> toMap() => {
        "resuming": resuming,
        "toggling_repeat_context": togglingRepeatContext,
        "toggling_repeat_track": togglingRepeatTrack,
        "toggling_shuffle": togglingShuffle,
    };
}

class Device {
    Device({
        required this.id,
        required this.isActive,
        required this.isPrivateSession,
        required this.isRestricted,
        required this.name,
        required this.type,
        required this.volumePercent,
    });

    String id;
    bool isActive;
    bool isPrivateSession;
    bool isRestricted;
    String name;
    String type;
    int volumePercent;

    factory Device.fromJson(String str) => Device.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Device.fromMap(Map<String, dynamic> json) => Device(
        id: json["id"],
        isActive: json["is_active"],
        isPrivateSession: json["is_private_session"],
        isRestricted: json["is_restricted"],
        name: json["name"],
        type: json["type"],
        volumePercent: json["volume_percent"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "is_active": isActive,
        "is_private_session": isPrivateSession,
        "is_restricted": isRestricted,
        "name": name,
        "type": type,
        "volume_percent": volumePercent,
    };
}

class Item {
    Item({
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

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
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
