import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String? image;

  const Image({this.image});

  @override
  List<Object?> get props => [image];
}
