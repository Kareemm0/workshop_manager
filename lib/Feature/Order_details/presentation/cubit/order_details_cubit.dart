import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:workshop_manager/Feature/Order_details/data/models/order_details_model.dart';
import 'package:workshop_manager/Feature/Order_details/domain/order_details_repo.dart';
import '../../../../Core/enum/order_status.dart';
import '../../../../Core/enum/service_state.dart';
part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final OrderDetailsRepo repo;

  OrderDetailsCubit(this.repo) : super(OrderDetailsInitial());

  final pendding = OrderStatus.pendding.name;
  final finished = OrderStatus.finished.name;
  final working = OrderStatus.working.name;
  final initial = ServiceState.initial.name;
  final servicePendding = ServiceState.pendding.name;

  final TextEditingController cancelController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  Future<void> orderDetails(String id) async {
    emit(OrderDetailsLoadingState());
    final result = await repo.orderDetails(id);
    result.fold(
      (failure) => emit(OrderDetailsFailureState(failure.message)),
      (order) => emit(OrderDetailsSuccessState(order)),
    );
  }

  Future<void> cancelOrder(String id) async {
    final OrderDetailsModel order = (state as OrderDetailsSuccessState).orders;
    final result = await repo.cancelOrder(
      id,
      cancelOrder: cancelController.text,
    );
    result.fold(
      (failure) => emit(CancelOrderFailureState(
        order,
        message: failure.message,
      )),
      (order) {
        log("=======================${order.id}");
        emit(CancelOrderSuccessState(order));
      },
    );
  }
}
