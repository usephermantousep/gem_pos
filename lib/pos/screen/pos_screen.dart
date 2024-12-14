part of 'package:gempos/global/screens.dart';

class POSScreen extends StatefulWidget {
  const POSScreen({super.key});

  @override
  State<POSScreen> createState() => _POSScreenState();
}

class _POSScreenState extends State<POSScreen> {
  final List<Map<String, dynamic>> products = [
    {'name': 'Product 1', 'price': 10, 'category': 'Food'},
    {'name': 'Product 2', 'price': 20, 'category': 'Drinks'},
    {'name': 'Product 3', 'price': 15, 'category': 'Food'},
    {'name': 'Product 4', 'price': 25, 'category': 'Snacks'},
    {'name': 'Product 5', 'price': 30, 'category': 'Drinks'},
  ];

  final List<Map<String, dynamic>> cart = [];
  final List<String> categories = ['All', 'Food', 'Drinks', 'Snacks'];
  String selectedCategory = 'All';
  String searchQuery = '';
  double totalPrice = 0;

  void addToCart(Map<String, dynamic> product) => setState(() {
        cart.add(product);
        totalPrice += product['price'];
      });

  void navigateToCart(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CartPage(cart: cart, totalPrice: totalPrice),
        ),
      );

  List<Map<String, dynamic>> getFilteredProducts() => products
      .where((product) =>
          (selectedCategory == 'All' || product['category'] == selectedCategory) &&
          (product['name'].toLowerCase().contains(searchQuery.toLowerCase())))
      .toList();

  @override
  Widget build(BuildContext context) {
    final filteredProducts = getFilteredProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('POS System'),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Product',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => setState(() => searchQuery = value),
            ),
          ),
          // Category chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  final isSelected = category == selectedCategory;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      selectedColor: Colors.blue,
                      backgroundColor: Colors.grey[200],
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          // Product list
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text(product['name']),
                    subtitle: Text('Price: \$${product['price']}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        addToCart(product);
                      },
                      child: Text('Add'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          navigateToCart(context);
        },
        label: Text('Cart (\$${totalPrice.toStringAsFixed(2)})'),
        icon: Icon(Icons.shopping_cart),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  final double totalPrice;

  const CartPage({super.key, required this.cart, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text(item['name']),
                    subtitle: Text('Price: \$${item['price']}'),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add checkout functionality here
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text('Checkout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
