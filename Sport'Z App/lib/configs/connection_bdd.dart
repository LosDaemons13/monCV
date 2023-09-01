// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mysql1/mysql1.dart';
import 'package:crypt/crypt.dart';
import './config.dart';

Future getUserType(String uid) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  try {
    var result = await conn.query(
        'SELECT id_user FROM user LEFT JOIN user_pro ON user.id = user_pro.id_user WHERE uid = ?',
        [uid]);
    if (result.isNotEmpty) {
      for (var row in result) {
        return row["id_user"] == null ? "user" : "pro";
      }
    }
  } on MySqlException catch (e) {
    print("error");
  }
}

Future deleteFavoriteSport(String id_user, id_sport) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  try {
    var result = await conn.query(
        'DELETE FROM favorite_sport WHERE id_user = ?  AND id_sport = ?',
        [id_user, id_sport]);
  } on MySqlException catch (e) {
    print("error");
  }
}

Future<Map> getUserInfos(String uid) async {
  Map userInfo = {};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var result = await conn.query(
      'SELECT `mail`,`firstname`,`lastname`,`pseudo`,`description`,`zip_code`,`birth_date`,`phone_number`, `description`, `uid`, `is_premium` FROM `user` WHERE `uid` = ?',
      [uid]);
  if (result.isNotEmpty) {
    for (var row in result) {
      userInfo = {
        "pseudo": row["pseudo"],
        "email": row["mail"],
        "firstname": row["firstname"],
        "lastname": row["lastname"],
        "zipCode": row["zip_code"],
        "birthDate": row["birth_date"],
        "phoneNumber": row["phone_number"],
        "description": row["description"],
        "is_premium": row["is_premium"],
        "uid": row["uid"]
      };
    }
  }
  await conn.close();
  return userInfo;
}

fetchUserProInfos(String uid) async {
  Map userInfo = {};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var result = await conn.query(
      'SELECT `mail`,`firstname`,`lastname`,`pseudo`,`description`,`zip_code`,'
      '`birth_date`,`phone_number`, `description`, `uid`, `is_premium` ,'
      'user.id, company_name, id_user, k_bis_valited, num_siret, brand_name, '
      'primary_activity, company_adress, identity_card, k_bis_path FROM `user` '
      'INNER JOIN user_pro on user.id = user_pro.id_user WHERE user.uid = ?',
      [uid]);
  if (result.isNotEmpty) {
    for (var row in result) {
      userInfo = {
        "pseudo": row["pseudo"],
        "email": row["mail"],
        "firstname": row["firstname"],
        "lastname": row["lastname"],
        "zipCode": row["zip_code"],
        "birthDate": row["birth_date"],
        "phoneNumber": row["phone_number"],
        "description": row["description"],
        "is_premium": row["is_premium"],
        "uid": row["uid"],
        "company_name": row["company_name"],
        "id_user": row["id_user"],
        "company_adress": row["company_adress"]
      };
    }
  }
  await conn.close();
  return userInfo;
}

Future<Map> getUserProInfos(int id) async {
  Map userInfo = {};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var result =
      await conn.query('SELECT `description` FROM `user` WHERE `id` = ?', [id]);
  if (result.isNotEmpty) {
    for (var row in result) {
      userInfo = {
        "description": row["description"],
      };
    }
  }
  await conn.close();
  return userInfo;
}

Future updateUser(String firstname, lastname, pseudo, zipCode, description,
    String uid) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  try {
    var result = await conn.query(
        'UPDATE user SET firstname = ?, lastname= ?,pseudo = ?, zip_code= ?,  description = ? WHERE uid = ?',
        [firstname, lastname, pseudo, zipCode, description, uid]);
    await conn.close();
    return true;
  } catch (e) {
    return false;
  }
}

Future updateUserPro(String description, int id) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var result = await conn
      .query('UPDATE user SET description = ? WHERE id = ?', [description, id]);
  await conn.close();
}

Future<Map> getFavoriteSports(String uid) async {
  Map favorites = {};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var result = await conn.query(
      'select * from favorite_sport inner join sport on id_sport = sport.id where id_user = ?',
      [uid]);
  if (result.isNotEmpty) {
    for (var row in result) {
      favorites[row["id_sport"]] = {
        "label": row["label"],
        "rating": row["rating"]
      };
    }
  }
  conn.close();
  return favorites;
}

