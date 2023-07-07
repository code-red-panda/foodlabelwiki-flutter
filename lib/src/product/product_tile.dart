import 'product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    void editProduct() {
      showModalBottomSheet(
          context: context,
          useSafeArea: true,
          showDragHandle: true,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          builder: (context) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: BlocProvider(
                create: (context) => ProductBloc(),
                child: const Wrap(
                  children: [
                    QuantityTile(),
                    NameTile(),
                    ImageTile(),
                    UpdateProductButton(),
                  ],
                ),
              ),
            );
          });
    }

    return ListTile(
      tileColor: product.isComplete
          ? Theme.of(context).colorScheme.primaryContainer
          : null,
      leading: CircleAvatar(
        foregroundImage: AssetImage(product.image),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: product.quantity,
                style: Theme.of(context).textTheme.titleSmall),
            const TextSpan(text: ' '),
            TextSpan(
                text: product.name,
                style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () => editProduct(),
                icon: Icon(
                  Icons.edit,
                  size: 15,
                )),
            Checkbox(
                value: product.isComplete, onChanged: (value) => print(value)),
          ],
        ),
      ),
      onTap: () => print('abc'),
    );
  }
}
