import 'package:reddit_app/persistence/models/comment_model.dart';
import 'package:reddit_app/persistence/models/post_model.dart';
import 'package:reddit_app/persistence/models/subreddit_model.dart';
import 'package:reddit_app/persistence/models/user_model.dart';
import 'package:reddit_app/persistence/persistence_port.dart';

class PersistenceAdapter implements PersistencePort {
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
}
