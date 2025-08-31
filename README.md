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

4 - AnimatedSwitcher(
  duration: Duration(milliseconds: 300),
  child: isLoading ? CircularProgressIndicator() : Text('Done'),
);

5 - 




in init Cubit :

1 - think where we want to update the UI 
2 - in case use cubit above of full body , you must set Bloc(consumer, listner, builder) in Builder widget or extract cubit to a new widget
3 - 




in init form field : 

1 - set validator function in customTextField (to ensure filed is filled) and accept onSaved (Function) 
note : we send onSaved function in body because we create and send attributes to cubit's function
2 - in their column make it stateful widget and wrap the column by form widget  
3 - create GlobalKey to validate current state of form and AutoValidateMode 
4 - create three Strings {name , email , password} and set their values by onSaved function from each customTextField
5 - in CustomButton of SignUp check of form validate by formKey to save current state and trigger the SignUp cubit else 



pattern we use in add services

Domain -> entity -> repos -> Data -> repos -> repo_impl -> Presentation -> manager (cubits)



steps to configure google log in 

get SHA certificate fingerprints key and convert it to base64 , go to project settings and set SHA key

steps to configure facebook login is steps in DOCS 



doing section :

1 - create item entity 
2 - methods of entity
3 - 
4 - 








to make flow when i add product in a screen added in cart view

1 - create cart entity contains list of cart item entites 
2 - create cubit with states { product added , product deleted }
3 - in any screen when i add product must exist in cart view so i must provide cubit to all screen which i can add product or delete product
4 - determine the dividers by exist products or no 
5 - use cubit's function in added button 
6 - create method to get product entity if exist just increase count else add cart entity
7 - 