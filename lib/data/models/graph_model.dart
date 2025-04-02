class GraphDataModel {
  final String date;
  final int steps;

  GraphDataModel(this.date, this.steps);

  GraphDataModel copyWith(int? steps) {
    return GraphDataModel(date, steps ?? this.steps);
  }
}
