class Event {
    int id;
    String name;
    String description;
    int descriptionformat;
    String location;
    dynamic categoryid;
    dynamic groupid;
    int userid;
    dynamic repeatid;
    dynamic eventcount;
    String component;
    String modulename;
    String activityname;
    String activitystr;
    int instance;
    String eventtype;
    int timestart;
    int timeduration;
    int timesort;
    int timeusermidnight;
    int visible;
    int timemodified;
    bool overdue;
    IconEvent icon;
    Course course;
    Subscription subscription;
    bool canedit;
    bool candelete;
    String deleteurl;
    String editurl;
    String viewurl;
    String formattedtime;
    String formattedlocation;
    bool isactionevent;
    bool iscourseevent;
    bool iscategoryevent;
    dynamic groupname;
    String normalisedeventtype;
    String normalisedeventtypetext;
    Action action;
    String purpose;
    String url;

    Event({
        required this.id,
        required this.name,
        required this.description,
        required this.descriptionformat,
        required this.location,
        required this.categoryid,
        required this.groupid,
        required this.userid,
        required this.repeatid,
        required this.eventcount,
        required this.component,
        required this.modulename,
        required this.activityname,
        required this.activitystr,
        required this.instance,
        required this.eventtype,
        required this.timestart,
        required this.timeduration,
        required this.timesort,
        required this.timeusermidnight,
        required this.visible,
        required this.timemodified,
        required this.overdue,
        required this.icon,
        required this.course,
        required this.subscription,
        required this.canedit,
        required this.candelete,
        required this.deleteurl,
        required this.editurl,
        required this.viewurl,
        required this.formattedtime,
        required this.formattedlocation,
        required this.isactionevent,
        required this.iscourseevent,
        required this.iscategoryevent,
        required this.groupname,
        required this.normalisedeventtype,
        required this.normalisedeventtypetext,
        required this.action,
        required this.purpose,
        required this.url,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        descriptionformat: json["descriptionformat"],
        location: json["location"],
        categoryid: json["categoryid"],
        groupid: json["groupid"],
        userid: json["userid"],
        repeatid: json["repeatid"],
        eventcount: json["eventcount"],
        component: json["component"],
        modulename: json["modulename"],
        activityname: json["activityname"],
        activitystr: json["activitystr"],
        instance: json["instance"],
        eventtype: json["eventtype"],
        timestart: json["timestart"],
        timeduration: json["timeduration"],
        timesort: json["timesort"],
        timeusermidnight: json["timeusermidnight"],
        visible: json["visible"],
        timemodified: json["timemodified"],
        overdue: json["overdue"],
        icon: IconEvent.fromJson(json["icon"]),
        course: Course.fromJson(json["course"]),
        subscription: Subscription.fromJson(json["subscription"]),
        canedit: json["canedit"],
        candelete: json["candelete"],
        deleteurl: json["deleteurl"],
        editurl: json["editurl"],
        viewurl: json["viewurl"],
        formattedtime: json["formattedtime"],
        formattedlocation: json["formattedlocation"],
        isactionevent: json["isactionevent"],
        iscourseevent: json["iscourseevent"],
        iscategoryevent: json["iscategoryevent"],
        groupname: json["groupname"],
        normalisedeventtype: json["normalisedeventtype"],
        normalisedeventtypetext: json["normalisedeventtypetext"],
        action: Action.fromJson(json["action"]),
        purpose: json["purpose"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "descriptionformat": descriptionformat,
        "location": location,
        "categoryid": categoryid,
        "groupid": groupid,
        "userid": userid,
        "repeatid": repeatid,
        "eventcount": eventcount,
        "component": component,
        "modulename": modulename,
        "activityname": activityname,
        "activitystr": activitystr,
        "instance": instance,
        "eventtype": eventtype,
        "timestart": timestart,
        "timeduration": timeduration,
        "timesort": timesort,
        "timeusermidnight": timeusermidnight,
        "visible": visible,
        "timemodified": timemodified,
        "overdue": overdue,
        "icon": icon.toJson(),
        "course": course.toJson(),
        "subscription": subscription.toJson(),
        "canedit": canedit,
        "candelete": candelete,
        "deleteurl": deleteurl,
        "editurl": editurl,
        "viewurl": viewurl,
        "formattedtime": formattedtime,
        "formattedlocation": formattedlocation,
        "isactionevent": isactionevent,
        "iscourseevent": iscourseevent,
        "iscategoryevent": iscategoryevent,
        "groupname": groupname,
        "normalisedeventtype": normalisedeventtype,
        "normalisedeventtypetext": normalisedeventtypetext,
        "action": action.toJson(),
        "purpose": purpose,
        "url": url,
    };
}

class Action {
    String name;
    String url;
    int itemcount;
    bool actionable;
    bool showitemcount;

    Action({
        required this.name,
        required this.url,
        required this.itemcount,
        required this.actionable,
        required this.showitemcount,
    });

    factory Action.fromJson(Map<String, dynamic> json) => Action(
        name: json["name"],
        url: json["url"],
        itemcount: json["itemcount"],
        actionable: json["actionable"],
        showitemcount: json["showitemcount"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "itemcount": itemcount,
        "actionable": actionable,
        "showitemcount": showitemcount,
    };
}

class Course {
    int id;
    String fullname;
    String shortname;
    String idnumber;
    String summary;
    int summaryformat;
    int startdate;
    int enddate;
    bool visible;
    bool showactivitydates;
    bool showcompletionconditions;
    String pdfexportfont;
    String fullnamedisplay;
    String viewurl;
    String courseimage;
    int progress;
    bool hasprogress;
    bool isfavourite;
    bool hidden;
    bool showshortname;
    String coursecategory;

    Course({
        required this.id,
        required this.fullname,
        required this.shortname,
        required this.idnumber,
        required this.summary,
        required this.summaryformat,
        required this.startdate,
        required this.enddate,
        required this.visible,
        required this.showactivitydates,
        required this.showcompletionconditions,
        required this.pdfexportfont,
        required this.fullnamedisplay,
        required this.viewurl,
        required this.courseimage,
        required this.progress,
        required this.hasprogress,
        required this.isfavourite,
        required this.hidden,
        required this.showshortname,
        required this.coursecategory,
    });

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        fullname: json["fullname"],
        shortname: json["shortname"],
        idnumber: json["idnumber"],
        summary: json["summary"],
        summaryformat: json["summaryformat"],
        startdate: json["startdate"],
        enddate: json["enddate"],
        visible: json["visible"],
        showactivitydates: json["showactivitydates"],
        showcompletionconditions: json["showcompletionconditions"],
        pdfexportfont: json["pdfexportfont"],
        fullnamedisplay: json["fullnamedisplay"],
        viewurl: json["viewurl"],
        courseimage: json["courseimage"],
        progress: json["progress"],
        hasprogress: json["hasprogress"],
        isfavourite: json["isfavourite"],
        hidden: json["hidden"],
        showshortname: json["showshortname"],
        coursecategory: json["coursecategory"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "shortname": shortname,
        "idnumber": idnumber,
        "summary": summary,
        "summaryformat": summaryformat,
        "startdate": startdate,
        "enddate": enddate,
        "visible": visible,
        "showactivitydates": showactivitydates,
        "showcompletionconditions": showcompletionconditions,
        "pdfexportfont": pdfexportfont,
        "fullnamedisplay": fullnamedisplay,
        "viewurl": viewurl,
        "courseimage": courseimage,
        "progress": progress,
        "hasprogress": hasprogress,
        "isfavourite": isfavourite,
        "hidden": hidden,
        "showshortname": showshortname,
        "coursecategory": coursecategory,
    };
}

class IconEvent {
    String key;
    String component;
    String alttext;
    String iconurl;
    String iconclass;

    IconEvent({
        required this.key,
        required this.component,
        required this.alttext,
        required this.iconurl,
        required this.iconclass,
    });

    factory IconEvent.fromJson(Map<String, dynamic> json) => IconEvent(
        key: json["key"],
        component: json["component"],
        alttext: json["alttext"],
        iconurl: json["iconurl"],
        iconclass: json["iconclass"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "component": component,
        "alttext": alttext,
        "iconurl": iconurl,
        "iconclass": iconclass,
    };
}

class Subscription {
    bool displayeventsource;

    Subscription({
        required this.displayeventsource,
    });

    factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        displayeventsource: json["displayeventsource"],
    );

    Map<String, dynamic> toJson() => {
        "displayeventsource": displayeventsource,
    };
}