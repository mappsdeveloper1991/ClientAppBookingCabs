class RouteDistanceAndTimeResponse {
  final List<String> destinationAddresses;
  final List<String> originAddresses;
  final List<Rows> rows;
  final String status;

  RouteDistanceAndTimeResponse({
    required this.destinationAddresses,
    required this.originAddresses,
    required this.rows,
    required this.status,
  });

  factory RouteDistanceAndTimeResponse.fromJson(Map<String, dynamic> json) {
    return RouteDistanceAndTimeResponse(
      destinationAddresses: List<String>.from(json['destination_addresses'] ?? []),
      originAddresses: List<String>.from(json['origin_addresses'] ?? []),
      rows: List<Rows>.from((json['rows'] ?? []).map((row) => Rows.fromJson(row))),
      status: json['status'] ?? '',
    );
  }
}

class Rows {
  final List<Element> elements;

  Rows({
    required this.elements,
  });

  factory Rows.fromJson(Map<String, dynamic> json) {
    return Rows(
      elements: List<Element>.from((json['elements'] ?? []).map((element) => Element.fromJson(element))),
    );
  }
}

class Element {
  final Distance distance;
  final Duration duration;
  final String status;

  Element({
    required this.distance,
    required this.duration,
    required this.status,
  });

  factory Element.fromJson(Map<String, dynamic> json) {
    return Element(
      distance: Distance.fromJson(json['distance'] ?? {}),
      duration: Duration.fromJson(json['duration'] ?? {}),
      status: json['status'] ?? '',
    );
  }
}

class Distance {
  final String text;
  final int value;

  Distance({
    required this.text,
    required this.value,
  });

  factory Distance.fromJson(Map<String, dynamic> json) {
    return Distance(
      text: json['text'] ?? '',
      value: json['value'] ?? 0,
    );
  }
}

class Duration {
  final String text;
  final int value;

  Duration({
    required this.text,
    required this.value,
  });

  factory Duration.fromJson(Map<String, dynamic> json) {
    return Duration(
      text: json['text'] ?? '',
      value: json['value'] ?? 0,
    );
  }
}
