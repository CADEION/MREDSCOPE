part of 'common_widgets_imports.dart';

class RepoCard extends StatelessWidget {
  const RepoCard(
      {super.key,
      required this.repoName,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      required this.commentCount,
      required this.avatarUrl});

  final String repoName;
  final String description;
  final String createdAt;
  final String updatedAt;
  final int commentCount;
  final String avatarUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Card(
            elevation: 15.0, // Adds shadow to the card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Rounds the corners
            ),
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: Image(image: NetworkImage(avatarUrl)),
                        radius: 30,
                      ),
                      repoName
                          .text
                          .fontWeight(FontWeight.w900)
                          .xl2
                          .italic
                          .make()
                    ],
                  ),
                  Divider(),
                  4.h.heightBox,
                  description
                      .text
                      .xl
                      .fontWeight(FontWeight.w700)
                      .maxLines(3)
                      .overflow(TextOverflow.ellipsis)
                      .make(),
                  10.h.heightBox,
                  'Created At  : ${createdAt}'.text.medium.make(),
                  
                  2.h.heightBox,
                  'Updated At :${updatedAt}:'.text.medium.make(),
                  
                  2.h.heightBox,
                  'Comment Count: ${commentCount}'.text.medium.make(),
                  10.h.heightBox,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
