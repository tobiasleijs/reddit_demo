import 'package:reddit_app/persistence/models/comment_model.dart';
import 'package:reddit_app/persistence/models/post_model.dart';
import 'package:reddit_app/persistence/models/subreddit_model.dart';
import 'package:reddit_app/persistence/models/user_model.dart';
import 'package:reddit_app/persistence/persistence_port.dart';

class PersistenceAdapter implements PersistencePort {
  static final PersistenceAdapter _persistenceAdapter =
      PersistenceAdapter._internal();
  factory PersistenceAdapter() {
    return _persistenceAdapter;
  }

  PersistenceAdapter._internal();

  List<PostModel> posts = [
    const PostModel(
        id: 1,
        title: 'Why Ajax will win the Europa League',
        authorId: 0,
        subreddit: 'r/soccer',
        body:
            'Ajax has all the ingredients to emerge victorious in the Europa League this season. With their relentless attacking prowess, skillful midfielders, and a solid defense, they\'ve shown an unwavering determination to claim the title. Under the astute guidance of their coach, their tactical acumen and ability to adapt to different opponents have been impressive. Furthermore, their rich history and experience in European competitions give them the edge, and their young talents continue to shine on the international stage. With a perfect blend of youth and experience, Ajax is poised to conquer the Europa League and add another prestigious trophy to their illustrious legacy.'),
    const PostModel(
        id: 2,
        title: 'How to get to radiant asap?',
        authorId: 1,
        subreddit: 'r/VALORANT',
        body:
            'Hey fellow Valorant players! I\'ve been grinding the ranks lately, and I\'m really eager to reach Radiant as soon as possible. Any tips or strategies you could share to help me climb the ladder quickly? I\'ve been working on my aim and communication, but I feel like there\'s more I can do to improve my game. Any agent recommendations or specific techniques that have worked for you in your journey to Radiant? Thanks in advance for the advice!'),
    const PostModel(
        id: 3,
        title:
            'How Max Verstappen got the record for most consecutive grand prix wins',
        authorId: 2,
        subreddit: 'r/formula1',
        body:
            'Max Verstappen secured the record for the most consecutive Grand Prix wins by delivering a remarkable performance in the 2023 Formula 1 season. Driving for Red Bull Racing, he achieved a total of nine consecutive wins from the Miami Grand Prix in May to the Dutch Grand Prix in August. Verstappen\'s success was attributed to his exceptional driving skills, the competitiveness of the Red Bull car, and strategic team decisions that optimized his race performances during this impressive streak, solidifying his reputation as one of the sport\'s most formidable talents.')
  ];

  List<CommentModel> comments = [
    const CommentModel(
        commenterId: 3,
        comment:
            'To quickly climb the Valorant ranks, prioritize aim training, communicate effectively, learn map details, master multiple agents, emphasize teamwork, manage your economy wisely, watch professional gameplay for tips, and strive for consistency in your performance.',
        postId: 2),
    const CommentModel(
        commenterId: 4,
        comment:
            'Look, folks, you wouldn\'t believe the winning strategy I\'ve got for you in Valorant. Tremendous game, very tremendous. You\'ve got to aim big, okay? We\'re talking the best aim, folks, nobody aims better than me. And communication, let me tell you, nobody communicates like I do. My communication is beautiful, just beautiful. Build a team, a fantastic team, the best team, and make Valorant great again. That\'s what we\'re going to do, folks. Believe me.',
        postId: 2),
    const CommentModel(commenterId: 5, comment: 'Just be me lol', postId: 2),
    const CommentModel(
        commenterId: 2,
        comment:
            'Ajax certainly has the potential to win the Europa League, but they\'ll face tough competition from other clubs like Manchester United, Arsenal, and Napoli. It\'s all about performance on the day, and we\'ll have to wait and see how they handle the pressure.',
        postId: 1),
    const CommentModel(
        commenterId: 4,
        comment:
            'Let me tell you, folks, Ajax is going to win the Europa League, and they\'re going to win it bigly! Believe me, I know winners, and Ajax is a winning team. No one else even comes close. It\'s going to be beautiful, folks, just beautiful.',
        postId: 1),
    const CommentModel(
        commenterId: 0,
        comment:
            'While Ajax does have a strong team, let\'s not forget that the Europa League is a highly competitive tournament. There are several other quality teams in the mix, so it won\'t be a walk in the park for them. But, I\'m hoping for an exciting tournament!',
        postId: 1),
    const CommentModel(
        commenterId: 3,
        comment:
            'Ajax has a strong squad and they\'ve shown great form recently. Their attacking prowess and solid defense make them a serious contender for the Europa League title. Let\'s go, Ajax!',
        postId: 1),
    const CommentModel(
        commenterId: 1,
        comment:
            'Ajax has a rich history in European competitions, and their youth academy consistently produces top talent. However, it\'s essential to consider that football can be unpredictable. Anything can happen in knockout rounds, so let\'s enjoy the journey and see how far they can go!',
        postId: 1),
    const CommentModel(
        commenterId: 6, comment: 'This guy is cheating', postId: 3),
    const CommentModel(
        commenterId: 7,
        comment: 'MAX MAX MAX\nSUPER MAX MAX\nSUPER SUPER MAX MAX MAX',
        postId: 3),
  ];

