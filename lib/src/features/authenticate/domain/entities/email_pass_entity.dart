import 'package:equatable/equatable.dart';

class EmailAndPass extends Equatable {
  final String email;
  final String password;

  const EmailAndPass({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
