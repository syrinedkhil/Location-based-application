
class Activity{
  String  IdActivity;
  String idParent;
  String idEnfant;
  String PlaceName;
  String StartTime;
  String EndTime;
  String? Position;
  bool NotifSended;


  Activity(
    { 
       this.IdActivity='',
       required this.idParent,
       required this.idEnfant,
     required this.PlaceName,
       required this.StartTime ,
       required this.EndTime,
       required this.Position,
       this.NotifSended=false
       
       });


  Map<String,dynamic> toJson(){
  return{
    'IdActivity':IdActivity,
    'idParent':idParent,
    'idEnfant':idEnfant,

    'PlaceName':PlaceName,
    'StartTime':StartTime,
    'EndTime':EndTime,
    'Position':Position,
    'NotifSended':NotifSended
  };

}

factory Activity.fromJson(Map<String,dynamic>json){
  return Activity(IdActivity:json['IdActivity'],PlaceName: json['PlaceName'],idParent:json['idParent'],idEnfant:json['idEnfant'],
  StartTime: json['StartTime'],EndTime: json['EndTime'],Position:json['Position'],NotifSended:json['NotifSended']);
}



}