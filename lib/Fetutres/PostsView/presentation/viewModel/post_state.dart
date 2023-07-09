
abstract class PostState{}
class CratePostInitial extends PostState{}

class CratePostLoading extends PostState{}
class CratePostSuccess extends PostState{}
class CratePostError extends PostState{
  final String error;
  CratePostError(this.error);
}
class RemovePostSuccess extends PostState{}

class UploadPostImageSuccess extends PostState{}
class UploadPostImageError extends PostState{}

class GetPostsLoading extends PostState{}
class GetPostsSuccess extends PostState{}
class GetPostsError extends PostState{
  final String error;
  GetPostsError(this.error);
}
class LoadingLikeState extends PostState{}
class SuccessLikeState extends PostState{}
class ErrorLikeState extends PostState{
  final String error;
  ErrorLikeState(this.error);

}
class AppGetUserLoadingState extends PostState{}
class AppGetUserSuccessState extends PostState{}
class AppGetUserErrorState extends PostState{
  final String error;
  AppGetUserErrorState(this.error);

}