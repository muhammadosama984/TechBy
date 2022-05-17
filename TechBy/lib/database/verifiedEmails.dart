class verifiedEmails {
  String email;

  verifiedEmails({required this.email});

  static verifiedEmails fromJson(Map<String, dynamic> json) =>
      verifiedEmails(email: json['email']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email']=email;
    return data;
  }
}