// fonction commencée juste pour garder la requête, elle fonctionne autant pour les
// utilisateurs normaux que pour les pros grace au left join
// elle sera utilisée lorsqu'un utilisateur veut télécharger ses données perso
Future downloadUserInfo(int id) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var result = await conn.query(
      'SELECT * FROM user LEFT JOIN user_pro ON id_user = user.id WHERE user.id = ?',
      [id]);
}

Future addFavoriteSport(String id_sport, String id_user, rating) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  try {
    var result = await conn.query(
        'INSERT INTO `favorite_sport` (`id_sport`, `id_user`, `rating`) VALUES (?, ?, ?)',
        [id_sport, id_user, rating]);
    if (result.insertId != null) {}
  } on MySqlException catch (e) {
    print(e);
  }
}

Future<Map> getSports() async {
  Map sports = {};
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var result = await conn.query('select id,label from sport');
  if (result.isNotEmpty) {
    for (var row in result) {
      sports[row["id"]] = row["label"];
    }
    conn.close();
    return sports;
  }
  conn.close();
  return sports;
}

Future insertUser(String firstname, lastname, pseudo, email, phoneNumber,
    password, birthDate, zipCode, gender) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  Crypt pwdHash = Crypt.sha512(password);
  await conn.query(
      'insert into user (uid, mail, password, firstname, lastname, pseudo, zip_code, birth_date, phone_number, gender, hash_salt) values (?, ?, ?, ?, ?, ?, ?, (?), ?, ?, ?)',
      [
        FirebaseAuth.instance.currentUser!.uid,
        email,
        pwdHash.hash.toString(),
        firstname,
        lastname,
        pseudo,
        zipCode,
        birthDate,
        phoneNumber,
        gender,
        pwdHash.salt
      ]);

  await conn.close();
}

Future insertUserPro(
    String firstname,
    lastname,
    email,
    password,
    company_name,
    brand_name,
    company_adress,
    num_siret,
    kbis,
    identity_card,
    primary_activity,
    description) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  Crypt pwdHash = Crypt.sha512(password);
  var result = await conn.query(
      'insert into user (uid, mail, password, firstname, lastname, hash_salt, description) values (?, ?, ?, ?, ?, ?, ?)',
      [
        FirebaseAuth.instance.currentUser!.uid,
        email,
        pwdHash.hash,
        firstname,
        lastname,
        pwdHash.salt,
        description
      ]);
  await conn.query(
      'insert into user_pro (company_name, id_user, num_siret, k_bis_path, brand_name, primary_activity, identity_card, company_adress) values (?, ?, ?, ?, ?, ?, ?, ? )',
      [
        company_name,
        result.insertId,
        num_siret,
        kbis,
        brand_name,
        primary_activity,
        identity_card,
        company_adress,
      ]);
  await conn.close();
  return proUserAuth(email, password);
}

Future<bool> checkIfEmailExists(String email) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));

  var results = await conn
      .query('select mail, is_archived from user where mail = ?', [email]);
  if (results.isNotEmpty) {
    for (var row in results) {
      if (row["is_archived"] == 0) {
        return false;
      }

      await conn.close();
    }
  }
  return true;
}

Future<String> checkEmailPseudo(String email, pseudo) async {
  String errors = "";
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));

  var getPseudo = await conn.query(
      'select pseudo, is_archived, mail_validated from user where pseudo = ?',
      [pseudo]);
  if (getPseudo.isNotEmpty) {
    for (var row in getPseudo) {
      if (row["is_archived"] == 0) {
        errors = "P";
      }
    }
  }
  var getEmail = await conn.query(
      'select mail, is_archived, mail_validated from user where mail = ?',
      [email]);
  if (getEmail.isNotEmpty) {
    for (var row in getEmail) {
      if (row["is_archived"] == 0) {
        errors += "E";
      }

      await conn.close();
    }
  }
  return errors;
}

// inutile car on se connecte via Firebase désormais
Future<Map> userAuth(String username, String password) async {
  Map userData = {"error": "id error"};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var idType = RegExp(r"@").hasMatch(username) ? "mail" : "pseudo";
  var result = await conn.query(
      'select id, mail, pseudo, password, is_archived, hash_salt from `user` where $idType = ?',
      [username]);
  if (result.isNotEmpty) {
    for (var row in result) {
      if (row["is_archived"] == 0 ? true : false) {
        if (row[idType] == username &&
            row["password"] ==
                Crypt.sha512(password, salt: row["hash_salt"]).hash) {
          userData = {
            "error": "no error",
            "pseudo": row["pseudo"],
            "email": row["mail"],
            "id": row["id"]
          };
          return userData;
        }
        return userData;
      }
    }
  }
  return userData;
}

