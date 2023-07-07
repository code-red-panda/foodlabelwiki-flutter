import 'store.dart';

List<Aisle> aisles = [
  Aisle(
    name: 'Produce',
    products: const [Product(name: 'Apples'), Product(name: 'Apples')],
    allProductsComplete: false,
    sort: 1,
  ),
  Aisle(
    name: 'Deli',
    products: const [Product(name: 'Lamb'), Product(name: 'Ground beef')],
    allProductsComplete: false,
    sort: 2,
  ),
  Aisle(
    name: 'Aisle 2',
    products: const [Product(name: 'Beans')],
    allProductsComplete: false,
    sort: 3,
  ),
  Aisle(
    name: 'Aisle 6',
    products: [],
    allProductsComplete: true,
    sort: 4,
  ),
  Aisle(
    name: 'Pharmacy',
    products: [],
    allProductsComplete: true,
    sort: 5,
  ),
  Aisle(
    name: 'By the checkstands',
    products: const [Product(name: 'Gum')],
    allProductsComplete: false,
    sort: 6,
  ),
];

class StoreView extends StatefulWidget {
  const StoreView({
    super.key,
  });

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  StreamController<Aisle> controller = StreamController<Aisle>();
  late Stream<Aisle> stream;

  @override
  void initState() {
    stream = controller.stream;
    for (var aisle in aisles) {
      print(aisle);
      controller.add(aisle);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void fabAdd() {
     showModalBottomSheet(
          context: context,
          useSafeArea: true,
          showDragHandle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          builder: (context) {
            return Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.store),
                  title: const Badge(
                      label: Text('Premium'),
                      offset: Offset(-75, 0),
                      child: Text('Add store')),
                  onTap: () => print('add store'),
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: const Text('Add aisle'),
                  onTap: () => print('add aisle'),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: const Text('Add product'),
                  onTap: () => print('add product'),
                )
              ],
            );
          });
    }

    Future<void> showD(BuildContext context) async {
      print('show d');
      await showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('This is a typical dialog.'),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ),
              );
    }

    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: aisles.length,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Kyle HEB'),
            actions: [
                            IconButton(
                onPressed: () => showD(context),
                icon: const Icon(Icons.edit_document),
                tooltip: 'View and edit account',
              ),
              PopupMenuButton<ListTile>(
                itemBuilder: (theContext) => <PopupMenuEntry<ListTile>>[
                  PopupMenuItem<ListTile>(
                    onTap: () => print('share list'),
                    child: const ListTile(
                      leading: Icon(Icons.share),
                      title: Text('Share list'),
                      trailing: Icon(Icons.group),
                    ),
                  ),
                  PopupMenuItem<ListTile>(
                    onTap: () => print('edit store name'),
                    child: const ListTile(
                      leading: Icon(Icons.edit_document),
                      title: Text('Edit store name'),
                    ),
                  ),
                  PopupMenuItem<ListTile>(
                    onTap: () => showD(theContext),
                    child: const ListTile(
                      leading: Icon(Icons.delete_forever),
                      title: Text('Delete list'),
                      
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => print('account'),
                icon: const Icon(Icons.account_circle),
                tooltip: 'View and edit account',
              ),
            ],
            bottom: TabBar(
                isScrollable: true,
                tabs: aisles
                    .map((aisle) => Badge(
                        isLabelVisible: !aisle.allProductsComplete,
                        label: Text('4'),
                        offset: const Offset(15, 5),
                        child: Tab(text: aisle.name)))
                    .toList()),
          ),
          body: StreamBuilder<Object>(
            stream: stream,
            builder: (context, snapshot) {
              print(snapshot.connectionState);
              print(snapshot.data);
              // If stream is active
              if (snapshot.connectionState == ConnectionState.active) {
                // On error, display error message
                if (snapshot.hasError) {}
          
                // On data, return stuff
                // maybe add && snapshot.data!.docs.isNotEmpty
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductTile(
                          product: aisles[index].products![index]);
                    },
                  );
                }
          
                // On no error and no data, display empty results
                return const Text('Empty results');
              }
          
              // If stream is not complete, display loading
              return const CircularProgressIndicator();
            },
          ),
          bottomNavigationBar: BottomAppBar(
            height: 75,
            child: Row(
              children: [
                IconButton(
                    onPressed: () => print('edit'),
                    icon: const Icon(Icons.edit),
                    tooltip: 'Edit products'),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
            onPressed: () => fabAdd(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.endContained,
        ),
      ),
    );
  }
}
