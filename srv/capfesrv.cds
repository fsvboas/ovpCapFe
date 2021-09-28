using capsrv as cp from '../db/schema';

@path : 'service/cap'
service capService {
    entity SalesOrder       as select from cp.SalesOrderType;
    @readonly
    entity SalesHistory     as select from cp.SalesHistoryType excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };
    entity SalesPerSupplier as select from cp.SalesPerSupplierType;
}