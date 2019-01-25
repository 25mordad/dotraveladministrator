class Report {
  String id;
  String id_adminuser;
  String date_start;
  String date_end;

  Report(this.id, this.id_adminuser, this.date_start, this.date_end);

  @override
  String toString() {
    return 'report{id: $id, id_adminuser: $id_adminuser, date_start: $date_start, date_end: $date_end}';
  }
}
