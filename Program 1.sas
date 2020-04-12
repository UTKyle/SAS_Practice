data demo1;
var_1 = 100;
var_2 = 150;
run;

data demo2;
var_1 = 200;
var_2 = 250;
run;

*single line comment;

/* multi
line
comment */

Data temperature;
celcius = 35;
farenheit = 35*(9/5)+32;
run;

Proc Print data=temperature;
run;

libname mylib '/folders/myfolders/PermDS';

data mylib.test;
Name = 'Student';
Age = 23;
run;


* Importing Data;
data inline_data_import1;
input Student$ Section$ Age;
datalines;
Jacob A 10
Francis A 11
Solomon B 10
Samuel B 11
;
run;

* Importing external data;
data importing_from_file;
infile '/folders/myfolders/DataSets1/Student_Data.txt';
input Student$ Section$ Age;
run;


* Importing space-separated data from a file;
data importing_space_separated;
infile '/folders/myfolders/DataSets1/Space_Separated_File.txt';
input Name$ Age Lap1 Lap2 Lap3;
run;


* Importing data arranged in columns;
data Data_Arranged_In_Columns;
infile '/folders/myfolders/DataSets1/Data_Arranged_In_Columns.txt';
input Name$ 1-16 Sub1 17-19 Sub2 20-22 Sub3 23-25 Sub4 26-28 Sub5 29-30;
run;

* Sample print;
proc print data=importing_from_file; run;


* Exercise 1 - File 1 - CustomerAge.txt;
data import_customer_age;
infile '/folders/myfolders/Exercise1/CustomerAge.txt';
input CustID Name$ Age;
run;

* Exercise 1 - File 2 - CustomerAccountBalance.txt;
data import_customer_acct_balance;
infile '/folders/myfolders/Exercise1/CustomerAccountBalance.txt';
input CustID Name$ Balance;
run;

* Exercise 1 - File 3 - TransactionDetails.txt;
data import_transaction_details;
infile '/folders/myfolders/Exercise1/TransactionDetails.txt';
input CustID$ FirstName$ LastName$ TransactionAmount;
run;

* Exercise 1 - File 4 - TransferDetails.txt;
data import_transfer_details;
infile '/folders/myfolders/Exercise1/TransferDetails.txt';
input CustID$ FirstName$ LastName$ FromAccount ToAccount TransactionAmount;
run;


* Importing Mixed Input - Using @ column pointer;
data Mixed_Input;
infile '/folders/myfolders/DataSets1/Mixed_Input.txt';
input CityName$ 1-18 @25 Population Comma9. ;
run;

* Using @@ character pointer;
data Pointer3;
infile '/folders/myfolders/DataSets1/Pointer3.txt';
input City$ Mon1 Mon2 Mon3 Mon4 Preci_Inch Preci_days Avg_Annual_Snowfall @@;
run;

* Using # and / line pointers;
data Pointer2;
infile '/folders/myfolders/DataSets1/Pointer2.txt';
input City$ Mon1 Mon2 #2 Mon3 Mon4 Preci_Inch #3 Preci_days Avg_Annual_Snowfall ;
* can also replace "#2" above with a "/" ... all intermediary #s can be /s, but not the final #;
run;


* Importing with Other Options - Firstobs, Obs, & Truncover -- Truncover due to EOL;
data Options2;
infile '/folders/myfolders/DataSets1/Options2.txt' firstobs=3 obs=5 truncover;
input City$ State$ @23 LandAreaMI comma8. @32 LandAreaKM comma5. @38 WaterAreaMI comma8. @47 
WaterAreaKM comma5. @53 TotalAreaMI comma8. @62 TotalAreaKM comma6. @69 Population comma9. ;
run;


* Importing with Other Options - Missover and Truncover;
* refer to https://support.sas.com/documentation/cdl/en/basess/58133/HTML/default/viewer.htm#a002645812.htm;


* DLM (delimited data) & DSD (delimiter-sensitive data);
data Options3;
infile '/folders/myfolders/DataSets1/Options3.txt' DLM=',' dsd;
input City$ State$ LandAreaMI LandAreaKM WaterAreaMI WaterAreaKM TotalAreaMI TotalAreaKM Population ;
run;


* PROC Import;
* Below, dataset = input file, out = dataset name, DBMS = type of file (XLS or XLSX for Excel);
*  and replace = replace dataset if one already exists with this name;
proc import datafile='/folders/myfolders/DataSets1/CSV_Import.csv' out=CSV_Import DBMS=csv replace;
getnames = yes;  *delete first line of data and treat as variable names;
run;



* Exercise 2 - File 1 - FiftyCompanies;
data import_fiftycompanies;
infile '/folders/myfolders/Exercise2/FiftyCompanies.txt' truncover;
input SNo @6 Name$ @35 Country$ @53 Sales$ @63 Profits$ @70 
  Assets$ @82 MarketCap comma6.;
run;















