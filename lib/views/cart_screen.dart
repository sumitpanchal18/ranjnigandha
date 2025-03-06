import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/utils/base/base_screen_two.dart';
import 'package:rajanigandha/utils/color_constant.dart';
import 'package:rajanigandha/utils/images.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(name: 'Pulse Kachcha Aam Candy', point: 300, quantity: 2, isSelected: true),
    CartItem(name: 'Pulse Kachcha Aam Candy', point: 300, quantity: 1, isSelected: false),
    CartItem(name: 'Pulse Kachcha Aam Candy', point: 300, quantity: 1, isSelected: false),
  ];

  void updateCart() {
    setState(() {});
  }

  void removeItem(CartItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPoints = cartItems.fold(0, (sum, item) => sum + (item.isSelected ? item.point * item.quantity : 0));
    int totalItems = cartItems.fold(0, (sum, item) => sum + (item.isSelected ? item.quantity : 0));
    bool allSelected = cartItems.every((item) => item.isSelected); // Check if all items are selected

    return BaseScreenTwo(
      title: 'My Cart',
      rightComponent:  Row(
        children: [
          Checkbox(
            value: allSelected,
            onChanged: (bool? value) {
              for (var item in cartItems) {
                item.isSelected = value ?? false;
              }
              updateCart();
            },
            activeColor: ColorConstant.yellow,
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return ColorConstant.yellow; // Selected color
              }
              return ColorConstant.appColor; // Default color
            }),
          ),
          Text(
            "${cartItems.length} Products",
            style: TextStyle(
              color: ColorConstant.yellow,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              /// 🔹 Cart Items (Scrollable)
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return CartItemWidget(
                      item: cartItems[index],
                      onUpdate: updateCart,
                      onDelete: removeItem,
                    );
                  },
                ),
              ),
            ],
          ),

          /// 🔹 Bottom Summary (Fixed at Bottom)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _bottomSummary(totalPoints, totalItems),
          ),
        ],
      ),
    );
  }



  Widget _bottomSummary(int totalPoints, int totalItems) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 26),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        children: [
          _summaryRow("Point", "$totalPoints"),
          _summaryRow("Item", "$totalItems"),
          Divider(thickness: 1),
          _summaryRow("Total", "$totalPoints", isBold: true),
          SizedBox(height: 20),
          // SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     onPressed: totalItems > 0 ? () {} : null,
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: totalItems > 0 ? Colors.orange : Colors.grey,
          //       padding: EdgeInsets.symmetric(vertical: 15),
          //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          //       textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //     ),
          //     child: Text("Redeem"),
          //   ),
          // ),
          _buildButton('Redeem'),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return GestureDetector(
      onTap: () {
        // Add your onTap functionality here
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: ColorConstant.product_bgclrsg,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final int point;
  int quantity;
  bool isSelected;

  CartItem({required this.name, required this.point, required this.quantity, this.isSelected = false});
}

class CartItemWidget extends StatefulWidget {
  final CartItem item;
  final VoidCallback onUpdate;
  final Function(CartItem) onDelete;

  CartItemWidget({required this.item, required this.onUpdate, required this.onDelete});

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color:  widget.item.isSelected ? Color(0xFFFFF5E5) : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Checkbox(
              value: widget.item.isSelected,
              onChanged: (bool? value) {
                setState(() {
                  widget.item.isSelected = value!;
                });
                widget.onUpdate();
              },
              activeColor: ColorConstant.yellow, // Set the check color
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return ColorConstant.yellow; // Selected color
                }
                return Colors.grey.shade300; // Default color
              }),
            ),
            Image.asset(AppImages.imgPulse, width: 50, height: 50),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.item.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Point: ${widget.item.point}', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red, size: 24),
                  onPressed: () {
                    widget.onDelete(widget.item);
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    quantityButton(false, () {
                      if (widget.item.quantity > 1) {
                        setState(() {
                          widget.item.quantity--;
                        });
                        widget.onUpdate();
                      }
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text('${widget.item.quantity}', style: TextStyle(fontSize: 16)),
                    ),
                    quantityButton(true, () {
                      setState(() {
                        widget.item.quantity++;
                      });
                      widget.onUpdate();
                    }),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget quantityButton(bool isIncrement, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.orange, width: 2),
        ),
        alignment: Alignment.center,
        child: Icon(
          isIncrement ? Icons.add : Icons.remove,
          size: 18,
          color: Colors.orange,
        ),
      ),
    );
  }

}