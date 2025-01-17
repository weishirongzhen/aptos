import 'package:freezed_annotation/freezed_annotation.dart';

part 'fungible_asset_balance.freezed.dart';
part 'fungible_asset_balance.g.dart';

@freezed
class FungibleAssetBalance with _$FungibleAssetBalance {
  const factory FungibleAssetBalance({
    @JsonKey(name: '__typename') String? typename,
    @JsonKey(name: 'current_fungible_asset_balances') @Default([])List<CurrentFungibleAssetBalances> currentFungibleAssetBalances,
  }) = _FungibleAssetBalance;

  factory FungibleAssetBalance.fromJson(Map<String, Object?> json) => _$FungibleAssetBalanceFromJson(json);
}

@freezed
class CurrentFungibleAssetBalances with _$CurrentFungibleAssetBalances {
  const factory CurrentFungibleAssetBalances({
    @JsonKey(name: '__typename') String? typename,
    @JsonKey(name: 'amount') @Default(0) int amount,
    @JsonKey(name: 'asset_type') String? assetType,
    @JsonKey(name: 'is_frozen') bool? isFrozen,
    @JsonKey(name: 'is_primary') bool? isPrimary,
    @JsonKey(name: 'last_transaction_timestamp') String? lastTransactionTimestamp,
    @JsonKey(name: 'last_transaction_version') int? lastTransactionVersion,
    @JsonKey(name: 'owner_address') String? ownerAddress,
    @JsonKey(name: 'storage_id') String? storageId,
    @JsonKey(name: 'token_standard') String? tokenStandard,
    @JsonKey(name: 'metadata') Metadata? metadata,
  }) = _CurrentFungibleAssetBalances;

  factory CurrentFungibleAssetBalances.fromJson(Map<String, Object?> json) => _$CurrentFungibleAssetBalancesFromJson(json);
}

@freezed
class Metadata with _$Metadata {
  const factory Metadata({
    @JsonKey(name: '__typename') String? Typename,
    @JsonKey(name: 'decimals') int? decimals,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'symbol') String? symbol,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, Object?> json) => _$MetadataFromJson(json);
}

