import 'dart:convert';
import 'package:http/http.dart' as http;

class Product {
  final String id;
  final String name;
  final String description;
  final String price;
  final String imagePath;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price']?.toString() ?? '0',
      imagePath: json['image_path'] ?? 'assets/shop/image 3.png',
      category: json['category'] ?? 'all',
    );
  }
}

class ProductService {
  // Update this URL to your actual API endpoint - do not use ngrok for production
  static const String baseUrl = 'https://your-actual-api-endpoint.com/api';

  // Add timeout for better error handling
  Future<List<Product>> fetchProducts({String? category}) async {
    try {
      // Create the URL with the appropriate filters
      final Uri uri;

      if (category != null && category != 'all') {
        // If a specific category is requested
        uri = Uri.parse('$baseUrl/products').replace(
          queryParameters: {'category': category},
        );
      } else {
        // Get all products
        uri = Uri.parse('$baseUrl/products');
      }

      // Log the request URL for debugging

      // Set timeout to avoid hanging if the server doesn't respond
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception(
              'Connection timeout. Please check your internet connection.');
        },
      );

      // Log response for debugging

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception(
            'Server returned error ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  // Helper function to limit string length for logging
  int min(int a, int b) {
    return a < b ? a : b;
  }
}
