// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fungible_asset_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FungibleAssetBalance _$FungibleAssetBalanceFromJson(Map<String, dynamic> json) {
  return _FungibleAssetBalance.fromJson(json);
}

/// @nodoc
mixin _$FungibleAssetBalance {
  @JsonKey(name: '__typename')
  String? get typename => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_fungible_asset_balances')
  List<CurrentFungibleAssetBalances> get currentFungibleAssetBalances =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$FungibleAssetBalanceImpl implements _FungibleAssetBalance {
  const _$FungibleAssetBalanceImpl(
      {@JsonKey(name: '__typename') this.typename,
      @JsonKey(name: 'current_fungible_asset_balances')
      final List<CurrentFungibleAssetBalances> currentFungibleAssetBalances =
          const []})
      : _currentFungibleAssetBalances = currentFungibleAssetBalances;

  factory _$FungibleAssetBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$FungibleAssetBalanceImplFromJson(json);

  @override
  @JsonKey(name: '__typename')
  final String? typename;
  final List<CurrentFungibleAssetBalances> _currentFungibleAssetBalances;
  @override
  @JsonKey(name: 'current_fungible_asset_balances')
  List<CurrentFungibleAssetBalances> get currentFungibleAssetBalances {
    if (_currentFungibleAssetBalances is EqualUnmodifiableListView)
      return _currentFungibleAssetBalances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentFungibleAssetBalances);
  }

  @override
  String toString() {
    return 'FungibleAssetBalance(typename: $typename, currentFungibleAssetBalances: $currentFungibleAssetBalances)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FungibleAssetBalanceImplToJson(
      this,
    );
  }
}

abstract class _FungibleAssetBalance implements FungibleAssetBalance {
  const factory _FungibleAssetBalance(
      {@JsonKey(name: '__typename') final String? typename,
      @JsonKey(name: 'current_fungible_asset_balances')
      final List<CurrentFungibleAssetBalances>
          currentFungibleAssetBalances}) = _$FungibleAssetBalanceImpl;

  factory _FungibleAssetBalance.fromJson(Map<String, dynamic> json) =
      _$FungibleAssetBalanceImpl.fromJson;

  @override
  @JsonKey(name: '__typename')
  String? get typename;
  @override
  @JsonKey(name: 'current_fungible_asset_balances')
  List<CurrentFungibleAssetBalances> get currentFungibleAssetBalances;
}

CurrentFungibleAssetBalances _$CurrentFungibleAssetBalancesFromJson(
    Map<String, dynamic> json) {
  return _CurrentFungibleAssetBalances.fromJson(json);
}

/// @nodoc
mixin _$CurrentFungibleAssetBalances {
  @JsonKey(name: '__typename')
  String? get typename => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'asset_type')
  String? get assetType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_frozen')
  bool? get isFrozen => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_primary')
  bool? get isPrimary => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_transaction_timestamp')
  String? get lastTransactionTimestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_transaction_version')
  int? get lastTransactionVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_address')
  String? get ownerAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'storage_id')
  String? get storageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_standard')
  String? get tokenStandard => throw _privateConstructorUsedError;
  @JsonKey(name: 'metadata')
  Metadata? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$CurrentFungibleAssetBalancesImpl
    implements _CurrentFungibleAssetBalances {
  const _$CurrentFungibleAssetBalancesImpl(
      {@JsonKey(name: '__typename') this.typename,
      @JsonKey(name: 'amount') this.amount = 0,
      @JsonKey(name: 'asset_type') this.assetType,
      @JsonKey(name: 'is_frozen') this.isFrozen,
      @JsonKey(name: 'is_primary') this.isPrimary,
      @JsonKey(name: 'last_transaction_timestamp')
      this.lastTransactionTimestamp,
      @JsonKey(name: 'last_transaction_version') this.lastTransactionVersion,
      @JsonKey(name: 'owner_address') this.ownerAddress,
      @JsonKey(name: 'storage_id') this.storageId,
      @JsonKey(name: 'token_standard') this.tokenStandard,
      @JsonKey(name: 'metadata') this.metadata});

  factory _$CurrentFungibleAssetBalancesImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CurrentFungibleAssetBalancesImplFromJson(json);

  @override
  @JsonKey(name: '__typename')
  final String? typename;
  @override
  @JsonKey(name: 'amount')
  final int amount;
  @override
  @JsonKey(name: 'asset_type')
  final String? assetType;
  @override
  @JsonKey(name: 'is_frozen')
  final bool? isFrozen;
  @override
  @JsonKey(name: 'is_primary')
  final bool? isPrimary;
  @override
  @JsonKey(name: 'last_transaction_timestamp')
  final String? lastTransactionTimestamp;
  @override
  @JsonKey(name: 'last_transaction_version')
  final int? lastTransactionVersion;
  @override
  @JsonKey(name: 'owner_address')
  final String? ownerAddress;
  @override
  @JsonKey(name: 'storage_id')
  final String? storageId;
  @override
  @JsonKey(name: 'token_standard')
  final String? tokenStandard;
  @override
  @JsonKey(name: 'metadata')
  final Metadata? metadata;

  @override
  String toString() {
    return 'CurrentFungibleAssetBalances(typename: $typename, amount: $amount, assetType: $assetType, isFrozen: $isFrozen, isPrimary: $isPrimary, lastTransactionTimestamp: $lastTransactionTimestamp, lastTransactionVersion: $lastTransactionVersion, ownerAddress: $ownerAddress, storageId: $storageId, tokenStandard: $tokenStandard, metadata: $metadata)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentFungibleAssetBalancesImplToJson(
      this,
    );
  }
}

