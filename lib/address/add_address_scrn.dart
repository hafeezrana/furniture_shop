import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/widgets/resusable_button.dart';
import 'package:map_location_picker/map_location_picker.dart';

import '../../../utils/widgets/text_style.dart';
import '../model/address.dart';
import '../utils/constants/map_key.dart';
import '../utils/widgets/reusable_card.dart';

class AddAdressScreen extends StatefulWidget {
  AddAdressScreen({this.address, super.key});

  static const route = '/addAddressScreen';
  Address? address;

  @override
  State<AddAdressScreen> createState() => _AddAdressScreenState();
}

class _AddAdressScreenState extends State<AddAdressScreen> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  final addressController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Text('Add Shipping Address',
                        style: MyTextStyle.textStyle3b),
                    const SizedBox(width: 10)
                  ],
                ),
                const SizedBox(height: 10),
                ReusableCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Name', style: MyTextStyle.textStyle2b),
                        ],
                      ),
                      const Divider(),
                      TextFormField(
                        maxLines: 1,
                        controller: nameController,
                        validator: (value) {
                          return value!.isEmpty ? 'Enter Name' : null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Ex. Hafeez Rana',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ReusableCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Address', style: MyTextStyle.textStyle2b),
                          IconButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MapLocationPicker(
                                        apiKey: gMapKey,
                                        components: [
                                          Component(Component.country, 'PK')
                                        ],
                                        canPopOnNextButtonTaped: true,
                                        currentLatLng:
                                            const LatLng(30.157458, 71.5249154),
                                        onNext: (GeocodingResult? result) {
                                          if (result != null) {
                                            setState(() {
                                              addressController.text =
                                                  result.formattedAddress ?? "";
                                            });
                                          }
                                        },
                                        onSuggestionSelected:
                                            (PlacesDetailsResponse? result) {
                                          if (result != null) {
                                            setState(() {});
                                          }
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.location_on_sharp,
                                color: Colors.green,
                                size: 35,
                              ))
                        ],
                      ),
                      const Divider(),
                      TextFormField(
                        maxLines: 2,
                        controller: addressController,
                        validator: (value) {
                          return value!.isEmpty ? 'Enter Address' : null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Ex. Gulberg III , Liberty Chowk , Lahore',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ResuableButton(
        buttonText: 'SAVE ADDRESS',
        onTap: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            if (nameController.text.isNotEmpty &&
                addressController.text.isNotEmpty) {
              Navigator.pop(context);
              Navigator.pop(context);
            }
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
