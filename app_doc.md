# E_COMMERCE

## Core : 


### Services :


#### database_services : 

it is abstract class has 3 methods 

1 - addData() : 

- accept 3 parameters { path - data (map) - documentId(O) } and return  void

2 - getData() : 

- accept 3 parameters { path - documentId(O) - query (map - O) } and return dynamic 

3 - checkDataExists() : 

- accept 2 parameters { path - documentId }


#### firestore_services : 

it is impl for database_services and using firebase package to use FirebaseFirestore functions

1 - addData() :

- if docId is null we add data by add method in our path and firebase add auto docId
- else we use .doc method and use set method to add specific id 

2 - getData() : 

- if docId is not null get data directly and check if is empty or not exist 
- else add reference for our collection and check if query is not null check orderBy field and limit field is not null and apply them in data 
- else query is null only get data 

3 - checkDataExist() : 

- only check if collection with specific id is exist 


#### firebase_auth_services : 

it is class which responsibility for all operation that relate with auth services

1 - createUserWithEmailAndPassword() :

- accept 3 parameters { email - password - name } and return User (firebase model)
- we create instance for firebaseAuth to use create user method 
- we use firebaseAuth.createUserWithEmailAndPassword to create user and return user model
- we check on some cases such as weak pass , email already exist or etc..

2 - logInWithEmailAndPassword() : 

- accept 2 parameters { email - password } and return User (firebase model)
- we create instance for firebaseAuth to use sign in method 
- check on some cases such as user not found , wrong pass or etc..

3 - signInWithGoogle() : 

- part 1 : final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn() :
 
 * This opens the Google Sign-In popup (or native dialog on mobile).
 * if user choose an account will return object of this account 

- part 2 : final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication :
 
 * From the signed-in Google account, it requests an authentication token.
 * This gives you: idToken → unique token for this Google user and accessToken → used to access Google APIs.

- part 3 : final credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken , idToken: googleAuth?.idToken) :

 * use to make authCredintail to use this email by accessToken to provide access and idToken to determine the user 
 * This credential is a bridge between Google and Firebase Auth and Firebase will verify this with Google’s servers.

4 - signInWithFacebook() :

- part 1 : final LoginResult loginResult = await FacebookAuth.instance.login() :
 
 * This opens the Facebook Sign-In popup (or native dialog on mobile).
 * if user choose an account will return object of this account

- part 2 : final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString) :
 
 * we get access token from loginResult that provide authenticated with facebook 
 * firebase want OAuthCredential to understand firebase token and use it to use sign in with credential 


#### shared_preferences_singelton : 

its responsibility is to save specific data localy 
create instance of shared preference 

1 - all set methods accept two parameters { key - value } 
2 - all get methods accept one parameter { key }



### Models : 


#### Product_model : 

- contain all attributes we want about product are {productName - productCode - productPrice - productDescription - productImage - isFeatured - imageUrl - expiryMonths - isOrganic - numOfCalories - avgRating - ratingCount - unitAmount - reviews - sellingCount}
- contain all methods we want to use in this model { fromJson - toEntity - toMap }


### Entities


#### Product_entity : 

- contain all attributes will shown in UI 


### Utils :

class contains benfit methods and constants values

- app_colors : all colors value used in project 
- app_decorations : const shape decoration
- app_keys : keys we use to configration with external services
- app_text_styles : all text styles and their attributes
- assets : all images created by assets generations 
- backend_end_points : all paths using in firebase 


### Repos : 


#### order_repo folder : 

we put this repo in core folder because we use it in different parts of project

* part 1 order_repo file :
- is abstract class contain only one method is addOrder()  
- addOrder() accept OrderInputEntity and return either ( Failures or void )

* part 2 order_repo_impl : 
- is impl of order_repo 
- first we create DatabaseServices object to use addData() 
- add OrderModel by convert OrderInputEntity to OrderModel to json , add path by Endpoints and documentId by order model  

#### product_repo folder : 

we put this repo in core folder because we use it in different parts of project

* part 1 product_repo file : 
- it is an abstract class that contain just two methods getProducts() and getBestSellingProducts()

