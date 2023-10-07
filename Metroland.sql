CREATE DATABASE Metroland
GO
USE Metroland
GO
CREATE TABLE TblBranch ( BranchId   CHAR(5) PRIMARY KEY
,                        BranchName VARCHAR(50) NOT NULL )

CREATE TABLE TblStaff ( StaffId     CHAR(5) PRIMARY KEY
,                       BranchId    CHAR(5) FOREIGN KEY REFERENCES TblBranch(BranchId)
,                       StaffName   VARCHAR(50) NOT NULL
,                       StaffEmail  VARCHAR(50) NOT NULL
,                       StaffPhone  CHAR(12) NOT NULL
,                       StaffGender VARCHAR(6) NOT NULL
,                       StaffSalary Money NOT NULL )

CREATE TABLE TblCustomer ( CustomerId     CHAR(5) PRIMARY KEY
,                          CustomerName   VARCHAR(50) NOT NULL
,                          CustomerGender VARCHAR(6) NOT NULL
,                          CustomerPhone  CHAR(12) NOT NULL
,                          CustomerEmail  VARCHAR(50) NOT NULL )

CREATE TABLE TblSupplier ( SupplierId    CHAR(5) PRIMARY KEY
,                              SupplierName  VARCHAR(50) NOT NULL
,                              SupplierPhone CHAR(12) NOT NULL
,                              SupplierEmail VARCHAR(50) NOT NULL )

CREATE TABLE TblToyType ( ToyTypeId   CHAR(5) PRIMARY KEY
,                         ToyTypeName VARCHAR(50) NOT NULL )

CREATE TABLE TblToy ( ToyId          CHAR(5) PRIMARY KEY
,                     ToyTypeId      CHAR(5) FOREIGN KEY REFERENCES TblToyType(ToyTypeId)
,                     ToyName        VARCHAR(50) NOT NULL
,                     WholesalePrice MONEY NOT NULL
,                     RetailPrice    MONEY NOT NULL
,                     StockQuantity  INT NOT NULL )


CREATE TABLE TblPaymentType ( PaymentTypeId CHAR(5) PRIMARY KEY
,                             PaymentType   VARCHAR(50) NOT NULL )

CREATE TABLE PurchaseHeader ( PurchaseId     CHAR(5) PRIMARY KEY
,                             PurchaseDate   DATE NOT NULL
,                             SupplierId CHAR(5) FOREIGN KEY REFERENCES TblSupplier(SupplierId)
,                             StaffId        CHAR(5) FOREIGN KEY REFERENCES TblStaff(StaffId) )

CREATE TABLE PurchaseDetail ( PurchaseId CHAR(5) FOREIGN KEY REFERENCES PurchaseHeader(PurchaseId)
,                             ToyId      CHAR(5) FOREIGN KEY REFERENCES TblToy(ToyId)
,                             Quantity   INT NOT NULL CHECK (Quantity > 0)
,                             PRIMARY KEY (PurchaseId, ToyId) )

CREATE TABLE SalesHeader ( SalesId       CHAR(5) PRIMARY KEY
,                          SalesDate     DATE NOT NULL
,                          PaymentTypeId CHAR(5) FOREIGN KEY REFERENCES TblPaymentType(PaymentTypeId)
,                          CustomerId    CHAR(5) FOREIGN KEY REFERENCES TblCustomer(CustomerId)
,                          StaffId       CHAR(5) FOREIGN KEY REFERENCES TblStaff(StaffId) )

CREATE TABLE SalesDetail ( SalesId  CHAR(5) FOREIGN KEY REFERENCES SalesHeader(SalesId)
,                          ToyId    CHAR(5) FOREIGN KEY REFERENCES TblToy(ToyId)
,                          Quantity INT NOT NULL CHECK (Quantity > 0)
,                          PRIMARY KEY (SalesId, ToyId) )


