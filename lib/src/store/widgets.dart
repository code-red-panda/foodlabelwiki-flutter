import 'store.dart';

class ProductTile extends StatefulWidget {
  final Product product;

  const ProductTile({
    super.key,
    required this.product,
  });

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void setChecked(bool value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: widget.product.quantity),
            const TextSpan(text: ' '),
            TextSpan(text: widget.product.name),
          ],
        ),
      ),
      value: widget.product.isComplete,
      secondary: CircleAvatar(
        foregroundImage: AssetImage(widget.product.image),
      ),
      onChanged: (newValue) => print('abc'),
    );
  }
}