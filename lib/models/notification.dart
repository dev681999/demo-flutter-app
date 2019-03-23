// To parse this JSON data, do
//
//     final notifications = notificationsFromJson(jsonString);

import 'dart:convert';

List<Notification> notificationsFromJson(String str) {
  final jsonData = json.decode(str);
  return jsonData["notifications"] == [null]
      ? []
      : List<Notification>.from(
          jsonData["notifications"].map(
            (x) => Notification.fromJson(x),
          ),
        );
}

String notificationsToJson(Notifications data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Notifications {
  List<Notification> notifications;

  Notifications({
    this.notifications,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        notifications: json["notifications"] == null
            ? null
            : List<Notification>.from(
                json["notifications"].map((x) => Notification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notifications": notifications == null
            ? null
            : List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}

class Notification {
  String id;
  String title;
  String to;
  String from;
  int typeOf;
  String product;

  Notification({
    this.id,
    this.title,
    this.to,
    this.from,
    this.typeOf,
    this.product,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        to: json["to"] == null ? null : json["to"],
        from: json["from"] == null ? null : json["from"],
        typeOf: json["typeOf"] == null ? null : json["typeOf"],
        product: json["product"] == null ? null : json["product"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "to": to == null ? null : to,
        "from": from == null ? null : from,
        "typeOf": typeOf == null ? null : typeOf,
        "product": product == null ? null : product,
      };
}
