import 'package:flutter_gen/gen_l10n/app-localizations.dart';
class SliderModel{
  String ? image;
  String ? title;
  String ? description;


// Constructor for variables
  SliderModel({ this.title, this.description,  this.image});

  void setImage(String getImage){
    image = getImage;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }
  void setDescription(String getDescription){
    description = getDescription;
  }

  String? getImage(){
    return image;
  }

  String? getTitle(){
    return title;
  }
  String? getDescription(){
    return description;
  }
}

// List created
List<SliderModel> getSlides(context){
  var data=AppLocalizations.of(context)!;
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = new SliderModel();

// Item 1
  sliderModel.setImage("assets/onboarding1.png");
  sliderModel.setTitle(data.onboarding_title1);
  sliderModel.setDescription(data.onboarding_title1_description);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

// Item 2
  sliderModel.setImage("assets/onboarding2.png");
  sliderModel.setTitle(data.onboarding_title2);
  sliderModel.setDescription(data.onboarding_title2_description);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

// Item 3
  sliderModel.setImage("assets/onboarding3.png");
  sliderModel.setTitle(data.onboarding_title3);
  sliderModel.setDescription(data.onboarding_title3_description);
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  return slides;
}