// inutile car on se connecte via Firebase désormais
Future<Map> proUserAuth(String mail, String password) async {
  Map userData = {"error": "id error"};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var result = await conn.query(
      'SELECT user.id, mail, pseudo, password, mail_validated, is_archived, hash_salt,'
      ' company_name, primary_activity, brand_name, description'
      ' FROM `user`'
      ' INNER JOIN user_pro'
      ' ON user.id = user_pro.id_user'
      ' WHERE mail = ?',
      [mail]);
  if (result.isNotEmpty) {
    for (var row in result) {
      if (row["is_archived"] == 0 ? true : false) {
        if (row['mail'] == mail &&
            row["password"] ==
                Crypt.sha512(password, salt: row["hash_salt"]).hash) {
          userData = {
            "error":
                row["mail_validated"] == 0 ? "mail not validated" : "no error",
            "email": row["mail"],
            "primary_activity": row["primary_activity"],
            "brand_name": row["brand_name"],
            "description": row["description"],
            "id": row["id"]
          };
          conn.close();
          return userData;
        }
        conn.close();
        return userData;
      }
    }
  }
  conn.close();
  return userData;
}

Future insertExternalUser(Map userData) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var result = await conn.query('insert into user (mail) values (?)', [
    userData["email"],
  ]);
  await conn.query(
      'insert into user_external (mail, id_user, auth_api) values (?, ?, ?)', [
    userData["email"],
    result.insertId,
    userData["api"],
  ]);
}

Future<String> externalUserAuth(Map? userData) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));

  var results = await conn.query(
      'select user.mail, is_archived from user inner join user_external on user.id = user_external.id_user where user.mail = ?;',
      [userData!["email"]]);
  if (results.isNotEmpty) {
    for (var row in results) {
      if (row["is_archived"] == 0) {
        await conn.close();
        return "already exists";
      }
      await conn.close();
    }
  }
  insertExternalUser(userData);
  return "inserted";
}

Future<bool> checkIfPseudoExists(String pseudo) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));

  var results = await conn
      .query('select pseudo, is_archived from user where pseudo = ?', [pseudo]);
  if (results.isNotEmpty) {
    for (var row in results) {
      if (row["is_archived"] == 0) {
        return false;
      }

      await conn.close();
    }
  }
  return true;
}

Future addParticipant(String uid, int idActivity) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  await conn.query(
      'INSERT INTO `participant` (`id_user`, `id_activity`) VALUES (?, ?)',
      [uid, idActivity]);
  await conn.close();
}

Future deleteParticipant(String uid, int idActivity) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  await conn.query(
      'DELETE FROM `participant` WHERE `id_user` =? AND `id_activity`=?',
      [uid, idActivity]);
  await conn.close();
}

Future<Map> selectActivitiesFilter(String uid, Map filters) async {
  Map activities = {};
  String query =
      'select activity.id as id_activity, title, sport.label, begin_date, nb_participants_max, nb_participants, rating, address, price, activity.description, activity.id_user from activity INNER JOIN sport on activity.id_sport = sport.id ';
  if (filters["sports"].isNotEmpty) {
    var sports = filters["sports"].join('","');
    sports = '"' + sports + '"';
    query = query + "WHERE sport.label IN ($sports)";
    if (filters["rating"] != null) {
      query = query + " AND rating = ${filters["rating"]}";
    }
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: properties['host'],
        port: properties['port'],
        user: properties['user'],
        db: properties['db'],
        password: properties['password']));
    print(query);
    var results = await conn.query(query);

    for (var row in results) {
      activities[row["id_activity"]] = {
        "title": row["title"],
        "sport": row["label"],
        "begin_date": row["begin_date"],
        "nb_participants_max": row["nb_participants_max"],
        "nb_participants": row["nb_participants"],
        "rating": row["rating"],
        "address": row["address"],
        "description": row["description"],
        "price": row["price"],
        "id_activity": row["id_activity"],
        "id_user": row["id_user"],
        "is_favorite": await isFavorite(row["id_activity"], uid),
        "is_participant": await isParticipant(row["id_activity"], uid)
      };
    }
    return activities;
  }
  if (filters["rating"] != null) {
    query = query + "WHERE rating = ${filters["rating"]}";
    Map activities = {};
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: properties['host'],
        port: properties['port'],
        user: properties['user'],
        db: properties['db'],
        password: properties['password']));
    print(query);
    var results = await conn.query(query);

    for (var row in results) {
      activities[row["id_activity"]] = {
        "title": row["title"],
        "sport": row["label"],
        "begin_date": row["begin_date"],
        "nb_participants_max": row["nb_participants_max"],
        "nb_participants": row["nb_participants"],
        "rating": row["rating"],
        "address": row["address"],
        "description": row["description"],
        "price": row["price"],
        "id_activity": row["id_activity"],
        "id_user": row["uid"],
        "is_favorite": await isFavorite(row["id_activity"], uid),
        "is_participant": await isParticipant(row["id_activity"], uid)
      };
    }
    return activities;
  }
  return {};
}

