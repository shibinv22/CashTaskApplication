// To parse this JSON data, do
//
//     final recentTransactions = recentTransactionsFromJson(jsonString);

import 'dart:convert';

RecentTransactions recentTransactionsFromJson(String str) =>
    RecentTransactions.fromJson(json.decode(str));

String recentTransactionsToJson(RecentTransactions data) =>
    json.encode(data.toJson());

class RecentTransactions {
  RecentTransactions({
    this.code,
    this.message,
    this.data,
    this.closingBalances,
  });

  String? code;
  String? message;
  List<Datum>? data;
  List<dynamic>? closingBalances;

  factory RecentTransactions.fromJson(Map<String, dynamic> json) =>
      RecentTransactions(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        closingBalances:
            List<dynamic>.from(json["closingBalances"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "closingBalances": List<dynamic>.from(closingBalances!.map((x) => x)),
      };
}

class Datum {
  Datum({
    this.date,
    this.currency,
    this.fiatCurrency,
    this.operationType,
    this.fee,
    this.operationTotal,
    this.amountUsd,
    this.amountCrypto,
    this.rate,
    this.source,
    this.transactionId,
    this.sourceTable,
    this.txTypeId,
    this.status,
    this.address,
    this.comment,
    this.withPartner,
    this.partnerCommission,
  });

  DateTime? date;
  String? currency;
  FiatCurrency? fiatCurrency;
  String? operationType;
  String? fee;
  String? operationTotal;
  String? amountUsd;
  String? amountCrypto;
  Rate? rate;
  String? source;
  String? transactionId;
  String? sourceTable;
  int? txTypeId;
  int? status;
  String? address;
  String? comment;
  bool? withPartner;
  String? partnerCommission;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        date: DateTime.parse(json["date"]),
        currency: json["currency"] == null ? null : json["currency"],
        fiatCurrency: fiatCurrencyValues.map![json["fiat_currency"]],
        operationType: json["operationType"],
        fee: json["fee"],
        operationTotal: json["operationTotal"],
        amountUsd: json["amountUsd"],
        amountCrypto:
            json["amountCrypto"] == null ? null : json["amountCrypto"],
        rate: json["rate"] == null ? null : Rate.fromJson(json["rate"]),
        source: json["source"],
        transactionId: json["transactionId"],
        sourceTable: json["source_table"] == null ? null : json["source_table"],
        txTypeId: json["tx_type_id"],
        status: json["status"],
        address: json["address"],
        comment: json["comment"] == null ? null : json["comment"],
        withPartner: json["with_partner"],
        partnerCommission: json["partner_commission"],
      );

  Map<String, dynamic> toJson() => {
        "date": date!.toIso8601String(),
        "currency": currency,
        "fiat_currency": fiatCurrencyValues.reverse![fiatCurrency],
        "operationType": operationType,
        "fee": fee,
        "operationTotal": operationTotal,
        "amountUsd": amountUsd,
        "amountCrypto": amountCrypto == null ? null : amountCrypto,
        "rate": rate == null ? null : rate!.toJson(),
        "source": source,
        "transactionId": transactionId,
        "source_table": sourceTable,
        "tx_type_id": txTypeId,
        "status": status,
        "address": address,
        "comment": comment == null ? null : comment,
        "with_partner": withPartner,
        "partner_commission": partnerCommission,
      };
}

enum FiatCurrency { EUR, USD }

final fiatCurrencyValues =
    EnumValues({"EUR": FiatCurrency.EUR, "USD": FiatCurrency.USD});

class Rate {
  Rate({
    this.usd,
    this.eur,
    this.gbp,
    this.ars,
    this.clp,
  });

  double? usd;
  double? eur;
  double? gbp;
  double? ars;
  double? clp;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        usd: json["USD"] == null ? null : json["USD"].toDouble(),
        eur: json["EUR"] == null ? null : json["EUR"].toDouble(),
        gbp: json["GBP"] == null ? null : json["GBP"].toDouble(),
        ars: json["ARS"] == null ? null : json["ARS"].toDouble(),
        clp: json["CLP"] == null ? null : json["CLP"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd,
        "EUR": eur,
        "GBP": gbp == null ? null : gbp,
        "ARS": ars == null ? null : ars,
        "CLP": clp == null ? null : clp,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
