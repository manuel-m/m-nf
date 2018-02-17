import { wrapResponse } from 'et-es/m-server/helpers';

var Database = require('better-sqlite3'),
    _db = new Database('dist/m-nf.db');

export { all };

function all(sql_) {
    return wrapResponse(_db.prepare(sql_).all());
}
