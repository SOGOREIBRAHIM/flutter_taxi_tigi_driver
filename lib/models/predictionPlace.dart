
class PredictionPlacle {
  String? place_id;
  String? main_Text;
  String? second_Text;

  PredictionPlacle({
    this.place_id,
    this.main_Text,
    this.second_Text,

  });

  PredictionPlacle.fromJson(Map<String, dynamic> jsonData){
    place_id = jsonData["place_id"];
    main_Text = jsonData["structured_formatting"]["main_text"];
    second_Text = jsonData["structured_formatting"]["secondary_text"];
  }


}