import 'product.dart';

class QuantityTile extends StatelessWidget {
  const QuantityTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (previous, current) => previous.quantity != current.quantity,
      builder: (context, state) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.numbers),
          subtitle: TextField(
            onChanged: (quantity) =>
                context.read<ProductBloc>().add(QuantityChanged(quantity)),
            decoration: InputDecoration(
                labelText: 'Quantity',
                counterText: '',
                border: OutlineInputBorder(borderRadius: borderMedium)),
            keyboardType: TextInputType.number,
            autocorrect: false,
            //autofillHints: const <String>['Email'],
            maxLength: 5,
          ),
        );
      },
    );
  }
}

class NameTile extends StatelessWidget {
  const NameTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.title),
          subtitle: TextField(
            onChanged: (name) =>
                context.read<ProductBloc>().add(NameChanged(name)),
            decoration: InputDecoration(
                labelText: 'Name',
                counterText: '',
                border: OutlineInputBorder(borderRadius: borderMedium)),
            keyboardType: TextInputType.text,
            autocorrect: false,
            //autofillHints: const <String>['Email'],
            maxLength: 5,
          ),
        );
      },
    );
  }
}

class ImageTile extends StatelessWidget {
  const ImageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (previous, current) => previous.image != current.image,
      builder: (context, state) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.title),
          subtitle: TextField(
            onChanged: (image) =>
                context.read<ProductBloc>().add(ImageChanged(image)),
            decoration: InputDecoration(
                labelText: 'Image',
                counterText: '',
                border: OutlineInputBorder(borderRadius: borderMedium)),
            keyboardType: TextInputType.text,
            autocorrect: false,
            //autofillHints: const <String>['Email'],
            maxLength: 5,
          ),
        );
      },
    );
  }
}

class UpdateProductButton extends StatelessWidget {
  const UpdateProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: () => context.read<ProductBloc>().add(const UpdateProduct()),
      icon: const Icon(Icons.add),
      label: const Text('Update Product'),
    );
  }
}
