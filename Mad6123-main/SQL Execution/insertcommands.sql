const sqlite3 = require('sqlite3').verbose();
// open the database
let db = new sqlite3.Database('./CISMarch17.db');

let sql = "select c.classid, c.classname, s.studentid, s.studentname " +
"from students as s, enrollments as e, classes as c " +
"where s.studentid = e.studentid and " +
"e.classid = c.classid"

db.all(sql, [], (err, rows) => {
  if (err) {
    throw err;
  }
  rows.forEach((row) => {
    console.log(row.studentid);
    console.log(row.studentname);    
  });
});

db.close();