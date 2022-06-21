
Object.defineProperty(exports, "__esModule", { value: true });

const {
  Decimal
} = require('./runtime/index-browser')


const Prisma = {}

exports.Prisma = Prisma

/**
 * Prisma Client JS version: 3.15.2
 * Query Engine version: 461d6a05159055555eb7dfb337c9fb271cbd4d7e
 */
Prisma.prismaVersion = {
  client: "3.15.2",
  engine: "461d6a05159055555eb7dfb337c9fb271cbd4d7e"
}

Prisma.PrismaClientKnownRequestError = () => {
  throw new Error(`PrismaClientKnownRequestError is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)};
Prisma.PrismaClientUnknownRequestError = () => {
  throw new Error(`PrismaClientUnknownRequestError is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.PrismaClientRustPanicError = () => {
  throw new Error(`PrismaClientRustPanicError is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.PrismaClientInitializationError = () => {
  throw new Error(`PrismaClientInitializationError is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.PrismaClientValidationError = () => {
  throw new Error(`PrismaClientValidationError is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.Decimal = Decimal

/**
 * Re-export of sql-template-tag
 */
Prisma.sql = () => {
  throw new Error(`sqltag is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.empty = () => {
  throw new Error(`empty is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.join = () => {
  throw new Error(`join is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.raw = () => {
  throw new Error(`raw is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.validator = () => (val) => val

/**
 * Shorthand utilities for JSON filtering
 */
Prisma.DbNull = 'DbNull'
Prisma.JsonNull = 'JsonNull'
Prisma.AnyNull = 'AnyNull'

/**
 * Enums
 */
// Based on
// https://github.com/microsoft/TypeScript/issues/3192#issuecomment-261720275
function makeEnum(x) { return x; }

exports.Prisma.CardScalarFieldEnum = makeEnum({
  idCard: 'idCard',
  idInfoPeople: 'idInfoPeople',
  cardNumber: 'cardNumber',
  expirationDate: 'expirationDate',
  cvv: 'cvv'
});

exports.Prisma.CashScalarFieldEnum = makeEnum({
  idCash: 'idCash',
  cashType: 'cashType'
});

exports.Prisma.ClientlocationScalarFieldEnum = makeEnum({
  idClientLocation: 'idClientLocation',
  idClientPeople: 'idClientPeople',
  idLocation: 'idLocation'
});

exports.Prisma.ClientmembershipScalarFieldEnum = makeEnum({
  idClientMembership: 'idClientMembership',
  idMembership: 'idMembership',
  idClientPeople: 'idClientPeople'
});

exports.Prisma.ClientpeopleScalarFieldEnum = makeEnum({
  idClientPeople: 'idClientPeople',
  idClientUser: 'idClientUser',
  idInfoPeople: 'idInfoPeople',
  salesCounter: 'salesCounter',
  isActive: 'isActive'
});

exports.Prisma.ClientuserScalarFieldEnum = makeEnum({
  idClientUser: 'idClientUser',
  userPassword: 'userPassword',
  isActive: 'isActive'
});

exports.Prisma.ClubScalarFieldEnum = makeEnum({
  idClub: 'idClub',
  clubName: 'clubName',
  idLocation: 'idLocation',
  deliveryCostProp: 'deliveryCostProp',
  idCash: 'idCash',
  isActive: 'isActive'
});

exports.Prisma.ComplaintScalarFieldEnum = makeEnum({
  idComplaint: 'idComplaint',
  idWorkerReview: 'idWorkerReview',
  compDescription: 'compDescription',
  solved: 'solved'
});

exports.Prisma.InfopeopleScalarFieldEnum = makeEnum({
  idInfoPeople: 'idInfoPeople',
  peopleName: 'peopleName',
  surname: 'surname',
  email: 'email',
  phoneNumber: 'phoneNumber',
  birthDate: 'birthDate',
  isActive: 'isActive'
});

exports.Prisma.InventoryScalarFieldEnum = makeEnum({
  idInventory: 'idInventory',
  idClub: 'idClub',
  idProduct: 'idProduct',
  stock: 'stock',
  isActive: 'isActive'
});

exports.Prisma.LocationScalarFieldEnum = makeEnum({
  idLocation: 'idLocation',
  typeLocation: 'typeLocation',
  isActive: 'isActive'
});

exports.Prisma.MembershipScalarFieldEnum = makeEnum({
  idMembership: 'idMembership',
  nameMembership: 'nameMembership',
  cost: 'cost',
  productDiscount: 'productDiscount',
  deliveryDiscount: 'deliveryDiscount',
  isActive: 'isActive'
});

exports.Prisma.OrderlineScalarFieldEnum = makeEnum({
  idOrderLine: 'idOrderLine',
  idOrderP: 'idOrderP',
  idProduct: 'idProduct',
  cost: 'cost',
  amount: 'amount'
});

exports.Prisma.OrderpScalarFieldEnum = makeEnum({
  idOrderP: 'idOrderP',
  idClientPeople: 'idClientPeople',
  orderDate: 'orderDate',
  idClub: 'idClub',
  idEmployer: 'idEmployer',
  idMailer: 'idMailer',
  deliveryCost: 'deliveryCost'
});

exports.Prisma.PopularproductsScalarFieldEnum = makeEnum({
  idPopularProducts: 'idPopularProducts',
  idProduct: 'idProduct',
  amount: 'amount',
  idClub: 'idClub'
});

exports.Prisma.PresentationScalarFieldEnum = makeEnum({
  idPresentation: 'idPresentation',
  idProduct: 'idProduct',
  amountBottles: 'amountBottles',
  sizeBottle: 'sizeBottle'
});

exports.Prisma.ProductScalarFieldEnum = makeEnum({
  idProduct: 'idProduct',
  productName: 'productName',
  cost: 'cost',
  idProductType: 'idProductType',
  image: 'image',
  idSupplier: 'idSupplier',
  idCash: 'idCash',
  isActive: 'isActive',
  entryDate: 'entryDate',
  tier: 'tier',
  productDescr: 'productDescr'
});

exports.Prisma.ProducttypeScalarFieldEnum = makeEnum({
  idProductType: 'idProductType',
  typeName: 'typeName',
  isActive: 'isActive'
});

exports.Prisma.QualificationScalarFieldEnum = makeEnum({
  idQualification: 'idQualification',
  idWorkerReview: 'idWorkerReview',
  qualDescription: 'qualDescription'
});

exports.Prisma.ReviewScalarFieldEnum = makeEnum({
  idReview: 'idReview',
  idProduct: 'idProduct',
  score: 'score',
  revDescription: 'revDescription',
  idClientUser: 'idClientUser',
  revDate: 'revDate'
});

exports.Prisma.SupplierScalarFieldEnum = makeEnum({
  idSupplier: 'idSupplier',
  supplierName: 'supplierName',
  isActive: 'isActive'
});

exports.Prisma.WorkerreviewScalarFieldEnum = makeEnum({
  idWorkerReview: 'idWorkerReview',
  idClientUser: 'idClientUser',
  idWorker: 'idWorker',
  dateWR: 'dateWR'
});

exports.Prisma.SortOrder = makeEnum({
  asc: 'asc',
  desc: 'desc'
});


exports.Prisma.ModelName = makeEnum({
  card: 'card',
  cash: 'cash',
  clientlocation: 'clientlocation',
  clientmembership: 'clientmembership',
  clientpeople: 'clientpeople',
  clientuser: 'clientuser',
  club: 'club',
  complaint: 'complaint',
  infopeople: 'infopeople',
  inventory: 'inventory',
  location: 'location',
  membership: 'membership',
  orderline: 'orderline',
  orderp: 'orderp',
  popularproducts: 'popularproducts',
  presentation: 'presentation',
  product: 'product',
  producttype: 'producttype',
  qualification: 'qualification',
  review: 'review',
  supplier: 'supplier',
  workerreview: 'workerreview'
});

/**
 * Create the Client
 */
class PrismaClient {
  constructor() {
    throw new Error(
      `PrismaClient is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
    )
  }
}
exports.PrismaClient = PrismaClient

Object.assign(exports, Prisma)
