import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  List<Map<String, dynamic>> inventoryItems = [];

  void _addNewItem() {
    String itemName = '';
    String category = '';
    String quantity = '';
    String price = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add New Item"),
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.deepOrange, fontSize: 20),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildInputField("Item Name", (value) => itemName = value),
                _buildInputField("Category", (value) => category = value),
                _buildInputField("Quantity", (value) => quantity = value),
                _buildInputField("Price", (value) => price = value),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
                setState(() {
                  inventoryItems.add({
                    "name": itemName,
                    "category": category,
                    "quantity": quantity,
                    "price": price,
                    "status": "Available",
                    "date": currentDate,
                  });
                });
                Navigator.pop(context);
              },
              child: Text("Add"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInputField(String label, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.orangeAccent),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orangeAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Inventory"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: inventoryItems.isEmpty
                  ? Center(child: Text("No items yet.", style: TextStyle(color: Colors.white70)))
                  : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith((states) => Colors.deepOrange),
                  columnSpacing: 20,
                  columns: [
                    DataColumn(label: Text('Name', style: TextStyle(color: Colors.white))),
                    DataColumn(label: Text('Category', style: TextStyle(color: Colors.white))),
                    DataColumn(label: Text('Qty', style: TextStyle(color: Colors.white))),
                    DataColumn(label: Text('Price', style: TextStyle(color: Colors.white))),
                    DataColumn(label: Text('Status', style: TextStyle(color: Colors.white))),
                    DataColumn(label: Text('Date', style: TextStyle(color: Colors.white))),
                  ],
                  rows: inventoryItems.map((item) {
                    return DataRow(
                      cells: [
                        DataCell(Text(item['name'], style: TextStyle(color: Colors.white))),
                        DataCell(Text(item['category'], style: TextStyle(color: Colors.white))),
                        DataCell(Text(item['quantity'], style: TextStyle(color: Colors.white))),
                        DataCell(Text(item['price'], style: TextStyle(color: Colors.white))),
                        DataCell(Text(item['status'], style: TextStyle(color: Colors.white))),
                        DataCell(Text(item['date'], style: TextStyle(color: Colors.white))),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addNewItem,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: Text("Add New Item", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
