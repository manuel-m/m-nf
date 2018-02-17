import { wrapResponse as wrap } from 'et-es/m-server/helpers';

export default {
    GET: {
        '/api/expenses': () => wrap([])
    }
};