Future<Map> selectFavoriteActivities(String uid) async {
  Map activities = {};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var results = await conn.query(
      'select activity.id as id_activity, title, sport.label, begin_date, nb_participants_max, nb_participants, rating, address, price, activity.description, activity.id_user from favorite_activity inner join activity on activity.id = favorite_activity.id_activity inner join sport on activity.id_sport = sport.id where favorite_activity.id_user = ?;',
      [uid]);

  for (var row in results) {
    activities[row["id_activity"]] = {
      "title": row["title"],
      "sport": row["label"],
      "begin_date": row["begin_date"],
      "nb_participants_max": row["nb_participants_max"],
      "nb_participants": row["nb_participants"],
      "rating": row["rating"],
      "address": row["address"],
      "description": row["description"],
      "price": row["price"],
      "id_activity": row["id_activity"],
      "id_user": row["id_user"],
      "is_favorite": true,
      "is_participant": await isParticipant(row["id_activity"], uid)
    };
  }

  return activities;
}

Future<Map> selectActivitiesByUser(String uid) async {
  Map activities = {};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var results = await conn.query(
      'select activity.id as id_activity, title, sport.label, begin_date, nb_participants_max, nb_participants, rating, address, price, activity.description, uid from activity'
      ' inner join user on activity.id_user = user.uid'
      ' inner join sport on activity.id_sport = sport.id where user.uid = ? ORDER BY activity.id desc',
      [uid]);

  for (var row in results) {
    activities[row["id_activity"]] = {
      "title": row["title"],
      "sport": row["label"],
      "begin_date": row["begin_date"],
      "nb_participants_max": row["nb_participants_max"],
      "nb_participants": row["nb_participants"],
      "rating": row["rating"],
      "address": row["address"],
      "description": row["description"],
      "price": row["price"],
      "id_activity": row["id_activity"],
      "id_user": row["uid"],
      "is_favorite": await isFavorite(row["id_activity"], uid),
      "is_participant": await isParticipant(row["id_activity"], uid)
    };
  }

  return activities;
}

Future<Map> selectUpcomingEventsByUser(String uid) async {
  Map events = {};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));

  var DateNow = DateTime.now().toUtc();
  var results = await conn.query(
      'select event.id as id_event, title, sport.label, begin_date, nb_participants_max, nb_participants, rating, address, price description from event'
      ' inner join user on event.id_user = user.id'
      ' inner join sport on event.id_sport = sport.id where user.uid = ? AND begin_date > ?',
      [uid, DateNow]);

  for (var row in results) {
    events[row["id_event"]] = {
      "title": row["title"],
      "sport": row["label"],
      "begin_date": row["begin_date"],
      "nb_participants_max": row["nb_participants_max"],
      "nb_participants": row["nb_participants"],
      "rating": row["rating"],
      "address": row["address"],
      "description": row["description"],
      "price": row["price"],
      "id_event": row["id_event"]
    };
  }

  return events;
}

