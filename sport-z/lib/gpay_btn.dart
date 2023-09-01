import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

class GpayBtn extends StatefulWidget {
  GpayBtn({Key? key}) : super(key: key);

  @override
  _GpayBtnState createState() => _GpayBtnState();
}

class _GpayBtnState extends State<GpayBtn> {
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  // void onApplePayResult(paymentResult) {
  //   debugPrint(paymentResult.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      width: 320,
      height: 55,
      paymentConfigurationAsset: 'gpay.json',
      paymentItems: _paymentItems,
      style: GooglePayButtonStyle.black,
      type: GooglePayButtonType.pay,
      margin: const EdgeInsets.only(top: 15.0),
      onPaymentResult: onGooglePayResult,
      loadingIndicator: const Center(
        child: CircularProgressIndicator(
          backgroundColor: Color(0XFFB4B4B4),
          color: Color(0XFF5AE999),
        ),
      ),
    );
  }
}
