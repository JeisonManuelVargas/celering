class AccountModel {
  AccountModel({
    required this.nameUser,
  });

  String nameUser;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    nameUser: json["nameUser"],
  );

  Map<String, dynamic> toJson() => {
    "nameUser": nameUser,
  };
}
