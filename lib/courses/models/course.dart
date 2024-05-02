import 'dart:convert';

class Course {
    int id;
    String shortname;
    String fullname;
    String displayname;
    int enrolledusercount;
    String idnumber;
    int visible;
    String summary;
    int summaryformat;
    String format;
    String courseimage;
    bool showgrades;
    String lang;
    bool enablecompletion;
    bool completionhascriteria;
    bool completionusertracked;
    int category;
    dynamic progress;
    bool completed;
    int startdate;
    int enddate;
    int marker;
    int lastaccess;
    bool isfavourite;
    bool hidden;
    List<Overviewfile> overviewfiles;
    bool showactivitydates;
    bool showcompletionconditions;
    int timemodified;

    Course({
        required this.id,
        required this.shortname,
        required this.fullname,
        required this.displayname,
        required this.enrolledusercount,
        required this.idnumber,
        required this.visible,
        required this.summary,
        required this.summaryformat,
        required this.format,
        required this.courseimage,
        required this.showgrades,
        required this.lang,
        required this.enablecompletion,
        required this.completionhascriteria,
        required this.completionusertracked,
        required this.category,
        required this.progress,
        required this.completed,
        required this.startdate,
        required this.enddate,
        required this.marker,
        required this.lastaccess,
        required this.isfavourite,
        required this.hidden,
        required this.overviewfiles,
        required this.showactivitydates,
        required this.showcompletionconditions,
        required this.timemodified,
    });

    factory Course.fromRawJson(String str) => Course.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        shortname: json["shortname"],
        fullname: json["fullname"],
        displayname: json["displayname"],
        enrolledusercount: json["enrolledusercount"],
        idnumber: json["idnumber"],
        visible: json["visible"],
        summary: json["summary"],
        summaryformat: json["summaryformat"],
        format: json["format"],
        courseimage: json["courseimage"],
        showgrades: json["showgrades"],
        lang: json["lang"],
        enablecompletion: json["enablecompletion"],
        completionhascriteria: json["completionhascriteria"],
        completionusertracked: json["completionusertracked"],
        category: json["category"],
        progress: json["progress"],
        completed: json["completed"],
        startdate: json["startdate"],
        enddate: json["enddate"],
        marker: json["marker"],
        lastaccess: json["lastaccess"],
        isfavourite: json["isfavourite"],
        hidden: json["hidden"],
        overviewfiles: List<Overviewfile>.from(json["overviewfiles"].map((x) => Overviewfile.fromJson(x))),
        showactivitydates: json["showactivitydates"],
        showcompletionconditions: json["showcompletionconditions"],
        timemodified: json["timemodified"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "shortname": shortname,
        "fullname": fullname,
        "displayname": displayname,
        "enrolledusercount": enrolledusercount,
        "idnumber": idnumber,
        "visible": visible,
        "summary": summary,
        "summaryformat": summaryformat,
        "format": format,
        "courseimage": courseimage,
        "showgrades": showgrades,
        "lang": lang,
        "enablecompletion": enablecompletion,
        "completionhascriteria": completionhascriteria,
        "completionusertracked": completionusertracked,
        "category": category,
        "progress": progress,
        "completed": completed,
        "startdate": startdate,
        "enddate": enddate,
        "marker": marker,
        "lastaccess": lastaccess,
        "isfavourite": isfavourite,
        "hidden": hidden,
        "overviewfiles": List<dynamic>.from(overviewfiles.map((x) => x.toJson())),
        "showactivitydates": showactivitydates,
        "showcompletionconditions": showcompletionconditions,
        "timemodified": timemodified,
    };
}

class Overviewfile {
    String filename;
    String filepath;
    int filesize;
    String fileurl;
    int timemodified;
    String mimetype;

    Overviewfile({
        required this.filename,
        required this.filepath,
        required this.filesize,
        required this.fileurl,
        required this.timemodified,
        required this.mimetype,
    });

    factory Overviewfile.fromRawJson(String str) => Overviewfile.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Overviewfile.fromJson(Map<String, dynamic> json) => Overviewfile(
        filename: json["filename"],
        filepath: json["filepath"],
        filesize: json["filesize"],
        fileurl: json["fileurl"],
        timemodified: json["timemodified"],
        mimetype: json["mimetype"],
    );

    Map<String, dynamic> toJson() => {
        "filename": filename,
        "filepath": filepath,
        "filesize": filesize,
        "fileurl": fileurl,
        "timemodified": timemodified,
        "mimetype": mimetype,
    };
}
