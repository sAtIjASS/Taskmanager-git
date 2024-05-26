import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String environment;
  late String appId;
  late String merchantId;
  late bool enableLogging;
  late String checksum;
  late String saltkey;
  late String salfindex;
  late String callbackurl;
  late String body;
  late Object ?result;
  @override
  void initState()
  {
    environment="UAT_SIM";
    appId="";
    merchantId="PGTESTPAYUAT";
    enableLogging=true;
    checksum="";
    saltkey="099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
    salfindex="1";
    callbackurl="https://www.google.com";
    body="";
    String apiEndPoint="/pg/v1/pay";
    super.initState();

  }
  void phonepeInit()
  {
    PhonePePaymentSdk.init(environment, appId, merchantId, enableLogging)
        .then((val) => {
      setState(() {
        result = 'PhonePe SDK Initialized - $val';
      })
    })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Center(

        )
      )
    );
  }


  void startpayment() async{

    PhonePePaymentSdk.startTransaction(body, callbackurl, checksum, {}).then((response) => {
      setState(() {
        if (response != null)
        {
          String status = response['status'].toString();
          String error = response['error'].toString();
          if (status == 'SUCCESS')
          {
            // "Flow Completed - Status: Success!";
          }
          else {
            // "Flow Completed - Status: $status and Error: $error";
          }
        }
        else {
          // "Flow Incomplete";
        }
      })
    }).catchError((error) {
      // handleError(error)
      return <dynamic>{};
    });

  }
  void handleError(error) {
    setState(() {
      result=error.toString();
    });
  }
}