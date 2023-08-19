import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ihun_food_app/src/features/products/domain/entities/product.dart';

import '../../../../config/styles/text_styles.dart';
import '../bloc/products_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  late ProductsBloc _productsBloc;

  @override
  void initState() {
    super.initState();
    _productsBloc = context.read<ProductsBloc>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:
            //Todo: Change to CircleAvatar and onTap function to navigate to the page [ProfilePage]
            IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Center(
              child: TextField(
                cursorColor: Colors.black,
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: _ClearButton(controller: _controller),
                  labelText: 'Find your favorite food',
                  border: const OutlineInputBorder(),
                  focusColor: Colors.black,
                  labelStyle: TextStyles.defaultStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                onChanged: (text) {
                  _productsBloc.add(
                    SearchingProduct(query: text),
                  );
                },
                onEditingComplete: () {
                  setState(() {});
                },
                onTap: () {
                  setState(() {});
                },
                onSubmitted: (value) {
                  value = _controller.text;
                },
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 20.w,
            indent: 20.w,
          ),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is SearchProductLoading) {
                return const CircularProgressIndicator.adaptive();
              } else if (state is SearchProductSuccess) {
                return state.products.isEmpty
                    ? const Text('No Results')
                    : Expanded(child: _SearchResults(items: state.products));
              } else if (state is SearchProductEmptyList) {
                return const Text('Please enter a term to begin');
              } else if (state is SearchProductError) {
                return Text(state.message);
              } else {
                return const Text('Please enter a term to beginnn');
              }
            },
          )
        ],
      ),
    );
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
        onPressed: () => controller.clear(),
      );
}

class _SearchResults extends StatelessWidget {
  const _SearchResults({Key? key, required this.items}) : super(key: key);

  final List<ProductEntity> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return _SearchResultItem(item: items[index]);
      },
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  const _SearchResultItem({Key? key, required this.item}) : super(key: key);

  final ProductEntity item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: Image.network(item.image[0]),
      title: Text(item.name),
    );
  }
}
