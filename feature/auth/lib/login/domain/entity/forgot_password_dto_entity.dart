// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ForgotPasswordDtoEntity extends Equatable {
  const ForgotPasswordDtoEntity({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [email];

  ForgotPasswordDtoEntity copyWith({
    String? email,
  }) {
    return ForgotPasswordDtoEntity(
      email: email ?? this.email,
    );
  }
}
