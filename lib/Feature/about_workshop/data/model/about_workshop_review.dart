import 'package:equatable/equatable.dart';

class AboutWorkshopReview with EquatableMixin {
  final String? name;

  AboutWorkshopReview(this.name);
  @override
  List<Object?> get props => [name];

  factory AboutWorkshopReview.fromJson(Map<String, dynamic> json) {
    return AboutWorkshopReview(json['name'] as String?);
  }
}
