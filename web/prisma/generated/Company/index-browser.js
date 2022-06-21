
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

exports.Prisma.CountryScalarFieldEnum = makeEnum({
  idCountry: 'idCountry',
  countryName: 'countryName'
});

exports.Prisma.CashClubScalarFieldEnum = makeEnum({
  idCashClub: 'idCashClub',
  cashType: 'cashType',
  idClub: 'idClub'
});

exports.Prisma.DepartmentScalarFieldEnum = makeEnum({
  idDepartment: 'idDepartment',
  departmentName: 'departmentName'
});

exports.Prisma.EmployeeScalarFieldEnum = makeEnum({
  idEmployee: 'idEmployee',
  idInfoEmployee: 'idInfoEmployee',
  isActive: 'isActive',
  salary: 'salary',
  idJob: 'idJob',
  idEmployeeUser: 'idEmployeeUser',
  idCashClub: 'idCashClub',
  calification: 'calification'
});

exports.Prisma.EmployeeUserScalarFieldEnum = makeEnum({
  idEmployeeUser: 'idEmployeeUser',
  pasword: 'pasword',
  isActive: 'isActive'
});

exports.Prisma.InfoEmployeeScalarFieldEnum = makeEnum({
  idInfoEmployee: 'idInfoEmployee',
  peopleName: 'peopleName',
  surname: 'surname',
  email: 'email',
  phoneNumber: 'phoneNumber',
  birthDate: 'birthDate',
  employeeAddress: 'employeeAddress',
  idCountry: 'idCountry'
});

exports.Prisma.JobScalarFieldEnum = makeEnum({
  idJob: 'idJob',
  jobName: 'jobName',
  idDepartment: 'idDepartment'
});

exports.Prisma.SortOrder = makeEnum({
  asc: 'asc',
  desc: 'desc'
});


exports.Prisma.ModelName = makeEnum({
  Country: 'Country',
  CashClub: 'CashClub',
  Department: 'Department',
  Employee: 'Employee',
  EmployeeUser: 'EmployeeUser',
  InfoEmployee: 'InfoEmployee',
  Job: 'Job'
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