abstract class _CurrentFungibleAssetBalances
    implements CurrentFungibleAssetBalances {
  const factory _CurrentFungibleAssetBalances(
          {@JsonKey(name: '__typename') final String? typename,
          @JsonKey(name: 'amount') final int amount,
          @JsonKey(name: 'asset_type') final String? assetType,
          @JsonKey(name: 'is_frozen') final bool? isFrozen,
          @JsonKey(name: 'is_primary') final bool? isPrimary,
          @JsonKey(name: 'last_transaction_timestamp')
          final String? lastTransactionTimestamp,
          @JsonKey(name: 'last_transaction_version')
          final int? lastTransactionVersion,
          @JsonKey(name: 'owner_address') final String? ownerAddress,
          @JsonKey(name: 'storage_id') final String? storageId,
          @JsonKey(name: 'token_standard') final String? tokenStandard,
          @JsonKey(name: 'metadata') final Metadata? metadata}) =
      _$CurrentFungibleAssetBalancesImpl;

  factory _CurrentFungibleAssetBalances.fromJson(Map<String, dynamic> json) =
      _$CurrentFungibleAssetBalancesImpl.fromJson;

  @override
  @JsonKey(name: '__typename')
  String? get typename;
  @override
  @JsonKey(name: 'amount')
  int get amount;
  @override
  @JsonKey(name: 'asset_type')
  String? get assetType;
  @override
  @JsonKey(name: 'is_frozen')
  bool? get isFrozen;
  @override
  @JsonKey(name: 'is_primary')
  bool? get isPrimary;
  @override
  @JsonKey(name: 'last_transaction_timestamp')
  String? get lastTransactionTimestamp;
  @override
  @JsonKey(name: 'last_transaction_version')
  int? get lastTransactionVersion;
  @override
  @JsonKey(name: 'owner_address')
  String? get ownerAddress;
  @override
  @JsonKey(name: 'storage_id')
  String? get storageId;
  @override
  @JsonKey(name: 'token_standard')
  String? get tokenStandard;
  @override
  @JsonKey(name: 'metadata')
  Metadata? get metadata;
}

Metadata _$MetadataFromJson(Map<String, dynamic> json) {
  return _Metadata.fromJson(json);
}

/// @nodoc
mixin _$Metadata {
  @JsonKey(name: '__typename')
  String? get Typename => throw _privateConstructorUsedError;
  @JsonKey(name: 'decimals')
  int? get decimals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$MetadataImpl implements _Metadata {
  const _$MetadataImpl(
      {@JsonKey(name: '__typename') this.Typename,
      @JsonKey(name: 'decimals') this.decimals});

  factory _$MetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetadataImplFromJson(json);

  @override
  @JsonKey(name: '__typename')
  final String? Typename;
  @override
  @JsonKey(name: 'decimals')
  final int? decimals;

  @override
  String toString() {
    return 'Metadata(Typename: $Typename, decimals: $decimals)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MetadataImplToJson(
      this,
    );
  }
}

abstract class _Metadata implements Metadata {
  const factory _Metadata(
      {@JsonKey(name: '__typename') final String? Typename,
      @JsonKey(name: 'decimals') final int? decimals}) = _$MetadataImpl;

  factory _Metadata.fromJson(Map<String, dynamic> json) =
      _$MetadataImpl.fromJson;

  @override
  @JsonKey(name: '__typename')
  String? get Typename;
  @override
  @JsonKey(name: 'decimals')
  int? get decimals;
}
