import 'package:appmoneymanager/common/enum/load_satatus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/enum/screen_size.dart';
import '../../../common/enum/utils.dart';
import '../../../models/transaction.dart';
import '../../common_widgets/noti_bar.dart';
import '../list_items/list_item_cubit.dart';
import '../list_items/list_item_screen.dart';

class AddEditScreen extends StatelessWidget {
  static const String route = "AddEditScreen";
  final bool isAddMode;
  final ScreenSize oldScreenSize;

  AddEditScreen(this.isAddMode, this.oldScreenSize);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isAddMode ? "Add" : "Edit")),
      body: _FormContent(isAddMode: isAddMode, oldScreenSize: oldScreenSize),
    );
  }
}

class _FormContent extends StatefulWidget {
  final bool isAddMode;
  final ScreenSize oldScreenSize;

  const _FormContent({required this.isAddMode, required this.oldScreenSize});

  @override
  State<_FormContent> createState() => _FormContentState();
}

class _FormContentState extends State<_FormContent> {
  late TextEditingController _title;
  late TextEditingController _content;
  late TextEditingController _amount;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: "");
    _content = TextEditingController(text: "");
    _amount = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _title.dispose();
    _content.dispose();
    _amount.dispose();
    super.dispose();
  }

  void _initializeFields(ListItemState state) {
    if (!_initialized) {
      if (!widget.isAddMode &&
          state.selectedIdx >= 0 &&
          state.selectedIdx < state.listTransaction.length) {
        final transaction = state.listTransaction[state.selectedIdx];
        _title.text = transaction.title;
        _content.text = transaction.content;
        _amount.text = transaction.amount.toString();
      }
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListItemCubit, ListItemState>(
      builder: (context, state) {
        _initializeFields(state);
        return Container(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Title",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _title,
                decoration: InputDecoration(
                  hintText: "Enter title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                  prefixIcon: Icon(Icons.label),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Content",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _content,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Enter content (optional)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                  prefixIcon: Icon(Icons.description),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Amount",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _amount,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                  prefixIcon: Icon(Icons.attach_money),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  var _cubit = context.read<ListItemCubit>();
                  try {
                    if (!widget.isAddMode) {
                      if (state.selectedIdx >= 0 &&
                          state.selectedIdx < state.listTransaction.length) {
                        final transaction = Transaction(
                          dateTime:
                              state.listTransaction[state.selectedIdx].dateTime,
                          title: _title.text,
                          content: _content.text,
                          amount: double.parse(_amount.text),
                        );
                        _cubit.editItem(transaction);
                        _pop(context);
                      }
                    } else {
                      _cubit.addItem(
                        Transaction(
                          dateTime: DateTime.now().toString().substring(0, 19),
                          title: _title.text,
                          content: _content.text,
                          amount: double.parse(_amount.text),
                        ),
                      );
                      _pop(context);
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(notiBar("Invalid amount", true));
                  }
                },
                icon: Icon(Icons.save),
                label: Text("Save"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  elevation: 4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _pop(BuildContext context) {
    final newScreenSize = calculateScreenSize(MediaQuery.sizeOf(context).width);
    if (widget.oldScreenSize == newScreenSize)
      Navigator.of(context).pop();
    else
      Navigator.of(context).popUntil(ModalRoute.withName(ListItemScreen.route));
  }
}
