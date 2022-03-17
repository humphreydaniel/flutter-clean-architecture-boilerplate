import '../../core.dart';

/// Base meta when receive data from a API
class MetaData {
  /// Total count data item
  final int totalData;

  /// Message response server
  final String message;

  /// Status code from server
  final int statusCode;

  /// Current page
  final int page;

  /// Item count in current page pagination
  final int perPage;

  /// Total pages pagination
  final int totalPage;

  ///
  MetaData({
    this.totalData,
    this.message,
    this.statusCode,
    this.page,
    this.perPage,
    this.totalPage,
  });

  /// Mapping data [MetaData] from Map or Json data
  factory MetaData.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return MetaData(
      totalData: json['total_data'],
      message: json['message'],
      statusCode: Utils.intParser(json['status_code']),
      page: Utils.intParser(json['page']),
      perPage: Utils.intParser(json['per_page']),
      totalPage: Utils.intParser(json['total_page']),
    );
  }

  /// Generate [MetaData] toMap
  Map<String, dynamic> toJson() {
    return {
      'total_data': totalData,
      'message': message,
      'status_code': statusCode,
      'page': page,
      'per_page': perPage,
      'total_page': totalPage,
    };
  }
}
