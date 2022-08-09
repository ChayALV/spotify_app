import 'dart:convert';

class DivicesModel {
    DivicesModel({
        required this.devices,
    });

    List<Device> devices;

    factory DivicesModel.fromJson(String str) => DivicesModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DivicesModel.fromMap(Map<String, dynamic> json) => DivicesModel(
        devices: List<Device>.from(json["devices"].map((x) => Device.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "devices": List<dynamic>.from(devices.map((x) => x.toMap())),
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