* part 2 product_repo_impl file : 
- it is impl of product repo for getProducts() and getBestSellingProducts()
- first method is getProducts() return either() we make instance of databaseServices to use getData()
- we set BackendEndpoints.products for path and we accept productsCollection we convert each product to productModel and convert it to entity 


### helper_functions : 

it is contain all general functions we use in project 

- 1 - getAvgRating() to clac avarage of reviews rating 
- 2 - getCurrency() to set currency of pay is created to change in all project
- 3 - getDummyProduct() to return list of dummy products to use in loading case 
- 4 - getSavedUserData() to get saved user entity by accept its key and convert it by UserModel.fromJson()
- 5 - onGenerateRoutes() it is used in pushNamed it accepts RouteSettings and return route for each screen and we can send arguments when navigate to other screen  
- 6 - customSnackBar() custom snackbar we use to show message in project


### cubits / product_cubit 

we set it in core folder because we use this cubit in many places in project

- 1 - productsCubit contain two methods which exist in products_repo 
- 2 - first getProducts we call databaseServices.getData() so if result success we emit productsSuccess else emit productsFailure
- 3 - same opertion in getBestSelling() just add different path




## Features 

we divide each Feature to seperate folder 

## Auth Feature

Handles **user authentication and authorization**.

### Responsibilities
- User registration (Email & Password)
- User login
- Google Sign-In
- Password reset
- Authentication state handling

### Includes
- **Entities:** `UserEntity`
- **Models:** `UserModel`
- **Repositories:** `AuthRepo`, `AuthRepoImpl`
- **Cubits:**  
  - LoginCubit  
  - SignupCubit  
  - LoginWithGoogleCubit
- **UI:**  
  - Login view  
  - Signup view  
  - Forget password view  
- **Widgets:**  
  - Custom auth app bar  
  - Social auth buttons  
  - Progress HUD  
  - Form helpers & validation widgets  

---

## Home Feature

Responsible for **main application flow and product browsing**.

### Responsibilities
- Display products
- Show best sellers
- Manage shopping cart
- Navigate between main screens
- Handle cart state updates

### Includes
- **Entities:**  
  - CartEntity  
  - CartItemEntity  
- **Cubits:**  
  - CartCubit  
  - CartItemCubit  
- **Views:**  
  - Home view  
  - Products view  
  - Best sellers view  
  - Cart view  
  - Profile view  
- **Widgets:**  
  - Product grid & list items  
  - Cart item widgets  
  - Bottom navigation bar  
  - Offers list  
  - Custom app bars  

---

## Checkout Feature

Handles **order processing and payments**.

### Responsibilities
- Multi-step checkout flow
- Collect shipping address
- Select shipping method
- Handle PayPal payments
- Review & submit orders

### Includes
- **Entities:**  
  - OrderEntity  
  - ShippingAddressEntity  
  - PayPal payment entities  
- **Models:**  
  - Order models  
  - Payment models  
- **Cubits:**  
  - OrderCubit  
- **UI & Widgets:**  
  - Checkout steps UI  
  - Address form  
  - Shipping selection  
  - Payment widgets  
  - Order summary & review  

---

## Onboarding Feature

Introduces the app to **first-time users**.

### Responsibilities
- Display onboarding screens
- Handle page transitions
- Improve first-launch experience

### Includes
- **Views:**  
  - Onboarding view  
- **Widgets:**  
  - PageView  
  - Dots indicator  
  - Onboarding page items  

---

## Splash Feature

Handles **initial app startup**.

### Responsibilities
- Display splash screen
- Initialize app resources
- Navigate user based on app state (auth / onboarding)

### Includes
- **Views:**  
  - Splash view  
- **Widgets:**  
  - Splash body  

---

## Feature Design Principles

- Each feature is **independent and isolated**
- No feature depends directly on another feature
- Shared logic lives in the `core` module
- State management handled using **Bloc / Cubit**
- UI layer is separated from business logic

---

## Benefits of This Structure

- High scalability
- Easy maintenance
- Test-friendly
- Clear separation of concerns
- Professional, production-ready architecture
