reportextension 60100 "PTE Customer - Order Detail" extends "Customer - Order Detail"
{
    dataset
    {
    }

    rendering
    {
        layout("PTE Customer Order Detail")
        {
            Type = Excel;
            LayoutFile = './src/report/layout/PTE Customer Order Detail.xlsx';
        }
    }
}
