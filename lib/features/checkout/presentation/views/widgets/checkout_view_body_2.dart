import 'dart:developer';
import 'package:e_commerce/core/utils/app_keys.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:e_commerce/features/checkout/presentation/manager/order_cubit/order_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/custom_checkout_app_bar.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/step_items_list.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/steps_body_page_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody2 extends StatefulWidget {
  const CheckoutViewBody2({super.key});

  @override
  State<CheckoutViewBody2> createState() => _CheckoutViewBody2State();
}

class _CheckoutViewBody2State extends State<CheckoutViewBody2> {
  late PageController pageController;
  int currentPage = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isValid = false;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              customCheckoutAppBar(
                context,
                currentIndex: currentPage,
                onPressed: currentPage == 0
                    ? null
                    : () {
                        currentPage--;
                        log(currentPage.toString());
                        pageController.animateToPage(
                          currentPage,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeInOut,
                        );
                      },
              ),
              const SizedBox(height: 16),
              StepItemsList(currentIndex: currentPage),
              const SizedBox(height: 32),
              Expanded(
                child: StepsBodyPageView(pageController: pageController),
              ),
              CustomButton(
                onPressed: () {
                  if (currentPage == 0) {
                    paywayMethod();
                  } else if (currentPage == 1) {
                    addAddressMethod();
                  } else if (currentPage == 2) {
                    reviewPageMethod(context);
                  }
                },
                title:
                    currentPage ==
                        stepItemsBodies(pageController: pageController).length -
                            1
                    ? 'تأكيد الطلب'
                    : 'التالي',
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  void reviewPageMethod(BuildContext context) {
    final BuildContext parentContext = context;
    final OrderInputEntity orderEntity = context.read<OrderInputEntity>();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kClinetId,
          secretKey: kSecret,
          transactions: [PaypalPaymentEntity.fromEntity(orderEntity)],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log('isSuccess: ${params.toString()} }');
            Navigator.pop(context);
            try {
              log('order added');
              parentContext.read<OrderCubit>().addOrder(orderEntity: orderEntity);
              Navigator.pushNamedAndRemoveUntil(context, HomeView.routeName, (r) => false);
            } catch (e) {
              log('the onSuccess error ${e.toString()}');
            }
          },
          onError: (error) {
            log(error.toString());
            PaypalPaymentEntity paypalPaymentEntity =
                PaypalPaymentEntity.fromEntity(orderEntity);
            log(paypalPaymentEntity.toJson().toString());
            Navigator.pop(context);
          },
          onCancel: () {
            log('cancelled:');
          },
        ),
      ),
    );
  }

  void addAddressMethod() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      currentPage++;
      isValid = true;
      log(currentPage.toString());
      if (isValid) {
        formKey.currentState!.save();
        isValid = false;
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
        );
      }
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  void paywayMethod() {
    currentPage++;
    log(currentPage.toString());
    pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }
}
