namespace capsrv;

using
{
    Currency,
    managed
}
from '@sap/cds/common';

entity SalesOrderType : managed
{
    key salesOrder : String(5) @title: 'Sales Order ID';
    customerCompanyName : String(40) @title : 'Company Name';
    revenueInLocalCurrency : String(30) @title : 'Gross Amount';
    localCurrency : String(30) @title : 'Currency Code';
    numberOfItems : String(60) @title : 'Number of Items';
}

entity SalesPerSupplierType : managed
{
    key ID : UUID @(Core.Computed:true) @title: 'Supplier';
    supplier : String(10) @title : 'Business Partner ID';
    supplierName : String(80) @title : 'Supplier';
    grossAmountInCompanyCurrency : Decimal(16, 3) @title : 'Revenue';
    netUnitPriceInCompanyCurrency : Decimal(16, 3) @title : 'Average Item Price';
    quantity : Decimal(13, 3) @title : 'Number of Sold Items';
    companyCurrency : String(5) @Common.Label : 'ISO Currency Code' @Common.IsUpperCase: true;
    quantityUnit : String(3) @Common.Label : 'Unit of Measure';
    companyCurrencyShortName : String(15) @Common.Label : 'Short text';
    quantityUnitName : String(10) @Common.Label : 'Measuremt unit text' @Common.QuickInfo : 'Unit of Measurement Text (Maximum 10 Characters)'
}

entity SalesHistoryType : managed
{
    key ID : UUID @(Core.Computed:true);
    creationMonthAsDate : DateTime;
    creationMonth : String(2);
    creationMonth_Text : String(10);
    grossAmountInCompanyCurrency : Decimal(16, 3) @title : 'Revenue';
    companyCurrency : String(5);
    companyCurrency_Text : String(40) @Common.Label : 'Long text';
    referenceAmount : Integer;
}