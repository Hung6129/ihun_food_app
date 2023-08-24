import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String userName;
  final String email;
  final String location;

  const UserEntity(
    this.id,
    this.userName,
    this.email,
    this.location,
  );

  @override
  List<Object?> get props => [
        id,
        userName,
        email,
        location,
      ];
}
