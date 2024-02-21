class ZakatHistoryModel {
  int? id;
  String? calculateFrom;
  String? calculateTo;
  String? amountOfUser;
  String? value;
  String? amountOfZakat;

  ZakatHistoryModel(
      {this.id,
      this.calculateFrom,
      this.calculateTo,
      this.amountOfUser,
      this.value,
      this.amountOfZakat});

  ZakatHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    calculateFrom = json['calculate_from'];
    calculateTo = json['calculate_to'];
    amountOfUser = json['amount_of_user'];
    value = json['value'];
    amountOfZakat = json['amount_of_zakat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['calculate_from'] = this.calculateFrom;
    data['calculate_to'] = this.calculateTo;
    data['amount_of_user'] = this.amountOfUser;
    data['value'] = this.value;
    data['amount_of_zakat'] = this.amountOfZakat;
    return data;
  }
}
