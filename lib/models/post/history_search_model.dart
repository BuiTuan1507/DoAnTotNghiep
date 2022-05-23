class HistorySearch {
  List<ListSearch>? listSearch;

  HistorySearch({this.listSearch});

  HistorySearch.fromJson(Map<String, dynamic> json) {
    if (json['listSearch'] != null) {
      listSearch = <ListSearch>[];
      json['listSearch'].forEach((v) {
        listSearch!.add(new ListSearch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listSearch != null) {
      data['listSearch'] = this.listSearch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListSearch {
  int? id;
  String? searchText;

  ListSearch({this.id, this.searchText});

  ListSearch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    searchText = json['searchText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['searchText'] = this.searchText;
    return data;
  }
}