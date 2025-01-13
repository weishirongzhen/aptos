// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fungible_asset_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FungibleAssetBalanceImpl _$$FungibleAssetBalanceImplFromJson(
        Map<String, dynamic> json) =>
    _$FungibleAssetBalanceImpl(
      typename: json['__typename'] as String?,
      currentFungibleAssetBalances:
          (json['current_fungible_asset_balances'] as List<dynamic>?)
                  ?.map((e) => CurrentFungibleAssetBalances.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              const [],
    );

Map<String, dynamic> _$$FungibleAssetBalanceImplToJson(
        _$FungibleAssetBalanceImpl instance) =>
    <String, dynamic>{
      '__typename': instance.typename,
      'current_fungible_asset_balances': instance.currentFungibleAssetBalances,
    };

_$CurrentFungibleAssetBalancesImpl _$$CurrentFungibleAssetBalancesImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrentFungibleAssetBalancesImpl(
      typename: json['__typename'] as String?,
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      assetType: json['asset_type'] as String?,
      isFrozen: json['is_frozen'] as bool?,
      isPrimary: json['is_primary'] as bool?,
      lastTransactionTimestamp: json['last_transaction_timestamp'] as String?,
      lastTransactionVersion:
          (json['last_transaction_version'] as num?)?.toInt(),
      ownerAddress: json['owner_address'] as String?,
      storageId: json['storage_id'] as String?,
      tokenStandard: json['token_standard'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CurrentFungibleAssetBalancesImplToJson(
        _$CurrentFungibleAssetBalancesImpl instance) =>
    <String, dynamic>{
      '__typename': instance.typename,
      'amount': instance.amount,
      'asset_type': instance.assetType,
      'is_frozen': instance.isFrozen,
      'is_primary': instance.isPrimary,
      'last_transaction_timestamp': instance.lastTransactionTimestamp,
      'last_transaction_version': instance.lastTransactionVersion,
      'owner_address': instance.ownerAddress,
      'storage_id': instance.storageId,
      'token_standard': instance.tokenStandard,
      'metadata': instance.metadata,
    };

_$MetadataImpl _$$MetadataImplFromJson(Map<String, dynamic> json) =>
    _$MetadataImpl(
      Typename: json['__typename'] as String?,
      decimals: (json['decimals'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MetadataImplToJson(_$MetadataImpl instance) =>
    <String, dynamic>{
      '__typename': instance.Typename,
      'decimals': instance.decimals,
    };