Future<Map> selectEventHistory(String uid) async {
  Map events = {};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var DateNow = DateTime.now().toUtc();
  var results = await conn.query(
      'select event.id as id_event, title, sport.label, begin_date, nb_participants_max, nb_participants, rating, address, price description from event'
      ' inner join user on event.id_user = user.id'
      ' inner join sport on event.id_sport = sport.id where user.uid = ? AND begin_date < ?',
      [uid, DateNow]);

  for (var row in results) {
    events[row["id_event"]] = {
      "title": row["title"],
      "sport": row["label"],
      "begin_date": row["begin_date"],
      "nb_participants_max": row["nb_participants_max"],
      "nb_participants": row["nb_participants"],
      "rating": row["rating"],
      "address": row["address"],
      "description": row["description"],
      "price": row["price"],
      "id_event": row["id_event"]
    };
  }

  return events;
}

Future selectSport(String name) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  await conn.query('select * from sport where name = ?', [name]);

  // // Update

  // // Query again database using a parameterized query
  // var results2 = await conn.query(
  //     'select name, email, age from users where id = ?', [result.insertId]);
  // for (var row in results2) {
  //   print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
  // }

  // Finally, close the connection
  await conn.close();
}

Future<Map> getActivitiesBySport(List<String> filters, int rating) async {
  Map activities = {};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var filter = filters.join('","');
  filter = '"' + filter + '"';
  var result = await conn.query(
      'SELECT * '
      'FROM `activity` '
      'INNER JOIN sport '
      'on activity.id_sport = sport.id '
      'WHERE sport.label IN ($filter) '
      'AND rating = ?;',
      [rating]);
  if (result.isNotEmpty) {
    for (var row in result) {
      activities[row["id"]] = row["label"];
    }
    return activities;
  }
  return activities;
}

//TO DO : mettre userId en paramètre pour recup isFavorite du user courant et pas du user 173
Future<Map> selectAllActivities() async {
  Map activities = {};
  var uid = FirebaseAuth.instance.currentUser!.uid;
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var results = await conn.query(
      'select activity.id as id_activity, title, sport.label, begin_date, nb_participants_max, nb_participants, rating, address, price, description, id_user from activity'
      ' inner join sport on activity.id_sport = sport.id '
      'ORDER BY activity.id desc');

  for (var row in results) {
    activities[row["id_activity"]] = {
      "title": row["title"],
      "sport": row["label"],
      "begin_date": row["begin_date"],
      "nb_participants_max": row["nb_participants_max"],
      "nb_participants": row["nb_participants"],
      "rating": row["rating"],
      "address": row["address"],
      "description": row["description"],
      "price": row["price"],
      "id_activity": row["id_activity"],
      "id_user": row["id_user"],
      "is_favorite": await isFavorite(row["id_activity"], uid),
      "is_participant": await isParticipant(row["id_activity"], uid),
    };
  }
  await conn.close();
  return activities;
}

Future insertActivity(
    String titleEvent,
    descriptionEvent,
    String userID,
    activitySport,
    participantsMax,
    activityType,
    addressEvent,
    dateEvent,
    price,
    requiredLevel,
    zipCode) async {
  // Open a connection (testdb should already exist)
  try {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: properties['host'],
        port: properties['port'],
        user: properties['user'],
        db: properties['db'],
        password: properties['password']));
    var result = await conn.query(
        'insert into activity (title, description, id_user, id_sport, nb_participants_max, id_category, address, begin_date, price, rating, zip_code) values (?, ?, ?, ?, ?, ?, ?, ?, (?), ?, ?)',
        [
          titleEvent,
          descriptionEvent,
          userID,
          activitySport,
          participantsMax,
          activityType,
          addressEvent,
          dateEvent,
          price,
          requiredLevel,
          zipCode
        ]);
    await conn.query(
        'INSERT INTO `participant` (`id_user`, `id_activity`) VALUES (?, ?)',
        [userID, result.insertId]);
    await conn.close();
    return result.insertId;
  } catch (e) {
    return Future.error("Une erreur est survenue");
  }
}

Future insertEvent(
    String titleEvent,
    descriptionEvent,
    uid,
    activitySport,
    participantsMax,
    activityType,
    addressEvent,
    dateEvent,
    price,
    requiredLevel) async {
  var uid = FirebaseAuth.instance.currentUser!.uid;
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var result = await conn.query(
      'insert into activity (title, description, id_user, id_sport, nb_participants_max, id_category, address, begin_date, price, rating) values (?, ?, ?, ?, ?, ?, ?, (?), ?, ?)',
      [
        titleEvent,
        descriptionEvent,
        uid,
        activitySport,
        participantsMax,
        activityType,
        addressEvent,
        dateEvent,
        price,
        requiredLevel
      ]);
  await conn.query(
      'INSERT INTO `participant` (`id_user`, `id_activity`) VALUES (?, ?)',
      [uid, result.insertId]);

  await conn.close();
}

