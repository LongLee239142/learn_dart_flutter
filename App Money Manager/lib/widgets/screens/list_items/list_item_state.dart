part of 'list_item_cubit.dart';

class ListItemState {
  final List<Transaction> listTransaction;
  final List<String> listMonths;
  final int selectedIdx;
  final int selectedMonth;
  final double total;
  final LoadStatus loadStatus;
  final ScreenSize screenSize;
  const ListItemState.init({
     this.listTransaction = const[],
     this.listMonths = const[],
     this.selectedIdx = -1,
     this.selectedMonth = 0,
     this.total = 0,
     this.loadStatus = LoadStatus.Init,
    this.screenSize = ScreenSize.Small,
  });

  //<editor-fold desc="Data Methods">
  const ListItemState({
    required this.listTransaction,
    required this.listMonths,
    required this.selectedIdx,
    required this.selectedMonth,
    required this.total,
    required this.loadStatus,
    required this.screenSize,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListItemState &&
          runtimeType == other.runtimeType &&
          listTransaction == other.listTransaction &&
          listMonths == other.listMonths &&
          selectedIdx == other.selectedIdx &&
          selectedMonth == other.selectedMonth &&
          total == other.total &&
          loadStatus == other.loadStatus &&
          screenSize == other.screenSize);

  @override
  int get hashCode =>
      listTransaction.hashCode ^
      listMonths.hashCode ^
      selectedIdx.hashCode ^
      selectedMonth.hashCode ^
      total.hashCode ^
      loadStatus.hashCode ^
      screenSize.hashCode;

  @override
  String toString() {
    return 'ListItemState{' +
        ' listTransaction: ${listTransaction.length},' +
        ' listMonths: ${listMonths.length},' +
        ' selectedIdx: ${selectedIdx},' +
        ' selectedMonth: ${selectedMonth},' +
        ' total: $total,' +
        ' loadStatus: $loadStatus,' +
        ' screenSize: $screenSize,' +
        '}';
  }

  ListItemState copyWith({
    List<Transaction>? listTransaction,
    List<String>? listMonths,
    int? selectedIdx,
    int? selectedMonth,
    double? total,
    LoadStatus? loadStatus,
    ScreenSize? screenSize,
  }) {
    return ListItemState(
      listTransaction: listTransaction ?? this.listTransaction,
      listMonths: listMonths ?? this.listMonths,
      selectedIdx: selectedIdx ?? this.selectedIdx,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      total: total ?? this.total,
      loadStatus: loadStatus ?? this.loadStatus,
      screenSize: screenSize ?? this.screenSize,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'listTransaction': this.listTransaction,
      'listMonths': this.listMonths,
      'selectedIdx': this.selectedIdx,
      'selectedMonth': this.selectedMonth,
      'total': this.total,
      'loadStatus': this.loadStatus,
      'screenSize': this.screenSize,
    };
  }

  factory ListItemState.fromMap(Map<String, dynamic> map) {
    return ListItemState(
      listTransaction: map['listTransaction'] as List<Transaction>,
      listMonths: map['listMonths'] as List<String>,
      selectedIdx: map['selectedIdx'] as int,
      selectedMonth: map['selectedMonth'] as int,
      total: map['total'] as double,
      loadStatus: map['loadStatus'] as LoadStatus,
      screenSize: map['screenSize'] as ScreenSize,
    );
  }

  //</editor-fold>
}

