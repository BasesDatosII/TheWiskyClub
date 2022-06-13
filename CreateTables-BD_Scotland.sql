CREATE SCHEMA `BD_Scotland` ;

CREATE TABLE Cash
(
    idCash INT AUTO_INCREMENT, PRIMARY KEY (idCash),
    cashType     VARCHAR(20) NOT NULL
);

CREATE TABLE Location
(
    idLocation INT AUTO_INCREMENT, PRIMARY KEY (idLocation),
    location     GEOMETRY NOT NULL,
    typeLocation BIT #1 = Club, 0 = ClientLocation
);

CREATE TABLE Club
(
	idClub INT AUTO_INCREMENT, PRIMARY KEY (idClub),
    clubName VARCHAR(20) NOT NULL,
    idLocation INT NOT NULL,
    CONSTRAINT fk_ClubLocation FOREIGN KEY(idLocation)
    REFERENCES Location(idLocation),
    deliveryCostProp FLOAT NOT NULL,
    idCash INT NOT NULL,
    CONSTRAINT fk_ClubCash FOREIGN KEY(idCash)
    REFERENCES Cash(idCash)
);

CREATE TABLE Membership
(
	idMembership INT AUTO_INCREMENT, PRIMARY KEY (idMembership),
    nameMembership VARCHAR(30) NOT NULL,
    cost DECIMAL(15,2) NOT NULL,
    productDiscount FLOAT NOT NULL,
    deliveryDiscount FLOAT NOT NULL
);

CREATE TABLE Presentation
(
	idPresentation INT AUTO_INCREMENT, PRIMARY KEY (idPresentation),
    amountBottles INT NOT NULL,
    sizeBottle INT NOT NULL
);

CREATE TABLE Supplier
(
	idSupplier INT AUTO_INCREMENT, PRIMARY KEY (idSupplier),
	supplierName VARCHAR(20) NOT NULL,
    isActive BIT NOT NULL #1 = ACTIVE, 0 = NON ACTIVE
);

CREATE TABLE ProductType
(
	idProductType INT AUTO_INCREMENT, PRIMARY KEY (idProductType),
    typeName VARCHAR(20) NOT NULL,
    isActive BIT NOT NULL #1 = ACTIVE, 0 = NON ACTIVE
);

CREATE TABLE Product
(
	idProduct INT AUTO_INCREMENT, PRIMARY KEY (idProduct),
    productName VARCHAR(20),
    cost DECIMAL(15,2) NOT NULL,
    idProductType INT NOT NULL,
    CONSTRAINT fk_ProductProductType FOREIGN KEY(idProductType)
    REFERENCES ProductType(idProductType),
    image BLOB,
    idSupplier INT NOT NULL,
    CONSTRAINT fk_ProductSupplier FOREIGN KEY(idSupplier)
    REFERENCES Supplier(idSupplier),
    idPresentation INT NOT NULL,
    CONSTRAINT fk_ProductPresentation FOREIGN KEY(idPresentation)
    REFERENCES Presentation(idPresentation),
    idCash INT NOT NULL,
    CONSTRAINT fk_ProductCash FOREIGN KEY(idCash)
    REFERENCES Cash(idCash),
    isActive BIT NOT NULL, #1 = ACTIVE, 0 = NON ACTIVE
    entryDate DATE NOT NULL,
	tier INT NOT NULL DEFAULT 1
);

CREATE TABLE PopularProducts
(
	idPopularProducts INT AUTO_INCREMENT, PRIMARY KEY (idPopularProducts),
    idProduct INT NOT NULL,
    CONSTRAINT fk_PopularProductsProduct FOREIGN KEY(idProduct)
    REFERENCES Product(idProduct),
    amount INT NOT NULL DEFAULT 0
);

CREATE TABLE Inventory
(
	idInventory INT AUTO_INCREMENT, PRIMARY KEY (idInventory),
    idClub INT NOT NULL,
    CONSTRAINT fk_InventoryClub FOREIGN KEY(idClub)
    REFERENCES Club(idClub),
    idProduct INT NOT NULL,
    CONSTRAINT fk_InventoryProduct FOREIGN KEY(idProduct)
    REFERENCES Product(idProduct),
    stock INT NOT NULL DEFAULT 0,
    isActive BIT NOT NULL #1 = ACTIVE, 0 = NON ACTIVE
);

CREATE TABLE InfoPeople
(
	idInfoPeople INT AUTO_INCREMENT, PRIMARY KEY (idInfoPeople),
    peopleName VARCHAR(20) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phoneNumber INT NOT NULL,
    birthDate DATE NOT NULL
);

CREATE TABLE CreditCard
(
	idCard INT AUTO_INCREMENT, PRIMARY KEY (idCard),
    idInfoPeople INT NOT NULL,
    CONSTRAINT fk_CardInfoPeople FOREIGN KEY(idInfoPeople)
    REFERENCES InfoPeople(idInfoPeople),
    cardNumber INT NOT NULL,
    expirationDate DATE NOT NULL,
    cvv INT NOT NULL
);

