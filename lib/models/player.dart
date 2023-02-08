class Player {
  final String nickname;
  final String socketID;
  final double points;
  final String playerType;
  final String playerOrg;

  Player(
      {required this.nickname,
      required this.socketID,
      required this.points,
      required this.playerType,
      required this.playerOrg});

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'socketID': socketID,
      'points': points,
      'playerType': playerType,
      'playerOrg': playerOrg,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      nickname: map['nickname'] ?? '',
      socketID: map['socketID'] ?? '',
      points: map['points']?.toDouble() ?? 0.0,
      playerType: map['playerType'] ?? '',
      playerOrg: map['playerOrg'] ?? '',
    );
  }

  Player copyWith({
    String? nickname,
    String? socketID,
    double? points,
    String? playerType,
    String? playerOrg,
  }) {
    return Player(
      nickname: nickname ?? this.nickname,
      socketID: socketID ?? this.socketID,
      points: points ?? this.points,
      playerType: playerType ?? this.playerType,
      playerOrg: playerOrg ?? this.playerOrg,
    );
  }
}
