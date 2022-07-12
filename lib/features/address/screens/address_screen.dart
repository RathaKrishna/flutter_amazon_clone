// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/address/services/address_services.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import 'package:amazon_clone/common/widgets/cusom_texfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/providers/user_provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;
  const AddressScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final AddressServices addressServices = AddressServices();

  final TextEditingController _flatController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  final _addressFormKey = GlobalKey<FormState>();
  List<PaymentItem> paymentItems = [];
  String addressToBeUsed = "";

  @override
  void initState() {
    super.initState();
    paymentItems.add(PaymentItem(
      amount: widget.totalAmount,
      label: 'Total Amount',
      status: PaymentItemStatus.final_price,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _flatController.dispose();
    _areaController.dispose();
    _pincodeController.dispose();
    _cityController.dispose();
  }

  void onApplePayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveDefaultAddress(
          context: context, address: addressToBeUsed);
    }
    addressServices.placeOrder(
        context: context,
        address: addressToBeUsed,
        totalSum: double.parse(widget.totalAmount));
  }

  void onAGooglePayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveDefaultAddress(
          context: context, address: addressToBeUsed);
    }
    addressServices.placeOrder(
        context: context,
        address: addressToBeUsed,
        totalSum: double.parse(widget.totalAmount));
  }

  void payPressed(String addressFromProvider) {
    addressToBeUsed = "";

    bool isForm = _flatController.text.isNotEmpty ||
        _areaController.text.isNotEmpty ||
        _pincodeController.text.isNotEmpty ||
        _cityController.text.isNotEmpty;

    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${_flatController.text}, ${_areaController.text}, ${_cityController.text} - ${_pincodeController.text}';
      } else {
        throw Exception('Please enter all the values!');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'ERROR');
    }
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(8),
            color: GlobalVariables.backgroundColor,
            child: Column(
              children: [
                if (address.isNotEmpty)
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              address,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                Form(
                  key: _addressFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _flatController,
                        hintText: 'Flat, House no, Building',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _areaController,
                        hintText: 'Area, Street',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _pincodeController,
                        hintText: 'Pincode',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _cityController,
                        hintText: 'Town/city',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ApplePayButton(
                        width: double.infinity,
                        height: 45,
                        style: ApplePayButtonStyle.whiteOutline,
                        type: ApplePayButtonType.buy,
                        paymentConfigurationAsset: 'applepay.json',
                        onPaymentResult: onApplePayResult,
                        paymentItems: paymentItems,
                        onPressed: () => payPressed(address),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GooglePayButton(
                        width: double.infinity,
                        height: 45,
                        paymentConfigurationAsset: 'gpay.json',
                        onPaymentResult: onAGooglePayResult,
                        paymentItems: paymentItems,
                        style: GooglePayButtonStyle.black,
                        type: GooglePayButtonType.buy,
                        onPressed: () => payPressed(address),
                        loadingIndicator: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
