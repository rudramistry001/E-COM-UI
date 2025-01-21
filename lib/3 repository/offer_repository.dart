


import 'package:e_com_ui/1%20model/dashboard/offer_model.dart';
import 'package:e_com_ui/2%20service/dashboard/offer_service.dart';

class OfferRepository {
OfferServices offerServices = OfferServices();

  Future getOffers(OfferModel offermodel) async {
    final response = await offerServices.getoffer(offermodel);
    return response;
  }
}
