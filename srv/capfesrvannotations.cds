using {capsrv} from './capfesrv';

//Filters
annotate capService.SalesOrder with @(UI : {
    SelectionFields  : [
        salesOrder,
        customerCompanyName,
        numberOfItems
    ],
    SelectionVariant : {
        $Type         : 'UI.SelectionVariantType',
        SelectOptions : [{
            $Type        : 'UI.SelectOptionType',
            PropertyName : localCurrency,
        }],
    },
});

annotate  capService.SalesOrder with {
 modifiedAt @UI.Hidden;
 modifiedBy @UI.Hidden;
 createdAt @UI.Hidden;
 createdBy @UI.Hidden ;
 };

//Donut Chart
annotate capService.SalesPerSupplier with @(UI : {
    Chart #donut                            : {
        $Type               : 'UI.ChartDefinitionType',
        ChartType           : #Donut,
        Description         : 'Donut Chart',
        Measures            : [grossAmountInCompanyCurrency],
        MeasureAttributes   : [{
            $Type     : 'UI.ChartMeasureAttributeType',
            Measure   : grossAmountInCompanyCurrency,
            Role      : #Axis1,
            DataPoint : '@UI.DataPoint#GrossAmountInCompanyCurrency'
        }],
        Dimensions          : [supplier],
        DimensionAttributes : [{
            $Type     : 'UI.ChartDimensionAttributeType',
            Dimension : supplier,
            Role      : #Category
        }]
    },
    PresentationVariant #donutPreVar        : {
        $Type             : 'UI.PresentationVariantType',
        Visualizations    : ['@UI.Chart#donut'],
        MaxItems          : 3,
        IncludeGrandTotal : true,
        SortOrder         : [{
            $Type      : 'Common.SortOrderType',
            Descending : true,
            Property   : grossAmountInCompanyCurrency
        }]
    },
    DataPoint #GrossAmountInCompanyCurrency : {
        $Type                  : 'UI.DataPointType',
        Value                  : grossAmountInCompanyCurrency,
        Title                  : 'Revenue',
        CriticalityCalculation : {
            $Type                   : 'UI.CriticalityCalculationType',
            ImprovementDirection    : #Maximize,
            DeviationRangeHighValue : 1000000,
            DeviationRangeLowValue  : 3000000
        },
        TrendCalculation       : {
            $Type                : 'UI.TrendCalculationType',
            ReferenceValue       : 1000,
            UpDifference         : 10,
            StrongUpDifference   : 100,
            DownDifference       : -10,
            StrongDownDifference : -100
        },
    },
    Identification                          : [{
        $Type : 'UI.DataField',
        Value : grossAmountInCompanyCurrency
    }]
});


annotate  capService.SalesHistory with {
 modifiedAt @UI.Hidden;
 modifiedBy @UI.Hidden;
 createdAt @UI.Hidden;
 createdBy @UI.Hidden;
 companyCurrency @title : 'Currency' @Measures.ISOCurrency : 'Currency';
 companyCurrency_Text @title : '';
 creationMonthAsDate @title : 'Creation Date';
 creationMonth @title : 'Month';
 creationMonth_Text @title : 'Month' @Common.QuickInfo : 'Month Long text';
 referenceAmount @title : 'Amount' ; 
 };
//Line Chart
annotate capService.SalesHistory with @(
    UI.Chart #Line                             : {
        $Type               : 'UI.ChartDefinitionType',
        ChartType           : #Line,
        Description         : 'Line Chart',
        Measures            : [grossAmountInCompanyCurrency],
        MeasureAttributes   : [{
            $Type     : 'UI.ChartMeasureAttributeType',
            Measure   : grossAmountInCompanyCurrency,
            Role      : #Axis1,
            DataPoint : '@UI.DataPoint#GrossAmountInCompanyCurrency'
        }],
        Dimensions          : [creationMonth],
        DimensionAttributes : [{
            $Type     : 'UI.ChartDimensionAttributeType',
            Dimension : creationMonth,
            Role      : #Category
        }]
    },
    UI.PresentationVariant #Line               : {
        $Type             : 'UI.PresentationVariantType',
        Visualizations    : ['@UI.Chart#Line'],
        MaxItems          : 3,
        IncludeGrandTotal : true,
        SortOrder         : [{
            $Type      : 'Common.SortOrderType',
            Descending : true,
            Property   : creationMonthAsDate
        }]
    },
    UI.DataPoint #GrossAmountInCompanyCurrency : {
        $Type                  : 'UI.DataPointType',
        Value                  : grossAmountInCompanyCurrency,
        Title                  : 'Revenue',
        CriticalityCalculation : {
            $Type                   : 'UI.CriticalityCalculationType',
            ImprovementDirection    : #Maximize,
            DeviationRangeHighValue : 1000000,
            DeviationRangeLowValue  : 3000000
        },
        TrendCalculation       : {
            $Type                : 'UI.TrendCalculationType',
            ReferenceValue       : referenceAmount,
            UpDifference         : 10,
            StrongUpDifference   : 100,
            DownDifference       : -10,
            StrongDownDifference : -100
        }
    }
);