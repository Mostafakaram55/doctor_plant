class LikeDataModel{
  String? likeMakerID;
  String? likeMakerName;
  bool? isLike;
  // Constructor
  LikeDataModel(this.likeMakerID,this.likeMakerName,this.isLike);

  LikeDataModel.fromJson({required Map<String,dynamic> json}){
    likeMakerID = json['likeMakerID'];
    likeMakerName = json['likeMakerName'];

    isLike = json['isLike'];
  }

  Map<String,dynamic> toJson(){
    return {
      'likeMakerID' : likeMakerID,
      'likeMakerName' : likeMakerName,
      'isLike' : isLike,
    };
  }
}