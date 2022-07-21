import 'package:im_good/interface/shared/ui_helpers.dart';
import 'package:im_good/interface/widgets/text_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'users_view_model.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UsersViewModel>.reactive(
      viewModelBuilder: () => UsersViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: const TextWiget.headline2('Пользователи'),
          centerTitle: true,
        ),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: viewModel.users.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => viewModel.navigateToUserView(index),
                  child: Card(
                    margin: basePadding,
                    child: Padding(
                      padding: constPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextWiget.headline3(viewModel.users[index].name),
                          verticalSpaceTiny,
                          CircleAvatar(child: Text(viewModel.users[index].username.substring(0, 1))),
                          verticalSpaceTiny,
                          TextWiget.body(viewModel.users[index].username),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
