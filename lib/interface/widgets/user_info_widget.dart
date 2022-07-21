import 'package:im_good/interface/shared/ui_helpers.dart';
import 'package:im_good/interface/widgets/text_widget.dart';
import 'package:im_good/models/user.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final User user;
  const UserInfoWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellowAccent,
      margin: basePadding,
      child: Container(
        padding: constPadding,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWiget.body('name:      ${user.name}'),
            verticalSpaceTiny,
            TextWiget.body('email:      ${user.email}'),
            verticalSpaceTiny,
            TextWiget.body('phone:     ${user.phone}'),
            verticalSpaceTiny,
            TextWiget.body('website:  ${user.website}'),
            verticalSpaceSmall,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWiget.body(
                  'company:',
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceTiny,
                      TextWiget.body("\nname:  " + user.company.name),
                      TextWiget.body("bs:        " + user.company.bs),
                      verticalSpaceTiny,
                      TextWiget.caption('catchPhrase:  "${user.company.catchPhrase}"'),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpaceSmall,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWiget.body(
                  'address:  ',
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceTiny,
                      TextWiget.body(
                          '\nstreet:  ${user.address.street},\nsuite:    ${user.address.suite},\ncity:      ${user.address.city}'),
                      verticalSpaceTiny,
                      TextWiget.caption('zipcode:  ${user.address.zipcode}'),
                      TextWiget.caption(
                        'Longitude: ${user.address.geo['lng']}, & Latitude: ${user.address.geo['lat']}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
