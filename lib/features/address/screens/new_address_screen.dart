import 'package:amazon_clone/common/widgets/cusom_texfield.dart';
import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/search_nav_bar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/address/services/address_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddAddressScreen extends StatefulWidget {
  static const String routeName = '/add-address';
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final AddressServices addressServices = AddressServices();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _flatController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  final _addressFormKey = GlobalKey<FormState>();
  bool _isDefault = false;
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    _flatController.dispose();
    _areaController.dispose();
    _pincodeController.dispose();
    _cityController.dispose();
  }

  void addAddress() {
    String addressToBeUsed = "";

    if (_addressFormKey.currentState!.validate()) {
      addressToBeUsed = '${_cityController.text} - ${_pincodeController.text}';

      addressServices.addAddress(
          context: context,
          name: _nameController.text,
          mobile: _mobileController.text,
          flat: _flatController.text,
          area: _areaController.text,
          pincode: _pincodeController.text,
          city: _cityController.text,
          isDefault: _isDefault);
      if (_isDefault) {
        addressServices.saveDefaultAddress(
            context: context, address: addressToBeUsed);
      }
    } else {
      // showSnackBar(context, 'Please enter valide address');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SearchNavBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add a new address',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                text: 'User current Location',
                onTap: () {},
                color: Colors.grey.shade200,
                textColor: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'OR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Full Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: _mobileController,
                      hintText: 'Mobile',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                    Row(
                      children: [
                        Checkbox(
                          activeColor: GlobalVariables.appColor,
                          value: _isDefault,
                          onChanged: (value) {
                            _isDefault = !_isDefault;
                            setState(() {});
                          },
                        ),
                        InkWell(
                          onTap: (() {
                            _isDefault = !_isDefault;
                            setState(() {});
                          }),
                          child: const Text(
                            'Make this my default address',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Add delivery instructions',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Preferences are used to plan your delivery. \nHowever, shipments can sometimes arrive early \nor later than planned.',
                        ),
                      ],
                    ),
                    const Text(
                        'Preferences are used to plan your delivery. \nHowever, shipments can sometimes arrive early \nor later than planned.'),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      text: 'Add address',
                      color: const Color.fromRGBO(254, 216, 19, 1),
                      textColor: Colors.black87,
                      onTap: addAddress,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
