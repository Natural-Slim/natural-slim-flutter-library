class PagingInfo {
  
  PagingInfo({
      required this.perPage,
      required this.currentPage,
      required this.totalRecords,
      required this.totalPages,
  });

  int perPage;
  int currentPage;
  int totalRecords;
  int totalPages;

  factory PagingInfo.fromJson(Map<String, dynamic> json) => PagingInfo(
      perPage: json["perPage"],
      currentPage: json["currentPage"],
      totalRecords: json["totalRecords"],
      totalPages: json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
      "perPage": perPage,
      "currentPage": currentPage,
      "totalRecords": totalRecords,
      "totalPages": totalPages,
  };
}