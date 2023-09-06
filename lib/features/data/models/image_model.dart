import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  final String? image;

  const ImageModel({this.image});

  @override
  List<Object?> get props => [image];
}
