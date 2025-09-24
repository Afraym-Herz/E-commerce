# e_commerce

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:



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

5 -  Event Bus in favorite button in card




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

1 - create order entity contain all infos we need to create order (list of cart items entity , bool if pay cash or by paypal , all address infos) 
2 - check if cart has cart entities 
3 - determine how you get those infos { we get it by provider.value it is just inherited widget }
4 - how send those infos to firebase 
5 - 
6 - 