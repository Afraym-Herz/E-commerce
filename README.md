# e_commerce

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




widget want use in our app 

1 - WidgetsBinding.instance.addPostFrameCallback((_) {
  // Start async work after first frame is rendered
  fetchDataOrStartAnimation();
});

2 - class _MyTabState extends State<MyTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
}

3 - IntrinsicHeight(
  child: Row(children: [...]),
)

4 - 




in init Cubit :

1 - think where we want to update the UI 
2 - in case use cubit above of full body , you must set Bloc(consumer, listner, builder) in Builder widget or extract cubit to a new widget
3 - 