  List<UserModel> users = [
    const UserModel(
        id: 0,
        username: 'FreekVonk',
        firstname: 'Freek',
        lastname: 'Vonk',
        email: 'FreekVonk@gmail.com',
        about: 'The Dutch Steve Irwin',
        remarks: '',
        avatar: 'users/freekvonk.jpg',
        title: 'The Shark'),
    const UserModel(
        id: 1,
        username: 'Joe_Biden',
        firstname: 'Joe',
        lastname: 'Biden',
        email: 'JoeBiden@us.gov.com',
        about: 'Lives in the white house',
        remarks: 'Probably has alzheimers',
        avatar: 'users/joebiden.jpg',
        title: 'POTUS'),
    const UserModel(
        id: 2,
        username: 'SebasVettel',
        firstname: 'Sebastian',
        lastname: 'Vettel',
        email: 'Sebastian_Vettel@redbull.com',
        about: 'Four time world champion.',
        remarks: '',
        avatar: 'users/weltmeister.png',
        title: 'Die weltmeister'),
    const UserModel(
        id: 3,
        username: 'mrPresident',
        firstname: 'Mark',
        lastname: 'Rutte',
        email: 'MarkRutte@rijksoverheid.nl',
        about: 'Will retire soon',
        remarks: 'Bad memory',
        avatar: 'users/rutte.jpg',
        title: 'Demissionary'),
    const UserModel(
        id: 4,
        username: 'exPOTUS',
        firstname: 'Donald',
        lastname: 'Trump',
        email: 'DonaldTrump@theelectionswererigged.com',
        about: 'Will make a tremendous comeback',
        remarks: 'Orange hair',
        avatar: 'users/trump.jpg',
        title: 'the_unimpeachable'),
    const UserModel(
        id: 5,
        username: 'TenZ',
        firstname: 'Tyson',
        lastname: 'Ngo',
        email: 'tenz@sentinels.com',
        about: 'Retired csgo player, rising valorant player',
        remarks: '',
        avatar: 'users/tenz.png',
        title: '#1 valorant player'),
    const UserModel(
        id: 6,
        username: 'LewisMercedes',
        firstname: 'Lewis',
        lastname: 'Hamilton',
        email: 'LewisHamilton@mercedes.com',
        about: 'His tyres are dead',
        remarks: '',
        avatar: 'users/hamilton.png',
        title: 'Sir'),
    const UserModel(
        id: 7,
        username: 'ThePitstopBoys',
        firstname: 'Pitstop',
        lastname: 'Boys',
        email: 'thepitstopboys@yahoo.nl',
        about: '',
        remarks: '',
        avatar: 'users/pitstopboys.jpg',
        title: 'Sir'),
  ];

  List<SubredditModel> subreddits = [
    const SubredditModel(name: 'r/VALORANT', image: 'subreddits/valo.png'),
    const SubredditModel(name: 'r/soccer', image: 'subreddits/soccer.png'),
    const SubredditModel(name: 'r/formula1', image: 'subreddits/f1.png'),
  ];

  @override
  PostModel getPostFromId(int postId) {
    return posts.singleWhere((element) => element.id == postId);
  }

  @override
  CommentModel getCommentFromPostId(int postId) {
    return comments.singleWhere((element) => element.postId == postId);
  }

  @override
  List<CommentModel> getCommentsForPost(int postId) {
    return comments.where((element) => element.postId == postId).toList();
  }

  @override
  SubredditModel getSubreddit(String name) {
    return subreddits.singleWhere((element) => element.name == name);
  }

  @override
  UserModel getUserFromId(int userId) {
    return users.singleWhere((element) => element.id == userId);
  }

  @override
  List<PostModel> getPosts() {
    return posts;
  }

  @override
  List<String> getSubredditNames() {
    return subreddits.map((e) => e.name).toList();
  }

  @override
  void savePost(PostModel post) {
    int highestPostId = 0;
    for (PostModel postModel in posts) {
      if (postModel.id > highestPostId) highestPostId = postModel.id;
    }
    posts.add(post.copyWith(id: (highestPostId + 1)));
  }

  @override
  void saveComment(CommentModel comment) {
    comments.add(comment);
  }
}
