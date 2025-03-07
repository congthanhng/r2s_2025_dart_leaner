import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  int? selectedIndex;
  final List<Map<String, dynamic>> foodItems = [
    {
      'name': 'Beef Ribs',
      'description': 'USDA beef ribs finger',
      'image': 'assets/images/beef_bacon.png',
      'rating': 5.0,
      'reviews': 100
    },
    {
      'name': 'Beef Bacon',
      'description': 'USDA beef bacon',
      'image': 'assets/images/beef_bacon.png',
      'rating': 4.5,
      'reviews': 100
    },
    {
      'name': 'Beefstake',
      'description': 'USDA beefsteak',
      'image': 'assets/images/beef_bacon.png',
      'rating': 4.8,
      'reviews': 100
    },
    {
      'name': 'Salad',
      'description': 'Lemony White Bean Salad with Prosciutto',
      'image': 'assets/images/beef_bacon.png',
      'rating': 4.7,
      'reviews': 100
    },
    {
      'name': 'Berry Mojito',
      'description': 'Homemade berry syrup',
      'image': 'assets/images/beef_bacon.png',
      'rating': 4.6,
      'reviews': 100
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8ECE2),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      backgroundColor: const Color(0xFFF8ECE2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tiêu đề + Dropdown filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best seller',
                  // style: GoogleFonts.poppins(
                  //   fontSize: 22,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.black,
                  // ),
                ),
                DropdownButton<String>(
                  value: 'ALL',
                  items: const [
                    DropdownMenuItem(value: 'ALL', child: Text('ALL')),
                    DropdownMenuItem(value: 'MEAT', child: Text('Meat')),
                    DropdownMenuItem(value: 'VEG', child: Text('Veg')),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Danh sách món ăn
            Expanded(
              child: ListView.builder(
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final item = foodItems[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: selectedIndex == index
                            ? Border.all(color: Colors.blue, width: 2)
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Hình ảnh món ăn
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            child: Image.asset(
                              item['image'],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Thông tin món ăn
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    // style: GoogleFonts.poppins(
                                    //   fontSize: 16,
                                    //   fontWeight: FontWeight.bold,
                                    // ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item['description'],
                                    // style: GoogleFonts.poppins(
                                    //   fontSize: 14,
                                    //   color: Colors.grey[600],
                                    // ),
                                  ),
                                  const SizedBox(height: 6),
                                  // Đánh giá + số lượt đánh giá
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          color: Colors.red, size: 16),
                                      const Icon(Icons.star,
                                          color: Colors.red, size: 16),
                                      const Icon(Icons.star,
                                          color: Colors.red, size: 16),
                                      const Icon(Icons.star,
                                          color: Colors.red, size: 16),
                                      const Icon(Icons.star,
                                          color: Colors.red, size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        '(${item['reviews']})',
                                        // style: GoogleFonts.poppins(
                                        //   fontSize: 12,
                                        //   color: Colors.grey[600],
                                        // ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Nút "Reserve"
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Reserve',
                                // style: GoogleFonts.poppins(
                                //   color: Colors.white,
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.bold,
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