CREATE TABLE ClientUser
(
	idClientUser INT AUTO_INCREMENT, PRIMARY KEY (idCLientUser),
    userPassword VARCHAR(30) NOT NULL,
    isActive BIT NOT NULL #1 = ACTIVE, 0 = NON ACTIVE
);

CREATE TABLE ClientPeople
(
	idClientPeople INT AUTO_INCREMENT, PRIMARY KEY (idClientPeople),
    idClientUser INT NOT NULL,
    CONSTRAINT fk_ClientPeopleClientUser FOREIGN KEY(idClientUser)
    REFERENCES ClientUser(idClientUser),
    idInfoPeople INT NOT NULL,
    CONSTRAINT fk_ClientInfoPeople FOREIGN KEY(idInfoPeople)
    REFERENCES InfoPeople(idInfoPeople),
    salesCounter INT NOT NULL DEFAULT 0,
    isActive BIT NOT NULL #1 = ACTIVE, 0 = NON ACTIVE
);

CREATE TABLE ClientLocation
(
	idClientLocation INT AUTO_INCREMENT, PRIMARY KEY (idClientLocation),
    idClientPeople INT NOT NULL,
    CONSTRAINT fk_ClientLocationClientPeople FOREIGN KEY(idClientPeople)
    REFERENCES ClientPeople(idClientPeople),
    idLocation INT NOT NULL,
    CONSTRAINT fk_ClientLocationLocation FOREIGN KEY(idLocation)
    REFERENCES Location(idLocation)
);

CREATE TABLE ClientMembership
(
	idClientMembership INT AUTO_INCREMENT, PRIMARY KEY (idClientMembership),
    idMembership INT NOT NULL,
    CONSTRAINT fk_ClientMembershipMembership FOREIGN KEY(idMembership)
    REFERENCES Membership(idMembership),
    idClientPeople INT NOT NULL,
    CONSTRAINT fk_ClientMembershipClient FOREIGN KEY(idClientPeople)
    REFERENCES ClientPeople(idClientPeople)
);

CREATE TABLE OrderP
(
	idOrderP INT AUTO_INCREMENT, PRIMARY KEY (idOrderP),
    idClientPeople INT NOT NULL,
    CONSTRAINT fk_OrderPClient FOREIGN KEY(idClientPeople)
    REFERENCES ClientPeople(idClientPeople),
    orderDate DATE NOT NULL,
    idClub INT NOT NULL,
    CONSTRAINT fk_OrderPClub FOREIGN KEY(idClub)
    REFERENCES Club(idClub),
    idEmployer INT NOT NULL,
    idMailer INT NOT NULL
);

CREATE TABLE OrderLine
(
	idOrderLine INT AUTO_INCREMENT, PRIMARY KEY (idOrderLine),
    idOrderP INT NOT NULL,
    CONSTRAINT fk_OrderLineOrderP FOREIGN KEY(idOrderP)
    REFERENCES OrderP(idOrderP),
    idProduct INT NOT NULL,
    CONSTRAINT fk_OrderLineProduct FOREIGN KEY(idProduct)
    REFERENCES Product(idProduct),
    cost DECIMAL(15,2) NOT NULL,
    amount INT NOT NULL
);

CREATE TABLE Review
(
	idReview INT AUTO_INCREMENT, PRIMARY KEY (idReview),
    idProduct INT NOT NULL,
    CONSTRAINT fk_ReviewProduct FOREIGN KEY(idProduct)
    REFERENCES Product(idProduct),
    score INT NOT NULL,
    revDescription VARCHAR(200) NOT NULL,
    idClientUser INT NOT NULL,
    CONSTRAINT fk_ReviewClientUser FOREIGN KEY(idClientUser)
    REFERENCES ClientUser(idClientUser)
);

CREATE TABLE WorkerReview
(
	idWorkerReview INT AUTO_INCREMENT, PRIMARY KEY (idWorkerReview),
    idClientUser INT NOT NULL,
    CONSTRAINT fk_WorkerReviewClientUser FOREIGN KEY(idClientUser)
    REFERENCES ClientUser(idClientUser),
    idWorker INT NOT NULL,
    dateWR DATE NOT NULL
);

CREATE TABLE Qualification
(
	idQualification INT AUTO_INCREMENT, PRIMARY KEY (idQualification),
    idWorkerReview INT NOT NULL,
    CONSTRAINT fk_QualificationWorkerReview FOREIGN KEY(idWorkerReview)
    REFERENCES WorkerReview(idWorkerReview),
    qualDescription VARCHAR(200) NOT NULL
);

CREATE TABLE Complaint
(
	Complaint INT AUTO_INCREMENT, PRIMARY KEY (Complaint),
    idWorkerReview INT NOT NULL,
    CONSTRAINT fk_ComplaintWorkerReview FOREIGN KEY(idWorkerReview)
    REFERENCES WorkerReview(idWorkerReview),
    qualDescription VARCHAR(200) NOT NULL,
    solved BIT NOT NULL #1 = NOT SOLVED, 0 = SOLVED
);