Future<Map> getParticipations(String uid) async {
  Map activities = {};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var results = await conn.query(
      'SELECT activity.id as id_activity, title, sport.label, begin_date, '
      'nb_participants_max, nb_participants, rating, address, price, activity.description, activity.id_user '
      'FROM activity '
      'INNER JOIN sport ON activity.id_sport = sport.id '
      'INNER JOIN participant on activity.id = participant.id_activity '
      'WHERE participant.id_user = ? '
      'AND activity.id_user != participant.id_user;',
      [uid]);

  for (var row in results) {
    activities[row["id_activity"]] = {
      "title": row["title"],
      "sport": row["label"],
      "begin_date": row["begin_date"],
      "nb_participants_max": row["nb_participants_max"],
      "nb_participants": row["nb_participants"],
      "rating": row["rating"],
      "address": row["address"],
      "description": row["description"],
      "price": row["price"],
      "id_activity": row["id_activity"],
      "id_user": row["id_user"],
      "is_favorite": await isFavorite(row["id_activity"], uid),
      "is_participant": true
    };
  }

  return activities;
}

//TO DO : mettre userId en paramètre pour recup isFavorite et isParticipant du user courant et pas du user 173
Future<Map> selectActivitiesByCategory(int id) async {
  Map activities = {};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var results = await conn.query(
      'select activity.id as id_activity, title, sport.label, begin_date, nb_participants_max, nb_participants, rating, address, price, description, id_user from activity'
      ' inner join sport on activity.id_sport = sport.id'
      ' inner join category on activity.id_category = category.id where category.id = ?',
      [id]);
  for (var row in results) {
    activities[row["id_activity"]] = {
      "title": row["title"],
      "sport": row["label"],
      "begin_date": row["begin_date"],
      "nb_participants_max": row["nb_participants_max"],
      "nb_participants": row["nb_participants"],
      "rating": row["rating"],
      "address": row["address"],
      "description": row["description"],
      "price": row["price"],
      "id_activity": row["id_activity"],
      "id_user": row["id_user"],
      "is_favorite": await isFavorite(row["id_activity"], 173),
      "is_participant": await isParticipant(row["id_activity"], 173)
    };
    await conn.close();
  }
  return activities;
}

Future<Map> selectAllUsers() async {
  Map activities = {};
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var results = await conn.query(
    'select id, mail, pseudo from user',
  );
  for (var row in results) {
    activities[row["id"]] = {"pseudo": row["pseudo"], "mail": row["mail"]};
  }
  await conn.close();
  return activities;
}

//TO DO : mettre userId en paramètre et pas du user 173
Future<bool> updateFavorite(int idActivity, bool isLiked) async {
  var uid = FirebaseAuth.instance.currentUser!.uid;
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  if (isLiked) {
    await conn.query(
        "DELETE FROM favorite_activity WHERE `id_activity` = ? AND `id_user` = ?",
        [idActivity, uid]);
  } else {
    await conn.query(
        "INSERT INTO `favorite_activity` (`id_activity`, `id_user`) VALUES (?, ?)",
        [idActivity, uid]);
  }
  await conn.close();
  return !isLiked;
}

Future<bool> isFavorite(int idActivity, idUser) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var result = await conn.query(
      "SELECT * from favorite_activity WHERE id_activity = ? AND id_user = ?",
      [idActivity, idUser]);
  await conn.close();
  if (result.isEmpty) {
    return false;
  } else {
    return true;
  }
}

Future<bool> isParticipant(int idActivity, idUser) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  var result = await conn.query(
      "SELECT * from participant WHERE id_user = ? AND id_activity = ?",
      [idUser, idActivity]);
  await conn.close();
  if (result.isEmpty) {
    return false;
  } else {
    return true;
  }
}

Future<bool> deleteUser(String idUser) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: properties['host'],
      port: properties['port'],
      user: properties['user'],
      db: properties['db'],
      password: properties['password']));
  try {
    await conn.query("UPDATE user SET is_archived = 1 WHERE uid = ?", [idUser]);
    await conn.close();
    FirebaseAuth.instance.currentUser!.delete();
    return true;
  } catch (e) {
    print(e);
    await conn.close();
    return false;
  }
}
