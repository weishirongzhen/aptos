import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:aptos/aptos.dart';
import 'package:aptos/coin_client.dart';
import 'package:aptos/constants.dart';
import 'package:aptos/indexer_client.dart';
import 'package:aptos/models/payload.dart';
import 'package:aptos/models/signature.dart';
import 'package:aptos/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed25519;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aptos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Transfer Aptos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final privateKeyTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();
  final amountTextEditingController = TextEditingController();
  var message = "";

  @override
  void initState() {
    super.initState();
    test();
  }

  void test() async {
    // final aptos = AptosClient(Constants.mainnetAPI, enableDebugLog: true);
    // final res = await aptos.getAccountResource('0x84b1675891d370d5de8f169031f9c3116d7add256ecf50a4bc71e3135ddba6e0',
    //     "0x1::coin::CoinStore<0x1::aptos_coin::AptosCoin>");
    //
    // print("wtf ${res}");
    //
    // final res2 = await aptos.getAccountResource('0x84b1675891d370d5de8f169031f9c3116d7add256ecf50a4bc71e3135ddba6e0',
    //     "0x1::coin::CoinStore<0xf22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa::asset::USDC>");
    //
    // print("wtf2 ${res2}");

    final indexerClient = IndexerClient(Constants.mainnetIndexer);

    // final coins =  await indexerClient.getAccountCoinsData(ownerAddress: '0x84b1675891d370d5de8f169031f9c3116d7add256ecf50a4bc71e3135ddba6e0');
    //
    //  print("wtf coins ${coins}");
    //
    final dy = await indexerClient.getCurrentFungibleAssetBalances(
      ownerAddress: '0x3f5d63ce3e32372246dbeb44dc7290ec66ac491727561b0d160e6c81bbe8645d',
      assetType: '0x2ebb2ccac5e027a87fa0e2e5f656a3a4238d6a48d93ec9b610d570fc0aa0df12',
    );
    debugPrint(
        "wtf dy ${dy.map((e) => '${e.assetType}  - ${e.metadata?.symbol} - ${e.metadata?.name} -  ${e.amount}')}");

    final dy2 = await indexerClient.getCurrentFungibleAssetsBalances(
      ownerAddress: '0x3f5d63ce3e32372246dbeb44dc7290ec66ac491727561b0d160e6c81bbe8645d',

    );
    debugPrint(
        "wtf dy2 ${dy2.map((e) => '${e.assetType}  - ${e.metadata?.symbol} - ${e.metadata?.name} -  ${e.amount}')}");
  }

  Future<dynamic> _transferWithEncodeSubmissionAPI(String privateKey, String receiverAddress, BigInt amount,
      BigInt gasPrice, BigInt maxGasAmount, BigInt expirationTimestamp) async {
    final aptos = AptosClient(Constants.testnetAPI, enableDebugLog: true);
    final account = AptosAccount(Uint8List.fromList(HEX.decode(privateKey)));
    final sender = account.address;
    final accountInfo = await aptos.getAccount(sender);
    final txSubmission = TransactionEncodeSubmissionRequest(
        sender: sender,
        sequenceNumber: accountInfo.sequenceNumber,
        maxGasAmount: maxGasAmount.toString(),
        gasUnitPrice: gasPrice.toString(),
        expirationTimestampSecs: expirationTimestamp.toString(),
        payload: Payload(
            type: "entry_function_payload",
            function: "0x1::coin::transfer",
            typeArguments: ["0x1::aptos_coin::AptosCoin"],
            arguments: [receiverAddress, amount.toString()]));

    final encodeTx = await aptos.encodeSubmission(txSubmission);
    final hex = HEX.decode(encodeTx.substring(2));
    final hexBytes = Uint8List.fromList(hex);
    final privateKeyBytes = HexString(privateKey).toUint8Array();
    final signingKey = ed25519.PrivateKey(privateKeyBytes);
    final signEncode = ed25519.sign(signingKey, hexBytes).sublist(0, 64);

    final tx = TransactionRequest(
        sender: txSubmission.sender,
        sequenceNumber: txSubmission.sequenceNumber,
        maxGasAmount: txSubmission.maxGasAmount.toString(),
        gasUnitPrice: txSubmission.gasUnitPrice.toString(),
        expirationTimestampSecs: txSubmission.expirationTimestampSecs.toString(),
        payload: txSubmission.payload,
        signature: Signature(
            type: "ed25519_signature", publicKey: account.pubKey().hex(), signature: "0x" + HEX.encode(signEncode)));

    final result = await aptos.submitTransaction(tx);
    debugPrint(result.toString());
    return result;
  }

  Future<dynamic> _transfer(String privateKey, String receiverAddress, BigInt amount, BigInt gasPrice,
      BigInt maxGasAmount, BigInt expirationTimestamp) async {
    final aptos = AptosClient(Constants.testnetAPI, enableDebugLog: true);
    final account = AptosAccount(Uint8List.fromList(HEX.decode(privateKey)));
    final sender = account.address;

    final accountInfo = await aptos.getAccount(sender);
    final ledgerInfo = await aptos.getLedgerInfo();
    final sequenceNumber = int.parse(accountInfo.sequenceNumber);

    const typeArgs = "0x1::aptos_coin::AptosCoin";
    const moduleId = "0x1::coin";
    const moduleFunc = "transfer";
    final entryFunc = EntryFunction.natural(
      moduleId,
      moduleFunc,
      [TypeTagStruct(StructTag.fromString(typeArgs))],
      [bcsToBytes(AccountAddress.fromHex(receiverAddress)), bcsSerializeUint64(amount)],
    );
    final entryFunctionPayload = TransactionPayloadEntryFunction(entryFunc);

    final rawTx = RawTransaction(AccountAddress.fromHex(sender), BigInt.from(sequenceNumber), entryFunctionPayload,
        maxGasAmount, gasPrice, expirationTimestamp, ChainId(ledgerInfo["chain_id"]));

    final privateKeyBytes = HexString(privateKey).toUint8Array();
    final signingKey = ed25519.newKeyFromSeed(privateKeyBytes.sublist(0, 32));
    final publicKey = ed25519.public(signingKey);

    final txnBuilder = TransactionBuilderEd25519(
      Uint8List.fromList(publicKey.bytes),
      (signingMessage) => Ed25519Signature(ed25519.sign(signingKey, signingMessage).sublist(0, 64)),
    );

    final signedTx = txnBuilder.rawToSigned(rawTx);
    final txEdd25519 = signedTx.authenticator as TransactionAuthenticatorEd25519;
    final signature = txEdd25519.signature.value;

    final tx = TransactionRequest(
        sender: sender,
        sequenceNumber: sequenceNumber.toString(),
        maxGasAmount: maxGasAmount.toString(),
        gasUnitPrice: gasPrice.toString(),
        expirationTimestampSecs: expirationTimestamp.toString(),
        payload: Payload(
            type: "entry_function_payload",
            function: "$moduleId::$moduleFunc",
            typeArguments: ["0x1::aptos_coin::AptosCoin"],
            arguments: [receiverAddress, amount.toString()]),
        signature: Signature(
            type: "ed25519_signature", publicKey: account.pubKey().hex(), signature: "0x" + HEX.encode(signature)));

    final result = await aptos.submitTransaction(tx);
    debugPrint(result.toString());
    return result;
  }

  Future<dynamic> _transferAptos(AptosAccount account, String receiverAddress, BigInt amount,
      {BigInt? gasPrice, BigInt? maxGasAmount, BigInt? expirationTimestamp}) async {
    final aptos = AptosClient(Constants.testnetAPI, enableDebugLog: true);
    final coinClient = CoinClient(aptos);
    final txHash = await coinClient.transfer(account, receiverAddress, amount,
        maxGasAmount: maxGasAmount, gasUnitPrice: gasPrice, expireTimestamp: expirationTimestamp);
    debugPrint(txHash);
    return txHash;
  }

  void _send() async {
    final privateKey = privateKeyTextEditingController.text.trim();
    final address = addressTextEditingController.text.trim();
    final amountText = amountTextEditingController.text.trim();

    AptosAccount account;
    try {
      account = AptosAccount(HexString(privateKey).toUint8Array());
    } catch (e) {
      setState(() {
        message = "invalid private key length";
      });
      return;
    }

    final amount = double.tryParse(amountText);
    if (amount == null) {
      setState(() {
        message = "invalid aptos amount";
      });
      return;
    }

    final totalAptos = BigInt.from(amount * pow(10, 8));
    final result = await _transferAptos(account, address, totalAptos);
    setState(() {
      message = "txhash: ${result["hash"]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                    controller: privateKeyTextEditingController,
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Private key")),
                const SizedBox(height: 40),
                TextField(
                    controller: addressTextEditingController,
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Receiver address")),
                const SizedBox(height: 20),
                TextField(
                    controller: amountTextEditingController,
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Aptos amount")),
                const SizedBox(height: 20),
                TextButton(onPressed: _send, child: const Text("Send", style: TextStyle(fontSize: 30))),
                const SizedBox(height: 20),
                Text(message, style: const TextStyle(color: Colors.red))
              ],
            ),
          ),
        ));
  }
}
