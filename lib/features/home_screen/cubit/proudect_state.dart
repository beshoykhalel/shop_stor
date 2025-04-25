import 'package:shop_stor/features/home_screen/models/proudects_model.dart';

abstract class ProudectState {}

class ProudectInitial extends ProudectState {}

class ProudectLoading extends ProudectState {}

class ProudectLoaded extends ProudectState {
  List<ProdectsModel> proudects;
  ProudectLoaded(this.proudects);
}

class ProudectError extends ProudectState {
  final String error;
  ProudectError(this.error);
}
