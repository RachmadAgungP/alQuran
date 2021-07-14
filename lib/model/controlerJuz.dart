List<JuzSurah> dataJuz = [];

class JuzSurah {
  late String index;
  late Start start;
  late Start end;

  JuzSurah(this.index, this.start, this.end);

  JuzSurah.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    start = (json['start'] != null ? new Start.fromJson(json['start']) : null)!;
    end = (json['end'] != null ? new Start.fromJson(json['end']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    if (this.start != null) {
      data['start'] = this.start.toJson();
    }
    if (this.end != null) {
      data['end'] = this.end.toJson();
    }
    return data;
  }
}

class Start {
  late String index;
  late String verse;
  late String name;

  Start(this.index, this.verse, this.name);

  Start.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    verse = json['verse'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['verse'] = this.verse;
    data['name'] = this.name;
    return data;
  }
}
