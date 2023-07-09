class PostModel{
  String? name;
  String? image;
  String? uId;
  String? dataTime;
  String? text;
  String? postImage;
  PostModel({
    this.name,
    this.image,
    this.uId,
    this.dataTime,
    this.text,
    this.postImage,
  });
  PostModel.fromJson(Map<String,dynamic>json){
    name=json['name'] ;
    uId=json['uId'] ;
    image=json['image'] ;
    dataTime=json['dataTime'] ;
    text=json['text'] ;
    postImage=json['postImage'] ;
  }
  Map<String,dynamic>toMap(){
    return {
      'name':name,
      'image':image,
      'uId':uId,
      'dataTime':dataTime,
      'text':text,
      'postImage':postImage,
    };
  }
}