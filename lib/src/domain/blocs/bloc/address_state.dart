part of 'address_bloc.dart';

@immutable
abstract class AddressState {}

class AddressInitial extends AddressState {
  final String address = "";
}
