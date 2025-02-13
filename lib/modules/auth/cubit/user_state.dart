part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

// Login States

class SuffixChangeState extends UserState {}

class LoadingLoginState extends UserState {}

class ErrorLoginState extends UserState {}

class SuccessLoginState extends UserState {}

// Register States
class LoadingRegisterState extends UserState {}

class ErrorRegisterState extends UserState {}

class SuccessRegisterState extends UserState {}

class LogoutState extends UserState {}