INSERT INTO TblBranch ( BranchId, BranchName          )
VALUES                ( 'BR001',  'MetrolandBandung'  )
,                     ( 'BR002',  'MetrolandSemarang' )
,                     ( 'BR003',  'MetrolandMalang'   )
,                     ( 'BR004',  'MetrolandBekasi'   )
,                     ( 'BR005',  'MetrolandJakarta'  )
INSERT INTO TblStaff ( StaffId, BranchId, StaffName,  StaffPhone,     StaffEmail,                   StaffGender, StaffSalary )
VALUES               ( 'ST001', 'BR005',  'David',    '085928592096', 'Davidaja@Metroland.com',      'Male',      7500000     )
,                    ( 'ST002', 'BR003',  'Abeng',    '081479378184', 'Abengobeng@Metroland.com',    'Male',      9000000     )
,                    ( 'ST003', 'BR001',  'Risman',   '081182773722', 'Rismana@Metroland.com',       'Male',      8500000     )
,                    ( 'ST004', 'BR004',  'Hermawan', '082535178560', 'Hermanwan@Metroland.com',     'Male',      8000000     )
,                    ( 'ST005', 'BR004',  'Tanto',    '081324735690', 'Tantohidayat@Metroland.com',  'Male',      7500000     )
,                    ( 'ST006', 'BR002',  'Yahya',    '082146708364', 'Yahyahiyahiya@Metroland.com', 'Male',      9000000     )
,                    ( 'ST007', 'BR001',  'Wendy',    '086651491428', 'Wendysday@Metroland.com',     'Female',    8500000     )
,                    ( 'ST008', 'BR002',  'Ehsan',    '087900384141', 'Ehsanfizi@Metroland.com',     'Male',      8000000     )
,                    ( 'ST009', 'BR003',  'Ijatz',    '087396932363', 'Ijatbicara@Metroland.com',    'Male',      7500000     )
,                    ( 'ST010', 'BR005',  'Oskar',    '086516525519', 'Oskarwantap@Metroland.com',   'Male',      9000000     )


INSERT INTO TblCustomer ( CustomerId, CustomerName, CustomerGender, CustomerPhone,  CustomerEmail             )
VALUES                  ( 'CU001',    'Renna',      'Female',       '081841052680', 'Renn@gmail.com'          )
,                       ( 'CU002',    'Marika',     'Female',       '082474032133', 'Mar@gmail.com'           )
,                       ( 'CU003',    'Alvian',     'Male',         '082038514624', 'Alviankeren@gmail.com'   )
,                       ( 'CU004',    'Fabio',      'Male',         '088673023885', 'Fabiodeltrame@gmail.com' )
,                       ( 'CU005',    'Ranni',      'Female',       '086387572400', 'Rann@gmail.com'          )
,                       ( 'CU006',    'Chloe',      'Female',       '081447740879', 'Chole@gmail.com'         )
,                       ( 'CU007',    'Melina',     'Female',       '082730675863', 'Meli@gmail.com'          )
,                       ( 'CU008',    'Amelia',     'Female',       '086145029306', 'Ameliawhatson@gmail.com' )
,                       ( 'CU009',    'Malenia',    'Female',       '085148860653', 'Maleni@gmail.com'        )
,                       ( 'CU010',    'Radhan',     'Male',         '089559936943', 'Rad@gmail.com'           )

INSERT INTO TblSupplier ( SupplierId, SupplierName, SupplierPhone, SupplierEmail          )
VALUES                      ( 'SP001',        'Hasbro',         '089983920689',    'HasbroOfficial@gmail.com' )
,                           ( 'SP002',        'Lego',           '088372910349',    'OfficialLego@gmail.com'   )
,                           ( 'SP003',        'BandaiNamco',    '089371385696',    'BandaiN@gmail.com'        )
,                           ( 'SP004',        'Blizzard',       '082752939836',    'Blizz@gmail.com'          )
,                           ( 'SP005',        'Activision',     '083245901235',    'Activ@gmail.com'          )

INSERT INTO TblToyType ( ToyTypeId, ToyTypeName      )
VALUES                 ( 'TT001',   'Action Figure'  )
,                      ( 'TT002',   'Brick'          )
,                      ( 'TT003',   'Diecast'        )
,                      ( 'TT004',   'Remote Control' )
,                      ( 'TT005',   'Puzzle'         )

INSERT INTO TblToy ( ToyId,   ToyTypeId, ToyName,      RetailPrice, WholesalePrice, StockQuantity )
VALUES             ( 'TY001', 'TT001',   'Hydralisk',  500000,      400000,         0             )
,                  ( 'TY002', 'TT002',   'Marine',     400000,      300000,         0             )
,                  ( 'TY003', 'TT003',   'Twinmill',   100000,      75000,          0             )
,                  ( 'TY004', 'TT004',   'Boneshaker', 150000,      100000,         0             )
,                  ( 'TY005', 'TT005',   'Zergling',   300000,      250000,         0             )

INSERT INTO TblPaymentType ( PaymentTypeId, PaymentType  )
VALUES                     ( 'PA001',       'Visa'       )
,                          ( 'PA002',       'Mastercard' )
,                          ( 'PA003',       'E-Money'    )
,                          ( 'PA004',       'Debit'      )
,                          ( 'PA005',       'Credit'     )


INSERT INTO PurchaseHeader ( PurchaseId, SupplierId, StaffId, PurchaseDate )
VALUES                     ( 'PO001',    'SP004',        'ST007', '2021-01-05' )
,                          ( 'PO002',    'SP005',        'ST003', '2021-02-10' )
,                          ( 'PO003',    'SP003',        'ST003', '2021-03-12' )
,                          ( 'PO004',    'SP002',        'ST004', '2021-04-16' )
,                          ( 'PO005',    'SP001',        'ST002', '2021-05-20' )


