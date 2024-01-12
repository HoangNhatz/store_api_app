import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/services/API_handler.dart';
import 'package:store_api_flutter_course/widgets/feeds_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  List<ProductsModel> productsList = [];
  @override
  void didChangeDependencies() {
    getAllProducts();
    super.didChangeDependencies();
  }

  Future<void> getAllProducts() async {
    productsList = await APIhandler.getAllProducts();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All products'),
      ),
      body: productsList.isEmpty
          ? const Center(child: CircularProgressIndicator(),)
          : Padding(
              padding: const EdgeInsets.only(top: 8),
              child: GridView.builder(
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: productsList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 0.67,
                ),
                itemBuilder: (ctx, index) {
                  return FeedsWidget(
                    imageUrl: productsList[index].images![0],
                    title: productsList[index].title.toString(),
                  );
                },
              ),
            ),
    );
  }
}
