import 'package:bloc/bloc.dart';

import '../../../common/enum/load_satatus.dart';
import '../../../common/enum/screen_size.dart';
import '../../../models/transaction.dart';
import '../../../repository/api.dart';

part 'list_item_state.dart';

class ListItemCubit extends Cubit<ListItemState> {
  Api api;

  ListItemCubit(this.api) : super(ListItemState.init());

  Future<void> loadData(int monthIdx) async {
    emit(
      state.copyWith(loadStatus: LoadStatus.Loading, selectedMonth: monthIdx),
    );
    try {
      var listMonths = await api.getMonths();
      emit(state.copyWith(listMonths: listMonths));
      var total = await api.getTotal();
      emit(state.copyWith(total: total));
      List<Transaction> listTransaction = listMonths.isEmpty
          ? []
          : await api.getTransaction(listMonths[monthIdx]);
      emit(state.copyWith(listTransaction: listTransaction, loadStatus: LoadStatus.Done));
    } catch (ex) {
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }
  Future<void> deleteItem(String dateTime) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
      await api.deleteTransaction(dateTime);
      await loadData(state.selectedMonth);
    } catch (ex) {
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }
  Future<void> addItem(Transaction transaction) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
      await api.addTransaction(transaction);
      await loadData(state.selectedMonth);
    } catch (ex) {
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }

  Future<void> editItem(Transaction transaction) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
      await api.editTransaction(transaction);
      await loadData(state.selectedMonth);
    } catch (ex) {
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }

  void setScreenSize(ScreenSize screenSize) {
    emit(state.copyWith(screenSize: screenSize));
  }

  void setSelectedIdx(int selectedIdx) {
    emit(state.copyWith(selectedIdx: selectedIdx));
  }
}
