// To parse this JSON data, do
//
//     final swipeResponse = swipeResponseFromJson(jsonString);

import 'dart:convert';

SwipeResponse swipeResponseFromJson(String str) =>
    SwipeResponse.fromJson(json.decode(str));

String swipeResponseToJson(SwipeResponse data) => json.encode(data.toJson());

class SwipeResponse {
  SwipeResponse({
    this.message,
    this.data,
  });

  String? message;
  BalanceDatum? data;

  factory SwipeResponse.fromJson(Map<String, dynamic> json) => SwipeResponse(
        message: json["message"],
        data: json["data"] == null ? null : BalanceDatum.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class BalanceDatum {
  BalanceDatum({
    this.ETH,
    this.DASH,
    this.BTC,
    this.USD,
    this.EUR,
    this.SGD,
    this.GBP,
    this.CLP,
    this.ARS,
    this.total,
  });

  double? ETH;
  double? DASH;
  double? BTC;
  double? USD;
  double? EUR;
  int? SGD;
  int? GBP;
  int? CLP;
  int? ARS;
  Total? total;

  factory BalanceDatum.fromJson(Map<String, dynamic> json) => BalanceDatum(
        ETH: json["ETH"] == null ? null : json["ETH"],
        DASH: json["DASH"] == null ? null : json["DASH"],
        BTC: json["BTC"] == null ? null : json["BTC"],
        USD: json["USD"] == null ? null : json["USD"],
        EUR: json["EUR"] == null ? null : json["EUR"],
        SGD: json["SGD"] == null ? null : json["SGD"],
        GBP: json["GBP"] == null ? null : json["GBP"],
        CLP: json["CLP"] == null ? null : json["CLP"],
        ARS: json["ARS"] == null ? null : json["ARS"],
        total: json["total"] == null ? null : Total.fromJson(json["total"]),
      );

  Map<String, dynamic> toJson() => {
        "ETH": ETH,
        "DASH": DASH,
        "BTC": BTC,
        "USD": USD,
        "EUR": EUR,
        "SGD": SGD,
        "GBP": GBP,
        "CLP": CLP,
        "ARS": ARS,
        "total": total,
      };
}

class Total {
  Total({this.USD, this.EUR, this.SGD, this.GBP, this.ARS, this.CLP});

  double? USD;
  double? EUR;
  double? SGD;
  double? GBP;
  double? CLP;
  double? ARS;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        USD: json["USD"] == null ? null : json["USD"],
        EUR: json["EUR"] == null ? null : json["EUR"],
        SGD: json["SGD"] == null ? null : json["SGD"],
        GBP: json["GBP"] == null ? null : json["GBP"],
        CLP: json["CLP"] == null ? null : json["CLP"],
        ARS: json["ARS"] == null ? null : json["ARS"],
      );

  Map<String, dynamic> toJson() => {
        "USD": USD,
        "EUR": EUR,
        "SGD": SGD,
        "GBP": GBP,
        "CLP": CLP,
        "ARS": ARS,
      };
}
