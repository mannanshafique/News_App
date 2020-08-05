import 'package:news_app/models/Countrymodel.dart';

List<CountryModel> getCountries() {
  List<CountryModel> countries = List<CountryModel>();

  CountryModel countryModel;

  //1
  countryModel = CountryModel();
  countryModel.countryName = "AE";
  countryModel.countryImageUrl =
      "https://cdn.webshopapp.com/shops/94414/files/54952980/the-united-arab-emirates-flag-icon-free-download.jpg";
  countries.add(countryModel);
  //2
  countryModel = CountryModel();
  countryModel.countryName = "AR";
  countryModel.countryImageUrl =
      "https://cdn.countryflags.com/thumbs/argentina/flag-400.png";
  countries.add(countryModel);
//3
  countryModel = CountryModel();
  countryModel.countryName = "AT";
  countryModel.countryImageUrl =
      "https://cdn.webshopapp.com/shops/94414/files/53449172/austria-flag-image-free-download.jpg";
  countries.add(countryModel);

//4
  countryModel = CountryModel();
  countryModel.countryName = "AU";
  countryModel.countryImageUrl =
      "https://cdn.countryflags.com/thumbs/australia/flag-400.png";
  countries.add(countryModel);
  //5
  countryModel = CountryModel();
  countryModel.countryName = "BE";
  countryModel.countryImageUrl =
      "https://cdn.webshopapp.com/shops/94414/files/53540672/belgium-flag-image-free-download.jpg";
  countries.add(countryModel);

  //6
  countryModel = CountryModel();
  countryModel.countryName = "BG";
  countryModel.countryImageUrl =
      "https://cdn.webshopapp.com/shops/94414/files/53593164/bulgaria-flag-image-free-download.jpg";
  countries.add(countryModel);
  //7
  countryModel = CountryModel();
  countryModel.countryName = "BR";
  countryModel.countryImageUrl =
      "https://cdn.countryflags.com/thumbs/brazil/flag-400.png";
  countries.add(countryModel);
  //8
  countryModel = CountryModel();
  countryModel.countryName = "CA";
  countryModel.countryImageUrl =
      "https://cdn.webshopapp.com/shops/94414/files/53601570/canada-flag-image-free-download.jpg";
  countries.add(countryModel);
  //9
  countryModel = CountryModel();
  countryModel.countryName = "CH";
  countryModel.countryImageUrl =
      "https://cdn.webshopapp.com/shops/94414/files/54946000/switzerland-flag-image-free-download.jpg";
  countries.add(countryModel);
  //10
  countryModel = CountryModel();
  countryModel.countryName = "CN";
  countryModel.countryImageUrl =
      "https://cdn.countryflags.com/thumbs/china/flag-400.png";
  countries.add(countryModel);
  //11
  countryModel = CountryModel();
  countryModel.countryName = "CO";
  countryModel.countryImageUrl =
      "https://cdn.webshopapp.com/shops/94414/files/53783904/colombia-flag-icon-free-download.jpg";
  countries.add(countryModel);
  //12
  countryModel = CountryModel();
  countryModel.countryName = "JP";
  countryModel.countryImageUrl =
      "https://cdn.webshopapp.com/shops/94414/files/54037182/japan-flag-icon-free-download.jpg";
  countries.add(countryModel);
  //13
  countryModel = CountryModel();
  countryModel.countryName = "MA";
  countryModel.countryImageUrl =
      "https://cdn.webshopapp.com/shops/94414/files/54592314/morocco-flag-icon-free-download.jpg";
  countries.add(countryModel);

  //14
  countryModel = CountryModel();
  countryModel.countryName = "US";
  countryModel.countryImageUrl =
      "https://cdn.countryflags.com/thumbs/united-states-of-america/flag-400.png";
  countries.add(countryModel);
  return countries;
}