insert into PurchaseDetail ( PurchaseId, ToyId,   Quantity )
values                     ( 'PO001',    'TY002', '50'     )
,                          ( 'PO002',    'TY005', '50'     )
,                          ( 'PO003',    'TY003', '50'     )
,                          ( 'PO004',    'TY001', '50'     )
,                          ( 'PO005',    'TY004', '50'     )

INSERT INTO SalesHeader ( SalesId, PaymentTypeId, CustomerId, StaffId, SalesDate    )
VALUES                  ( 'SA001', 'PA001',       'CU001',    'ST007', '2022-01-05' )
,                       ( 'SA002', 'PA003',       'CU005',    'ST003', '2022-02-10' )
,                       ( 'SA003', 'PA003',       'CU005',    'ST003', '2022-03-12' )
,                       ( 'SA004', 'PA001',       'CU003',    'ST004', '2022-04-16' )
,                       ( 'SA005', 'PA002',       'CU004',    'ST002', '2022-05-20' )
,                       ( 'SA006', 'PA005',       'CU002',    'ST005', '2022-06-21' )
,                       ( 'SA007', 'PA003',       'CU009',    'ST006', '2022-07-22' )
,                       ( 'SA008', 'PA003',       'CU007',    'ST002', '2022-09-24' )
,                       ( 'SA009', 'PA003',       'CU009',    'ST002', '2022-10-24' )
,                       ( 'SA010', 'PA004',       'CU008',    'ST001', '2022-11-24' )

INSERT INTO SalesDetail ( SalesId, ToyId,   Quantity )
VALUES                  ( 'SA001', 'TY001', '2'      )
,                       ( 'SA001', 'TY005', '1'      )
,                       ( 'SA002', 'TY001', '1'      )
,                       ( 'SA002', 'TY003', '1'      )
,                       ( 'SA003', 'TY003', '1'      )
,                       ( 'SA003', 'TY001', '1'      )
,                       ( 'SA004', 'TY004', '3'      )
,                       ( 'SA004', 'TY003', '2'      )
,                       ( 'SA005', 'TY005', '2'      )
,                       ( 'SA005', 'TY001', '2'      )
,                       ( 'SA006', 'TY004', '1'      )
,                       ( 'SA006', 'TY001', '4'      )
,                       ( 'SA007', 'TY002', '2'      )
,                       ( 'SA007', 'TY003', '2'      )
,                       ( 'SA008', 'TY002', '2'      )
,                       ( 'SA008', 'TY005', '3'      )
,                       ( 'SA009', 'TY003', '1'      )
,                       ( 'SA009', 'TY004', '1'      )
,                       ( 'SA010', 'TY002', '1'      )
,                       ( 'SA010', 'TY001', '1'      )

--6. (LO3 – Weight: 10%) Please create a profitability report of sales transaction during the period Jan – Mar 2022. The report will show some require fields quantity of each sold toys type, purchase price, sales price, profit for each type, and the profitability percentage.

select [Toy Type] = ToyTypeName                                                                                                                                  
,      [Quantity Sold] = sum(Quantity)                                                                                                                           
,      [Total Purchase Price] = 'Rp. '+ cast(WholesalePrice*sum(Quantity) as varchar)                                                                            
,      [Total Sale Price] = 'Rp. '+ cast(RetailPrice*sum(Quantity) as varchar)                                                                                   
,      [Profit] = 'Rp. '+ cast(((RetailPrice*sum(Quantity)) - (WholesalePrice*sum(Quantity))) as varchar)                                                        
,      [Profitability Percentage] = cast((((RetailPrice*sum(Quantity)) - (WholesalePrice*sum(Quantity))) / (WholesalePrice*sum(Quantity))) * 100 as varchar) +'%'
from SalesDetail d 
join SalesHeader h  on h.SalesId = d.SalesId
join TblToy      t  on t.ToyId = d.ToyId
join TblToyType  ty on t.ToyTypeId = ty.ToyTypeId
where month(SalesDate) between 1 and 3
	and year(SalesDate) = 2022
group by ToyTypeName
,        WholesalePrice
,        RetailPrice

--7. (LO3 – Weight: 10%) Please create a report using subquery to show items that have not sold during Jan – Mar 2022.
select ToyId
,      ToyName
from TblToy
where ToyId not in(select ToyId
	from SalesHeader h
	join SalesDetail d on h.SalesId = d.SalesId
	where month(SalesDate) between 1 and 3
		and year(SalesDate) = 2022 )




--8. (LO3 – Weight: 10%) Please create a view to display customer data, where the data is used to give the promotion. This view displays the customer's name, and the customer's phone number.
GO
create view [Customer Data to give promotion]
as
	select CustomerName  as [Customer name]
	,      CustomerPhone as [Customer phone]
	from TblCustomer
GO

