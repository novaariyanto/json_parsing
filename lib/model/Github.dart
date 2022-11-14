class Github{
  String username;
  int repository;

  Github({required this.username, required this.repository});

  String toString(){
    return "Github {username : $username, repository : $repository}";
  }
  factory Github.fromJson(Map<String,dynamic>json){
    return Github(
      username:json["username"],
      repository:json["repository"]
    );
  }
}