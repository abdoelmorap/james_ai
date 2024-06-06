class EdenAiModel {
  Cohere? cohere;

  EdenAiModel({this.cohere});

  EdenAiModel.fromJson(Map<String, dynamic> json) {
    cohere =
    json['cohere'] != null ? new Cohere.fromJson(json['cohere']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cohere != null) {
      data['cohere'] = this.cohere!.toJson();
    }
    return data;
  }
}

class Cohere {
  String? status;
  String? generatedText;

  Cohere({this.status, this.generatedText});

  Cohere.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    generatedText = json['generated_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['generated_text'] = this.generatedText;
    return data;
  }
}
