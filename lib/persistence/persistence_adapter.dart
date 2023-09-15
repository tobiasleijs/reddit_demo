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
            'Ajax has all the ingredients to emerge victorious in the Europa League this season. With their relentless attacking prowess, skillful midfielders, and a solid defense, they\'ve shown an unwavering determination to claim the title. Under the astute guidance of their coach, their tactical acumen and ability to adapt to different opponents have been impressive. Furthermore, their rich history and experience in European competitions give them the edge, and their young talents continue to shine on the international stage. With a perfect blend of youth and experience, Ajax is poised to conquer the Europa League and add another prestigious trophy to their illustrious legacy.',
        upvotes: [2, 3, 4],
        downvotes: []),
    const PostModel(
        id: 2,
        title: 'How to get to radiant asap?',
        authorId: 1,
        subreddit: 'r/VALORANT',
        body:
            'Hey fellow Valorant players! I\'ve been grinding the ranks lately, and I\'m really eager to reach Radiant as soon as possible. Any tips or strategies you could share to help me climb the ladder quickly? I\'ve been working on my aim and communication, but I feel like there\'s more I can do to improve my game. Any agent recommendations or specific techniques that have worked for you in your journey to Radiant? Thanks in advance for the advice!',
        upvotes: [1, 5],
        downvotes: [6]),
    const PostModel(
        id: 3,
        title:
            'How Max Verstappen got the record for most consecutive grand prix wins',
        authorId: 2,
        subreddit: 'r/formula1',
        body: 'Max Verstappen secured the record for the most consecutive Grand Prix wins by delivering a remarkable performance in the 2023 Formula 1 season. Driving for Red Bull Racing, he achieved a total of nine consecutive wins from the Miami Grand Prix in May to the Dutch Grand Prix in August. Verstappen\'s success was attributed to his exceptional driving skills, the competitiveness of the Red Bull car, and strategic team decisions that optimized his race performances during this impressive streak, solidifying his reputation as one of the sport\'s most formidable talents.',
        upvotes: [1, 5],
        downvotes: []),
  ];

  List<CommentModel> comments = [
    const CommentModel(
        id: 1,
        commenterId: 3,
        comment:
            'To quickly climb the Valorant ranks, prioritize aim training, communicate effectively, learn map details, master multiple agents, emphasize teamwork, manage your economy wisely, watch professional gameplay for tips, and strive for consistency in your performance.',
        postId: 2,
        upvotes: [3, 5, 7],
        downvotes: [2]),
    const CommentModel(
        id: 2,
        commenterId: 4,
        comment:
            'Look, folks, you wouldn\'t believe the winning strategy I\'ve got for you in Valorant. Tremendous game, very tremendous. You\'ve got to aim big, okay? We\'re talking the best aim, folks, nobody aims better than me. And communication, let me tell you, nobody communicates like I do. My communication is beautiful, just beautiful. Build a team, a fantastic team, the best team, and make Valorant great again. That\'s what we\'re going to do, folks. Believe me.',
        postId: 2,
        upvotes: [1, 2],
        downvotes: []),
    const CommentModel(
        id: 3,
        commenterId: 5,
        comment: 'Just be me lol',
        postId: 2,
        upvotes: [3, 2, 1],
        downvotes: [7, 6]),
    const CommentModel(
        id: 4,
        commenterId: 2,
        upvotes: [6, 5, 7, 2],
        downvotes: [],
        comment:
            'Ajax certainly has the potential to win the Europa League, but they\'ll face tough competition from other clubs like Manchester United, Arsenal, and Napoli. It\'s all about performance on the day, and we\'ll have to wait and see how they handle the pressure.',
        postId: 1),
    const CommentModel(
        id: 5,
        commenterId: 4,
        upvotes: [0, 1, 2, 3, 5, 6, 7],
        downvotes: [],
        comment:
            'Let me tell you, folks, Ajax is going to win the Europa League, and they\'re going to win it bigly! Believe me, I know winners, and Ajax is a winning team. No one else even comes close. It\'s going to be beautiful, folks, just beautiful.',
        postId: 1),
    const CommentModel(
        id: 6,
        commenterId: 0,
        upvotes: [1, 2, 3],
        downvotes: [],
        comment:
            'While Ajax does have a strong team, let\'s not forget that the Europa League is a highly competitive tournament. There are several other quality teams in the mix, so it won\'t be a walk in the park for them. But, I\'m hoping for an exciting tournament!',
        postId: 1),
    const CommentModel(
        id: 7,
        commenterId: 3,
        upvotes: [],
        downvotes: [],
        comment:
            'Ajax has a strong squad and they\'ve shown great form recently. Their attacking prowess and solid defense make them a serious contender for the Europa League title. Let\'s go, Ajax!',
        postId: 1),
    const CommentModel(
        id: 8,
        commenterId: 1,
        upvotes: [2],
        downvotes: [],
        comment:
            'Ajax has a rich history in European competitions, and their youth academy consistently produces top talent. However, it\'s essential to consider that football can be unpredictable. Anything can happen in knockout rounds, so let\'s enjoy the journey and see how far they can go!',
        postId: 1),
    const CommentModel(
        id: 9,
        commenterId: 6,
        upvotes: [],
        downvotes: [0, 1, 2, 3, 4, 5, 7],
        comment: 'This guy is cheating',
        postId: 3),
    const CommentModel(
        id: 10,
        commenterId: 7,
        upvotes: [2],
        downvotes: [],
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
        email: 'sebastianvettel@redbull.com',
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
    comments.add(comment.copyWith(id: comments.length + 1));
  }

  @override
  void upvotePost(int postId, int userId) {
    PostModel post = getPostFromId(postId);
    List<int> upvotes = List.from(post.upvotes);
    List<int> downvotes = List.from(post.downvotes);
    int postIndex = posts.indexOf(post);

    if (!upvotes.contains(userId)) {
      upvotes.add(userId);
      if (downvotes.contains(userId)) {
        downvotes.remove(userId);
      }
    } else {
      upvotes.remove(userId);
    }
    posts[postIndex] = post.copyWith(upvotes: upvotes, downvotes: downvotes);
  }

  @override
  void downvotePost(int postId, int userId) {
    PostModel post = getPostFromId(postId);
    List<int> upvotes = List.from(post.upvotes);
    List<int> downvotes = List.from(post.downvotes);
    int postIndex = posts.indexOf(post);

    if (!downvotes.contains(userId)) {
      downvotes.add(userId);
      if (upvotes.contains(userId)) {
        upvotes.remove(userId);
      }
    } else {
      downvotes.remove(userId);
    }
    posts[postIndex] = post.copyWith(upvotes: upvotes, downvotes: downvotes);
  }

  @override
  int getUpvoteScore(int postId) {
    PostModel post = getPostFromId(postId);
    return post.upvotes.length - post.downvotes.length;
  }

  @override
  int? loginUser(String email, String password) {
    for (UserModel user in users) {
      if (user.email == email && user.password == password) {
        return user.id;
      }
    }
    return null;
  }

  @override
  bool getPostUpvotedForUser(int userId, int postId) {
    return getPostFromId(postId).upvotes.contains(userId);
  }

  @override
  bool getPostDownvotedForUser(int userId, int postId) {
    return getPostFromId(postId).downvotes.contains(userId);
  }

  @override
  void upvoteComment(int commentId, int userId) {
    print('Upvoted comment with id: $commentId');
    CommentModel comment = _getCommentFromId(commentId);
    int commentIndex = comments.indexOf(comment);
    List<int> upvotes = List.of(comment.upvotes);
    List<int> downvotes = List.of(comment.downvotes);

    if (!upvotes.contains(userId)) {
      upvotes.add(userId);
      if (downvotes.contains(userId)) {
        downvotes.remove(userId);
      }
    } else {
      upvotes.remove(userId);
    }

    comments[commentIndex] =
        comment.copyWith(upvotes: upvotes, downvotes: downvotes);
  }

  @override
  void downvoteComment(int commentId, int userId) {
    print('Downvoted comment with id: $commentId');
    CommentModel comment = _getCommentFromId(commentId);
    int commentIndex = comments.indexOf(comment);
    List<int> upvotes = List.of(comment.upvotes);
    List<int> downvotes = List.of(comment.downvotes);

    if (!downvotes.contains(userId)) {
      downvotes.add(userId);
      if (upvotes.contains(userId)) {
        upvotes.remove(userId);
      }
    } else {
      downvotes.remove(userId);
    }

    comments[commentIndex] =
        comment.copyWith(upvotes: upvotes, downvotes: downvotes);
  }

  @override
  int getCommentScore(int commentId) {
    CommentModel comment = _getCommentFromId(commentId);

    print(
        'Comment score is: ${comment.upvotes.length - comment.downvotes.length}');
    return comment.upvotes.length - comment.downvotes.length;
  }

  CommentModel _getCommentFromId(int id) {
    return comments.singleWhere((element) => element.id == id);
  }

  @override
  bool getCommentDownvotedForUser(int userId, int commentId) {
    return _getCommentFromId(commentId).downvotes.contains(userId);
  }

  @override
  bool getCommentUpvotedForUser(int userId, int commentId) {
    return _getCommentFromId(commentId).upvotes.contains(userId);
  }
}
