import 'package:flutter/foundation.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/slider_model.dart';

List<SliderModel> getSliders() {
  List<SliderModel> sliders = [];
  SliderModel categoryModel = new SliderModel();

  categoryModel.image = "assets/img/entertainment.jpg";
  categoryModel.name = "When The Ships are down it is right to rework";
  sliders.add(categoryModel);
  categoryModel = new SliderModel();

    categoryModel.image = "assets/img/health.jpg";
  categoryModel.name = "Never Bow To The Authority of Silenceforce";
  sliders.add(categoryModel);
  categoryModel = new SliderModel();

    categoryModel.image = "assets/img/science.jpg";
  categoryModel.name = "Hard work always pay but working inteligently pays more";
  sliders.add(categoryModel);
  categoryModel = new SliderModel();

 

  return sliders;
}
