import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/cupertino.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: FeaturesListViewItem(),
            );
          }),
    );
  }
}
