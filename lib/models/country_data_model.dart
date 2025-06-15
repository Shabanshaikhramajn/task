class CountryDataModel {
  String? countryName;
  String? currencyCode;
  String? countryFlag;
  int? minAmount;
  int? maxAmount;
  int? foreignCurrencyMinAmount;
  int? foreignCurrencyMaxAmount;
  int? transferFeesGBP;
  double? rate;

  CountryDataModel(
      {this.countryName,
      this.currencyCode,
      this.countryFlag,
      this.minAmount,
      this.maxAmount,
      this.foreignCurrencyMinAmount,
      this.foreignCurrencyMaxAmount,
      this.transferFeesGBP,
      this.rate});

  CountryDataModel.fromJson(Map<String, dynamic> json) {
    countryName = json['countryName'];
    currencyCode = json['currencyCode'];
    countryFlag = json['countryFlag'];
    minAmount = json['minAmount'];
    maxAmount = json['maxAmount'];
    foreignCurrencyMinAmount = json['foreignCurrencyMinAmount'];
    foreignCurrencyMaxAmount = json['foreignCurrencyMaxAmount'];
    transferFeesGBP = json['transferFeesGBP'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryName'] = this.countryName;
    data['currencyCode'] = this.currencyCode;
    data['countryFlag'] = this.countryFlag;
    data['minAmount'] = this.minAmount;
    data['maxAmount'] = this.maxAmount;
    data['foreignCurrencyMinAmount'] = this.foreignCurrencyMinAmount;
    data['foreignCurrencyMaxAmount'] = this.foreignCurrencyMaxAmount;
    data['transferFeesGBP'] = this.transferFeesGBP;
    data['rate'] = this.rate;
    return data;
  }
}
