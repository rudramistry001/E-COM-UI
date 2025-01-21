class OfferModel {
  String? message;
  List<String>? imageUrls;

  OfferModel({this.message, this.imageUrls});

  OfferModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['imageUrls'] != null) {
      imageUrls = List<String>.from(json['imageUrls']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (imageUrls != null) {
      data['imageUrls'] = imageUrls;
    }
    return data;
  }
}
