class Mail{
  bool _isread, _isarchived, _isinfo, _isimportant, _isfollowup;
  String from, message, subject,time;
  List<String> to;

  Mail(this._isread, this._isarchived, this._isinfo, this._isimportant,
      this._isfollowup, this.from, this.message, this.subject, this.to,this.time);

  List<Mail> mails=[
    Mail(false, false, false, false, false, "raj@gmail.com", "Hello Sir,\nMyself Raj,\nSir Due to heavy rain please allow us holiday sir", "Request For Holiday", ["md@gmail.com"],"2:15"),
    Mail(true, false, false, false, false, "raj@gmail.com", "Hello Sir,\nMyself Raj,\nSir Due to heavy rain please allow us holiday sir", "Request For Holiday", ["md@gmail.com"],"2:15"),
    Mail(false, false, false, false, false, "raj@gmail.com", "Hello Sir,\nMyself Raj,\nSir Due to heavy rain please allow us holiday sir", "Request For Holiday", ["md@gmail.com"],"2:15")
  ];

  List<Mail> getMails(){
    return mails;
  }
}

