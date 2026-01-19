import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/address_provider.dart';
import '../../models/address.dart';

class AddressSelectionScreen extends StatelessWidget {
  const AddressSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Address'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: Consumer<AddressProvider>(
        builder: (context, addressProvider, _) {
          final addresses = addressProvider.addresses;

          if (addresses.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_off_outlined,
                    size: 100,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No saved addresses',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      _showAddAddressDialog(context, addressProvider);
                    },
                    child: const Text('Add New Address'),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: addresses.length + 1,
            itemBuilder: (context, index) {
              if (index == addresses.length) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      _showAddAddressDialog(context, addressProvider);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(Icons.add_location_alt_outlined),
                          SizedBox(width: 12),
                          Text(
                            'Add New Address',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              final address = addresses[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: RadioListTile(
                  value: address.id,
                  groupValue: addressProvider.defaultAddress?.id,
                  onChanged: (value) {
                    addressProvider.setDefaultAddress(address.id);
                    Navigator.pop(context);
                  },
                  title: Text(
                    address.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(address.fullAddress),
                      const SizedBox(height: 4),
                      Text('Phone: ${address.phone}'),
                    ],
                  ),
                  isThreeLine: true,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showAddAddressDialog(BuildContext context, AddressProvider addressProvider) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final streetController = TextEditingController();
    final cityController = TextEditingController();
    final stateController = TextEditingController();
    final pincodeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Address'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: streetController,
                decoration: const InputDecoration(
                  labelText: 'Street Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: stateController,
                decoration: const InputDecoration(
                  labelText: 'State',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: pincodeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Pincode',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  phoneController.text.isNotEmpty &&
                  streetController.text.isNotEmpty &&
                  cityController.text.isNotEmpty &&
                  stateController.text.isNotEmpty &&
                  pincodeController.text.isNotEmpty) {
                final newAddress = Address(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: nameController.text,
                  phone: phoneController.text,
                  street: streetController.text,
                  city: cityController.text,
                  state: stateController.text,
                  pincode: pincodeController.text,
                  isDefault: addressProvider.addresses.isEmpty,
                );
                addressProvider.addAddress(newAddress);
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    ).then((_) {
      nameController.dispose();
      phoneController.dispose();
      streetController.dispose();
      cityController.dispose();
      stateController.dispose();
      pincodeController.dispose();
    });
  }
}
