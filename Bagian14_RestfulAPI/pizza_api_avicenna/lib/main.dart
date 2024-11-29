import 'package:flutter/material.dart';
import 'package:pizza_api_avicenna/httphelper.dart';
import 'package:pizza_api_avicenna/pizza.dart';
import 'package:pizza_api_avicenna/pizza_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pizza API Avicenna'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    List<Pizza> pizzas = await helper.getPizzaList();
    return pizzas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: callPizzas(),
        builder: (context, AsyncSnapshot<List<Pizza>> pizzas) {
          if (pizzas.hasError) {
            return Center(child: Text('Error: ${pizzas.error}'));
          }
          if (!pizzas.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          // final pizzas = pizzas.data!;
          return ListView.builder(
            itemCount: (pizzas.data == null) ? 0 : pizzas.data!.length,
            itemBuilder: (BuildContext context, int position) {
              return Dismissible(
                key: Key(pizzas.data![position].id.toString()),
                onDismissed: (item) {
                  HttpHelper helper = HttpHelper();
                  pizzas.data!.removeWhere((element) {
                    return element.id == pizzas.data![position].id;
                  });
                  helper.deletePizza(pizzas.data![position].id);
                },
                child: ListTile(
                  title: Text(pizzas.data![position].pizzaName),
                  subtitle: Text(
                    '${pizzas.data![position].description} - \$ ${pizzas.data![position].price}',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PizzaDetailScreen(
                          pizza: pizzas.data![position],
                          isNew: false,
                        ),
                      ),
                    );
                  },
                  // leading: Image.network(pizzas.data![position].imageUrl),
                  // trailing: Text(pizzas.data![position].price.toString()),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PizzaDetailScreen(
                pizza: Pizza(
                  id: 0,
                  pizzaName: '',
                  description: '',
                  price: 0.0,
                  imageUrl: '',
                ),
                isNew: true,
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
