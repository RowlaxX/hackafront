import 'package:flutter/material.dart';
import 'package:hackafront/profile_card.dart';

class AccountList extends StatefulWidget {
  final List<dynamic> ids;
  final void Function(String) onSelected;

  const AccountList(this.ids, this.onSelected, {super.key});

  @override
  State<StatefulWidget> createState() => AccountListState();
}

class AccountListState extends State<AccountList> {

  @override
  Widget build(BuildContext context) => ListView.builder(
    itemBuilder: (context, index) => ProfileCard(widget.ids[index].toString(), widget.onSelected),
    itemCount: widget.ids.length,
  );
  
}