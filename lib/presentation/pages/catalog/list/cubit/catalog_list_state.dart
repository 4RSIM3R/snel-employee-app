part of 'catalog_list_cubit.dart';

@freezed
class CatalogListState with _$CatalogListState {
  const factory CatalogListState.initial() = _Initial;
  const factory CatalogListState.loading() = _Loading;
  const factory CatalogListState.failure(String message) = _failure;
  const factory CatalogListState.success(List<TicketModel> payload) = _Success;
}
