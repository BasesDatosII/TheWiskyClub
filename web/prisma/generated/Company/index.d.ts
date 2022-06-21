
/**
 * Client
**/

import * as runtime from './runtime/index';
declare const prisma: unique symbol
export type PrismaPromise<A> = Promise<A> & {[prisma]: true}
type UnwrapPromise<P extends any> = P extends Promise<infer R> ? R : P
type UnwrapTuple<Tuple extends readonly unknown[]> = {
  [K in keyof Tuple]: K extends `${number}` ? Tuple[K] extends PrismaPromise<infer X> ? X : UnwrapPromise<Tuple[K]> : UnwrapPromise<Tuple[K]>
};


/**
 * Model Country
 * 
 */
export type Country = {
  idCountry: number
  countryName: string
}

/**
 * Model CashClub
 * 
 */
export type CashClub = {
  idCashClub: number
  cashType: string
  idClub: number
}

/**
 * Model Department
 * 
 */
export type Department = {
  idDepartment: number
  departmentName: string
}

/**
 * Model Employee
 * 
 */
export type Employee = {
  idEmployee: number
  idInfoEmployee: number
  isActive: boolean
  salary: number
  idJob: number | null
  idEmployeeUser: number
  idCashClub: number
  calification: number
}

/**
 * Model EmployeeUser
 * 
 */
export type EmployeeUser = {
  idEmployeeUser: number
  pasword: Buffer
  isActive: boolean | null
}

/**
 * Model InfoEmployee
 * 
 */
export type InfoEmployee = {
  idInfoEmployee: number
  peopleName: string
  surname: string
  email: string
  phoneNumber: number
  birthDate: Date
  employeeAddress: string
  idCountry: number
}

/**
 * Model Job
 * 
 */
export type Job = {
  idJob: number
  jobName: string
  idDepartment: number
}


/**
 * ##  Prisma Client ʲˢ
 * 
 * Type-safe database client for TypeScript & Node.js
 * @example
 * ```
 * const prisma = new PrismaClient()
 * // Fetch zero or more Countries
 * const countries = await prisma.country.findMany()
 * ```
 *
 * 
 * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client).
 */
export class PrismaClient<
  T extends Prisma.PrismaClientOptions = Prisma.PrismaClientOptions,
  U = 'log' extends keyof T ? T['log'] extends Array<Prisma.LogLevel | Prisma.LogDefinition> ? Prisma.GetEvents<T['log']> : never : never,
  GlobalReject = 'rejectOnNotFound' extends keyof T
    ? T['rejectOnNotFound']
    : false
      > {
      /**
       * @private
       */
      private fetcher;
      /**
       * @private
       */
      private readonly dmmf;
      /**
       * @private
       */
      private connectionPromise?;
      /**
       * @private
       */
      private disconnectionPromise?;
      /**
       * @private
       */
      private readonly engineConfig;
      /**
       * @private
       */
      private readonly measurePerformance;

    /**
   * ##  Prisma Client ʲˢ
   * 
   * Type-safe database client for TypeScript & Node.js
   * @example
   * ```
   * const prisma = new PrismaClient()
   * // Fetch zero or more Countries
   * const countries = await prisma.country.findMany()
   * ```
   *
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client).
   */

  constructor(optionsArg ?: Prisma.Subset<T, Prisma.PrismaClientOptions>);
  $on<V extends (U | 'beforeExit')>(eventType: V, callback: (event: V extends 'query' ? Prisma.QueryEvent : V extends 'beforeExit' ? () => Promise<void> : Prisma.LogEvent) => void): void;

  /**
   * Connect with the database
   */
  $connect(): Promise<void>;

  /**
   * Disconnect from the database
   */
  $disconnect(): Promise<void>;

  /**
   * Add a middleware
   */
  $use(cb: Prisma.Middleware): void

/**
   * Executes a prepared raw query and returns the number of affected rows.
   * @example
   * ```
   * const result = await prisma.$executeRaw`UPDATE User SET cool = ${true} WHERE email = ${'user@email.com'};`
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $executeRaw<T = unknown>(query: TemplateStringsArray | Prisma.Sql, ...values: any[]): PrismaPromise<number>;

  /**
   * Executes a raw query and returns the number of affected rows.
   * Susceptible to SQL injections, see documentation.
   * @example
   * ```
   * const result = await prisma.$executeRawUnsafe('UPDATE User SET cool = $1 WHERE email = $2 ;', true, 'user@email.com')
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $executeRawUnsafe<T = unknown>(query: string, ...values: any[]): PrismaPromise<number>;

  /**
   * Performs a prepared raw query and returns the `SELECT` data.
   * @example
   * ```
   * const result = await prisma.$queryRaw`SELECT * FROM User WHERE id = ${1} OR email = ${'user@email.com'};`
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $queryRaw<T = unknown>(query: TemplateStringsArray | Prisma.Sql, ...values: any[]): PrismaPromise<T>;

  /**
   * Performs a raw query and returns the `SELECT` data.
   * Susceptible to SQL injections, see documentation.
   * @example
   * ```
   * const result = await prisma.$queryRawUnsafe('SELECT * FROM User WHERE id = $1 OR email = $2;', 1, 'user@email.com')
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $queryRawUnsafe<T = unknown>(query: string, ...values: any[]): PrismaPromise<T>;

  /**
   * Allows the running of a sequence of read/write operations that are guaranteed to either succeed or fail as a whole.
   * @example
   * ```
   * const [george, bob, alice] = await prisma.$transaction([
   *   prisma.user.create({ data: { name: 'George' } }),
   *   prisma.user.create({ data: { name: 'Bob' } }),
   *   prisma.user.create({ data: { name: 'Alice' } }),
   * ])
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/concepts/components/prisma-client/transactions).
   */
  $transaction<P extends PrismaPromise<any>[]>(arg: [...P]): Promise<UnwrapTuple<P>>;

      /**
   * `prisma.country`: Exposes CRUD operations for the **Country** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more Countries
    * const countries = await prisma.country.findMany()
    * ```
    */
  get country(): Prisma.CountryDelegate<GlobalReject>;

  /**
   * `prisma.cashClub`: Exposes CRUD operations for the **CashClub** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more CashClubs
    * const cashClubs = await prisma.cashClub.findMany()
    * ```
    */
  get cashClub(): Prisma.CashClubDelegate<GlobalReject>;

  /**
   * `prisma.department`: Exposes CRUD operations for the **Department** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more Departments
    * const departments = await prisma.department.findMany()
    * ```
    */
  get department(): Prisma.DepartmentDelegate<GlobalReject>;

  /**
   * `prisma.employee`: Exposes CRUD operations for the **Employee** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more Employees
    * const employees = await prisma.employee.findMany()
    * ```
    */
  get employee(): Prisma.EmployeeDelegate<GlobalReject>;

  /**
   * `prisma.employeeUser`: Exposes CRUD operations for the **EmployeeUser** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more EmployeeUsers
    * const employeeUsers = await prisma.employeeUser.findMany()
    * ```
    */
  get employeeUser(): Prisma.EmployeeUserDelegate<GlobalReject>;

  /**
   * `prisma.infoEmployee`: Exposes CRUD operations for the **InfoEmployee** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more InfoEmployees
    * const infoEmployees = await prisma.infoEmployee.findMany()
    * ```
    */
  get infoEmployee(): Prisma.InfoEmployeeDelegate<GlobalReject>;

  /**
   * `prisma.job`: Exposes CRUD operations for the **Job** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more Jobs
    * const jobs = await prisma.job.findMany()
    * ```
    */
  get job(): Prisma.JobDelegate<GlobalReject>;
}

export namespace Prisma {
  export import DMMF = runtime.DMMF

  /**
   * Prisma Errors
   */
  export import PrismaClientKnownRequestError = runtime.PrismaClientKnownRequestError
  export import PrismaClientUnknownRequestError = runtime.PrismaClientUnknownRequestError
  export import PrismaClientRustPanicError = runtime.PrismaClientRustPanicError
  export import PrismaClientInitializationError = runtime.PrismaClientInitializationError
  export import PrismaClientValidationError = runtime.PrismaClientValidationError

  /**
   * Re-export of sql-template-tag
   */
  export import sql = runtime.sqltag
  export import empty = runtime.empty
  export import join = runtime.join
  export import raw = runtime.raw
  export import Sql = runtime.Sql

  /**
   * Decimal.js
   */
  export import Decimal = runtime.Decimal

  export type DecimalJsLike = runtime.DecimalJsLike

  /**
   * Prisma Client JS version: 3.15.2
   * Query Engine version: 461d6a05159055555eb7dfb337c9fb271cbd4d7e
   */
  export type PrismaVersion = {
    client: string
  }

  export const prismaVersion: PrismaVersion 

  /**
   * Utility Types
   */

  /**
   * From https://github.com/sindresorhus/type-fest/
   * Matches a JSON object.
   * This type can be useful to enforce some input to be JSON-compatible or as a super-type to be extended from. 
   */
  export type JsonObject = {[Key in string]?: JsonValue}

  /**
   * From https://github.com/sindresorhus/type-fest/
   * Matches a JSON array.
   */
  export interface JsonArray extends Array<JsonValue> {}

  /**
   * From https://github.com/sindresorhus/type-fest/
   * Matches any valid JSON value.
   */
  export type JsonValue = string | number | boolean | JsonObject | JsonArray | null

  /**
   * Matches a JSON object.
   * Unlike `JsonObject`, this type allows undefined and read-only properties.
   */
  export type InputJsonObject = {readonly [Key in string]?: InputJsonValue | null}

  /**
   * Matches a JSON array.
   * Unlike `JsonArray`, readonly arrays are assignable to this type.
   */
  export interface InputJsonArray extends ReadonlyArray<InputJsonValue | null> {}

  /**
   * Matches any valid value that can be used as an input for operations like
   * create and update as the value of a JSON field. Unlike `JsonValue`, this
   * type allows read-only arrays and read-only object properties and disallows
   * `null` at the top level.
   *
   * `null` cannot be used as the value of a JSON field because its meaning
   * would be ambiguous. Use `Prisma.JsonNull` to store the JSON null value or
   * `Prisma.DbNull` to clear the JSON value and set the field to the database
   * NULL value instead.
   *
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-by-null-values
   */
  export type InputJsonValue = string | number | boolean | InputJsonObject | InputJsonArray

  /**
   * Helper for filtering JSON entries that have `null` on the database (empty on the db)
   * 
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  export const DbNull: 'DbNull'

  /**
   * Helper for filtering JSON entries that have JSON `null` values (not empty on the db)
   * 
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  export const JsonNull: 'JsonNull'

  /**
   * Helper for filtering JSON entries that are `Prisma.DbNull` or `Prisma.JsonNull`
   * 
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  export const AnyNull: 'AnyNull'

  type SelectAndInclude = {
    select: any
    include: any
  }
  type HasSelect = {
    select: any
  }
  type HasInclude = {
    include: any
  }
  type CheckSelect<T, S, U> = T extends SelectAndInclude
    ? 'Please either choose `select` or `include`'
    : T extends HasSelect
    ? U
    : T extends HasInclude
    ? U
    : S

  /**
   * Get the type of the value, that the Promise holds.
   */
  export type PromiseType<T extends PromiseLike<any>> = T extends PromiseLike<infer U> ? U : T;

  /**
   * Get the return type of a function which returns a Promise.
   */
  export type PromiseReturnType<T extends (...args: any) => Promise<any>> = PromiseType<ReturnType<T>>

  /**
   * From T, pick a set of properties whose keys are in the union K
   */
  type Prisma__Pick<T, K extends keyof T> = {
      [P in K]: T[P];
  };


  export type Enumerable<T> = T | Array<T>;

  export type RequiredKeys<T> = {
    [K in keyof T]-?: {} extends Prisma__Pick<T, K> ? never : K
  }[keyof T]

  export type TruthyKeys<T> = {
    [key in keyof T]: T[key] extends false | undefined | null ? never : key
  }[keyof T]

  export type TrueKeys<T> = TruthyKeys<Prisma__Pick<T, RequiredKeys<T>>>

  /**
   * Subset
   * @desc From `T` pick properties that exist in `U`. Simple version of Intersection
   */
  export type Subset<T, U> = {
    [key in keyof T]: key extends keyof U ? T[key] : never;
  };

  /**
   * SelectSubset
   * @desc From `T` pick properties that exist in `U`. Simple version of Intersection.
   * Additionally, it validates, if both select and include are present. If the case, it errors.
   */
  export type SelectSubset<T, U> = {
    [key in keyof T]: key extends keyof U ? T[key] : never
  } &
    (T extends SelectAndInclude
      ? 'Please either choose `select` or `include`.'
      : {})

  /**
   * Subset + Intersection
   * @desc From `T` pick properties that exist in `U` and intersect `K`
   */
  export type SubsetIntersection<T, U, K> = {
    [key in keyof T]: key extends keyof U ? T[key] : never
  } &
    K

  type Without<T, U> = { [P in Exclude<keyof T, keyof U>]?: never };

  /**
   * XOR is needed to have a real mutually exclusive union type
   * https://stackoverflow.com/questions/42123407/does-typescript-support-mutually-exclusive-types
   */
  type XOR<T, U> =
    T extends object ?
    U extends object ?
      (Without<T, U> & U) | (Without<U, T> & T)
    : U : T


  /**
   * Is T a Record?
   */
  type IsObject<T extends any> = T extends Array<any>
  ? False
  : T extends Date
  ? False
  : T extends Buffer
  ? False
  : T extends BigInt
  ? False
  : T extends object
  ? True
  : False


  /**
   * If it's T[], return T
   */
  export type UnEnumerate<T extends unknown> = T extends Array<infer U> ? U : T

  /**
   * From ts-toolbelt
   */

  type __Either<O extends object, K extends Key> = Omit<O, K> &
    {
      // Merge all but K
      [P in K]: Prisma__Pick<O, P & keyof O> // With K possibilities
    }[K]

  type EitherStrict<O extends object, K extends Key> = Strict<__Either<O, K>>

  type EitherLoose<O extends object, K extends Key> = ComputeRaw<__Either<O, K>>

  type _Either<
    O extends object,
    K extends Key,
    strict extends Boolean
  > = {
    1: EitherStrict<O, K>
    0: EitherLoose<O, K>
  }[strict]

  type Either<
    O extends object,
    K extends Key,
    strict extends Boolean = 1
  > = O extends unknown ? _Either<O, K, strict> : never

  export type Union = any

  type PatchUndefined<O extends object, O1 extends object> = {
    [K in keyof O]: O[K] extends undefined ? At<O1, K> : O[K]
  } & {}

  /** Helper Types for "Merge" **/
  export type IntersectOf<U extends Union> = (
    U extends unknown ? (k: U) => void : never
  ) extends (k: infer I) => void
    ? I
    : never

  export type Overwrite<O extends object, O1 extends object> = {
      [K in keyof O]: K extends keyof O1 ? O1[K] : O[K];
  } & {};

  type _Merge<U extends object> = IntersectOf<Overwrite<U, {
      [K in keyof U]-?: At<U, K>;
  }>>;

  type Key = string | number | symbol;
  type AtBasic<O extends object, K extends Key> = K extends keyof O ? O[K] : never;
  type AtStrict<O extends object, K extends Key> = O[K & keyof O];
  type AtLoose<O extends object, K extends Key> = O extends unknown ? AtStrict<O, K> : never;
  export type At<O extends object, K extends Key, strict extends Boolean = 1> = {
      1: AtStrict<O, K>;
      0: AtLoose<O, K>;
  }[strict];

  export type ComputeRaw<A extends any> = A extends Function ? A : {
    [K in keyof A]: A[K];
  } & {};

  export type OptionalFlat<O> = {
    [K in keyof O]?: O[K];
  } & {};

  type _Record<K extends keyof any, T> = {
    [P in K]: T;
  };

  type _Strict<U, _U = U> = U extends unknown ? U & OptionalFlat<_Record<Exclude<Keys<_U>, keyof U>, never>> : never;

  export type Strict<U extends object> = ComputeRaw<_Strict<U>>;
  /** End Helper Types for "Merge" **/

  export type Merge<U extends object> = ComputeRaw<_Merge<Strict<U>>>;

  /**
  A [[Boolean]]
  */
  export type Boolean = True | False

  // /**
  // 1
  // */
  export type True = 1

  /**
  0
  */
  export type False = 0

  export type Not<B extends Boolean> = {
    0: 1
    1: 0
  }[B]

  export type Extends<A1 extends any, A2 extends any> = [A1] extends [never]
    ? 0 // anything `never` is false
    : A1 extends A2
    ? 1
    : 0

  export type Has<U extends Union, U1 extends Union> = Not<
    Extends<Exclude<U1, U>, U1>
  >

  export type Or<B1 extends Boolean, B2 extends Boolean> = {
    0: {
      0: 0
      1: 1
    }
    1: {
      0: 1
      1: 1
    }
  }[B1][B2]

  export type Keys<U extends Union> = U extends unknown ? keyof U : never

  type Exact<A, W = unknown> = 
  W extends unknown ? A extends Narrowable ? Cast<A, W> : Cast<
  {[K in keyof A]: K extends keyof W ? Exact<A[K], W[K]> : never},
  {[K in keyof W]: K extends keyof A ? Exact<A[K], W[K]> : W[K]}>
  : never;

  type Narrowable = string | number | boolean | bigint;

  type Cast<A, B> = A extends B ? A : B;

  export const type: unique symbol;

  export function validator<V>(): <S>(select: Exact<S, V>) => S;

  /**
   * Used by group by
   */

  export type GetScalarType<T, O> = O extends object ? {
    [P in keyof T]: P extends keyof O
      ? O[P]
      : never
  } : never

  type FieldPaths<
    T,
    U = Omit<T, '_avg' | '_sum' | '_count' | '_min' | '_max'>
  > = IsObject<T> extends True ? U : T

  type GetHavingFields<T> = {
    [K in keyof T]: Or<
      Or<Extends<'OR', K>, Extends<'AND', K>>,
      Extends<'NOT', K>
    > extends True
      ? // infer is only needed to not hit TS limit
        // based on the brilliant idea of Pierre-Antoine Mills
        // https://github.com/microsoft/TypeScript/issues/30188#issuecomment-478938437
        T[K] extends infer TK
        ? GetHavingFields<UnEnumerate<TK> extends object ? Merge<UnEnumerate<TK>> : never>
        : never
      : {} extends FieldPaths<T[K]>
      ? never
      : K
  }[keyof T]

  /**
   * Convert tuple to union
   */
  type _TupleToUnion<T> = T extends (infer E)[] ? E : never
  type TupleToUnion<K extends readonly any[]> = _TupleToUnion<K>
  type MaybeTupleToUnion<T> = T extends any[] ? TupleToUnion<T> : T

  /**
   * Like `Pick`, but with an array
   */
  type PickArray<T, K extends Array<keyof T>> = Prisma__Pick<T, TupleToUnion<K>>

  /**
   * Exclude all keys with underscores
   */
  type ExcludeUnderscoreKeys<T extends string> = T extends `_${string}` ? never : T

  class PrismaClientFetcher {
    private readonly prisma;
    private readonly debug;
    private readonly hooks?;
    constructor(prisma: PrismaClient<any, any>, debug?: boolean, hooks?: Hooks | undefined);
    request<T>(document: any, dataPath?: string[], rootField?: string, typeName?: string, isList?: boolean, callsite?: string): Promise<T>;
    sanitizeMessage(message: string): string;
    protected unpack(document: any, data: any, path: string[], rootField?: string, isList?: boolean): any;
  }

  export const ModelName: {
    Country: 'Country',
    CashClub: 'CashClub',
    Department: 'Department',
    Employee: 'Employee',
    EmployeeUser: 'EmployeeUser',
    InfoEmployee: 'InfoEmployee',
    Job: 'Job'
  };

  export type ModelName = (typeof ModelName)[keyof typeof ModelName]


  export type Datasources = {
    sqlServer_db?: Datasource
  }

  export type RejectOnNotFound = boolean | ((error: Error) => Error)
  export type RejectPerModel = { [P in ModelName]?: RejectOnNotFound }
  export type RejectPerOperation =  { [P in "findUnique" | "findFirst"]?: RejectPerModel | RejectOnNotFound } 
  type IsReject<T> = T extends true ? True : T extends (err: Error) => Error ? True : False
  export type HasReject<
    GlobalRejectSettings extends Prisma.PrismaClientOptions['rejectOnNotFound'],
    LocalRejectSettings,
    Action extends PrismaAction,
    Model extends ModelName
  > = LocalRejectSettings extends RejectOnNotFound
    ? IsReject<LocalRejectSettings>
    : GlobalRejectSettings extends RejectPerOperation
    ? Action extends keyof GlobalRejectSettings
      ? GlobalRejectSettings[Action] extends RejectOnNotFound
        ? IsReject<GlobalRejectSettings[Action]>
        : GlobalRejectSettings[Action] extends RejectPerModel
        ? Model extends keyof GlobalRejectSettings[Action]
          ? IsReject<GlobalRejectSettings[Action][Model]>
          : False
        : False
      : False
    : IsReject<GlobalRejectSettings>
  export type ErrorFormat = 'pretty' | 'colorless' | 'minimal'

  export interface PrismaClientOptions {
    /**
     * Configure findUnique/findFirst to throw an error if the query returns null. 
     *  * @example
     * ```
     * // Reject on both findUnique/findFirst
     * rejectOnNotFound: true
     * // Reject only on findFirst with a custom error
     * rejectOnNotFound: { findFirst: (err) => new Error("Custom Error")}
     * // Reject on user.findUnique with a custom error
     * rejectOnNotFound: { findUnique: {User: (err) => new Error("User not found")}}
     * ```
     */
    rejectOnNotFound?: RejectOnNotFound | RejectPerOperation
    /**
     * Overwrites the datasource url from your prisma.schema file
     */
    datasources?: Datasources

    /**
     * @default "colorless"
     */
    errorFormat?: ErrorFormat

    /**
     * @example
     * ```
     * // Defaults to stdout
     * log: ['query', 'info', 'warn', 'error']
     * 
     * // Emit as events
     * log: [
     *  { emit: 'stdout', level: 'query' },
     *  { emit: 'stdout', level: 'info' },
     *  { emit: 'stdout', level: 'warn' }
     *  { emit: 'stdout', level: 'error' }
     * ]
     * ```
     * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/logging#the-log-option).
     */
    log?: Array<LogLevel | LogDefinition>
  }

  export type Hooks = {
    beforeRequest?: (options: { query: string, path: string[], rootField?: string, typeName?: string, document: any }) => any
  }

  /* Types for Logging */
  export type LogLevel = 'info' | 'query' | 'warn' | 'error'
  export type LogDefinition = {
    level: LogLevel
    emit: 'stdout' | 'event'
  }

  export type GetLogType<T extends LogLevel | LogDefinition> = T extends LogDefinition ? T['emit'] extends 'event' ? T['level'] : never : never
  export type GetEvents<T extends any> = T extends Array<LogLevel | LogDefinition> ?
    GetLogType<T[0]> | GetLogType<T[1]> | GetLogType<T[2]> | GetLogType<T[3]>
    : never

  export type QueryEvent = {
    timestamp: Date
    query: string
    params: string
    duration: number
    target: string
  }

  export type LogEvent = {
    timestamp: Date
    message: string
    target: string
  }
  /* End Types for Logging */


  export type PrismaAction =
    | 'findUnique'
    | 'findMany'
    | 'findFirst'
    | 'create'
    | 'createMany'
    | 'update'
    | 'updateMany'
    | 'upsert'
    | 'delete'
    | 'deleteMany'
    | 'executeRaw'
    | 'queryRaw'
    | 'aggregate'
    | 'count'
    | 'runCommandRaw'
    | 'findRaw'

  /**
   * These options are being passed in to the middleware as "params"
   */
  export type MiddlewareParams = {
    model?: ModelName
    action: PrismaAction
    args: any
    dataPath: string[]
    runInTransaction: boolean
  }

  /**
   * The `T` type makes sure, that the `return proceed` is not forgotten in the middleware implementation
   */
  export type Middleware<T = any> = (
    params: MiddlewareParams,
    next: (params: MiddlewareParams) => Promise<T>,
  ) => Promise<T>

  // tested in getLogLevel.test.ts
  export function getLogLevel(log: Array<LogLevel | LogDefinition>): LogLevel | undefined;

  export type Datasource = {
    url?: string
  }

  /**
   * Count Types
   */


  /**
   * Count Type CountryCountOutputType
   */


  export type CountryCountOutputType = {
    InfoEmployee: number
  }

  export type CountryCountOutputTypeSelect = {
    InfoEmployee?: boolean
  }

  export type CountryCountOutputTypeGetPayload<
    S extends boolean | null | undefined | CountryCountOutputTypeArgs,
    U = keyof S
      > = S extends true
        ? CountryCountOutputType
    : S extends undefined
    ? never
    : S extends CountryCountOutputTypeArgs
    ?'include' extends U
    ? CountryCountOutputType 
    : 'select' extends U
    ? {
    [P in TrueKeys<S['select']>]:
    P extends keyof CountryCountOutputType ? CountryCountOutputType[P] : never
  } 
    : CountryCountOutputType
  : CountryCountOutputType




  // Custom InputTypes

  /**
   * CountryCountOutputType without action
   */
  export type CountryCountOutputTypeArgs = {
    /**
     * Select specific fields to fetch from the CountryCountOutputType
     * 
    **/
    select?: CountryCountOutputTypeSelect | null
  }



  /**
   * Count Type CashClubCountOutputType
   */


  export type CashClubCountOutputType = {
    Employee: number
  }

  export type CashClubCountOutputTypeSelect = {
    Employee?: boolean
  }

  export type CashClubCountOutputTypeGetPayload<
    S extends boolean | null | undefined | CashClubCountOutputTypeArgs,
    U = keyof S
      > = S extends true
        ? CashClubCountOutputType
    : S extends undefined
    ? never
    : S extends CashClubCountOutputTypeArgs
    ?'include' extends U
    ? CashClubCountOutputType 
    : 'select' extends U
    ? {
    [P in TrueKeys<S['select']>]:
    P extends keyof CashClubCountOutputType ? CashClubCountOutputType[P] : never
  } 
    : CashClubCountOutputType
  : CashClubCountOutputType




  // Custom InputTypes

  /**
   * CashClubCountOutputType without action
   */
  export type CashClubCountOutputTypeArgs = {
    /**
     * Select specific fields to fetch from the CashClubCountOutputType
     * 
    **/
    select?: CashClubCountOutputTypeSelect | null
  }



  /**
   * Count Type DepartmentCountOutputType
   */


  export type DepartmentCountOutputType = {
    Job: number
  }

  export type DepartmentCountOutputTypeSelect = {
    Job?: boolean
  }

  export type DepartmentCountOutputTypeGetPayload<
    S extends boolean | null | undefined | DepartmentCountOutputTypeArgs,
    U = keyof S
      > = S extends true
        ? DepartmentCountOutputType
    : S extends undefined
    ? never
    : S extends DepartmentCountOutputTypeArgs
    ?'include' extends U
    ? DepartmentCountOutputType 
    : 'select' extends U
    ? {
    [P in TrueKeys<S['select']>]:
    P extends keyof DepartmentCountOutputType ? DepartmentCountOutputType[P] : never
  } 
    : DepartmentCountOutputType
  : DepartmentCountOutputType




  // Custom InputTypes

  /**
   * DepartmentCountOutputType without action
   */
  export type DepartmentCountOutputTypeArgs = {
    /**
     * Select specific fields to fetch from the DepartmentCountOutputType
     * 
    **/
    select?: DepartmentCountOutputTypeSelect | null
  }



  /**
   * Count Type EmployeeUserCountOutputType
   */


  export type EmployeeUserCountOutputType = {
    Employee: number
  }

  export type EmployeeUserCountOutputTypeSelect = {
    Employee?: boolean
  }

  export type EmployeeUserCountOutputTypeGetPayload<
    S extends boolean | null | undefined | EmployeeUserCountOutputTypeArgs,
    U = keyof S
      > = S extends true
        ? EmployeeUserCountOutputType
    : S extends undefined
    ? never
    : S extends EmployeeUserCountOutputTypeArgs
    ?'include' extends U
    ? EmployeeUserCountOutputType 
    : 'select' extends U
    ? {
    [P in TrueKeys<S['select']>]:
    P extends keyof EmployeeUserCountOutputType ? EmployeeUserCountOutputType[P] : never
  } 
    : EmployeeUserCountOutputType
  : EmployeeUserCountOutputType




  // Custom InputTypes

  /**
   * EmployeeUserCountOutputType without action
   */
  export type EmployeeUserCountOutputTypeArgs = {
    /**
     * Select specific fields to fetch from the EmployeeUserCountOutputType
     * 
    **/
    select?: EmployeeUserCountOutputTypeSelect | null
  }



  /**
   * Count Type InfoEmployeeCountOutputType
   */


  export type InfoEmployeeCountOutputType = {
    Employee: number
  }

  export type InfoEmployeeCountOutputTypeSelect = {
    Employee?: boolean
  }

  export type InfoEmployeeCountOutputTypeGetPayload<
    S extends boolean | null | undefined | InfoEmployeeCountOutputTypeArgs,
    U = keyof S
      > = S extends true
        ? InfoEmployeeCountOutputType
    : S extends undefined
    ? never
    : S extends InfoEmployeeCountOutputTypeArgs
    ?'include' extends U
    ? InfoEmployeeCountOutputType 
    : 'select' extends U
    ? {
    [P in TrueKeys<S['select']>]:
    P extends keyof InfoEmployeeCountOutputType ? InfoEmployeeCountOutputType[P] : never
  } 
    : InfoEmployeeCountOutputType
  : InfoEmployeeCountOutputType




  // Custom InputTypes

  /**
   * InfoEmployeeCountOutputType without action
   */
  export type InfoEmployeeCountOutputTypeArgs = {
    /**
     * Select specific fields to fetch from the InfoEmployeeCountOutputType
     * 
    **/
    select?: InfoEmployeeCountOutputTypeSelect | null
  }



  /**
   * Count Type JobCountOutputType
   */


  export type JobCountOutputType = {
    Employee: number
  }

  export type JobCountOutputTypeSelect = {
    Employee?: boolean
  }

  export type JobCountOutputTypeGetPayload<
    S extends boolean | null | undefined | JobCountOutputTypeArgs,
    U = keyof S
      > = S extends true
        ? JobCountOutputType
    : S extends undefined
    ? never
    : S extends JobCountOutputTypeArgs
    ?'include' extends U
    ? JobCountOutputType 
    : 'select' extends U
    ? {
    [P in TrueKeys<S['select']>]:
    P extends keyof JobCountOutputType ? JobCountOutputType[P] : never
  } 
    : JobCountOutputType
  : JobCountOutputType




  // Custom InputTypes

  /**
   * JobCountOutputType without action
   */
  export type JobCountOutputTypeArgs = {
    /**
     * Select specific fields to fetch from the JobCountOutputType
     * 
    **/
    select?: JobCountOutputTypeSelect | null
  }



  /**
   * Models
   */

  /**
   * Model Country
   */


  export type AggregateCountry = {
    _count: CountryCountAggregateOutputType | null
    _avg: CountryAvgAggregateOutputType | null
    _sum: CountrySumAggregateOutputType | null
    _min: CountryMinAggregateOutputType | null
    _max: CountryMaxAggregateOutputType | null
  }

  export type CountryAvgAggregateOutputType = {
    idCountry: number | null
  }

  export type CountrySumAggregateOutputType = {
    idCountry: number | null
  }

  export type CountryMinAggregateOutputType = {
    idCountry: number | null
    countryName: string | null
  }

  export type CountryMaxAggregateOutputType = {
    idCountry: number | null
    countryName: string | null
  }

  export type CountryCountAggregateOutputType = {
    idCountry: number
    countryName: number
    _all: number
  }


  export type CountryAvgAggregateInputType = {
    idCountry?: true
  }

  export type CountrySumAggregateInputType = {
    idCountry?: true
  }

  export type CountryMinAggregateInputType = {
    idCountry?: true
    countryName?: true
  }

  export type CountryMaxAggregateInputType = {
    idCountry?: true
    countryName?: true
  }

  export type CountryCountAggregateInputType = {
    idCountry?: true
    countryName?: true
    _all?: true
  }

  export type CountryAggregateArgs = {
    /**
     * Filter which Country to aggregate.
     * 
    **/
    where?: CountryWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Countries to fetch.
     * 
    **/
    orderBy?: Enumerable<CountryOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     * 
    **/
    cursor?: CountryWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Countries from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Countries.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned Countries
    **/
    _count?: true | CountryCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: CountryAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: CountrySumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: CountryMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: CountryMaxAggregateInputType
  }

  export type GetCountryAggregateType<T extends CountryAggregateArgs> = {
        [P in keyof T & keyof AggregateCountry]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateCountry[P]>
      : GetScalarType<T[P], AggregateCountry[P]>
  }




  export type CountryGroupByArgs = {
    where?: CountryWhereInput
    orderBy?: Enumerable<CountryOrderByWithAggregationInput>
    by: Array<CountryScalarFieldEnum>
    having?: CountryScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: CountryCountAggregateInputType | true
    _avg?: CountryAvgAggregateInputType
    _sum?: CountrySumAggregateInputType
    _min?: CountryMinAggregateInputType
    _max?: CountryMaxAggregateInputType
  }


  export type CountryGroupByOutputType = {
    idCountry: number
    countryName: string
    _count: CountryCountAggregateOutputType | null
    _avg: CountryAvgAggregateOutputType | null
    _sum: CountrySumAggregateOutputType | null
    _min: CountryMinAggregateOutputType | null
    _max: CountryMaxAggregateOutputType | null
  }

  type GetCountryGroupByPayload<T extends CountryGroupByArgs> = PrismaPromise<
    Array<
      PickArray<CountryGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof CountryGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], CountryGroupByOutputType[P]>
            : GetScalarType<T[P], CountryGroupByOutputType[P]>
        }
      >
    >


  export type CountrySelect = {
    idCountry?: boolean
    countryName?: boolean
    InfoEmployee?: boolean | InfoEmployeeFindManyArgs
    _count?: boolean | CountryCountOutputTypeArgs
  }

  export type CountryInclude = {
    InfoEmployee?: boolean | InfoEmployeeFindManyArgs
    _count?: boolean | CountryCountOutputTypeArgs
  }

  export type CountryGetPayload<
    S extends boolean | null | undefined | CountryArgs,
    U = keyof S
      > = S extends true
        ? Country
    : S extends undefined
    ? never
    : S extends CountryArgs | CountryFindManyArgs
    ?'include' extends U
    ? Country  & {
    [P in TrueKeys<S['include']>]:
        P extends 'InfoEmployee' ? Array < InfoEmployeeGetPayload<S['include'][P]>>  :
        P extends '_count' ? CountryCountOutputTypeGetPayload<S['include'][P]> :  never
  } 
    : 'select' extends U
    ? {
    [P in TrueKeys<S['select']>]:
        P extends 'InfoEmployee' ? Array < InfoEmployeeGetPayload<S['select'][P]>>  :
        P extends '_count' ? CountryCountOutputTypeGetPayload<S['select'][P]> :  P extends keyof Country ? Country[P] : never
  } 
    : Country
  : Country


  type CountryCountArgs = Merge<
    Omit<CountryFindManyArgs, 'select' | 'include'> & {
      select?: CountryCountAggregateInputType | true
    }
  >

  export interface CountryDelegate<GlobalRejectSettings> {
    /**
     * Find zero or one Country that matches the filter.
     * @param {CountryFindUniqueArgs} args - Arguments to find a Country
     * @example
     * // Get one Country
     * const country = await prisma.country.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findUnique<T extends CountryFindUniqueArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args: SelectSubset<T, CountryFindUniqueArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findUnique', 'Country'> extends True ? CheckSelect<T, Prisma__CountryClient<Country>, Prisma__CountryClient<CountryGetPayload<T>>> : CheckSelect<T, Prisma__CountryClient<Country | null >, Prisma__CountryClient<CountryGetPayload<T> | null >>

    /**
     * Find the first Country that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CountryFindFirstArgs} args - Arguments to find a Country
     * @example
     * // Get one Country
     * const country = await prisma.country.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findFirst<T extends CountryFindFirstArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args?: SelectSubset<T, CountryFindFirstArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findFirst', 'Country'> extends True ? CheckSelect<T, Prisma__CountryClient<Country>, Prisma__CountryClient<CountryGetPayload<T>>> : CheckSelect<T, Prisma__CountryClient<Country | null >, Prisma__CountryClient<CountryGetPayload<T> | null >>

    /**
     * Find zero or more Countries that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CountryFindManyArgs=} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all Countries
     * const countries = await prisma.country.findMany()
     * 
     * // Get first 10 Countries
     * const countries = await prisma.country.findMany({ take: 10 })
     * 
     * // Only select the `idCountry`
     * const countryWithIdCountryOnly = await prisma.country.findMany({ select: { idCountry: true } })
     * 
    **/
    findMany<T extends CountryFindManyArgs>(
      args?: SelectSubset<T, CountryFindManyArgs>
    ): CheckSelect<T, PrismaPromise<Array<Country>>, PrismaPromise<Array<CountryGetPayload<T>>>>

    /**
     * Create a Country.
     * @param {CountryCreateArgs} args - Arguments to create a Country.
     * @example
     * // Create one Country
     * const Country = await prisma.country.create({
     *   data: {
     *     // ... data to create a Country
     *   }
     * })
     * 
    **/
    create<T extends CountryCreateArgs>(
      args: SelectSubset<T, CountryCreateArgs>
    ): CheckSelect<T, Prisma__CountryClient<Country>, Prisma__CountryClient<CountryGetPayload<T>>>

    /**
     * Create many Countries.
     *     @param {CountryCreateManyArgs} args - Arguments to create many Countries.
     *     @example
     *     // Create many Countries
     *     const country = await prisma.country.createMany({
     *       data: {
     *         // ... provide data here
     *       }
     *     })
     *     
    **/
    createMany<T extends CountryCreateManyArgs>(
      args?: SelectSubset<T, CountryCreateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Delete a Country.
     * @param {CountryDeleteArgs} args - Arguments to delete one Country.
     * @example
     * // Delete one Country
     * const Country = await prisma.country.delete({
     *   where: {
     *     // ... filter to delete one Country
     *   }
     * })
     * 
    **/
    delete<T extends CountryDeleteArgs>(
      args: SelectSubset<T, CountryDeleteArgs>
    ): CheckSelect<T, Prisma__CountryClient<Country>, Prisma__CountryClient<CountryGetPayload<T>>>

    /**
     * Update one Country.
     * @param {CountryUpdateArgs} args - Arguments to update one Country.
     * @example
     * // Update one Country
     * const country = await prisma.country.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    update<T extends CountryUpdateArgs>(
      args: SelectSubset<T, CountryUpdateArgs>
    ): CheckSelect<T, Prisma__CountryClient<Country>, Prisma__CountryClient<CountryGetPayload<T>>>

    /**
     * Delete zero or more Countries.
     * @param {CountryDeleteManyArgs} args - Arguments to filter Countries to delete.
     * @example
     * // Delete a few Countries
     * const { count } = await prisma.country.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
    **/
    deleteMany<T extends CountryDeleteManyArgs>(
      args?: SelectSubset<T, CountryDeleteManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Update zero or more Countries.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CountryUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many Countries
     * const country = await prisma.country.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    updateMany<T extends CountryUpdateManyArgs>(
      args: SelectSubset<T, CountryUpdateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Create or update one Country.
     * @param {CountryUpsertArgs} args - Arguments to update or create a Country.
     * @example
     * // Update or create a Country
     * const country = await prisma.country.upsert({
     *   create: {
     *     // ... data to create a Country
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the Country we want to update
     *   }
     * })
    **/
    upsert<T extends CountryUpsertArgs>(
      args: SelectSubset<T, CountryUpsertArgs>
    ): CheckSelect<T, Prisma__CountryClient<Country>, Prisma__CountryClient<CountryGetPayload<T>>>

    /**
     * Count the number of Countries.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CountryCountArgs} args - Arguments to filter Countries to count.
     * @example
     * // Count the number of Countries
     * const count = await prisma.country.count({
     *   where: {
     *     // ... the filter for the Countries we want to count
     *   }
     * })
    **/
    count<T extends CountryCountArgs>(
      args?: Subset<T, CountryCountArgs>,
    ): PrismaPromise<
      T extends _Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], CountryCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a Country.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CountryAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends CountryAggregateArgs>(args: Subset<T, CountryAggregateArgs>): PrismaPromise<GetCountryAggregateType<T>>

    /**
     * Group by Country.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CountryGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends CountryGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: CountryGroupByArgs['orderBy'] }
        : { orderBy?: CountryGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends TupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, CountryGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetCountryGroupByPayload<T> : PrismaPromise<InputErrors>
  }

  /**
   * The delegate class that acts as a "Promise-like" for Country.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export class Prisma__CountryClient<T> implements PrismaPromise<T> {
    [prisma]: true;
    private readonly _dmmf;
    private readonly _fetcher;
    private readonly _queryType;
    private readonly _rootField;
    private readonly _clientMethod;
    private readonly _args;
    private readonly _dataPath;
    private readonly _errorFormat;
    private readonly _measurePerformance?;
    private _isList;
    private _callsite;
    private _requestPromise?;
    constructor(_dmmf: runtime.DMMFClass, _fetcher: PrismaClientFetcher, _queryType: 'query' | 'mutation', _rootField: string, _clientMethod: string, _args: any, _dataPath: string[], _errorFormat: ErrorFormat, _measurePerformance?: boolean | undefined, _isList?: boolean);
    readonly [Symbol.toStringTag]: 'PrismaClientPromise';

    InfoEmployee<T extends InfoEmployeeFindManyArgs = {}>(args?: Subset<T, InfoEmployeeFindManyArgs>): CheckSelect<T, PrismaPromise<Array<InfoEmployee>>, PrismaPromise<Array<InfoEmployeeGetPayload<T>>>>;

    private get _document();
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): Promise<TResult1 | TResult2>;
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): Promise<T | TResult>;
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): Promise<T>;
  }

  // Custom InputTypes

  /**
   * Country findUnique
   */
  export type CountryFindUniqueArgs = {
    /**
     * Select specific fields to fetch from the Country
     * 
    **/
    select?: CountrySelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CountryInclude | null
    /**
     * Throw an Error if a Country can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which Country to fetch.
     * 
    **/
    where: CountryWhereUniqueInput
  }


  /**
   * Country findFirst
   */
  export type CountryFindFirstArgs = {
    /**
     * Select specific fields to fetch from the Country
     * 
    **/
    select?: CountrySelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CountryInclude | null
    /**
     * Throw an Error if a Country can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which Country to fetch.
     * 
    **/
    where?: CountryWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Countries to fetch.
     * 
    **/
    orderBy?: Enumerable<CountryOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for Countries.
     * 
    **/
    cursor?: CountryWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Countries from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Countries.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of Countries.
     * 
    **/
    distinct?: Enumerable<CountryScalarFieldEnum>
  }


  /**
   * Country findMany
   */
  export type CountryFindManyArgs = {
    /**
     * Select specific fields to fetch from the Country
     * 
    **/
    select?: CountrySelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CountryInclude | null
    /**
     * Filter, which Countries to fetch.
     * 
    **/
    where?: CountryWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Countries to fetch.
     * 
    **/
    orderBy?: Enumerable<CountryOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing Countries.
     * 
    **/
    cursor?: CountryWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Countries from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Countries.
     * 
    **/
    skip?: number
    distinct?: Enumerable<CountryScalarFieldEnum>
  }


  /**
   * Country create
   */
  export type CountryCreateArgs = {
    /**
     * Select specific fields to fetch from the Country
     * 
    **/
    select?: CountrySelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CountryInclude | null
    /**
     * The data needed to create a Country.
     * 
    **/
    data: XOR<CountryCreateInput, CountryUncheckedCreateInput>
  }


  /**
   * Country createMany
   */
  export type CountryCreateManyArgs = {
    /**
     * The data used to create many Countries.
     * 
    **/
    data: Enumerable<CountryCreateManyInput>
  }


  /**
   * Country update
   */
  export type CountryUpdateArgs = {
    /**
     * Select specific fields to fetch from the Country
     * 
    **/
    select?: CountrySelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CountryInclude | null
    /**
     * The data needed to update a Country.
     * 
    **/
    data: XOR<CountryUpdateInput, CountryUncheckedUpdateInput>
    /**
     * Choose, which Country to update.
     * 
    **/
    where: CountryWhereUniqueInput
  }


  /**
   * Country updateMany
   */
  export type CountryUpdateManyArgs = {
    /**
     * The data used to update Countries.
     * 
    **/
    data: XOR<CountryUpdateManyMutationInput, CountryUncheckedUpdateManyInput>
    /**
     * Filter which Countries to update
     * 
    **/
    where?: CountryWhereInput
  }


  /**
   * Country upsert
   */
  export type CountryUpsertArgs = {
    /**
     * Select specific fields to fetch from the Country
     * 
    **/
    select?: CountrySelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CountryInclude | null
    /**
     * The filter to search for the Country to update in case it exists.
     * 
    **/
    where: CountryWhereUniqueInput
    /**
     * In case the Country found by the `where` argument doesn't exist, create a new Country with this data.
     * 
    **/
    create: XOR<CountryCreateInput, CountryUncheckedCreateInput>
    /**
     * In case the Country was found with the provided `where` argument, update it with this data.
     * 
    **/
    update: XOR<CountryUpdateInput, CountryUncheckedUpdateInput>
  }


  /**
   * Country delete
   */
  export type CountryDeleteArgs = {
    /**
     * Select specific fields to fetch from the Country
     * 
    **/
    select?: CountrySelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CountryInclude | null
    /**
     * Filter which Country to delete.
     * 
    **/
    where: CountryWhereUniqueInput
  }


  /**
   * Country deleteMany
   */
  export type CountryDeleteManyArgs = {
    /**
     * Filter which Countries to delete
     * 
    **/
    where?: CountryWhereInput
  }


  /**
   * Country without action
   */
  export type CountryArgs = {
    /**
     * Select specific fields to fetch from the Country
     * 
    **/
    select?: CountrySelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CountryInclude | null
  }



  /**
   * Model CashClub
   */


  export type AggregateCashClub = {
    _count: CashClubCountAggregateOutputType | null
    _avg: CashClubAvgAggregateOutputType | null
    _sum: CashClubSumAggregateOutputType | null
    _min: CashClubMinAggregateOutputType | null
    _max: CashClubMaxAggregateOutputType | null
  }

  export type CashClubAvgAggregateOutputType = {
    idCashClub: number | null
    idClub: number | null
  }

  export type CashClubSumAggregateOutputType = {
    idCashClub: number | null
    idClub: number | null
  }

  export type CashClubMinAggregateOutputType = {
    idCashClub: number | null
    cashType: string | null
    idClub: number | null
  }

  export type CashClubMaxAggregateOutputType = {
    idCashClub: number | null
    cashType: string | null
    idClub: number | null
  }

  export type CashClubCountAggregateOutputType = {
    idCashClub: number
    cashType: number
    idClub: number
    _all: number
  }


  export type CashClubAvgAggregateInputType = {
    idCashClub?: true
    idClub?: true
  }

  export type CashClubSumAggregateInputType = {
    idCashClub?: true
    idClub?: true
  }

  export type CashClubMinAggregateInputType = {
    idCashClub?: true
    cashType?: true
    idClub?: true
  }

  export type CashClubMaxAggregateInputType = {
    idCashClub?: true
    cashType?: true
    idClub?: true
  }

  export type CashClubCountAggregateInputType = {
    idCashClub?: true
    cashType?: true
    idClub?: true
    _all?: true
  }

  export type CashClubAggregateArgs = {
    /**
     * Filter which CashClub to aggregate.
     * 
    **/
    where?: CashClubWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of CashClubs to fetch.
     * 
    **/
    orderBy?: Enumerable<CashClubOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     * 
    **/
    cursor?: CashClubWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` CashClubs from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` CashClubs.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned CashClubs
    **/
    _count?: true | CashClubCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: CashClubAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: CashClubSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: CashClubMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: CashClubMaxAggregateInputType
  }

  export type GetCashClubAggregateType<T extends CashClubAggregateArgs> = {
        [P in keyof T & keyof AggregateCashClub]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateCashClub[P]>
      : GetScalarType<T[P], AggregateCashClub[P]>
  }




  export type CashClubGroupByArgs = {
    where?: CashClubWhereInput
    orderBy?: Enumerable<CashClubOrderByWithAggregationInput>
    by: Array<CashClubScalarFieldEnum>
    having?: CashClubScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: CashClubCountAggregateInputType | true
    _avg?: CashClubAvgAggregateInputType
    _sum?: CashClubSumAggregateInputType
    _min?: CashClubMinAggregateInputType
    _max?: CashClubMaxAggregateInputType
  }


  export type CashClubGroupByOutputType = {
    idCashClub: number
    cashType: string
    idClub: number
    _count: CashClubCountAggregateOutputType | null
    _avg: CashClubAvgAggregateOutputType | null
    _sum: CashClubSumAggregateOutputType | null
    _min: CashClubMinAggregateOutputType | null
    _max: CashClubMaxAggregateOutputType | null
  }

  type GetCashClubGroupByPayload<T extends CashClubGroupByArgs> = PrismaPromise<
    Array<
      PickArray<CashClubGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof CashClubGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], CashClubGroupByOutputType[P]>
            : GetScalarType<T[P], CashClubGroupByOutputType[P]>
        }
      >
    >


  export type CashClubSelect = {
    idCashClub?: boolean
    cashType?: boolean
    idClub?: boolean
    Employee?: boolean | EmployeeFindManyArgs
    _count?: boolean | CashClubCountOutputTypeArgs
  }

  export type CashClubInclude = {
    Employee?: boolean | EmployeeFindManyArgs
    _count?: boolean | CashClubCountOutputTypeArgs
  }

  export type CashClubGetPayload<
    S extends boolean | null | undefined | CashClubArgs,
    U = keyof S
      > = S extends true
        ? CashClub
    : S extends undefined
    ? never
    : S extends CashClubArgs | CashClubFindManyArgs
    ?'include' extends U
    ? CashClub  & {
    [P in TrueKeys<S['include']>]:
        P extends 'Employee' ? Array < EmployeeGetPayload<S['include'][P]>>  :
        P extends '_count' ? CashClubCountOutputTypeGetPayload<S['include'][P]> :  never
  } 
    : 'select' extends U
    ? {
    [P in TrueKeys<S['select']>]:
        P extends 'Employee' ? Array < EmployeeGetPayload<S['select'][P]>>  :
        P extends '_count' ? CashClubCountOutputTypeGetPayload<S['select'][P]> :  P extends keyof CashClub ? CashClub[P] : never
  } 
    : CashClub
  : CashClub


  type CashClubCountArgs = Merge<
    Omit<CashClubFindManyArgs, 'select' | 'include'> & {
      select?: CashClubCountAggregateInputType | true
    }
  >

  export interface CashClubDelegate<GlobalRejectSettings> {
    /**
     * Find zero or one CashClub that matches the filter.
     * @param {CashClubFindUniqueArgs} args - Arguments to find a CashClub
     * @example
     * // Get one CashClub
     * const cashClub = await prisma.cashClub.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findUnique<T extends CashClubFindUniqueArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args: SelectSubset<T, CashClubFindUniqueArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findUnique', 'CashClub'> extends True ? CheckSelect<T, Prisma__CashClubClient<CashClub>, Prisma__CashClubClient<CashClubGetPayload<T>>> : CheckSelect<T, Prisma__CashClubClient<CashClub | null >, Prisma__CashClubClient<CashClubGetPayload<T> | null >>

    /**
     * Find the first CashClub that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CashClubFindFirstArgs} args - Arguments to find a CashClub
     * @example
     * // Get one CashClub
     * const cashClub = await prisma.cashClub.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findFirst<T extends CashClubFindFirstArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args?: SelectSubset<T, CashClubFindFirstArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findFirst', 'CashClub'> extends True ? CheckSelect<T, Prisma__CashClubClient<CashClub>, Prisma__CashClubClient<CashClubGetPayload<T>>> : CheckSelect<T, Prisma__CashClubClient<CashClub | null >, Prisma__CashClubClient<CashClubGetPayload<T> | null >>

    /**
     * Find zero or more CashClubs that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CashClubFindManyArgs=} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all CashClubs
     * const cashClubs = await prisma.cashClub.findMany()
     * 
     * // Get first 10 CashClubs
     * const cashClubs = await prisma.cashClub.findMany({ take: 10 })
     * 
     * // Only select the `idCashClub`
     * const cashClubWithIdCashClubOnly = await prisma.cashClub.findMany({ select: { idCashClub: true } })
     * 
    **/
    findMany<T extends CashClubFindManyArgs>(
      args?: SelectSubset<T, CashClubFindManyArgs>
    ): CheckSelect<T, PrismaPromise<Array<CashClub>>, PrismaPromise<Array<CashClubGetPayload<T>>>>

    /**
     * Create a CashClub.
     * @param {CashClubCreateArgs} args - Arguments to create a CashClub.
     * @example
     * // Create one CashClub
     * const CashClub = await prisma.cashClub.create({
     *   data: {
     *     // ... data to create a CashClub
     *   }
     * })
     * 
    **/
    create<T extends CashClubCreateArgs>(
      args: SelectSubset<T, CashClubCreateArgs>
    ): CheckSelect<T, Prisma__CashClubClient<CashClub>, Prisma__CashClubClient<CashClubGetPayload<T>>>

    /**
     * Create many CashClubs.
     *     @param {CashClubCreateManyArgs} args - Arguments to create many CashClubs.
     *     @example
     *     // Create many CashClubs
     *     const cashClub = await prisma.cashClub.createMany({
     *       data: {
     *         // ... provide data here
     *       }
     *     })
     *     
    **/
    createMany<T extends CashClubCreateManyArgs>(
      args?: SelectSubset<T, CashClubCreateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Delete a CashClub.
     * @param {CashClubDeleteArgs} args - Arguments to delete one CashClub.
     * @example
     * // Delete one CashClub
     * const CashClub = await prisma.cashClub.delete({
     *   where: {
     *     // ... filter to delete one CashClub
     *   }
     * })
     * 
    **/
    delete<T extends CashClubDeleteArgs>(
      args: SelectSubset<T, CashClubDeleteArgs>
    ): CheckSelect<T, Prisma__CashClubClient<CashClub>, Prisma__CashClubClient<CashClubGetPayload<T>>>

    /**
     * Update one CashClub.
     * @param {CashClubUpdateArgs} args - Arguments to update one CashClub.
     * @example
     * // Update one CashClub
     * const cashClub = await prisma.cashClub.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    update<T extends CashClubUpdateArgs>(
      args: SelectSubset<T, CashClubUpdateArgs>
    ): CheckSelect<T, Prisma__CashClubClient<CashClub>, Prisma__CashClubClient<CashClubGetPayload<T>>>

    /**
     * Delete zero or more CashClubs.
     * @param {CashClubDeleteManyArgs} args - Arguments to filter CashClubs to delete.
     * @example
     * // Delete a few CashClubs
     * const { count } = await prisma.cashClub.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
    **/
    deleteMany<T extends CashClubDeleteManyArgs>(
      args?: SelectSubset<T, CashClubDeleteManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Update zero or more CashClubs.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CashClubUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many CashClubs
     * const cashClub = await prisma.cashClub.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    updateMany<T extends CashClubUpdateManyArgs>(
      args: SelectSubset<T, CashClubUpdateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Create or update one CashClub.
     * @param {CashClubUpsertArgs} args - Arguments to update or create a CashClub.
     * @example
     * // Update or create a CashClub
     * const cashClub = await prisma.cashClub.upsert({
     *   create: {
     *     // ... data to create a CashClub
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the CashClub we want to update
     *   }
     * })
    **/
    upsert<T extends CashClubUpsertArgs>(
      args: SelectSubset<T, CashClubUpsertArgs>
    ): CheckSelect<T, Prisma__CashClubClient<CashClub>, Prisma__CashClubClient<CashClubGetPayload<T>>>

    /**
     * Count the number of CashClubs.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CashClubCountArgs} args - Arguments to filter CashClubs to count.
     * @example
     * // Count the number of CashClubs
     * const count = await prisma.cashClub.count({
     *   where: {
     *     // ... the filter for the CashClubs we want to count
     *   }
     * })
    **/
    count<T extends CashClubCountArgs>(
      args?: Subset<T, CashClubCountArgs>,
    ): PrismaPromise<
      T extends _Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], CashClubCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a CashClub.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CashClubAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends CashClubAggregateArgs>(args: Subset<T, CashClubAggregateArgs>): PrismaPromise<GetCashClubAggregateType<T>>

    /**
     * Group by CashClub.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CashClubGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends CashClubGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: CashClubGroupByArgs['orderBy'] }
        : { orderBy?: CashClubGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends TupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, CashClubGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetCashClubGroupByPayload<T> : PrismaPromise<InputErrors>
  }

  /**
   * The delegate class that acts as a "Promise-like" for CashClub.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export class Prisma__CashClubClient<T> implements PrismaPromise<T> {
    [prisma]: true;
    private readonly _dmmf;
    private readonly _fetcher;
    private readonly _queryType;
    private readonly _rootField;
    private readonly _clientMethod;
    private readonly _args;
    private readonly _dataPath;
    private readonly _errorFormat;
    private readonly _measurePerformance?;
    private _isList;
    private _callsite;
    private _requestPromise?;
    constructor(_dmmf: runtime.DMMFClass, _fetcher: PrismaClientFetcher, _queryType: 'query' | 'mutation', _rootField: string, _clientMethod: string, _args: any, _dataPath: string[], _errorFormat: ErrorFormat, _measurePerformance?: boolean | undefined, _isList?: boolean);
    readonly [Symbol.toStringTag]: 'PrismaClientPromise';

    Employee<T extends EmployeeFindManyArgs = {}>(args?: Subset<T, EmployeeFindManyArgs>): CheckSelect<T, PrismaPromise<Array<Employee>>, PrismaPromise<Array<EmployeeGetPayload<T>>>>;

    private get _document();
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): Promise<TResult1 | TResult2>;
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): Promise<T | TResult>;
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): Promise<T>;
  }

  // Custom InputTypes

  /**
   * CashClub findUnique
   */
  export type CashClubFindUniqueArgs = {
    /**
     * Select specific fields to fetch from the CashClub
     * 
    **/
    select?: CashClubSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CashClubInclude | null
    /**
     * Throw an Error if a CashClub can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which CashClub to fetch.
     * 
    **/
    where: CashClubWhereUniqueInput
  }


  /**
   * CashClub findFirst
   */
  export type CashClubFindFirstArgs = {
    /**
     * Select specific fields to fetch from the CashClub
     * 
    **/
    select?: CashClubSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CashClubInclude | null
    /**
     * Throw an Error if a CashClub can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which CashClub to fetch.
     * 
    **/
    where?: CashClubWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of CashClubs to fetch.
     * 
    **/
    orderBy?: Enumerable<CashClubOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for CashClubs.
     * 
    **/
    cursor?: CashClubWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` CashClubs from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` CashClubs.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of CashClubs.
     * 
    **/
    distinct?: Enumerable<CashClubScalarFieldEnum>
  }


  /**
   * CashClub findMany
   */
  export type CashClubFindManyArgs = {
    /**
     * Select specific fields to fetch from the CashClub
     * 
    **/
    select?: CashClubSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CashClubInclude | null
    /**
     * Filter, which CashClubs to fetch.
     * 
    **/
    where?: CashClubWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of CashClubs to fetch.
     * 
    **/
    orderBy?: Enumerable<CashClubOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing CashClubs.
     * 
    **/
    cursor?: CashClubWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` CashClubs from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` CashClubs.
     * 
    **/
    skip?: number
    distinct?: Enumerable<CashClubScalarFieldEnum>
  }


  /**
   * CashClub create
   */
  export type CashClubCreateArgs = {
    /**
     * Select specific fields to fetch from the CashClub
     * 
    **/
    select?: CashClubSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CashClubInclude | null
    /**
     * The data needed to create a CashClub.
     * 
    **/
    data: XOR<CashClubCreateInput, CashClubUncheckedCreateInput>
  }


  /**
   * CashClub createMany
   */
  export type CashClubCreateManyArgs = {
    /**
     * The data used to create many CashClubs.
     * 
    **/
    data: Enumerable<CashClubCreateManyInput>
  }


  /**
   * CashClub update
   */
  export type CashClubUpdateArgs = {
    /**
     * Select specific fields to fetch from the CashClub
     * 
    **/
    select?: CashClubSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CashClubInclude | null
    /**
     * The data needed to update a CashClub.
     * 
    **/
    data: XOR<CashClubUpdateInput, CashClubUncheckedUpdateInput>
    /**
     * Choose, which CashClub to update.
     * 
    **/
    where: CashClubWhereUniqueInput
  }


  /**
   * CashClub updateMany
   */
  export type CashClubUpdateManyArgs = {
    /**
     * The data used to update CashClubs.
     * 
    **/
    data: XOR<CashClubUpdateManyMutationInput, CashClubUncheckedUpdateManyInput>
    /**
     * Filter which CashClubs to update
     * 
    **/
    where?: CashClubWhereInput
  }


  /**
   * CashClub upsert
   */
  export type CashClubUpsertArgs = {
    /**
     * Select specific fields to fetch from the CashClub
     * 
    **/
    select?: CashClubSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CashClubInclude | null
    /**
     * The filter to search for the CashClub to update in case it exists.
     * 
    **/
    where: CashClubWhereUniqueInput
    /**
     * In case the CashClub found by the `where` argument doesn't exist, create a new CashClub with this data.
     * 
    **/
    create: XOR<CashClubCreateInput, CashClubUncheckedCreateInput>
    /**
     * In case the CashClub was found with the provided `where` argument, update it with this data.
     * 
    **/
    update: XOR<CashClubUpdateInput, CashClubUncheckedUpdateInput>
  }


  /**
   * CashClub delete
   */
  export type CashClubDeleteArgs = {
    /**
     * Select specific fields to fetch from the CashClub
     * 
    **/
    select?: CashClubSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CashClubInclude | null
    /**
     * Filter which CashClub to delete.
     * 
    **/
    where: CashClubWhereUniqueInput
  }


  /**
   * CashClub deleteMany
   */
  export type CashClubDeleteManyArgs = {
    /**
     * Filter which CashClubs to delete
     * 
    **/
    where?: CashClubWhereInput
  }


  /**
   * CashClub without action
   */
  export type CashClubArgs = {
    /**
     * Select specific fields to fetch from the CashClub
     * 
    **/
    select?: CashClubSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: CashClubInclude | null
  }



  /**
   * Model Department
   */


  export type AggregateDepartment = {
    _count: DepartmentCountAggregateOutputType | null
    _avg: DepartmentAvgAggregateOutputType | null
    _sum: DepartmentSumAggregateOutputType | null
    _min: DepartmentMinAggregateOutputType | null
    _max: DepartmentMaxAggregateOutputType | null
  }

  export type DepartmentAvgAggregateOutputType = {
    idDepartment: number | null
  }

  export type DepartmentSumAggregateOutputType = {
    idDepartment: number | null
  }

  export type DepartmentMinAggregateOutputType = {
    idDepartment: number | null
    departmentName: string | null
  }

  export type DepartmentMaxAggregateOutputType = {
    idDepartment: number | null
    departmentName: string | null
  }

  export type DepartmentCountAggregateOutputType = {
    idDepartment: number
    departmentName: number
    _all: number
  }


  export type DepartmentAvgAggregateInputType = {
    idDepartment?: true
  }

  export type DepartmentSumAggregateInputType = {
    idDepartment?: true
  }

  export type DepartmentMinAggregateInputType = {
    idDepartment?: true
    departmentName?: true
  }

  export type DepartmentMaxAggregateInputType = {
    idDepartment?: true
    departmentName?: true
  }

  export type DepartmentCountAggregateInputType = {
    idDepartment?: true
    departmentName?: true
    _all?: true
  }

  export type DepartmentAggregateArgs = {
    /**
     * Filter which Department to aggregate.
     * 
    **/
    where?: DepartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Departments to fetch.
     * 
    **/
    orderBy?: Enumerable<DepartmentOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     * 
    **/
    cursor?: DepartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Departments from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Departments.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned Departments
    **/
    _count?: true | DepartmentCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: DepartmentAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: DepartmentSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: DepartmentMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: DepartmentMaxAggregateInputType
  }

  export type GetDepartmentAggregateType<T extends DepartmentAggregateArgs> = {
        [P in keyof T & keyof AggregateDepartment]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateDepartment[P]>
      : GetScalarType<T[P], AggregateDepartment[P]>
  }




  export type DepartmentGroupByArgs = {
    where?: DepartmentWhereInput
    orderBy?: Enumerable<DepartmentOrderByWithAggregationInput>
    by: Array<DepartmentScalarFieldEnum>
    having?: DepartmentScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: DepartmentCountAggregateInputType | true
    _avg?: DepartmentAvgAggregateInputType
    _sum?: DepartmentSumAggregateInputType
    _min?: DepartmentMinAggregateInputType
    _max?: DepartmentMaxAggregateInputType
  }


  export type DepartmentGroupByOutputType = {
    idDepartment: number
    departmentName: string
    _count: DepartmentCountAggregateOutputType | null
    _avg: DepartmentAvgAggregateOutputType | null
    _sum: DepartmentSumAggregateOutputType | null
    _min: DepartmentMinAggregateOutputType | null
    _max: DepartmentMaxAggregateOutputType | null
  }

  type GetDepartmentGroupByPayload<T extends DepartmentGroupByArgs> = PrismaPromise<
    Array<
      PickArray<DepartmentGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof DepartmentGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], DepartmentGroupByOutputType[P]>
            : GetScalarType<T[P], DepartmentGroupByOutputType[P]>
        }
      >
    >


  export type DepartmentSelect = {
    idDepartment?: boolean
    departmentName?: boolean
    Job?: boolean | JobFindManyArgs
    _count?: boolean | DepartmentCountOutputTypeArgs
  }

  export type DepartmentInclude = {
    Job?: boolean | JobFindManyArgs
    _count?: boolean | DepartmentCountOutputTypeArgs
  }

  export type DepartmentGetPayload<
    S extends boolean | null | undefined | DepartmentArgs,
    U = keyof S
      > = S extends true
        ? Department
    : S extends undefined
    ? never
    : S extends DepartmentArgs | DepartmentFindManyArgs
    ?'include' extends U
    ? Department  & {
    [P in TrueKeys<S['include']>]:
        P extends 'Job' ? Array < JobGetPayload<S['include'][P]>>  :
        P extends '_count' ? DepartmentCountOutputTypeGetPayload<S['include'][P]> :  never
  } 
    : 'select' extends U
    ? {
    [P in TrueKeys<S['select']>]:
        P extends 'Job' ? Array < JobGetPayload<S['select'][P]>>  :
        P extends '_count' ? DepartmentCountOutputTypeGetPayload<S['select'][P]> :  P extends keyof Department ? Department[P] : never
  } 
    : Department
  : Department


  type DepartmentCountArgs = Merge<
    Omit<DepartmentFindManyArgs, 'select' | 'include'> & {
      select?: DepartmentCountAggregateInputType | true
    }
  >

  export interface DepartmentDelegate<GlobalRejectSettings> {
    /**
     * Find zero or one Department that matches the filter.
     * @param {DepartmentFindUniqueArgs} args - Arguments to find a Department
     * @example
     * // Get one Department
     * const department = await prisma.department.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findUnique<T extends DepartmentFindUniqueArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args: SelectSubset<T, DepartmentFindUniqueArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findUnique', 'Department'> extends True ? CheckSelect<T, Prisma__DepartmentClient<Department>, Prisma__DepartmentClient<DepartmentGetPayload<T>>> : CheckSelect<T, Prisma__DepartmentClient<Department | null >, Prisma__DepartmentClient<DepartmentGetPayload<T> | null >>

    /**
     * Find the first Department that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {DepartmentFindFirstArgs} args - Arguments to find a Department
     * @example
     * // Get one Department
     * const department = await prisma.department.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findFirst<T extends DepartmentFindFirstArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args?: SelectSubset<T, DepartmentFindFirstArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findFirst', 'Department'> extends True ? CheckSelect<T, Prisma__DepartmentClient<Department>, Prisma__DepartmentClient<DepartmentGetPayload<T>>> : CheckSelect<T, Prisma__DepartmentClient<Department | null >, Prisma__DepartmentClient<DepartmentGetPayload<T> | null >>

    /**
     * Find zero or more Departments that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {DepartmentFindManyArgs=} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all Departments
     * const departments = await prisma.department.findMany()
     * 
     * // Get first 10 Departments
     * const departments = await prisma.department.findMany({ take: 10 })
     * 
     * // Only select the `idDepartment`
     * const departmentWithIdDepartmentOnly = await prisma.department.findMany({ select: { idDepartment: true } })
     * 
    **/
    findMany<T extends DepartmentFindManyArgs>(
      args?: SelectSubset<T, DepartmentFindManyArgs>
    ): CheckSelect<T, PrismaPromise<Array<Department>>, PrismaPromise<Array<DepartmentGetPayload<T>>>>

    /**
     * Create a Department.
     * @param {DepartmentCreateArgs} args - Arguments to create a Department.
     * @example
     * // Create one Department
     * const Department = await prisma.department.create({
     *   data: {
     *     // ... data to create a Department
     *   }
     * })
     * 
    **/
    create<T extends DepartmentCreateArgs>(
      args: SelectSubset<T, DepartmentCreateArgs>
    ): CheckSelect<T, Prisma__DepartmentClient<Department>, Prisma__DepartmentClient<DepartmentGetPayload<T>>>

    /**
     * Create many Departments.
     *     @param {DepartmentCreateManyArgs} args - Arguments to create many Departments.
     *     @example
     *     // Create many Departments
     *     const department = await prisma.department.createMany({
     *       data: {
     *         // ... provide data here
     *       }
     *     })
     *     
    **/
    createMany<T extends DepartmentCreateManyArgs>(
      args?: SelectSubset<T, DepartmentCreateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Delete a Department.
     * @param {DepartmentDeleteArgs} args - Arguments to delete one Department.
     * @example
     * // Delete one Department
     * const Department = await prisma.department.delete({
     *   where: {
     *     // ... filter to delete one Department
     *   }
     * })
     * 
    **/
    delete<T extends DepartmentDeleteArgs>(
      args: SelectSubset<T, DepartmentDeleteArgs>
    ): CheckSelect<T, Prisma__DepartmentClient<Department>, Prisma__DepartmentClient<DepartmentGetPayload<T>>>

    /**
     * Update one Department.
     * @param {DepartmentUpdateArgs} args - Arguments to update one Department.
     * @example
     * // Update one Department
     * const department = await prisma.department.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    update<T extends DepartmentUpdateArgs>(
      args: SelectSubset<T, DepartmentUpdateArgs>
    ): CheckSelect<T, Prisma__DepartmentClient<Department>, Prisma__DepartmentClient<DepartmentGetPayload<T>>>

    /**
     * Delete zero or more Departments.
     * @param {DepartmentDeleteManyArgs} args - Arguments to filter Departments to delete.
     * @example
     * // Delete a few Departments
     * const { count } = await prisma.department.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
    **/
    deleteMany<T extends DepartmentDeleteManyArgs>(
      args?: SelectSubset<T, DepartmentDeleteManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Update zero or more Departments.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {DepartmentUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many Departments
     * const department = await prisma.department.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    updateMany<T extends DepartmentUpdateManyArgs>(
      args: SelectSubset<T, DepartmentUpdateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Create or update one Department.
     * @param {DepartmentUpsertArgs} args - Arguments to update or create a Department.
     * @example
     * // Update or create a Department
     * const department = await prisma.department.upsert({
     *   create: {
     *     // ... data to create a Department
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the Department we want to update
     *   }
     * })
    **/
    upsert<T extends DepartmentUpsertArgs>(
      args: SelectSubset<T, DepartmentUpsertArgs>
    ): CheckSelect<T, Prisma__DepartmentClient<Department>, Prisma__DepartmentClient<DepartmentGetPayload<T>>>

    /**
     * Count the number of Departments.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {DepartmentCountArgs} args - Arguments to filter Departments to count.
     * @example
     * // Count the number of Departments
     * const count = await prisma.department.count({
     *   where: {
     *     // ... the filter for the Departments we want to count
     *   }
     * })
    **/
    count<T extends DepartmentCountArgs>(
      args?: Subset<T, DepartmentCountArgs>,
    ): PrismaPromise<
      T extends _Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], DepartmentCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a Department.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {DepartmentAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends DepartmentAggregateArgs>(args: Subset<T, DepartmentAggregateArgs>): PrismaPromise<GetDepartmentAggregateType<T>>

    /**
     * Group by Department.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {DepartmentGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends DepartmentGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: DepartmentGroupByArgs['orderBy'] }
        : { orderBy?: DepartmentGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends TupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, DepartmentGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetDepartmentGroupByPayload<T> : PrismaPromise<InputErrors>
  }

  /**
   * The delegate class that acts as a "Promise-like" for Department.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export class Prisma__DepartmentClient<T> implements PrismaPromise<T> {
    [prisma]: true;
    private readonly _dmmf;
    private readonly _fetcher;
    private readonly _queryType;
    private readonly _rootField;
    private readonly _clientMethod;
    private readonly _args;
    private readonly _dataPath;
    private readonly _errorFormat;
    private readonly _measurePerformance?;
    private _isList;
    private _callsite;
    private _requestPromise?;
    constructor(_dmmf: runtime.DMMFClass, _fetcher: PrismaClientFetcher, _queryType: 'query' | 'mutation', _rootField: string, _clientMethod: string, _args: any, _dataPath: string[], _errorFormat: ErrorFormat, _measurePerformance?: boolean | undefined, _isList?: boolean);
    readonly [Symbol.toStringTag]: 'PrismaClientPromise';

    Job<T extends JobFindManyArgs = {}>(args?: Subset<T, JobFindManyArgs>): CheckSelect<T, PrismaPromise<Array<Job>>, PrismaPromise<Array<JobGetPayload<T>>>>;

    private get _document();
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): Promise<TResult1 | TResult2>;
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): Promise<T | TResult>;
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): Promise<T>;
  }

  // Custom InputTypes

  /**
   * Department findUnique
   */
  export type DepartmentFindUniqueArgs = {
    /**
     * Select specific fields to fetch from the Department
     * 
    **/
    select?: DepartmentSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: DepartmentInclude | null
    /**
     * Throw an Error if a Department can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which Department to fetch.
     * 
    **/
    where: DepartmentWhereUniqueInput
  }


  /**
   * Department findFirst
   */
  export type DepartmentFindFirstArgs = {
    /**
     * Select specific fields to fetch from the Department
     * 
    **/
    select?: DepartmentSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: DepartmentInclude | null
    /**
     * Throw an Error if a Department can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which Department to fetch.
     * 
    **/
    where?: DepartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Departments to fetch.
     * 
    **/
    orderBy?: Enumerable<DepartmentOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for Departments.
     * 
    **/
    cursor?: DepartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Departments from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Departments.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of Departments.
     * 
    **/
    distinct?: Enumerable<DepartmentScalarFieldEnum>
  }


  /**
   * Department findMany
   */
  export type DepartmentFindManyArgs = {
    /**
     * Select specific fields to fetch from the Department
     * 
    **/
    select?: DepartmentSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: DepartmentInclude | null
    /**
     * Filter, which Departments to fetch.
     * 
    **/
    where?: DepartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Departments to fetch.
     * 
    **/
    orderBy?: Enumerable<DepartmentOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing Departments.
     * 
    **/
    cursor?: DepartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Departments from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Departments.
     * 
    **/
    skip?: number
    distinct?: Enumerable<DepartmentScalarFieldEnum>
  }


  /**
   * Department create
   */
  export type DepartmentCreateArgs = {
    /**
     * Select specific fields to fetch from the Department
     * 
    **/
    select?: DepartmentSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: DepartmentInclude | null
    /**
     * The data needed to create a Department.
     * 
    **/
    data: XOR<DepartmentCreateInput, DepartmentUncheckedCreateInput>
  }


  /**
   * Department createMany
   */
  export type DepartmentCreateManyArgs = {
    /**
     * The data used to create many Departments.
     * 
    **/
    data: Enumerable<DepartmentCreateManyInput>
  }


  /**
   * Department update
   */
  export type DepartmentUpdateArgs = {
    /**
     * Select specific fields to fetch from the Department
     * 
    **/
    select?: DepartmentSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: DepartmentInclude | null
    /**
     * The data needed to update a Department.
     * 
    **/
    data: XOR<DepartmentUpdateInput, DepartmentUncheckedUpdateInput>
    /**
     * Choose, which Department to update.
     * 
    **/
    where: DepartmentWhereUniqueInput
  }


  /**
   * Department updateMany
   */
  export type DepartmentUpdateManyArgs = {
    /**
     * The data used to update Departments.
     * 
    **/
    data: XOR<DepartmentUpdateManyMutationInput, DepartmentUncheckedUpdateManyInput>
    /**
     * Filter which Departments to update
     * 
    **/
    where?: DepartmentWhereInput
  }


  /**
   * Department upsert
   */
  export type DepartmentUpsertArgs = {
    /**
     * Select specific fields to fetch from the Department
     * 
    **/
    select?: DepartmentSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: DepartmentInclude | null
    /**
     * The filter to search for the Department to update in case it exists.
     * 
    **/
    where: DepartmentWhereUniqueInput
    /**
     * In case the Department found by the `where` argument doesn't exist, create a new Department with this data.
     * 
    **/
    create: XOR<DepartmentCreateInput, DepartmentUncheckedCreateInput>
    /**
     * In case the Department was found with the provided `where` argument, update it with this data.
     * 
    **/
    update: XOR<DepartmentUpdateInput, DepartmentUncheckedUpdateInput>
  }


  /**
   * Department delete
   */
  export type DepartmentDeleteArgs = {
    /**
     * Select specific fields to fetch from the Department
     * 
    **/
    select?: DepartmentSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: DepartmentInclude | null
    /**
     * Filter which Department to delete.
     * 
    **/
    where: DepartmentWhereUniqueInput
  }


  /**
   * Department deleteMany
   */
  export type DepartmentDeleteManyArgs = {
    /**
     * Filter which Departments to delete
     * 
    **/
    where?: DepartmentWhereInput
  }


  /**
   * Department without action
   */
  export type DepartmentArgs = {
    /**
     * Select specific fields to fetch from the Department
     * 
    **/
    select?: DepartmentSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: DepartmentInclude | null
  }



  /**
   * Model Employee
   */


  export type AggregateEmployee = {
    _count: EmployeeCountAggregateOutputType | null
    _avg: EmployeeAvgAggregateOutputType | null
    _sum: EmployeeSumAggregateOutputType | null
    _min: EmployeeMinAggregateOutputType | null
    _max: EmployeeMaxAggregateOutputType | null
  }

  export type EmployeeAvgAggregateOutputType = {
    idEmployee: number | null
    idInfoEmployee: number | null
    salary: number | null
    idJob: number | null
    idEmployeeUser: number | null
    idCashClub: number | null
    calification: number | null
  }

  export type EmployeeSumAggregateOutputType = {
    idEmployee: number | null
    idInfoEmployee: number | null
    salary: number | null
    idJob: number | null
    idEmployeeUser: number | null
    idCashClub: number | null
    calification: number | null
  }

  export type EmployeeMinAggregateOutputType = {
    idEmployee: number | null
    idInfoEmployee: number | null
    isActive: boolean | null
    salary: number | null
    idJob: number | null
    idEmployeeUser: number | null
    idCashClub: number | null
    calification: number | null
  }

  export type EmployeeMaxAggregateOutputType = {
    idEmployee: number | null
    idInfoEmployee: number | null
    isActive: boolean | null
    salary: number | null
    idJob: number | null
    idEmployeeUser: number | null
    idCashClub: number | null
    calification: number | null
  }

  export type EmployeeCountAggregateOutputType = {
    idEmployee: number
    idInfoEmployee: number
    isActive: number
    salary: number
    idJob: number
    idEmployeeUser: number
    idCashClub: number
    calification: number
    _all: number
  }


  export type EmployeeAvgAggregateInputType = {
    idEmployee?: true
    idInfoEmployee?: true
    salary?: true
    idJob?: true
    idEmployeeUser?: true
    idCashClub?: true
    calification?: true
  }

  export type EmployeeSumAggregateInputType = {
    idEmployee?: true
    idInfoEmployee?: true
    salary?: true
    idJob?: true
    idEmployeeUser?: true
    idCashClub?: true
    calification?: true
  }

  export type EmployeeMinAggregateInputType = {
    idEmployee?: true
    idInfoEmployee?: true
    isActive?: true
    salary?: true
    idJob?: true
    idEmployeeUser?: true
    idCashClub?: true
    calification?: true
  }

  export type EmployeeMaxAggregateInputType = {
    idEmployee?: true
    idInfoEmployee?: true
    isActive?: true
    salary?: true
    idJob?: true
    idEmployeeUser?: true
    idCashClub?: true
    calification?: true
  }

  export type EmployeeCountAggregateInputType = {
    idEmployee?: true
    idInfoEmployee?: true
    isActive?: true
    salary?: true
    idJob?: true
    idEmployeeUser?: true
    idCashClub?: true
    calification?: true
    _all?: true
  }

  export type EmployeeAggregateArgs = {
    /**
     * Filter which Employee to aggregate.
     * 
    **/
    where?: EmployeeWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Employees to fetch.
     * 
    **/
    orderBy?: Enumerable<EmployeeOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     * 
    **/
    cursor?: EmployeeWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Employees from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Employees.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned Employees
    **/
    _count?: true | EmployeeCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: EmployeeAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: EmployeeSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: EmployeeMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: EmployeeMaxAggregateInputType
  }

  export type GetEmployeeAggregateType<T extends EmployeeAggregateArgs> = {
        [P in keyof T & keyof AggregateEmployee]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateEmployee[P]>
      : GetScalarType<T[P], AggregateEmployee[P]>
  }




  export type EmployeeGroupByArgs = {
    where?: EmployeeWhereInput
    orderBy?: Enumerable<EmployeeOrderByWithAggregationInput>
    by: Array<EmployeeScalarFieldEnum>
    having?: EmployeeScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: EmployeeCountAggregateInputType | true
    _avg?: EmployeeAvgAggregateInputType
    _sum?: EmployeeSumAggregateInputType
    _min?: EmployeeMinAggregateInputType
    _max?: EmployeeMaxAggregateInputType
  }


  export type EmployeeGroupByOutputType = {
    idEmployee: number
    idInfoEmployee: number
    isActive: boolean
    salary: number
    idJob: number | null
    idEmployeeUser: number
    idCashClub: number
    calification: number
    _count: EmployeeCountAggregateOutputType | null
    _avg: EmployeeAvgAggregateOutputType | null
    _sum: EmployeeSumAggregateOutputType | null
    _min: EmployeeMinAggregateOutputType | null
    _max: EmployeeMaxAggregateOutputType | null
  }

  type GetEmployeeGroupByPayload<T extends EmployeeGroupByArgs> = PrismaPromise<
    Array<
      PickArray<EmployeeGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof EmployeeGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], EmployeeGroupByOutputType[P]>
            : GetScalarType<T[P], EmployeeGroupByOutputType[P]>
        }
      >
    >


  export type EmployeeSelect = {
    idEmployee?: boolean
    idInfoEmployee?: boolean
    isActive?: boolean
    salary?: boolean
    idJob?: boolean
    idEmployeeUser?: boolean
    idCashClub?: boolean
    calification?: boolean
    CashClub?: boolean | CashClubArgs
    EmployeeUser?: boolean | EmployeeUserArgs
    InfoEmployee?: boolean | InfoEmployeeArgs
    Job?: boolean | JobArgs
  }

  export type EmployeeInclude = {
    CashClub?: boolean | CashClubArgs
    EmployeeUser?: boolean | EmployeeUserArgs
    InfoEmployee?: boolean | InfoEmployeeArgs
    Job?: boolean | JobArgs
  }

  export type EmployeeGetPayload<
    S extends boolean | null | undefined | EmployeeArgs,
    U = keyof S
      > = S extends true
        ? Employee
    : S extends undefined
    ? never
    : S extends EmployeeArgs | EmployeeFindManyArgs
    ?'include' extends U
    ? Employee  & {
    [P in TrueKeys<S['include']>]:
        P extends 'CashClub' ? CashClubGetPayload<S['include'][P]> :
        P extends 'EmployeeUser' ? EmployeeUserGetPayload<S['include'][P]> :
        P extends 'InfoEmployee' ? InfoEmployeeGetPayload<S['include'][P]> :
        P extends 'Job' ? JobGetPayload<S['include'][P]> | null :  never
  } 
    : 'select' extends U
    ? {
    [P in TrueKeys<S['select']>]:
        P extends 'CashClub' ? CashClubGetPayload<S['select'][P]> :
        P extends 'EmployeeUser' ? EmployeeUserGetPayload<S['select'][P]> :
        P extends 'InfoEmployee' ? InfoEmployeeGetPayload<S['select'][P]> :
        P extends 'Job' ? JobGetPayload<S['select'][P]> | null :  P extends keyof Employee ? Employee[P] : never
  } 
    : Employee
  : Employee


  type EmployeeCountArgs = Merge<
    Omit<EmployeeFindManyArgs, 'select' | 'include'> & {
      select?: EmployeeCountAggregateInputType | true
    }
  >

  export interface EmployeeDelegate<GlobalRejectSettings> {
    /**
     * Find zero or one Employee that matches the filter.
     * @param {EmployeeFindUniqueArgs} args - Arguments to find a Employee
     * @example
     * // Get one Employee
     * const employee = await prisma.employee.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findUnique<T extends EmployeeFindUniqueArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args: SelectSubset<T, EmployeeFindUniqueArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findUnique', 'Employee'> extends True ? CheckSelect<T, Prisma__EmployeeClient<Employee>, Prisma__EmployeeClient<EmployeeGetPayload<T>>> : CheckSelect<T, Prisma__EmployeeClient<Employee | null >, Prisma__EmployeeClient<EmployeeGetPayload<T> | null >>

    /**
     * Find the first Employee that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {EmployeeFindFirstArgs} args - Arguments to find a Employee
     * @example
     * // Get one Employee
     * const employee = await prisma.employee.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findFirst<T extends EmployeeFindFirstArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args?: SelectSubset<T, EmployeeFindFirstArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findFirst', 'Employee'> extends True ? CheckSelect<T, Prisma__EmployeeClient<Employee>, Prisma__EmployeeClient<EmployeeGetPayload<T>>> : CheckSelect<T, Prisma__EmployeeClient<Employee | null >, Prisma__EmployeeClient<EmployeeGetPayload<T> | null >>

    /**
     * Find zero or more Employees that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {EmployeeFindManyArgs=} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all Employees
     * const employees = await prisma.employee.findMany()
     * 
     * // Get first 10 Employees
     * const employees = await prisma.employee.findMany({ take: 10 })
     * 
     * // Only select the `idEmployee`
     * const employeeWithIdEmployeeOnly = await prisma.employee.findMany({ select: { idEmployee: true } })
     * 
    **/
    findMany<T extends EmployeeFindManyArgs>(
      args?: SelectSubset<T, EmployeeFindManyArgs>
    ): CheckSelect<T, PrismaPromise<Array<Employee>>, PrismaPromise<Array<EmployeeGetPayload<T>>>>

    /**
     * Create a Employee.
     * @param {EmployeeCreateArgs} args - Arguments to create a Employee.
     * @example
     * // Create one Employee
     * const Employee = await prisma.employee.create({
     *   data: {
     *     // ... data to create a Employee
     *   }
     * })
     * 
    **/
    create<T extends EmployeeCreateArgs>(
      args: SelectSubset<T, EmployeeCreateArgs>
    ): CheckSelect<T, Prisma__EmployeeClient<Employee>, Prisma__EmployeeClient<EmployeeGetPayload<T>>>

    /**
     * Create many Employees.
     *     @param {EmployeeCreateManyArgs} args - Arguments to create many Employees.
     *     @example
     *     // Create many Employees
     *     const employee = await prisma.employee.createMany({
     *       data: {
     *         // ... provide data here
     *       }
     *     })
     *     
    **/
    createMany<T extends EmployeeCreateManyArgs>(
      args?: SelectSubset<T, EmployeeCreateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Delete a Employee.
     * @param {EmployeeDeleteArgs} args - Arguments to delete one Employee.
     * @example
     * // Delete one Employee
     * const Employee = await prisma.employee.delete({
     *   where: {
     *     // ... filter to delete one Employee
     *   }
     * })
     * 
    **/
    delete<T extends EmployeeDeleteArgs>(
      args: SelectSubset<T, EmployeeDeleteArgs>
    ): CheckSelect<T, Prisma__EmployeeClient<Employee>, Prisma__EmployeeClient<EmployeeGetPayload<T>>>

    /**
     * Update one Employee.
     * @param {EmployeeUpdateArgs} args - Arguments to update one Employee.
     * @example
     * // Update one Employee
     * const employee = await prisma.employee.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    update<T extends EmployeeUpdateArgs>(
      args: SelectSubset<T, EmployeeUpdateArgs>
    ): CheckSelect<T, Prisma__EmployeeClient<Employee>, Prisma__EmployeeClient<EmployeeGetPayload<T>>>

    /**
     * Delete zero or more Employees.
     * @param {EmployeeDeleteManyArgs} args - Arguments to filter Employees to delete.
     * @example
     * // Delete a few Employees
     * const { count } = await prisma.employee.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
    **/
    deleteMany<T extends EmployeeDeleteManyArgs>(
      args?: SelectSubset<T, EmployeeDeleteManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Update zero or more Employees.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {EmployeeUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many Employees
     * const employee = await prisma.employee.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    updateMany<T extends EmployeeUpdateManyArgs>(
      args: SelectSubset<T, EmployeeUpdateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Create or update one Employee.
     * @param {EmployeeUpsertArgs} args - Arguments to update or create a Employee.
     * @example
     * // Update or create a Employee
     * const employee = await prisma.employee.upsert({
     *   create: {
     *     // ... data to create a Employee
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the Employee we want to update
     *   }
     * })
    **/
    upsert<T extends EmployeeUpsertArgs>(
      args: SelectSubset<T, EmployeeUpsertArgs>
    ): CheckSelect<T, Prisma__EmployeeClient<Employee>, Prisma__EmployeeClient<EmployeeGetPayload<T>>>

    /**
     * Count the number of Employees.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {EmployeeCountArgs} args - Arguments to filter Employees to count.
     * @example
     * // Count the number of Employees
     * const count = await prisma.employee.count({
     *   where: {
     *     // ... the filter for the Employees we want to count
     *   }
     * })
    **/
    count<T extends EmployeeCountArgs>(
      args?: Subset<T, EmployeeCountArgs>,
    ): PrismaPromise<
      T extends _Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], EmployeeCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a Employee.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {EmployeeAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends EmployeeAggregateArgs>(args: Subset<T, EmployeeAggregateArgs>): PrismaPromise<GetEmployeeAggregateType<T>>

    /**
     * Group by Employee.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {EmployeeGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends EmployeeGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: EmployeeGroupByArgs['orderBy'] }
        : { orderBy?: EmployeeGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends TupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, EmployeeGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetEmployeeGroupByPayload<T> : PrismaPromise<InputErrors>
  }

  /**
   * The delegate class that acts as a "Promise-like" for Employee.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export class Prisma__EmployeeClient<T> implements PrismaPromise<T> {
    [prisma]: true;
    private readonly _dmmf;
    private readonly _fetcher;
    private readonly _queryType;
    private readonly _rootField;
    private readonly _clientMethod;
    private readonly _args;
    private readonly _dataPath;
    private readonly _errorFormat;
    private readonly _measurePerformance?;
    private _isList;
    private _callsite;
    private _requestPromise?;
    constructor(_dmmf: runtime.DMMFClass, _fetcher: PrismaClientFetcher, _queryType: 'query' | 'mutation', _rootField: string, _clientMethod: string, _args: any, _dataPath: string[], _errorFormat: ErrorFormat, _measurePerformance?: boolean | undefined, _isList?: boolean);
    readonly [Symbol.toStringTag]: 'PrismaClientPromise';

    CashClub<T extends CashClubArgs = {}>(args?: Subset<T, CashClubArgs>): CheckSelect<T, Prisma__CashClubClient<CashClub | null >, Prisma__CashClubClient<CashClubGetPayload<T> | null >>;

    EmployeeUser<T extends EmployeeUserArgs = {}>(args?: Subset<T, EmployeeUserArgs>): CheckSelect<T, Prisma__EmployeeUserClient<EmployeeUser | null >, Prisma__EmployeeUserClient<EmployeeUserGetPayload<T> | null >>;

    InfoEmployee<T extends InfoEmployeeArgs = {}>(args?: Subset<T, InfoEmployeeArgs>): CheckSelect<T, Prisma__InfoEmployeeClient<InfoEmployee | null >, Prisma__InfoEmployeeClient<InfoEmployeeGetPayload<T> | null >>;

    Job<T extends JobArgs = {}>(args?: Subset<T, JobArgs>): CheckSelect<T, Prisma__JobClient<Job | null >, Prisma__JobClient<JobGetPayload<T> | null >>;

    private get _document();
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): Promise<TResult1 | TResult2>;
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): Promise<T | TResult>;
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): Promise<T>;
  }

  // Custom InputTypes

  /**
   * Employee findUnique
   */
  export type EmployeeFindUniqueArgs = {
    /**
     * Select specific fields to fetch from the Employee
     * 
    **/
    select?: EmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeInclude | null
    /**
     * Throw an Error if a Employee can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which Employee to fetch.
     * 
    **/
    where: EmployeeWhereUniqueInput
  }


  /**
   * Employee findFirst
   */
  export type EmployeeFindFirstArgs = {
    /**
     * Select specific fields to fetch from the Employee
     * 
    **/
    select?: EmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeInclude | null
    /**
     * Throw an Error if a Employee can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which Employee to fetch.
     * 
    **/
    where?: EmployeeWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Employees to fetch.
     * 
    **/
    orderBy?: Enumerable<EmployeeOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for Employees.
     * 
    **/
    cursor?: EmployeeWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Employees from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Employees.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of Employees.
     * 
    **/
    distinct?: Enumerable<EmployeeScalarFieldEnum>
  }


  /**
   * Employee findMany
   */
  export type EmployeeFindManyArgs = {
    /**
     * Select specific fields to fetch from the Employee
     * 
    **/
    select?: EmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeInclude | null
    /**
     * Filter, which Employees to fetch.
     * 
    **/
    where?: EmployeeWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Employees to fetch.
     * 
    **/
    orderBy?: Enumerable<EmployeeOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing Employees.
     * 
    **/
    cursor?: EmployeeWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Employees from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Employees.
     * 
    **/
    skip?: number
    distinct?: Enumerable<EmployeeScalarFieldEnum>
  }


  /**
   * Employee create
   */
  export type EmployeeCreateArgs = {
    /**
     * Select specific fields to fetch from the Employee
     * 
    **/
    select?: EmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeInclude | null
    /**
     * The data needed to create a Employee.
     * 
    **/
    data: XOR<EmployeeCreateInput, EmployeeUncheckedCreateInput>
  }


  /**
   * Employee createMany
   */
  export type EmployeeCreateManyArgs = {
    /**
     * The data used to create many Employees.
     * 
    **/
    data: Enumerable<EmployeeCreateManyInput>
  }


  /**
   * Employee update
   */
  export type EmployeeUpdateArgs = {
    /**
     * Select specific fields to fetch from the Employee
     * 
    **/
    select?: EmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeInclude | null
    /**
     * The data needed to update a Employee.
     * 
    **/
    data: XOR<EmployeeUpdateInput, EmployeeUncheckedUpdateInput>
    /**
     * Choose, which Employee to update.
     * 
    **/
    where: EmployeeWhereUniqueInput
  }


  /**
   * Employee updateMany
   */
  export type EmployeeUpdateManyArgs = {
    /**
     * The data used to update Employees.
     * 
    **/
    data: XOR<EmployeeUpdateManyMutationInput, EmployeeUncheckedUpdateManyInput>
    /**
     * Filter which Employees to update
     * 
    **/
    where?: EmployeeWhereInput
  }


  /**
   * Employee upsert
   */
  export type EmployeeUpsertArgs = {
    /**
     * Select specific fields to fetch from the Employee
     * 
    **/
    select?: EmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeInclude | null
    /**
     * The filter to search for the Employee to update in case it exists.
     * 
    **/
    where: EmployeeWhereUniqueInput
    /**
     * In case the Employee found by the `where` argument doesn't exist, create a new Employee with this data.
     * 
    **/
    create: XOR<EmployeeCreateInput, EmployeeUncheckedCreateInput>
    /**
     * In case the Employee was found with the provided `where` argument, update it with this data.
     * 
    **/
    update: XOR<EmployeeUpdateInput, EmployeeUncheckedUpdateInput>
  }


  /**
   * Employee delete
   */
  export type EmployeeDeleteArgs = {
    /**
     * Select specific fields to fetch from the Employee
     * 
    **/
    select?: EmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeInclude | null
    /**
     * Filter which Employee to delete.
     * 
    **/
    where: EmployeeWhereUniqueInput
  }


  /**
   * Employee deleteMany
   */
  export type EmployeeDeleteManyArgs = {
    /**
     * Filter which Employees to delete
     * 
    **/
    where?: EmployeeWhereInput
  }


  /**
   * Employee without action
   */
  export type EmployeeArgs = {
    /**
     * Select specific fields to fetch from the Employee
     * 
    **/
    select?: EmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeInclude | null
  }



  /**
   * Model EmployeeUser
   */


  export type AggregateEmployeeUser = {
    _count: EmployeeUserCountAggregateOutputType | null
    _avg: EmployeeUserAvgAggregateOutputType | null
    _sum: EmployeeUserSumAggregateOutputType | null
    _min: EmployeeUserMinAggregateOutputType | null
    _max: EmployeeUserMaxAggregateOutputType | null
  }

  export type EmployeeUserAvgAggregateOutputType = {
    idEmployeeUser: number | null
  }

  export type EmployeeUserSumAggregateOutputType = {
    idEmployeeUser: number | null
  }

  export type EmployeeUserMinAggregateOutputType = {
    idEmployeeUser: number | null
    pasword: Buffer | null
    isActive: boolean | null
  }

  export type EmployeeUserMaxAggregateOutputType = {
    idEmployeeUser: number | null
    pasword: Buffer | null
    isActive: boolean | null
  }

  export type EmployeeUserCountAggregateOutputType = {
    idEmployeeUser: number
    pasword: number
    isActive: number
    _all: number
  }


  export type EmployeeUserAvgAggregateInputType = {
    idEmployeeUser?: true
  }

  export type EmployeeUserSumAggregateInputType = {
    idEmployeeUser?: true
  }

  export type EmployeeUserMinAggregateInputType = {
    idEmployeeUser?: true
    pasword?: true
    isActive?: true
  }

  export type EmployeeUserMaxAggregateInputType = {
    idEmployeeUser?: true
    pasword?: true
    isActive?: true
  }

  export type EmployeeUserCountAggregateInputType = {
    idEmployeeUser?: true
    pasword?: true
    isActive?: true
    _all?: true
  }

  export type EmployeeUserAggregateArgs = {
    /**
     * Filter which EmployeeUser to aggregate.
     * 
    **/
    where?: EmployeeUserWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of EmployeeUsers to fetch.
     * 
    **/
    orderBy?: Enumerable<EmployeeUserOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     * 
    **/
    cursor?: EmployeeUserWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` EmployeeUsers from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` EmployeeUsers.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned EmployeeUsers
    **/
    _count?: true | EmployeeUserCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: EmployeeUserAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: EmployeeUserSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: EmployeeUserMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: EmployeeUserMaxAggregateInputType
  }

  export type GetEmployeeUserAggregateType<T extends EmployeeUserAggregateArgs> = {
        [P in keyof T & keyof AggregateEmployeeUser]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateEmployeeUser[P]>
      : GetScalarType<T[P], AggregateEmployeeUser[P]>
  }




  export type EmployeeUserGroupByArgs = {
    where?: EmployeeUserWhereInput
    orderBy?: Enumerable<EmployeeUserOrderByWithAggregationInput>
    by: Array<EmployeeUserScalarFieldEnum>
    having?: EmployeeUserScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: EmployeeUserCountAggregateInputType | true
    _avg?: EmployeeUserAvgAggregateInputType
    _sum?: EmployeeUserSumAggregateInputType
    _min?: EmployeeUserMinAggregateInputType
    _max?: EmployeeUserMaxAggregateInputType
  }


  export type EmployeeUserGroupByOutputType = {
    idEmployeeUser: number
    pasword: Buffer
    isActive: boolean | null
    _count: EmployeeUserCountAggregateOutputType | null
    _avg: EmployeeUserAvgAggregateOutputType | null
    _sum: EmployeeUserSumAggregateOutputType | null
    _min: EmployeeUserMinAggregateOutputType | null
    _max: EmployeeUserMaxAggregateOutputType | null
  }

  type GetEmployeeUserGroupByPayload<T extends EmployeeUserGroupByArgs> = PrismaPromise<
    Array<
      PickArray<EmployeeUserGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof EmployeeUserGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], EmployeeUserGroupByOutputType[P]>
            : GetScalarType<T[P], EmployeeUserGroupByOutputType[P]>
        }
      >
    >


  export type EmployeeUserSelect = {
    idEmployeeUser?: boolean
    pasword?: boolean
    isActive?: boolean
    Employee?: boolean | EmployeeFindManyArgs
    _count?: boolean | EmployeeUserCountOutputTypeArgs
  }

  export type EmployeeUserInclude = {
    Employee?: boolean | EmployeeFindManyArgs
    _count?: boolean | EmployeeUserCountOutputTypeArgs
  }

  export type EmployeeUserGetPayload<
    S extends boolean | null | undefined | EmployeeUserArgs,
    U = keyof S
      > = S extends true
        ? EmployeeUser
    : S extends undefined
    ? never
    : S extends EmployeeUserArgs | EmployeeUserFindManyArgs
    ?'include' extends U
    ? EmployeeUser  & {
    [P in TrueKeys<S['include']>]:
        P extends 'Employee' ? Array < EmployeeGetPayload<S['include'][P]>>  :
        P extends '_count' ? EmployeeUserCountOutputTypeGetPayload<S['include'][P]> :  never
  } 
    : 'select' extends U
    ? {
    [P in TrueKeys<S['select']>]:
        P extends 'Employee' ? Array < EmployeeGetPayload<S['select'][P]>>  :
        P extends '_count' ? EmployeeUserCountOutputTypeGetPayload<S['select'][P]> :  P extends keyof EmployeeUser ? EmployeeUser[P] : never
  } 
    : EmployeeUser
  : EmployeeUser


  type EmployeeUserCountArgs = Merge<
    Omit<EmployeeUserFindManyArgs, 'select' | 'include'> & {
      select?: EmployeeUserCountAggregateInputType | true
    }
  >

  export interface EmployeeUserDelegate<GlobalRejectSettings> {
    /**
     * Find zero or one EmployeeUser that matches the filter.
     * @param {EmployeeUserFindUniqueArgs} args - Arguments to find a EmployeeUser
     * @example
     * // Get one EmployeeUser
     * const employeeUser = await prisma.employeeUser.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findUnique<T extends EmployeeUserFindUniqueArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args: SelectSubset<T, EmployeeUserFindUniqueArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findUnique', 'EmployeeUser'> extends True ? CheckSelect<T, Prisma__EmployeeUserClient<EmployeeUser>, Prisma__EmployeeUserClient<EmployeeUserGetPayload<T>>> : CheckSelect<T, Prisma__EmployeeUserClient<EmployeeUser | null >, Prisma__EmployeeUserClient<EmployeeUserGetPayload<T> | null >>

    /**
     * Find the first EmployeeUser that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {EmployeeUserFindFirstArgs} args - Arguments to find a EmployeeUser
     * @example
     * // Get one EmployeeUser
     * const employeeUser = await prisma.employeeUser.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findFirst<T extends EmployeeUserFindFirstArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args?: SelectSubset<T, EmployeeUserFindFirstArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findFirst', 'EmployeeUser'> extends True ? CheckSelect<T, Prisma__EmployeeUserClient<EmployeeUser>, Prisma__EmployeeUserClient<EmployeeUserGetPayload<T>>> : CheckSelect<T, Prisma__EmployeeUserClient<EmployeeUser | null >, Prisma__EmployeeUserClient<EmployeeUserGetPayload<T> | null >>

    /**
     * Find zero or more EmployeeUsers that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {EmployeeUserFindManyArgs=} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all EmployeeUsers
     * const employeeUsers = await prisma.employeeUser.findMany()
     * 
     * // Get first 10 EmployeeUsers
     * const employeeUsers = await prisma.employeeUser.findMany({ take: 10 })
     * 
     * // Only select the `idEmployeeUser`
     * const employeeUserWithIdEmployeeUserOnly = await prisma.employeeUser.findMany({ select: { idEmployeeUser: true } })
     * 
    **/
    findMany<T extends EmployeeUserFindManyArgs>(
      args?: SelectSubset<T, EmployeeUserFindManyArgs>
    ): CheckSelect<T, PrismaPromise<Array<EmployeeUser>>, PrismaPromise<Array<EmployeeUserGetPayload<T>>>>

    /**
     * Create a EmployeeUser.
     * @param {EmployeeUserCreateArgs} args - Arguments to create a EmployeeUser.
     * @example
     * // Create one EmployeeUser
     * const EmployeeUser = await prisma.employeeUser.create({
     *   data: {
     *     // ... data to create a EmployeeUser
     *   }
     * })
     * 
    **/
    create<T extends EmployeeUserCreateArgs>(
      args: SelectSubset<T, EmployeeUserCreateArgs>
    ): CheckSelect<T, Prisma__EmployeeUserClient<EmployeeUser>, Prisma__EmployeeUserClient<EmployeeUserGetPayload<T>>>

    /**
     * Create many EmployeeUsers.
     *     @param {EmployeeUserCreateManyArgs} args - Arguments to create many EmployeeUsers.
     *     @example
     *     // Create many EmployeeUsers
     *     const employeeUser = await prisma.employeeUser.createMany({
     *       data: {
     *         // ... provide data here
     *       }
     *     })
     *     
    **/
    createMany<T extends EmployeeUserCreateManyArgs>(
      args?: SelectSubset<T, EmployeeUserCreateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Delete a EmployeeUser.
     * @param {EmployeeUserDeleteArgs} args - Arguments to delete one EmployeeUser.
     * @example
     * // Delete one EmployeeUser
     * const EmployeeUser = await prisma.employeeUser.delete({
     *   where: {
     *     // ... filter to delete one EmployeeUser
     *   }
     * })
     * 
    **/
    delete<T extends EmployeeUserDeleteArgs>(
      args: SelectSubset<T, EmployeeUserDeleteArgs>
    ): CheckSelect<T, Prisma__EmployeeUserClient<EmployeeUser>, Prisma__EmployeeUserClient<EmployeeUserGetPayload<T>>>

    /**
     * Update one EmployeeUser.
     * @param {EmployeeUserUpdateArgs} args - Arguments to update one EmployeeUser.
     * @example
     * // Update one EmployeeUser
     * const employeeUser = await prisma.employeeUser.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    update<T extends EmployeeUserUpdateArgs>(
      args: SelectSubset<T, EmployeeUserUpdateArgs>
    ): CheckSelect<T, Prisma__EmployeeUserClient<EmployeeUser>, Prisma__EmployeeUserClient<EmployeeUserGetPayload<T>>>

    /**
     * Delete zero or more EmployeeUsers.
     * @param {EmployeeUserDeleteManyArgs} args - Arguments to filter EmployeeUsers to delete.
     * @example
     * // Delete a few EmployeeUsers
     * const { count } = await prisma.employeeUser.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
    **/
    deleteMany<T extends EmployeeUserDeleteManyArgs>(
      args?: SelectSubset<T, EmployeeUserDeleteManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Update zero or more EmployeeUsers.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {EmployeeUserUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many EmployeeUsers
     * const employeeUser = await prisma.employeeUser.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    updateMany<T extends EmployeeUserUpdateManyArgs>(
      args: SelectSubset<T, EmployeeUserUpdateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Create or update one EmployeeUser.
     * @param {EmployeeUserUpsertArgs} args - Arguments to update or create a EmployeeUser.
     * @example
     * // Update or create a EmployeeUser
     * const employeeUser = await prisma.employeeUser.upsert({
     *   create: {
     *     // ... data to create a EmployeeUser
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the EmployeeUser we want to update
     *   }
     * })
    **/
    upsert<T extends EmployeeUserUpsertArgs>(
      args: SelectSubset<T, EmployeeUserUpsertArgs>
    ): CheckSelect<T, Prisma__EmployeeUserClient<EmployeeUser>, Prisma__EmployeeUserClient<EmployeeUserGetPayload<T>>>

    /**
     * Count the number of EmployeeUsers.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {EmployeeUserCountArgs} args - Arguments to filter EmployeeUsers to count.
     * @example
     * // Count the number of EmployeeUsers
     * const count = await prisma.employeeUser.count({
     *   where: {
     *     // ... the filter for the EmployeeUsers we want to count
     *   }
     * })
    **/
    count<T extends EmployeeUserCountArgs>(
      args?: Subset<T, EmployeeUserCountArgs>,
    ): PrismaPromise<
      T extends _Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], EmployeeUserCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a EmployeeUser.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {EmployeeUserAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends EmployeeUserAggregateArgs>(args: Subset<T, EmployeeUserAggregateArgs>): PrismaPromise<GetEmployeeUserAggregateType<T>>

    /**
     * Group by EmployeeUser.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {EmployeeUserGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends EmployeeUserGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: EmployeeUserGroupByArgs['orderBy'] }
        : { orderBy?: EmployeeUserGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends TupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, EmployeeUserGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetEmployeeUserGroupByPayload<T> : PrismaPromise<InputErrors>
  }

  /**
   * The delegate class that acts as a "Promise-like" for EmployeeUser.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export class Prisma__EmployeeUserClient<T> implements PrismaPromise<T> {
    [prisma]: true;
    private readonly _dmmf;
    private readonly _fetcher;
    private readonly _queryType;
    private readonly _rootField;
    private readonly _clientMethod;
    private readonly _args;
    private readonly _dataPath;
    private readonly _errorFormat;
    private readonly _measurePerformance?;
    private _isList;
    private _callsite;
    private _requestPromise?;
    constructor(_dmmf: runtime.DMMFClass, _fetcher: PrismaClientFetcher, _queryType: 'query' | 'mutation', _rootField: string, _clientMethod: string, _args: any, _dataPath: string[], _errorFormat: ErrorFormat, _measurePerformance?: boolean | undefined, _isList?: boolean);
    readonly [Symbol.toStringTag]: 'PrismaClientPromise';

    Employee<T extends EmployeeFindManyArgs = {}>(args?: Subset<T, EmployeeFindManyArgs>): CheckSelect<T, PrismaPromise<Array<Employee>>, PrismaPromise<Array<EmployeeGetPayload<T>>>>;

    private get _document();
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): Promise<TResult1 | TResult2>;
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): Promise<T | TResult>;
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): Promise<T>;
  }

  // Custom InputTypes

  /**
   * EmployeeUser findUnique
   */
  export type EmployeeUserFindUniqueArgs = {
    /**
     * Select specific fields to fetch from the EmployeeUser
     * 
    **/
    select?: EmployeeUserSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeUserInclude | null
    /**
     * Throw an Error if a EmployeeUser can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which EmployeeUser to fetch.
     * 
    **/
    where: EmployeeUserWhereUniqueInput
  }


  /**
   * EmployeeUser findFirst
   */
  export type EmployeeUserFindFirstArgs = {
    /**
     * Select specific fields to fetch from the EmployeeUser
     * 
    **/
    select?: EmployeeUserSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeUserInclude | null
    /**
     * Throw an Error if a EmployeeUser can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which EmployeeUser to fetch.
     * 
    **/
    where?: EmployeeUserWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of EmployeeUsers to fetch.
     * 
    **/
    orderBy?: Enumerable<EmployeeUserOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for EmployeeUsers.
     * 
    **/
    cursor?: EmployeeUserWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` EmployeeUsers from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` EmployeeUsers.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of EmployeeUsers.
     * 
    **/
    distinct?: Enumerable<EmployeeUserScalarFieldEnum>
  }


  /**
   * EmployeeUser findMany
   */
  export type EmployeeUserFindManyArgs = {
    /**
     * Select specific fields to fetch from the EmployeeUser
     * 
    **/
    select?: EmployeeUserSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeUserInclude | null
    /**
     * Filter, which EmployeeUsers to fetch.
     * 
    **/
    where?: EmployeeUserWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of EmployeeUsers to fetch.
     * 
    **/
    orderBy?: Enumerable<EmployeeUserOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing EmployeeUsers.
     * 
    **/
    cursor?: EmployeeUserWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` EmployeeUsers from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` EmployeeUsers.
     * 
    **/
    skip?: number
    distinct?: Enumerable<EmployeeUserScalarFieldEnum>
  }


  /**
   * EmployeeUser create
   */
  export type EmployeeUserCreateArgs = {
    /**
     * Select specific fields to fetch from the EmployeeUser
     * 
    **/
    select?: EmployeeUserSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeUserInclude | null
    /**
     * The data needed to create a EmployeeUser.
     * 
    **/
    data: XOR<EmployeeUserCreateInput, EmployeeUserUncheckedCreateInput>
  }


  /**
   * EmployeeUser createMany
   */
  export type EmployeeUserCreateManyArgs = {
    /**
     * The data used to create many EmployeeUsers.
     * 
    **/
    data: Enumerable<EmployeeUserCreateManyInput>
  }


  /**
   * EmployeeUser update
   */
  export type EmployeeUserUpdateArgs = {
    /**
     * Select specific fields to fetch from the EmployeeUser
     * 
    **/
    select?: EmployeeUserSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeUserInclude | null
    /**
     * The data needed to update a EmployeeUser.
     * 
    **/
    data: XOR<EmployeeUserUpdateInput, EmployeeUserUncheckedUpdateInput>
    /**
     * Choose, which EmployeeUser to update.
     * 
    **/
    where: EmployeeUserWhereUniqueInput
  }


  /**
   * EmployeeUser updateMany
   */
  export type EmployeeUserUpdateManyArgs = {
    /**
     * The data used to update EmployeeUsers.
     * 
    **/
    data: XOR<EmployeeUserUpdateManyMutationInput, EmployeeUserUncheckedUpdateManyInput>
    /**
     * Filter which EmployeeUsers to update
     * 
    **/
    where?: EmployeeUserWhereInput
  }


  /**
   * EmployeeUser upsert
   */
  export type EmployeeUserUpsertArgs = {
    /**
     * Select specific fields to fetch from the EmployeeUser
     * 
    **/
    select?: EmployeeUserSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeUserInclude | null
    /**
     * The filter to search for the EmployeeUser to update in case it exists.
     * 
    **/
    where: EmployeeUserWhereUniqueInput
    /**
     * In case the EmployeeUser found by the `where` argument doesn't exist, create a new EmployeeUser with this data.
     * 
    **/
    create: XOR<EmployeeUserCreateInput, EmployeeUserUncheckedCreateInput>
    /**
     * In case the EmployeeUser was found with the provided `where` argument, update it with this data.
     * 
    **/
    update: XOR<EmployeeUserUpdateInput, EmployeeUserUncheckedUpdateInput>
  }


  /**
   * EmployeeUser delete
   */
  export type EmployeeUserDeleteArgs = {
    /**
     * Select specific fields to fetch from the EmployeeUser
     * 
    **/
    select?: EmployeeUserSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeUserInclude | null
    /**
     * Filter which EmployeeUser to delete.
     * 
    **/
    where: EmployeeUserWhereUniqueInput
  }


  /**
   * EmployeeUser deleteMany
   */
  export type EmployeeUserDeleteManyArgs = {
    /**
     * Filter which EmployeeUsers to delete
     * 
    **/
    where?: EmployeeUserWhereInput
  }


  /**
   * EmployeeUser without action
   */
  export type EmployeeUserArgs = {
    /**
     * Select specific fields to fetch from the EmployeeUser
     * 
    **/
    select?: EmployeeUserSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: EmployeeUserInclude | null
  }



  /**
   * Model InfoEmployee
   */


  export type AggregateInfoEmployee = {
    _count: InfoEmployeeCountAggregateOutputType | null
    _avg: InfoEmployeeAvgAggregateOutputType | null
    _sum: InfoEmployeeSumAggregateOutputType | null
    _min: InfoEmployeeMinAggregateOutputType | null
    _max: InfoEmployeeMaxAggregateOutputType | null
  }

  export type InfoEmployeeAvgAggregateOutputType = {
    idInfoEmployee: number | null
    phoneNumber: number | null
    idCountry: number | null
  }

  export type InfoEmployeeSumAggregateOutputType = {
    idInfoEmployee: number | null
    phoneNumber: number | null
    idCountry: number | null
  }

  export type InfoEmployeeMinAggregateOutputType = {
    idInfoEmployee: number | null
    peopleName: string | null
    surname: string | null
    email: string | null
    phoneNumber: number | null
    birthDate: Date | null
    employeeAddress: string | null
    idCountry: number | null
  }

  export type InfoEmployeeMaxAggregateOutputType = {
    idInfoEmployee: number | null
    peopleName: string | null
    surname: string | null
    email: string | null
    phoneNumber: number | null
    birthDate: Date | null
    employeeAddress: string | null
    idCountry: number | null
  }

  export type InfoEmployeeCountAggregateOutputType = {
    idInfoEmployee: number
    peopleName: number
    surname: number
    email: number
    phoneNumber: number
    birthDate: number
    employeeAddress: number
    idCountry: number
    _all: number
  }


  export type InfoEmployeeAvgAggregateInputType = {
    idInfoEmployee?: true
    phoneNumber?: true
    idCountry?: true
  }

  export type InfoEmployeeSumAggregateInputType = {
    idInfoEmployee?: true
    phoneNumber?: true
    idCountry?: true
  }

  export type InfoEmployeeMinAggregateInputType = {
    idInfoEmployee?: true
    peopleName?: true
    surname?: true
    email?: true
    phoneNumber?: true
    birthDate?: true
    employeeAddress?: true
    idCountry?: true
  }

  export type InfoEmployeeMaxAggregateInputType = {
    idInfoEmployee?: true
    peopleName?: true
    surname?: true
    email?: true
    phoneNumber?: true
    birthDate?: true
    employeeAddress?: true
    idCountry?: true
  }

  export type InfoEmployeeCountAggregateInputType = {
    idInfoEmployee?: true
    peopleName?: true
    surname?: true
    email?: true
    phoneNumber?: true
    birthDate?: true
    employeeAddress?: true
    idCountry?: true
    _all?: true
  }

  export type InfoEmployeeAggregateArgs = {
    /**
     * Filter which InfoEmployee to aggregate.
     * 
    **/
    where?: InfoEmployeeWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of InfoEmployees to fetch.
     * 
    **/
    orderBy?: Enumerable<InfoEmployeeOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     * 
    **/
    cursor?: InfoEmployeeWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` InfoEmployees from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` InfoEmployees.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned InfoEmployees
    **/
    _count?: true | InfoEmployeeCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: InfoEmployeeAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: InfoEmployeeSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: InfoEmployeeMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: InfoEmployeeMaxAggregateInputType
  }

  export type GetInfoEmployeeAggregateType<T extends InfoEmployeeAggregateArgs> = {
        [P in keyof T & keyof AggregateInfoEmployee]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateInfoEmployee[P]>
      : GetScalarType<T[P], AggregateInfoEmployee[P]>
  }




  export type InfoEmployeeGroupByArgs = {
    where?: InfoEmployeeWhereInput
    orderBy?: Enumerable<InfoEmployeeOrderByWithAggregationInput>
    by: Array<InfoEmployeeScalarFieldEnum>
    having?: InfoEmployeeScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: InfoEmployeeCountAggregateInputType | true
    _avg?: InfoEmployeeAvgAggregateInputType
    _sum?: InfoEmployeeSumAggregateInputType
    _min?: InfoEmployeeMinAggregateInputType
    _max?: InfoEmployeeMaxAggregateInputType
  }


  export type InfoEmployeeGroupByOutputType = {
    idInfoEmployee: number
    peopleName: string
    surname: string
    email: string
    phoneNumber: number
    birthDate: Date
    employeeAddress: string
    idCountry: number
    _count: InfoEmployeeCountAggregateOutputType | null
    _avg: InfoEmployeeAvgAggregateOutputType | null
    _sum: InfoEmployeeSumAggregateOutputType | null
    _min: InfoEmployeeMinAggregateOutputType | null
    _max: InfoEmployeeMaxAggregateOutputType | null
  }

  type GetInfoEmployeeGroupByPayload<T extends InfoEmployeeGroupByArgs> = PrismaPromise<
    Array<
      PickArray<InfoEmployeeGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof InfoEmployeeGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], InfoEmployeeGroupByOutputType[P]>
            : GetScalarType<T[P], InfoEmployeeGroupByOutputType[P]>
        }
      >
    >


  export type InfoEmployeeSelect = {
    idInfoEmployee?: boolean
    peopleName?: boolean
    surname?: boolean
    email?: boolean
    phoneNumber?: boolean
    birthDate?: boolean
    employeeAddress?: boolean
    idCountry?: boolean
    Country?: boolean | CountryArgs
    Employee?: boolean | EmployeeFindManyArgs
    _count?: boolean | InfoEmployeeCountOutputTypeArgs
  }

  export type InfoEmployeeInclude = {
    Country?: boolean | CountryArgs
    Employee?: boolean | EmployeeFindManyArgs
    _count?: boolean | InfoEmployeeCountOutputTypeArgs
  }

  export type InfoEmployeeGetPayload<
    S extends boolean | null | undefined | InfoEmployeeArgs,
    U = keyof S
      > = S extends true
        ? InfoEmployee
    : S extends undefined
    ? never
    : S extends InfoEmployeeArgs | InfoEmployeeFindManyArgs
    ?'include' extends U
    ? InfoEmployee  & {
    [P in TrueKeys<S['include']>]:
        P extends 'Country' ? CountryGetPayload<S['include'][P]> :
        P extends 'Employee' ? Array < EmployeeGetPayload<S['include'][P]>>  :
        P extends '_count' ? InfoEmployeeCountOutputTypeGetPayload<S['include'][P]> :  never
  } 
    : 'select' extends U
    ? {
    [P in TrueKeys<S['select']>]:
        P extends 'Country' ? CountryGetPayload<S['select'][P]> :
        P extends 'Employee' ? Array < EmployeeGetPayload<S['select'][P]>>  :
        P extends '_count' ? InfoEmployeeCountOutputTypeGetPayload<S['select'][P]> :  P extends keyof InfoEmployee ? InfoEmployee[P] : never
  } 
    : InfoEmployee
  : InfoEmployee


  type InfoEmployeeCountArgs = Merge<
    Omit<InfoEmployeeFindManyArgs, 'select' | 'include'> & {
      select?: InfoEmployeeCountAggregateInputType | true
    }
  >

  export interface InfoEmployeeDelegate<GlobalRejectSettings> {
    /**
     * Find zero or one InfoEmployee that matches the filter.
     * @param {InfoEmployeeFindUniqueArgs} args - Arguments to find a InfoEmployee
     * @example
     * // Get one InfoEmployee
     * const infoEmployee = await prisma.infoEmployee.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findUnique<T extends InfoEmployeeFindUniqueArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args: SelectSubset<T, InfoEmployeeFindUniqueArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findUnique', 'InfoEmployee'> extends True ? CheckSelect<T, Prisma__InfoEmployeeClient<InfoEmployee>, Prisma__InfoEmployeeClient<InfoEmployeeGetPayload<T>>> : CheckSelect<T, Prisma__InfoEmployeeClient<InfoEmployee | null >, Prisma__InfoEmployeeClient<InfoEmployeeGetPayload<T> | null >>

    /**
     * Find the first InfoEmployee that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {InfoEmployeeFindFirstArgs} args - Arguments to find a InfoEmployee
     * @example
     * // Get one InfoEmployee
     * const infoEmployee = await prisma.infoEmployee.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findFirst<T extends InfoEmployeeFindFirstArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args?: SelectSubset<T, InfoEmployeeFindFirstArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findFirst', 'InfoEmployee'> extends True ? CheckSelect<T, Prisma__InfoEmployeeClient<InfoEmployee>, Prisma__InfoEmployeeClient<InfoEmployeeGetPayload<T>>> : CheckSelect<T, Prisma__InfoEmployeeClient<InfoEmployee | null >, Prisma__InfoEmployeeClient<InfoEmployeeGetPayload<T> | null >>

    /**
     * Find zero or more InfoEmployees that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {InfoEmployeeFindManyArgs=} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all InfoEmployees
     * const infoEmployees = await prisma.infoEmployee.findMany()
     * 
     * // Get first 10 InfoEmployees
     * const infoEmployees = await prisma.infoEmployee.findMany({ take: 10 })
     * 
     * // Only select the `idInfoEmployee`
     * const infoEmployeeWithIdInfoEmployeeOnly = await prisma.infoEmployee.findMany({ select: { idInfoEmployee: true } })
     * 
    **/
    findMany<T extends InfoEmployeeFindManyArgs>(
      args?: SelectSubset<T, InfoEmployeeFindManyArgs>
    ): CheckSelect<T, PrismaPromise<Array<InfoEmployee>>, PrismaPromise<Array<InfoEmployeeGetPayload<T>>>>

    /**
     * Create a InfoEmployee.
     * @param {InfoEmployeeCreateArgs} args - Arguments to create a InfoEmployee.
     * @example
     * // Create one InfoEmployee
     * const InfoEmployee = await prisma.infoEmployee.create({
     *   data: {
     *     // ... data to create a InfoEmployee
     *   }
     * })
     * 
    **/
    create<T extends InfoEmployeeCreateArgs>(
      args: SelectSubset<T, InfoEmployeeCreateArgs>
    ): CheckSelect<T, Prisma__InfoEmployeeClient<InfoEmployee>, Prisma__InfoEmployeeClient<InfoEmployeeGetPayload<T>>>

    /**
     * Create many InfoEmployees.
     *     @param {InfoEmployeeCreateManyArgs} args - Arguments to create many InfoEmployees.
     *     @example
     *     // Create many InfoEmployees
     *     const infoEmployee = await prisma.infoEmployee.createMany({
     *       data: {
     *         // ... provide data here
     *       }
     *     })
     *     
    **/
    createMany<T extends InfoEmployeeCreateManyArgs>(
      args?: SelectSubset<T, InfoEmployeeCreateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Delete a InfoEmployee.
     * @param {InfoEmployeeDeleteArgs} args - Arguments to delete one InfoEmployee.
     * @example
     * // Delete one InfoEmployee
     * const InfoEmployee = await prisma.infoEmployee.delete({
     *   where: {
     *     // ... filter to delete one InfoEmployee
     *   }
     * })
     * 
    **/
    delete<T extends InfoEmployeeDeleteArgs>(
      args: SelectSubset<T, InfoEmployeeDeleteArgs>
    ): CheckSelect<T, Prisma__InfoEmployeeClient<InfoEmployee>, Prisma__InfoEmployeeClient<InfoEmployeeGetPayload<T>>>

    /**
     * Update one InfoEmployee.
     * @param {InfoEmployeeUpdateArgs} args - Arguments to update one InfoEmployee.
     * @example
     * // Update one InfoEmployee
     * const infoEmployee = await prisma.infoEmployee.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    update<T extends InfoEmployeeUpdateArgs>(
      args: SelectSubset<T, InfoEmployeeUpdateArgs>
    ): CheckSelect<T, Prisma__InfoEmployeeClient<InfoEmployee>, Prisma__InfoEmployeeClient<InfoEmployeeGetPayload<T>>>

    /**
     * Delete zero or more InfoEmployees.
     * @param {InfoEmployeeDeleteManyArgs} args - Arguments to filter InfoEmployees to delete.
     * @example
     * // Delete a few InfoEmployees
     * const { count } = await prisma.infoEmployee.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
    **/
    deleteMany<T extends InfoEmployeeDeleteManyArgs>(
      args?: SelectSubset<T, InfoEmployeeDeleteManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Update zero or more InfoEmployees.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {InfoEmployeeUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many InfoEmployees
     * const infoEmployee = await prisma.infoEmployee.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    updateMany<T extends InfoEmployeeUpdateManyArgs>(
      args: SelectSubset<T, InfoEmployeeUpdateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Create or update one InfoEmployee.
     * @param {InfoEmployeeUpsertArgs} args - Arguments to update or create a InfoEmployee.
     * @example
     * // Update or create a InfoEmployee
     * const infoEmployee = await prisma.infoEmployee.upsert({
     *   create: {
     *     // ... data to create a InfoEmployee
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the InfoEmployee we want to update
     *   }
     * })
    **/
    upsert<T extends InfoEmployeeUpsertArgs>(
      args: SelectSubset<T, InfoEmployeeUpsertArgs>
    ): CheckSelect<T, Prisma__InfoEmployeeClient<InfoEmployee>, Prisma__InfoEmployeeClient<InfoEmployeeGetPayload<T>>>

    /**
     * Count the number of InfoEmployees.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {InfoEmployeeCountArgs} args - Arguments to filter InfoEmployees to count.
     * @example
     * // Count the number of InfoEmployees
     * const count = await prisma.infoEmployee.count({
     *   where: {
     *     // ... the filter for the InfoEmployees we want to count
     *   }
     * })
    **/
    count<T extends InfoEmployeeCountArgs>(
      args?: Subset<T, InfoEmployeeCountArgs>,
    ): PrismaPromise<
      T extends _Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], InfoEmployeeCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a InfoEmployee.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {InfoEmployeeAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends InfoEmployeeAggregateArgs>(args: Subset<T, InfoEmployeeAggregateArgs>): PrismaPromise<GetInfoEmployeeAggregateType<T>>

    /**
     * Group by InfoEmployee.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {InfoEmployeeGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends InfoEmployeeGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: InfoEmployeeGroupByArgs['orderBy'] }
        : { orderBy?: InfoEmployeeGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends TupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, InfoEmployeeGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetInfoEmployeeGroupByPayload<T> : PrismaPromise<InputErrors>
  }

  /**
   * The delegate class that acts as a "Promise-like" for InfoEmployee.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export class Prisma__InfoEmployeeClient<T> implements PrismaPromise<T> {
    [prisma]: true;
    private readonly _dmmf;
    private readonly _fetcher;
    private readonly _queryType;
    private readonly _rootField;
    private readonly _clientMethod;
    private readonly _args;
    private readonly _dataPath;
    private readonly _errorFormat;
    private readonly _measurePerformance?;
    private _isList;
    private _callsite;
    private _requestPromise?;
    constructor(_dmmf: runtime.DMMFClass, _fetcher: PrismaClientFetcher, _queryType: 'query' | 'mutation', _rootField: string, _clientMethod: string, _args: any, _dataPath: string[], _errorFormat: ErrorFormat, _measurePerformance?: boolean | undefined, _isList?: boolean);
    readonly [Symbol.toStringTag]: 'PrismaClientPromise';

    Country<T extends CountryArgs = {}>(args?: Subset<T, CountryArgs>): CheckSelect<T, Prisma__CountryClient<Country | null >, Prisma__CountryClient<CountryGetPayload<T> | null >>;

    Employee<T extends EmployeeFindManyArgs = {}>(args?: Subset<T, EmployeeFindManyArgs>): CheckSelect<T, PrismaPromise<Array<Employee>>, PrismaPromise<Array<EmployeeGetPayload<T>>>>;

    private get _document();
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): Promise<TResult1 | TResult2>;
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): Promise<T | TResult>;
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): Promise<T>;
  }

  // Custom InputTypes

  /**
   * InfoEmployee findUnique
   */
  export type InfoEmployeeFindUniqueArgs = {
    /**
     * Select specific fields to fetch from the InfoEmployee
     * 
    **/
    select?: InfoEmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: InfoEmployeeInclude | null
    /**
     * Throw an Error if a InfoEmployee can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which InfoEmployee to fetch.
     * 
    **/
    where: InfoEmployeeWhereUniqueInput
  }


  /**
   * InfoEmployee findFirst
   */
  export type InfoEmployeeFindFirstArgs = {
    /**
     * Select specific fields to fetch from the InfoEmployee
     * 
    **/
    select?: InfoEmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: InfoEmployeeInclude | null
    /**
     * Throw an Error if a InfoEmployee can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which InfoEmployee to fetch.
     * 
    **/
    where?: InfoEmployeeWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of InfoEmployees to fetch.
     * 
    **/
    orderBy?: Enumerable<InfoEmployeeOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for InfoEmployees.
     * 
    **/
    cursor?: InfoEmployeeWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` InfoEmployees from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` InfoEmployees.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of InfoEmployees.
     * 
    **/
    distinct?: Enumerable<InfoEmployeeScalarFieldEnum>
  }


  /**
   * InfoEmployee findMany
   */
  export type InfoEmployeeFindManyArgs = {
    /**
     * Select specific fields to fetch from the InfoEmployee
     * 
    **/
    select?: InfoEmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: InfoEmployeeInclude | null
    /**
     * Filter, which InfoEmployees to fetch.
     * 
    **/
    where?: InfoEmployeeWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of InfoEmployees to fetch.
     * 
    **/
    orderBy?: Enumerable<InfoEmployeeOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing InfoEmployees.
     * 
    **/
    cursor?: InfoEmployeeWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` InfoEmployees from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` InfoEmployees.
     * 
    **/
    skip?: number
    distinct?: Enumerable<InfoEmployeeScalarFieldEnum>
  }


  /**
   * InfoEmployee create
   */
  export type InfoEmployeeCreateArgs = {
    /**
     * Select specific fields to fetch from the InfoEmployee
     * 
    **/
    select?: InfoEmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: InfoEmployeeInclude | null
    /**
     * The data needed to create a InfoEmployee.
     * 
    **/
    data: XOR<InfoEmployeeCreateInput, InfoEmployeeUncheckedCreateInput>
  }


  /**
   * InfoEmployee createMany
   */
  export type InfoEmployeeCreateManyArgs = {
    /**
     * The data used to create many InfoEmployees.
     * 
    **/
    data: Enumerable<InfoEmployeeCreateManyInput>
  }


  /**
   * InfoEmployee update
   */
  export type InfoEmployeeUpdateArgs = {
    /**
     * Select specific fields to fetch from the InfoEmployee
     * 
    **/
    select?: InfoEmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: InfoEmployeeInclude | null
    /**
     * The data needed to update a InfoEmployee.
     * 
    **/
    data: XOR<InfoEmployeeUpdateInput, InfoEmployeeUncheckedUpdateInput>
    /**
     * Choose, which InfoEmployee to update.
     * 
    **/
    where: InfoEmployeeWhereUniqueInput
  }


  /**
   * InfoEmployee updateMany
   */
  export type InfoEmployeeUpdateManyArgs = {
    /**
     * The data used to update InfoEmployees.
     * 
    **/
    data: XOR<InfoEmployeeUpdateManyMutationInput, InfoEmployeeUncheckedUpdateManyInput>
    /**
     * Filter which InfoEmployees to update
     * 
    **/
    where?: InfoEmployeeWhereInput
  }


  /**
   * InfoEmployee upsert
   */
  export type InfoEmployeeUpsertArgs = {
    /**
     * Select specific fields to fetch from the InfoEmployee
     * 
    **/
    select?: InfoEmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: InfoEmployeeInclude | null
    /**
     * The filter to search for the InfoEmployee to update in case it exists.
     * 
    **/
    where: InfoEmployeeWhereUniqueInput
    /**
     * In case the InfoEmployee found by the `where` argument doesn't exist, create a new InfoEmployee with this data.
     * 
    **/
    create: XOR<InfoEmployeeCreateInput, InfoEmployeeUncheckedCreateInput>
    /**
     * In case the InfoEmployee was found with the provided `where` argument, update it with this data.
     * 
    **/
    update: XOR<InfoEmployeeUpdateInput, InfoEmployeeUncheckedUpdateInput>
  }


  /**
   * InfoEmployee delete
   */
  export type InfoEmployeeDeleteArgs = {
    /**
     * Select specific fields to fetch from the InfoEmployee
     * 
    **/
    select?: InfoEmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: InfoEmployeeInclude | null
    /**
     * Filter which InfoEmployee to delete.
     * 
    **/
    where: InfoEmployeeWhereUniqueInput
  }


  /**
   * InfoEmployee deleteMany
   */
  export type InfoEmployeeDeleteManyArgs = {
    /**
     * Filter which InfoEmployees to delete
     * 
    **/
    where?: InfoEmployeeWhereInput
  }


  /**
   * InfoEmployee without action
   */
  export type InfoEmployeeArgs = {
    /**
     * Select specific fields to fetch from the InfoEmployee
     * 
    **/
    select?: InfoEmployeeSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: InfoEmployeeInclude | null
  }



  /**
   * Model Job
   */


  export type AggregateJob = {
    _count: JobCountAggregateOutputType | null
    _avg: JobAvgAggregateOutputType | null
    _sum: JobSumAggregateOutputType | null
    _min: JobMinAggregateOutputType | null
    _max: JobMaxAggregateOutputType | null
  }

  export type JobAvgAggregateOutputType = {
    idJob: number | null
    idDepartment: number | null
  }

  export type JobSumAggregateOutputType = {
    idJob: number | null
    idDepartment: number | null
  }

  export type JobMinAggregateOutputType = {
    idJob: number | null
    jobName: string | null
    idDepartment: number | null
  }

  export type JobMaxAggregateOutputType = {
    idJob: number | null
    jobName: string | null
    idDepartment: number | null
  }

  export type JobCountAggregateOutputType = {
    idJob: number
    jobName: number
    idDepartment: number
    _all: number
  }


  export type JobAvgAggregateInputType = {
    idJob?: true
    idDepartment?: true
  }

  export type JobSumAggregateInputType = {
    idJob?: true
    idDepartment?: true
  }

  export type JobMinAggregateInputType = {
    idJob?: true
    jobName?: true
    idDepartment?: true
  }

  export type JobMaxAggregateInputType = {
    idJob?: true
    jobName?: true
    idDepartment?: true
  }

  export type JobCountAggregateInputType = {
    idJob?: true
    jobName?: true
    idDepartment?: true
    _all?: true
  }

  export type JobAggregateArgs = {
    /**
     * Filter which Job to aggregate.
     * 
    **/
    where?: JobWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Jobs to fetch.
     * 
    **/
    orderBy?: Enumerable<JobOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     * 
    **/
    cursor?: JobWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Jobs from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Jobs.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned Jobs
    **/
    _count?: true | JobCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: JobAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: JobSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: JobMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: JobMaxAggregateInputType
  }

  export type GetJobAggregateType<T extends JobAggregateArgs> = {
        [P in keyof T & keyof AggregateJob]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateJob[P]>
      : GetScalarType<T[P], AggregateJob[P]>
  }




  export type JobGroupByArgs = {
    where?: JobWhereInput
    orderBy?: Enumerable<JobOrderByWithAggregationInput>
    by: Array<JobScalarFieldEnum>
    having?: JobScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: JobCountAggregateInputType | true
    _avg?: JobAvgAggregateInputType
    _sum?: JobSumAggregateInputType
    _min?: JobMinAggregateInputType
    _max?: JobMaxAggregateInputType
  }


  export type JobGroupByOutputType = {
    idJob: number
    jobName: string
    idDepartment: number
    _count: JobCountAggregateOutputType | null
    _avg: JobAvgAggregateOutputType | null
    _sum: JobSumAggregateOutputType | null
    _min: JobMinAggregateOutputType | null
    _max: JobMaxAggregateOutputType | null
  }

  type GetJobGroupByPayload<T extends JobGroupByArgs> = PrismaPromise<
    Array<
      PickArray<JobGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof JobGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], JobGroupByOutputType[P]>
            : GetScalarType<T[P], JobGroupByOutputType[P]>
        }
      >
    >


  export type JobSelect = {
    idJob?: boolean
    jobName?: boolean
    idDepartment?: boolean
    Department?: boolean | DepartmentArgs
    Employee?: boolean | EmployeeFindManyArgs
    _count?: boolean | JobCountOutputTypeArgs
  }

  export type JobInclude = {
    Department?: boolean | DepartmentArgs
    Employee?: boolean | EmployeeFindManyArgs
    _count?: boolean | JobCountOutputTypeArgs
  }

  export type JobGetPayload<
    S extends boolean | null | undefined | JobArgs,
    U = keyof S
      > = S extends true
        ? Job
    : S extends undefined
    ? never
    : S extends JobArgs | JobFindManyArgs
    ?'include' extends U
    ? Job  & {
    [P in TrueKeys<S['include']>]:
        P extends 'Department' ? DepartmentGetPayload<S['include'][P]> :
        P extends 'Employee' ? Array < EmployeeGetPayload<S['include'][P]>>  :
        P extends '_count' ? JobCountOutputTypeGetPayload<S['include'][P]> :  never
  } 
    : 'select' extends U
    ? {
    [P in TrueKeys<S['select']>]:
        P extends 'Department' ? DepartmentGetPayload<S['select'][P]> :
        P extends 'Employee' ? Array < EmployeeGetPayload<S['select'][P]>>  :
        P extends '_count' ? JobCountOutputTypeGetPayload<S['select'][P]> :  P extends keyof Job ? Job[P] : never
  } 
    : Job
  : Job


  type JobCountArgs = Merge<
    Omit<JobFindManyArgs, 'select' | 'include'> & {
      select?: JobCountAggregateInputType | true
    }
  >

  export interface JobDelegate<GlobalRejectSettings> {
    /**
     * Find zero or one Job that matches the filter.
     * @param {JobFindUniqueArgs} args - Arguments to find a Job
     * @example
     * // Get one Job
     * const job = await prisma.job.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findUnique<T extends JobFindUniqueArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args: SelectSubset<T, JobFindUniqueArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findUnique', 'Job'> extends True ? CheckSelect<T, Prisma__JobClient<Job>, Prisma__JobClient<JobGetPayload<T>>> : CheckSelect<T, Prisma__JobClient<Job | null >, Prisma__JobClient<JobGetPayload<T> | null >>

    /**
     * Find the first Job that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {JobFindFirstArgs} args - Arguments to find a Job
     * @example
     * // Get one Job
     * const job = await prisma.job.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findFirst<T extends JobFindFirstArgs,  LocalRejectSettings = T["rejectOnNotFound"] extends RejectOnNotFound ? T['rejectOnNotFound'] : undefined>(
      args?: SelectSubset<T, JobFindFirstArgs>
    ): HasReject<GlobalRejectSettings, LocalRejectSettings, 'findFirst', 'Job'> extends True ? CheckSelect<T, Prisma__JobClient<Job>, Prisma__JobClient<JobGetPayload<T>>> : CheckSelect<T, Prisma__JobClient<Job | null >, Prisma__JobClient<JobGetPayload<T> | null >>

    /**
     * Find zero or more Jobs that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {JobFindManyArgs=} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all Jobs
     * const jobs = await prisma.job.findMany()
     * 
     * // Get first 10 Jobs
     * const jobs = await prisma.job.findMany({ take: 10 })
     * 
     * // Only select the `idJob`
     * const jobWithIdJobOnly = await prisma.job.findMany({ select: { idJob: true } })
     * 
    **/
    findMany<T extends JobFindManyArgs>(
      args?: SelectSubset<T, JobFindManyArgs>
    ): CheckSelect<T, PrismaPromise<Array<Job>>, PrismaPromise<Array<JobGetPayload<T>>>>

    /**
     * Create a Job.
     * @param {JobCreateArgs} args - Arguments to create a Job.
     * @example
     * // Create one Job
     * const Job = await prisma.job.create({
     *   data: {
     *     // ... data to create a Job
     *   }
     * })
     * 
    **/
    create<T extends JobCreateArgs>(
      args: SelectSubset<T, JobCreateArgs>
    ): CheckSelect<T, Prisma__JobClient<Job>, Prisma__JobClient<JobGetPayload<T>>>

    /**
     * Create many Jobs.
     *     @param {JobCreateManyArgs} args - Arguments to create many Jobs.
     *     @example
     *     // Create many Jobs
     *     const job = await prisma.job.createMany({
     *       data: {
     *         // ... provide data here
     *       }
     *     })
     *     
    **/
    createMany<T extends JobCreateManyArgs>(
      args?: SelectSubset<T, JobCreateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Delete a Job.
     * @param {JobDeleteArgs} args - Arguments to delete one Job.
     * @example
     * // Delete one Job
     * const Job = await prisma.job.delete({
     *   where: {
     *     // ... filter to delete one Job
     *   }
     * })
     * 
    **/
    delete<T extends JobDeleteArgs>(
      args: SelectSubset<T, JobDeleteArgs>
    ): CheckSelect<T, Prisma__JobClient<Job>, Prisma__JobClient<JobGetPayload<T>>>

    /**
     * Update one Job.
     * @param {JobUpdateArgs} args - Arguments to update one Job.
     * @example
     * // Update one Job
     * const job = await prisma.job.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    update<T extends JobUpdateArgs>(
      args: SelectSubset<T, JobUpdateArgs>
    ): CheckSelect<T, Prisma__JobClient<Job>, Prisma__JobClient<JobGetPayload<T>>>

    /**
     * Delete zero or more Jobs.
     * @param {JobDeleteManyArgs} args - Arguments to filter Jobs to delete.
     * @example
     * // Delete a few Jobs
     * const { count } = await prisma.job.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
    **/
    deleteMany<T extends JobDeleteManyArgs>(
      args?: SelectSubset<T, JobDeleteManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Update zero or more Jobs.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {JobUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many Jobs
     * const job = await prisma.job.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    updateMany<T extends JobUpdateManyArgs>(
      args: SelectSubset<T, JobUpdateManyArgs>
    ): PrismaPromise<BatchPayload>

    /**
     * Create or update one Job.
     * @param {JobUpsertArgs} args - Arguments to update or create a Job.
     * @example
     * // Update or create a Job
     * const job = await prisma.job.upsert({
     *   create: {
     *     // ... data to create a Job
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the Job we want to update
     *   }
     * })
    **/
    upsert<T extends JobUpsertArgs>(
      args: SelectSubset<T, JobUpsertArgs>
    ): CheckSelect<T, Prisma__JobClient<Job>, Prisma__JobClient<JobGetPayload<T>>>

    /**
     * Count the number of Jobs.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {JobCountArgs} args - Arguments to filter Jobs to count.
     * @example
     * // Count the number of Jobs
     * const count = await prisma.job.count({
     *   where: {
     *     // ... the filter for the Jobs we want to count
     *   }
     * })
    **/
    count<T extends JobCountArgs>(
      args?: Subset<T, JobCountArgs>,
    ): PrismaPromise<
      T extends _Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], JobCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a Job.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {JobAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends JobAggregateArgs>(args: Subset<T, JobAggregateArgs>): PrismaPromise<GetJobAggregateType<T>>

    /**
     * Group by Job.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {JobGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends JobGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: JobGroupByArgs['orderBy'] }
        : { orderBy?: JobGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends TupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, JobGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetJobGroupByPayload<T> : PrismaPromise<InputErrors>
  }

  /**
   * The delegate class that acts as a "Promise-like" for Job.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export class Prisma__JobClient<T> implements PrismaPromise<T> {
    [prisma]: true;
    private readonly _dmmf;
    private readonly _fetcher;
    private readonly _queryType;
    private readonly _rootField;
    private readonly _clientMethod;
    private readonly _args;
    private readonly _dataPath;
    private readonly _errorFormat;
    private readonly _measurePerformance?;
    private _isList;
    private _callsite;
    private _requestPromise?;
    constructor(_dmmf: runtime.DMMFClass, _fetcher: PrismaClientFetcher, _queryType: 'query' | 'mutation', _rootField: string, _clientMethod: string, _args: any, _dataPath: string[], _errorFormat: ErrorFormat, _measurePerformance?: boolean | undefined, _isList?: boolean);
    readonly [Symbol.toStringTag]: 'PrismaClientPromise';

    Department<T extends DepartmentArgs = {}>(args?: Subset<T, DepartmentArgs>): CheckSelect<T, Prisma__DepartmentClient<Department | null >, Prisma__DepartmentClient<DepartmentGetPayload<T> | null >>;

    Employee<T extends EmployeeFindManyArgs = {}>(args?: Subset<T, EmployeeFindManyArgs>): CheckSelect<T, PrismaPromise<Array<Employee>>, PrismaPromise<Array<EmployeeGetPayload<T>>>>;

    private get _document();
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): Promise<TResult1 | TResult2>;
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): Promise<T | TResult>;
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): Promise<T>;
  }

  // Custom InputTypes

  /**
   * Job findUnique
   */
  export type JobFindUniqueArgs = {
    /**
     * Select specific fields to fetch from the Job
     * 
    **/
    select?: JobSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: JobInclude | null
    /**
     * Throw an Error if a Job can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which Job to fetch.
     * 
    **/
    where: JobWhereUniqueInput
  }


  /**
   * Job findFirst
   */
  export type JobFindFirstArgs = {
    /**
     * Select specific fields to fetch from the Job
     * 
    **/
    select?: JobSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: JobInclude | null
    /**
     * Throw an Error if a Job can't be found
     * 
    **/
    rejectOnNotFound?: RejectOnNotFound
    /**
     * Filter, which Job to fetch.
     * 
    **/
    where?: JobWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Jobs to fetch.
     * 
    **/
    orderBy?: Enumerable<JobOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for Jobs.
     * 
    **/
    cursor?: JobWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Jobs from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Jobs.
     * 
    **/
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of Jobs.
     * 
    **/
    distinct?: Enumerable<JobScalarFieldEnum>
  }


  /**
   * Job findMany
   */
  export type JobFindManyArgs = {
    /**
     * Select specific fields to fetch from the Job
     * 
    **/
    select?: JobSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: JobInclude | null
    /**
     * Filter, which Jobs to fetch.
     * 
    **/
    where?: JobWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Jobs to fetch.
     * 
    **/
    orderBy?: Enumerable<JobOrderByWithRelationInput>
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing Jobs.
     * 
    **/
    cursor?: JobWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Jobs from the position of the cursor.
     * 
    **/
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Jobs.
     * 
    **/
    skip?: number
    distinct?: Enumerable<JobScalarFieldEnum>
  }


  /**
   * Job create
   */
  export type JobCreateArgs = {
    /**
     * Select specific fields to fetch from the Job
     * 
    **/
    select?: JobSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: JobInclude | null
    /**
     * The data needed to create a Job.
     * 
    **/
    data: XOR<JobCreateInput, JobUncheckedCreateInput>
  }


  /**
   * Job createMany
   */
  export type JobCreateManyArgs = {
    /**
     * The data used to create many Jobs.
     * 
    **/
    data: Enumerable<JobCreateManyInput>
  }


  /**
   * Job update
   */
  export type JobUpdateArgs = {
    /**
     * Select specific fields to fetch from the Job
     * 
    **/
    select?: JobSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: JobInclude | null
    /**
     * The data needed to update a Job.
     * 
    **/
    data: XOR<JobUpdateInput, JobUncheckedUpdateInput>
    /**
     * Choose, which Job to update.
     * 
    **/
    where: JobWhereUniqueInput
  }


  /**
   * Job updateMany
   */
  export type JobUpdateManyArgs = {
    /**
     * The data used to update Jobs.
     * 
    **/
    data: XOR<JobUpdateManyMutationInput, JobUncheckedUpdateManyInput>
    /**
     * Filter which Jobs to update
     * 
    **/
    where?: JobWhereInput
  }


  /**
   * Job upsert
   */
  export type JobUpsertArgs = {
    /**
     * Select specific fields to fetch from the Job
     * 
    **/
    select?: JobSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: JobInclude | null
    /**
     * The filter to search for the Job to update in case it exists.
     * 
    **/
    where: JobWhereUniqueInput
    /**
     * In case the Job found by the `where` argument doesn't exist, create a new Job with this data.
     * 
    **/
    create: XOR<JobCreateInput, JobUncheckedCreateInput>
    /**
     * In case the Job was found with the provided `where` argument, update it with this data.
     * 
    **/
    update: XOR<JobUpdateInput, JobUncheckedUpdateInput>
  }


  /**
   * Job delete
   */
  export type JobDeleteArgs = {
    /**
     * Select specific fields to fetch from the Job
     * 
    **/
    select?: JobSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: JobInclude | null
    /**
     * Filter which Job to delete.
     * 
    **/
    where: JobWhereUniqueInput
  }


  /**
   * Job deleteMany
   */
  export type JobDeleteManyArgs = {
    /**
     * Filter which Jobs to delete
     * 
    **/
    where?: JobWhereInput
  }


  /**
   * Job without action
   */
  export type JobArgs = {
    /**
     * Select specific fields to fetch from the Job
     * 
    **/
    select?: JobSelect | null
    /**
     * Choose, which related nodes to fetch as well.
     * 
    **/
    include?: JobInclude | null
  }



  /**
   * Enums
   */

  // Based on
  // https://github.com/microsoft/TypeScript/issues/3192#issuecomment-261720275

  export const CountryScalarFieldEnum: {
    idCountry: 'idCountry',
    countryName: 'countryName'
  };

  export type CountryScalarFieldEnum = (typeof CountryScalarFieldEnum)[keyof typeof CountryScalarFieldEnum]


  export const CashClubScalarFieldEnum: {
    idCashClub: 'idCashClub',
    cashType: 'cashType',
    idClub: 'idClub'
  };

  export type CashClubScalarFieldEnum = (typeof CashClubScalarFieldEnum)[keyof typeof CashClubScalarFieldEnum]


  export const DepartmentScalarFieldEnum: {
    idDepartment: 'idDepartment',
    departmentName: 'departmentName'
  };

  export type DepartmentScalarFieldEnum = (typeof DepartmentScalarFieldEnum)[keyof typeof DepartmentScalarFieldEnum]


  export const EmployeeScalarFieldEnum: {
    idEmployee: 'idEmployee',
    idInfoEmployee: 'idInfoEmployee',
    isActive: 'isActive',
    salary: 'salary',
    idJob: 'idJob',
    idEmployeeUser: 'idEmployeeUser',
    idCashClub: 'idCashClub',
    calification: 'calification'
  };

  export type EmployeeScalarFieldEnum = (typeof EmployeeScalarFieldEnum)[keyof typeof EmployeeScalarFieldEnum]


  export const EmployeeUserScalarFieldEnum: {
    idEmployeeUser: 'idEmployeeUser',
    pasword: 'pasword',
    isActive: 'isActive'
  };

  export type EmployeeUserScalarFieldEnum = (typeof EmployeeUserScalarFieldEnum)[keyof typeof EmployeeUserScalarFieldEnum]


  export const InfoEmployeeScalarFieldEnum: {
    idInfoEmployee: 'idInfoEmployee',
    peopleName: 'peopleName',
    surname: 'surname',
    email: 'email',
    phoneNumber: 'phoneNumber',
    birthDate: 'birthDate',
    employeeAddress: 'employeeAddress',
    idCountry: 'idCountry'
  };

  export type InfoEmployeeScalarFieldEnum = (typeof InfoEmployeeScalarFieldEnum)[keyof typeof InfoEmployeeScalarFieldEnum]


  export const JobScalarFieldEnum: {
    idJob: 'idJob',
    jobName: 'jobName',
    idDepartment: 'idDepartment'
  };

  export type JobScalarFieldEnum = (typeof JobScalarFieldEnum)[keyof typeof JobScalarFieldEnum]


  export const SortOrder: {
    asc: 'asc',
    desc: 'desc'
  };

  export type SortOrder = (typeof SortOrder)[keyof typeof SortOrder]


  /**
   * Deep Input Types
   */


  export type CountryWhereInput = {
    AND?: Enumerable<CountryWhereInput>
    OR?: Enumerable<CountryWhereInput>
    NOT?: Enumerable<CountryWhereInput>
    idCountry?: IntFilter | number
    countryName?: StringFilter | string
    InfoEmployee?: InfoEmployeeListRelationFilter
  }

  export type CountryOrderByWithRelationInput = {
    idCountry?: SortOrder
    countryName?: SortOrder
    InfoEmployee?: InfoEmployeeOrderByRelationAggregateInput
  }

  export type CountryWhereUniqueInput = {
    idCountry?: number
  }

  export type CountryOrderByWithAggregationInput = {
    idCountry?: SortOrder
    countryName?: SortOrder
    _count?: CountryCountOrderByAggregateInput
    _avg?: CountryAvgOrderByAggregateInput
    _max?: CountryMaxOrderByAggregateInput
    _min?: CountryMinOrderByAggregateInput
    _sum?: CountrySumOrderByAggregateInput
  }

  export type CountryScalarWhereWithAggregatesInput = {
    AND?: Enumerable<CountryScalarWhereWithAggregatesInput>
    OR?: Enumerable<CountryScalarWhereWithAggregatesInput>
    NOT?: Enumerable<CountryScalarWhereWithAggregatesInput>
    idCountry?: IntWithAggregatesFilter | number
    countryName?: StringWithAggregatesFilter | string
  }

  export type CashClubWhereInput = {
    AND?: Enumerable<CashClubWhereInput>
    OR?: Enumerable<CashClubWhereInput>
    NOT?: Enumerable<CashClubWhereInput>
    idCashClub?: IntFilter | number
    cashType?: StringFilter | string
    idClub?: IntFilter | number
    Employee?: EmployeeListRelationFilter
  }

  export type CashClubOrderByWithRelationInput = {
    idCashClub?: SortOrder
    cashType?: SortOrder
    idClub?: SortOrder
    Employee?: EmployeeOrderByRelationAggregateInput
  }

  export type CashClubWhereUniqueInput = {
    idCashClub?: number
  }

  export type CashClubOrderByWithAggregationInput = {
    idCashClub?: SortOrder
    cashType?: SortOrder
    idClub?: SortOrder
    _count?: CashClubCountOrderByAggregateInput
    _avg?: CashClubAvgOrderByAggregateInput
    _max?: CashClubMaxOrderByAggregateInput
    _min?: CashClubMinOrderByAggregateInput
    _sum?: CashClubSumOrderByAggregateInput
  }

  export type CashClubScalarWhereWithAggregatesInput = {
    AND?: Enumerable<CashClubScalarWhereWithAggregatesInput>
    OR?: Enumerable<CashClubScalarWhereWithAggregatesInput>
    NOT?: Enumerable<CashClubScalarWhereWithAggregatesInput>
    idCashClub?: IntWithAggregatesFilter | number
    cashType?: StringWithAggregatesFilter | string
    idClub?: IntWithAggregatesFilter | number
  }

  export type DepartmentWhereInput = {
    AND?: Enumerable<DepartmentWhereInput>
    OR?: Enumerable<DepartmentWhereInput>
    NOT?: Enumerable<DepartmentWhereInput>
    idDepartment?: IntFilter | number
    departmentName?: StringFilter | string
    Job?: JobListRelationFilter
  }

  export type DepartmentOrderByWithRelationInput = {
    idDepartment?: SortOrder
    departmentName?: SortOrder
    Job?: JobOrderByRelationAggregateInput
  }

  export type DepartmentWhereUniqueInput = {
    idDepartment?: number
  }

  export type DepartmentOrderByWithAggregationInput = {
    idDepartment?: SortOrder
    departmentName?: SortOrder
    _count?: DepartmentCountOrderByAggregateInput
    _avg?: DepartmentAvgOrderByAggregateInput
    _max?: DepartmentMaxOrderByAggregateInput
    _min?: DepartmentMinOrderByAggregateInput
    _sum?: DepartmentSumOrderByAggregateInput
  }

  export type DepartmentScalarWhereWithAggregatesInput = {
    AND?: Enumerable<DepartmentScalarWhereWithAggregatesInput>
    OR?: Enumerable<DepartmentScalarWhereWithAggregatesInput>
    NOT?: Enumerable<DepartmentScalarWhereWithAggregatesInput>
    idDepartment?: IntWithAggregatesFilter | number
    departmentName?: StringWithAggregatesFilter | string
  }

  export type EmployeeWhereInput = {
    AND?: Enumerable<EmployeeWhereInput>
    OR?: Enumerable<EmployeeWhereInput>
    NOT?: Enumerable<EmployeeWhereInput>
    idEmployee?: IntFilter | number
    idInfoEmployee?: IntFilter | number
    isActive?: BoolFilter | boolean
    salary?: FloatFilter | number
    idJob?: IntNullableFilter | number | null
    idEmployeeUser?: IntFilter | number
    idCashClub?: IntFilter | number
    calification?: FloatFilter | number
    CashClub?: XOR<CashClubRelationFilter, CashClubWhereInput>
    EmployeeUser?: XOR<EmployeeUserRelationFilter, EmployeeUserWhereInput>
    InfoEmployee?: XOR<InfoEmployeeRelationFilter, InfoEmployeeWhereInput>
    Job?: XOR<JobRelationFilter, JobWhereInput> | null
  }

  export type EmployeeOrderByWithRelationInput = {
    idEmployee?: SortOrder
    idInfoEmployee?: SortOrder
    isActive?: SortOrder
    salary?: SortOrder
    idJob?: SortOrder
    idEmployeeUser?: SortOrder
    idCashClub?: SortOrder
    calification?: SortOrder
    CashClub?: CashClubOrderByWithRelationInput
    EmployeeUser?: EmployeeUserOrderByWithRelationInput
    InfoEmployee?: InfoEmployeeOrderByWithRelationInput
    Job?: JobOrderByWithRelationInput
  }

  export type EmployeeWhereUniqueInput = {
    idEmployee?: number
  }

  export type EmployeeOrderByWithAggregationInput = {
    idEmployee?: SortOrder
    idInfoEmployee?: SortOrder
    isActive?: SortOrder
    salary?: SortOrder
    idJob?: SortOrder
    idEmployeeUser?: SortOrder
    idCashClub?: SortOrder
    calification?: SortOrder
    _count?: EmployeeCountOrderByAggregateInput
    _avg?: EmployeeAvgOrderByAggregateInput
    _max?: EmployeeMaxOrderByAggregateInput
    _min?: EmployeeMinOrderByAggregateInput
    _sum?: EmployeeSumOrderByAggregateInput
  }

  export type EmployeeScalarWhereWithAggregatesInput = {
    AND?: Enumerable<EmployeeScalarWhereWithAggregatesInput>
    OR?: Enumerable<EmployeeScalarWhereWithAggregatesInput>
    NOT?: Enumerable<EmployeeScalarWhereWithAggregatesInput>
    idEmployee?: IntWithAggregatesFilter | number
    idInfoEmployee?: IntWithAggregatesFilter | number
    isActive?: BoolWithAggregatesFilter | boolean
    salary?: FloatWithAggregatesFilter | number
    idJob?: IntNullableWithAggregatesFilter | number | null
    idEmployeeUser?: IntWithAggregatesFilter | number
    idCashClub?: IntWithAggregatesFilter | number
    calification?: FloatWithAggregatesFilter | number
  }

  export type EmployeeUserWhereInput = {
    AND?: Enumerable<EmployeeUserWhereInput>
    OR?: Enumerable<EmployeeUserWhereInput>
    NOT?: Enumerable<EmployeeUserWhereInput>
    idEmployeeUser?: IntFilter | number
    pasword?: BytesFilter | Buffer
    isActive?: BoolNullableFilter | boolean | null
    Employee?: EmployeeListRelationFilter
  }

  export type EmployeeUserOrderByWithRelationInput = {
    idEmployeeUser?: SortOrder
    pasword?: SortOrder
    isActive?: SortOrder
    Employee?: EmployeeOrderByRelationAggregateInput
  }

  export type EmployeeUserWhereUniqueInput = {
    idEmployeeUser?: number
  }

  export type EmployeeUserOrderByWithAggregationInput = {
    idEmployeeUser?: SortOrder
    pasword?: SortOrder
    isActive?: SortOrder
    _count?: EmployeeUserCountOrderByAggregateInput
    _avg?: EmployeeUserAvgOrderByAggregateInput
    _max?: EmployeeUserMaxOrderByAggregateInput
    _min?: EmployeeUserMinOrderByAggregateInput
    _sum?: EmployeeUserSumOrderByAggregateInput
  }

  export type EmployeeUserScalarWhereWithAggregatesInput = {
    AND?: Enumerable<EmployeeUserScalarWhereWithAggregatesInput>
    OR?: Enumerable<EmployeeUserScalarWhereWithAggregatesInput>
    NOT?: Enumerable<EmployeeUserScalarWhereWithAggregatesInput>
    idEmployeeUser?: IntWithAggregatesFilter | number
    pasword?: BytesWithAggregatesFilter | Buffer
    isActive?: BoolNullableWithAggregatesFilter | boolean | null
  }

  export type InfoEmployeeWhereInput = {
    AND?: Enumerable<InfoEmployeeWhereInput>
    OR?: Enumerable<InfoEmployeeWhereInput>
    NOT?: Enumerable<InfoEmployeeWhereInput>
    idInfoEmployee?: IntFilter | number
    peopleName?: StringFilter | string
    surname?: StringFilter | string
    email?: StringFilter | string
    phoneNumber?: IntFilter | number
    birthDate?: DateTimeFilter | Date | string
    employeeAddress?: StringFilter | string
    idCountry?: IntFilter | number
    Country?: XOR<CountryRelationFilter, CountryWhereInput>
    Employee?: EmployeeListRelationFilter
  }

  export type InfoEmployeeOrderByWithRelationInput = {
    idInfoEmployee?: SortOrder
    peopleName?: SortOrder
    surname?: SortOrder
    email?: SortOrder
    phoneNumber?: SortOrder
    birthDate?: SortOrder
    employeeAddress?: SortOrder
    idCountry?: SortOrder
    Country?: CountryOrderByWithRelationInput
    Employee?: EmployeeOrderByRelationAggregateInput
  }

  export type InfoEmployeeWhereUniqueInput = {
    idInfoEmployee?: number
  }

  export type InfoEmployeeOrderByWithAggregationInput = {
    idInfoEmployee?: SortOrder
    peopleName?: SortOrder
    surname?: SortOrder
    email?: SortOrder
    phoneNumber?: SortOrder
    birthDate?: SortOrder
    employeeAddress?: SortOrder
    idCountry?: SortOrder
    _count?: InfoEmployeeCountOrderByAggregateInput
    _avg?: InfoEmployeeAvgOrderByAggregateInput
    _max?: InfoEmployeeMaxOrderByAggregateInput
    _min?: InfoEmployeeMinOrderByAggregateInput
    _sum?: InfoEmployeeSumOrderByAggregateInput
  }

  export type InfoEmployeeScalarWhereWithAggregatesInput = {
    AND?: Enumerable<InfoEmployeeScalarWhereWithAggregatesInput>
    OR?: Enumerable<InfoEmployeeScalarWhereWithAggregatesInput>
    NOT?: Enumerable<InfoEmployeeScalarWhereWithAggregatesInput>
    idInfoEmployee?: IntWithAggregatesFilter | number
    peopleName?: StringWithAggregatesFilter | string
    surname?: StringWithAggregatesFilter | string
    email?: StringWithAggregatesFilter | string
    phoneNumber?: IntWithAggregatesFilter | number
    birthDate?: DateTimeWithAggregatesFilter | Date | string
    employeeAddress?: StringWithAggregatesFilter | string
    idCountry?: IntWithAggregatesFilter | number
  }

  export type JobWhereInput = {
    AND?: Enumerable<JobWhereInput>
    OR?: Enumerable<JobWhereInput>
    NOT?: Enumerable<JobWhereInput>
    idJob?: IntFilter | number
    jobName?: StringFilter | string
    idDepartment?: IntFilter | number
    Department?: XOR<DepartmentRelationFilter, DepartmentWhereInput>
    Employee?: EmployeeListRelationFilter
  }

  export type JobOrderByWithRelationInput = {
    idJob?: SortOrder
    jobName?: SortOrder
    idDepartment?: SortOrder
    Department?: DepartmentOrderByWithRelationInput
    Employee?: EmployeeOrderByRelationAggregateInput
  }

  export type JobWhereUniqueInput = {
    idJob?: number
  }

  export type JobOrderByWithAggregationInput = {
    idJob?: SortOrder
    jobName?: SortOrder
    idDepartment?: SortOrder
    _count?: JobCountOrderByAggregateInput
    _avg?: JobAvgOrderByAggregateInput
    _max?: JobMaxOrderByAggregateInput
    _min?: JobMinOrderByAggregateInput
    _sum?: JobSumOrderByAggregateInput
  }

  export type JobScalarWhereWithAggregatesInput = {
    AND?: Enumerable<JobScalarWhereWithAggregatesInput>
    OR?: Enumerable<JobScalarWhereWithAggregatesInput>
    NOT?: Enumerable<JobScalarWhereWithAggregatesInput>
    idJob?: IntWithAggregatesFilter | number
    jobName?: StringWithAggregatesFilter | string
    idDepartment?: IntWithAggregatesFilter | number
  }

  export type CountryCreateInput = {
    idCountry: number
    countryName: string
    InfoEmployee?: InfoEmployeeCreateNestedManyWithoutCountryInput
  }

  export type CountryUncheckedCreateInput = {
    idCountry: number
    countryName: string
    InfoEmployee?: InfoEmployeeUncheckedCreateNestedManyWithoutCountryInput
  }

  export type CountryUpdateInput = {
    idCountry?: IntFieldUpdateOperationsInput | number
    countryName?: StringFieldUpdateOperationsInput | string
    InfoEmployee?: InfoEmployeeUpdateManyWithoutCountryInput
  }

  export type CountryUncheckedUpdateInput = {
    idCountry?: IntFieldUpdateOperationsInput | number
    countryName?: StringFieldUpdateOperationsInput | string
    InfoEmployee?: InfoEmployeeUncheckedUpdateManyWithoutCountryInput
  }

  export type CountryCreateManyInput = {
    idCountry: number
    countryName: string
  }

  export type CountryUpdateManyMutationInput = {
    idCountry?: IntFieldUpdateOperationsInput | number
    countryName?: StringFieldUpdateOperationsInput | string
  }

  export type CountryUncheckedUpdateManyInput = {
    idCountry?: IntFieldUpdateOperationsInput | number
    countryName?: StringFieldUpdateOperationsInput | string
  }

  export type CashClubCreateInput = {
    cashType: string
    idClub: number
    Employee?: EmployeeCreateNestedManyWithoutCashClubInput
  }

  export type CashClubUncheckedCreateInput = {
    idCashClub?: number
    cashType: string
    idClub: number
    Employee?: EmployeeUncheckedCreateNestedManyWithoutCashClubInput
  }

  export type CashClubUpdateInput = {
    cashType?: StringFieldUpdateOperationsInput | string
    idClub?: IntFieldUpdateOperationsInput | number
    Employee?: EmployeeUpdateManyWithoutCashClubInput
  }

  export type CashClubUncheckedUpdateInput = {
    idCashClub?: IntFieldUpdateOperationsInput | number
    cashType?: StringFieldUpdateOperationsInput | string
    idClub?: IntFieldUpdateOperationsInput | number
    Employee?: EmployeeUncheckedUpdateManyWithoutCashClubInput
  }

  export type CashClubCreateManyInput = {
    cashType: string
    idClub: number
  }

  export type CashClubUpdateManyMutationInput = {
    cashType?: StringFieldUpdateOperationsInput | string
    idClub?: IntFieldUpdateOperationsInput | number
  }

  export type CashClubUncheckedUpdateManyInput = {
    idCashClub?: IntFieldUpdateOperationsInput | number
    cashType?: StringFieldUpdateOperationsInput | string
    idClub?: IntFieldUpdateOperationsInput | number
  }

  export type DepartmentCreateInput = {
    departmentName: string
    Job?: JobCreateNestedManyWithoutDepartmentInput
  }

  export type DepartmentUncheckedCreateInput = {
    idDepartment?: number
    departmentName: string
    Job?: JobUncheckedCreateNestedManyWithoutDepartmentInput
  }

  export type DepartmentUpdateInput = {
    departmentName?: StringFieldUpdateOperationsInput | string
    Job?: JobUpdateManyWithoutDepartmentInput
  }

  export type DepartmentUncheckedUpdateInput = {
    idDepartment?: IntFieldUpdateOperationsInput | number
    departmentName?: StringFieldUpdateOperationsInput | string
    Job?: JobUncheckedUpdateManyWithoutDepartmentInput
  }

  export type DepartmentCreateManyInput = {
    departmentName: string
  }

  export type DepartmentUpdateManyMutationInput = {
    departmentName?: StringFieldUpdateOperationsInput | string
  }

  export type DepartmentUncheckedUpdateManyInput = {
    idDepartment?: IntFieldUpdateOperationsInput | number
    departmentName?: StringFieldUpdateOperationsInput | string
  }

  export type EmployeeCreateInput = {
    idEmployee: number
    isActive?: boolean
    salary: number
    calification?: number
    CashClub: CashClubCreateNestedOneWithoutEmployeeInput
    EmployeeUser: EmployeeUserCreateNestedOneWithoutEmployeeInput
    InfoEmployee: InfoEmployeeCreateNestedOneWithoutEmployeeInput
    Job?: JobCreateNestedOneWithoutEmployeeInput
  }

  export type EmployeeUncheckedCreateInput = {
    idEmployee: number
    idInfoEmployee: number
    isActive?: boolean
    salary: number
    idJob?: number | null
    idEmployeeUser: number
    idCashClub: number
    calification?: number
  }

  export type EmployeeUpdateInput = {
    idEmployee?: IntFieldUpdateOperationsInput | number
    isActive?: BoolFieldUpdateOperationsInput | boolean
    salary?: FloatFieldUpdateOperationsInput | number
    calification?: FloatFieldUpdateOperationsInput | number
    CashClub?: CashClubUpdateOneRequiredWithoutEmployeeInput
    EmployeeUser?: EmployeeUserUpdateOneRequiredWithoutEmployeeInput
    InfoEmployee?: InfoEmployeeUpdateOneRequiredWithoutEmployeeInput
    Job?: JobUpdateOneWithoutEmployeeInput
  }

  export type EmployeeUncheckedUpdateInput = {
    idEmployee?: IntFieldUpdateOperationsInput | number
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    isActive?: BoolFieldUpdateOperationsInput | boolean
    salary?: FloatFieldUpdateOperationsInput | number
    idJob?: NullableIntFieldUpdateOperationsInput | number | null
    idEmployeeUser?: IntFieldUpdateOperationsInput | number
    idCashClub?: IntFieldUpdateOperationsInput | number
    calification?: FloatFieldUpdateOperationsInput | number
  }

  export type EmployeeCreateManyInput = {
    idEmployee: number
    idInfoEmployee: number
    isActive?: boolean
    salary: number
    idJob?: number | null
    idEmployeeUser: number
    idCashClub: number
    calification?: number
  }

  export type EmployeeUpdateManyMutationInput = {
    idEmployee?: IntFieldUpdateOperationsInput | number
    isActive?: BoolFieldUpdateOperationsInput | boolean
    salary?: FloatFieldUpdateOperationsInput | number
    calification?: FloatFieldUpdateOperationsInput | number
  }

  export type EmployeeUncheckedUpdateManyInput = {
    idEmployee?: IntFieldUpdateOperationsInput | number
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    isActive?: BoolFieldUpdateOperationsInput | boolean
    salary?: FloatFieldUpdateOperationsInput | number
    idJob?: NullableIntFieldUpdateOperationsInput | number | null
    idEmployeeUser?: IntFieldUpdateOperationsInput | number
    idCashClub?: IntFieldUpdateOperationsInput | number
    calification?: FloatFieldUpdateOperationsInput | number
  }

  export type EmployeeUserCreateInput = {
    idEmployeeUser: number
    pasword: Buffer
    isActive?: boolean | null
    Employee?: EmployeeCreateNestedManyWithoutEmployeeUserInput
  }

  export type EmployeeUserUncheckedCreateInput = {
    idEmployeeUser: number
    pasword: Buffer
    isActive?: boolean | null
    Employee?: EmployeeUncheckedCreateNestedManyWithoutEmployeeUserInput
  }

  export type EmployeeUserUpdateInput = {
    idEmployeeUser?: IntFieldUpdateOperationsInput | number
    pasword?: BytesFieldUpdateOperationsInput | Buffer
    isActive?: NullableBoolFieldUpdateOperationsInput | boolean | null
    Employee?: EmployeeUpdateManyWithoutEmployeeUserInput
  }

  export type EmployeeUserUncheckedUpdateInput = {
    idEmployeeUser?: IntFieldUpdateOperationsInput | number
    pasword?: BytesFieldUpdateOperationsInput | Buffer
    isActive?: NullableBoolFieldUpdateOperationsInput | boolean | null
    Employee?: EmployeeUncheckedUpdateManyWithoutEmployeeUserInput
  }

  export type EmployeeUserCreateManyInput = {
    idEmployeeUser: number
    pasword: Buffer
    isActive?: boolean | null
  }

  export type EmployeeUserUpdateManyMutationInput = {
    idEmployeeUser?: IntFieldUpdateOperationsInput | number
    pasword?: BytesFieldUpdateOperationsInput | Buffer
    isActive?: NullableBoolFieldUpdateOperationsInput | boolean | null
  }

  export type EmployeeUserUncheckedUpdateManyInput = {
    idEmployeeUser?: IntFieldUpdateOperationsInput | number
    pasword?: BytesFieldUpdateOperationsInput | Buffer
    isActive?: NullableBoolFieldUpdateOperationsInput | boolean | null
  }

  export type InfoEmployeeCreateInput = {
    idInfoEmployee: number
    peopleName: string
    surname: string
    email: string
    phoneNumber: number
    birthDate: Date | string
    employeeAddress: string
    Country: CountryCreateNestedOneWithoutInfoEmployeeInput
    Employee?: EmployeeCreateNestedManyWithoutInfoEmployeeInput
  }

  export type InfoEmployeeUncheckedCreateInput = {
    idInfoEmployee: number
    peopleName: string
    surname: string
    email: string
    phoneNumber: number
    birthDate: Date | string
    employeeAddress: string
    idCountry: number
    Employee?: EmployeeUncheckedCreateNestedManyWithoutInfoEmployeeInput
  }

  export type InfoEmployeeUpdateInput = {
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    peopleName?: StringFieldUpdateOperationsInput | string
    surname?: StringFieldUpdateOperationsInput | string
    email?: StringFieldUpdateOperationsInput | string
    phoneNumber?: IntFieldUpdateOperationsInput | number
    birthDate?: DateTimeFieldUpdateOperationsInput | Date | string
    employeeAddress?: StringFieldUpdateOperationsInput | string
    Country?: CountryUpdateOneRequiredWithoutInfoEmployeeInput
    Employee?: EmployeeUpdateManyWithoutInfoEmployeeInput
  }

  export type InfoEmployeeUncheckedUpdateInput = {
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    peopleName?: StringFieldUpdateOperationsInput | string
    surname?: StringFieldUpdateOperationsInput | string
    email?: StringFieldUpdateOperationsInput | string
    phoneNumber?: IntFieldUpdateOperationsInput | number
    birthDate?: DateTimeFieldUpdateOperationsInput | Date | string
    employeeAddress?: StringFieldUpdateOperationsInput | string
    idCountry?: IntFieldUpdateOperationsInput | number
    Employee?: EmployeeUncheckedUpdateManyWithoutInfoEmployeeInput
  }

  export type InfoEmployeeCreateManyInput = {
    idInfoEmployee: number
    peopleName: string
    surname: string
    email: string
    phoneNumber: number
    birthDate: Date | string
    employeeAddress: string
    idCountry: number
  }

  export type InfoEmployeeUpdateManyMutationInput = {
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    peopleName?: StringFieldUpdateOperationsInput | string
    surname?: StringFieldUpdateOperationsInput | string
    email?: StringFieldUpdateOperationsInput | string
    phoneNumber?: IntFieldUpdateOperationsInput | number
    birthDate?: DateTimeFieldUpdateOperationsInput | Date | string
    employeeAddress?: StringFieldUpdateOperationsInput | string
  }

  export type InfoEmployeeUncheckedUpdateManyInput = {
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    peopleName?: StringFieldUpdateOperationsInput | string
    surname?: StringFieldUpdateOperationsInput | string
    email?: StringFieldUpdateOperationsInput | string
    phoneNumber?: IntFieldUpdateOperationsInput | number
    birthDate?: DateTimeFieldUpdateOperationsInput | Date | string
    employeeAddress?: StringFieldUpdateOperationsInput | string
    idCountry?: IntFieldUpdateOperationsInput | number
  }

  export type JobCreateInput = {
    jobName: string
    Department: DepartmentCreateNestedOneWithoutJobInput
    Employee?: EmployeeCreateNestedManyWithoutJobInput
  }

  export type JobUncheckedCreateInput = {
    idJob?: number
    jobName: string
    idDepartment: number
    Employee?: EmployeeUncheckedCreateNestedManyWithoutJobInput
  }

  export type JobUpdateInput = {
    jobName?: StringFieldUpdateOperationsInput | string
    Department?: DepartmentUpdateOneRequiredWithoutJobInput
    Employee?: EmployeeUpdateManyWithoutJobInput
  }

  export type JobUncheckedUpdateInput = {
    idJob?: IntFieldUpdateOperationsInput | number
    jobName?: StringFieldUpdateOperationsInput | string
    idDepartment?: IntFieldUpdateOperationsInput | number
    Employee?: EmployeeUncheckedUpdateManyWithoutJobInput
  }

  export type JobCreateManyInput = {
    jobName: string
    idDepartment: number
  }

  export type JobUpdateManyMutationInput = {
    jobName?: StringFieldUpdateOperationsInput | string
  }

  export type JobUncheckedUpdateManyInput = {
    idJob?: IntFieldUpdateOperationsInput | number
    jobName?: StringFieldUpdateOperationsInput | string
    idDepartment?: IntFieldUpdateOperationsInput | number
  }

  export type IntFilter = {
    equals?: number
    in?: Enumerable<number>
    notIn?: Enumerable<number>
    lt?: number
    lte?: number
    gt?: number
    gte?: number
    not?: NestedIntFilter | number
  }

  export type StringFilter = {
    equals?: string
    in?: Enumerable<string>
    notIn?: Enumerable<string>
    lt?: string
    lte?: string
    gt?: string
    gte?: string
    contains?: string
    startsWith?: string
    endsWith?: string
    not?: NestedStringFilter | string
  }

  export type InfoEmployeeListRelationFilter = {
    every?: InfoEmployeeWhereInput
    some?: InfoEmployeeWhereInput
    none?: InfoEmployeeWhereInput
  }

  export type InfoEmployeeOrderByRelationAggregateInput = {
    _count?: SortOrder
  }

  export type CountryCountOrderByAggregateInput = {
    idCountry?: SortOrder
    countryName?: SortOrder
  }

  export type CountryAvgOrderByAggregateInput = {
    idCountry?: SortOrder
  }

  export type CountryMaxOrderByAggregateInput = {
    idCountry?: SortOrder
    countryName?: SortOrder
  }

  export type CountryMinOrderByAggregateInput = {
    idCountry?: SortOrder
    countryName?: SortOrder
  }

  export type CountrySumOrderByAggregateInput = {
    idCountry?: SortOrder
  }

  export type IntWithAggregatesFilter = {
    equals?: number
    in?: Enumerable<number>
    notIn?: Enumerable<number>
    lt?: number
    lte?: number
    gt?: number
    gte?: number
    not?: NestedIntWithAggregatesFilter | number
    _count?: NestedIntFilter
    _avg?: NestedFloatFilter
    _sum?: NestedIntFilter
    _min?: NestedIntFilter
    _max?: NestedIntFilter
  }

  export type StringWithAggregatesFilter = {
    equals?: string
    in?: Enumerable<string>
    notIn?: Enumerable<string>
    lt?: string
    lte?: string
    gt?: string
    gte?: string
    contains?: string
    startsWith?: string
    endsWith?: string
    not?: NestedStringWithAggregatesFilter | string
    _count?: NestedIntFilter
    _min?: NestedStringFilter
    _max?: NestedStringFilter
  }

  export type EmployeeListRelationFilter = {
    every?: EmployeeWhereInput
    some?: EmployeeWhereInput
    none?: EmployeeWhereInput
  }

  export type EmployeeOrderByRelationAggregateInput = {
    _count?: SortOrder
  }

  export type CashClubCountOrderByAggregateInput = {
    idCashClub?: SortOrder
    cashType?: SortOrder
    idClub?: SortOrder
  }

  export type CashClubAvgOrderByAggregateInput = {
    idCashClub?: SortOrder
    idClub?: SortOrder
  }

  export type CashClubMaxOrderByAggregateInput = {
    idCashClub?: SortOrder
    cashType?: SortOrder
    idClub?: SortOrder
  }

  export type CashClubMinOrderByAggregateInput = {
    idCashClub?: SortOrder
    cashType?: SortOrder
    idClub?: SortOrder
  }

  export type CashClubSumOrderByAggregateInput = {
    idCashClub?: SortOrder
    idClub?: SortOrder
  }

  export type JobListRelationFilter = {
    every?: JobWhereInput
    some?: JobWhereInput
    none?: JobWhereInput
  }

  export type JobOrderByRelationAggregateInput = {
    _count?: SortOrder
  }

  export type DepartmentCountOrderByAggregateInput = {
    idDepartment?: SortOrder
    departmentName?: SortOrder
  }

  export type DepartmentAvgOrderByAggregateInput = {
    idDepartment?: SortOrder
  }

  export type DepartmentMaxOrderByAggregateInput = {
    idDepartment?: SortOrder
    departmentName?: SortOrder
  }

  export type DepartmentMinOrderByAggregateInput = {
    idDepartment?: SortOrder
    departmentName?: SortOrder
  }

  export type DepartmentSumOrderByAggregateInput = {
    idDepartment?: SortOrder
  }

  export type BoolFilter = {
    equals?: boolean
    not?: NestedBoolFilter | boolean
  }

  export type FloatFilter = {
    equals?: number
    in?: Enumerable<number>
    notIn?: Enumerable<number>
    lt?: number
    lte?: number
    gt?: number
    gte?: number
    not?: NestedFloatFilter | number
  }

  export type IntNullableFilter = {
    equals?: number | null
    in?: Enumerable<number> | null
    notIn?: Enumerable<number> | null
    lt?: number
    lte?: number
    gt?: number
    gte?: number
    not?: NestedIntNullableFilter | number | null
  }

  export type CashClubRelationFilter = {
    is?: CashClubWhereInput
    isNot?: CashClubWhereInput
  }

  export type EmployeeUserRelationFilter = {
    is?: EmployeeUserWhereInput
    isNot?: EmployeeUserWhereInput
  }

  export type InfoEmployeeRelationFilter = {
    is?: InfoEmployeeWhereInput
    isNot?: InfoEmployeeWhereInput
  }

  export type JobRelationFilter = {
    is?: JobWhereInput | null
    isNot?: JobWhereInput | null
  }

  export type EmployeeCountOrderByAggregateInput = {
    idEmployee?: SortOrder
    idInfoEmployee?: SortOrder
    isActive?: SortOrder
    salary?: SortOrder
    idJob?: SortOrder
    idEmployeeUser?: SortOrder
    idCashClub?: SortOrder
    calification?: SortOrder
  }

  export type EmployeeAvgOrderByAggregateInput = {
    idEmployee?: SortOrder
    idInfoEmployee?: SortOrder
    salary?: SortOrder
    idJob?: SortOrder
    idEmployeeUser?: SortOrder
    idCashClub?: SortOrder
    calification?: SortOrder
  }

  export type EmployeeMaxOrderByAggregateInput = {
    idEmployee?: SortOrder
    idInfoEmployee?: SortOrder
    isActive?: SortOrder
    salary?: SortOrder
    idJob?: SortOrder
    idEmployeeUser?: SortOrder
    idCashClub?: SortOrder
    calification?: SortOrder
  }

  export type EmployeeMinOrderByAggregateInput = {
    idEmployee?: SortOrder
    idInfoEmployee?: SortOrder
    isActive?: SortOrder
    salary?: SortOrder
    idJob?: SortOrder
    idEmployeeUser?: SortOrder
    idCashClub?: SortOrder
    calification?: SortOrder
  }

  export type EmployeeSumOrderByAggregateInput = {
    idEmployee?: SortOrder
    idInfoEmployee?: SortOrder
    salary?: SortOrder
    idJob?: SortOrder
    idEmployeeUser?: SortOrder
    idCashClub?: SortOrder
    calification?: SortOrder
  }

  export type BoolWithAggregatesFilter = {
    equals?: boolean
    not?: NestedBoolWithAggregatesFilter | boolean
    _count?: NestedIntFilter
    _min?: NestedBoolFilter
    _max?: NestedBoolFilter
  }

  export type FloatWithAggregatesFilter = {
    equals?: number
    in?: Enumerable<number>
    notIn?: Enumerable<number>
    lt?: number
    lte?: number
    gt?: number
    gte?: number
    not?: NestedFloatWithAggregatesFilter | number
    _count?: NestedIntFilter
    _avg?: NestedFloatFilter
    _sum?: NestedFloatFilter
    _min?: NestedFloatFilter
    _max?: NestedFloatFilter
  }

  export type IntNullableWithAggregatesFilter = {
    equals?: number | null
    in?: Enumerable<number> | null
    notIn?: Enumerable<number> | null
    lt?: number
    lte?: number
    gt?: number
    gte?: number
    not?: NestedIntNullableWithAggregatesFilter | number | null
    _count?: NestedIntNullableFilter
    _avg?: NestedFloatNullableFilter
    _sum?: NestedIntNullableFilter
    _min?: NestedIntNullableFilter
    _max?: NestedIntNullableFilter
  }

  export type BytesFilter = {
    equals?: Buffer
    in?: Enumerable<Buffer>
    notIn?: Enumerable<Buffer>
    not?: NestedBytesFilter | Buffer
  }

  export type BoolNullableFilter = {
    equals?: boolean | null
    not?: NestedBoolNullableFilter | boolean | null
  }

  export type EmployeeUserCountOrderByAggregateInput = {
    idEmployeeUser?: SortOrder
    pasword?: SortOrder
    isActive?: SortOrder
  }

  export type EmployeeUserAvgOrderByAggregateInput = {
    idEmployeeUser?: SortOrder
  }

  export type EmployeeUserMaxOrderByAggregateInput = {
    idEmployeeUser?: SortOrder
    pasword?: SortOrder
    isActive?: SortOrder
  }

  export type EmployeeUserMinOrderByAggregateInput = {
    idEmployeeUser?: SortOrder
    pasword?: SortOrder
    isActive?: SortOrder
  }

  export type EmployeeUserSumOrderByAggregateInput = {
    idEmployeeUser?: SortOrder
  }

  export type BytesWithAggregatesFilter = {
    equals?: Buffer
    in?: Enumerable<Buffer>
    notIn?: Enumerable<Buffer>
    not?: NestedBytesWithAggregatesFilter | Buffer
    _count?: NestedIntFilter
    _min?: NestedBytesFilter
    _max?: NestedBytesFilter
  }

  export type BoolNullableWithAggregatesFilter = {
    equals?: boolean | null
    not?: NestedBoolNullableWithAggregatesFilter | boolean | null
    _count?: NestedIntNullableFilter
    _min?: NestedBoolNullableFilter
    _max?: NestedBoolNullableFilter
  }

  export type DateTimeFilter = {
    equals?: Date | string
    in?: Enumerable<Date> | Enumerable<string>
    notIn?: Enumerable<Date> | Enumerable<string>
    lt?: Date | string
    lte?: Date | string
    gt?: Date | string
    gte?: Date | string
    not?: NestedDateTimeFilter | Date | string
  }

  export type CountryRelationFilter = {
    is?: CountryWhereInput
    isNot?: CountryWhereInput
  }

  export type InfoEmployeeCountOrderByAggregateInput = {
    idInfoEmployee?: SortOrder
    peopleName?: SortOrder
    surname?: SortOrder
    email?: SortOrder
    phoneNumber?: SortOrder
    birthDate?: SortOrder
    employeeAddress?: SortOrder
    idCountry?: SortOrder
  }

  export type InfoEmployeeAvgOrderByAggregateInput = {
    idInfoEmployee?: SortOrder
    phoneNumber?: SortOrder
    idCountry?: SortOrder
  }

  export type InfoEmployeeMaxOrderByAggregateInput = {
    idInfoEmployee?: SortOrder
    peopleName?: SortOrder
    surname?: SortOrder
    email?: SortOrder
    phoneNumber?: SortOrder
    birthDate?: SortOrder
    employeeAddress?: SortOrder
    idCountry?: SortOrder
  }

  export type InfoEmployeeMinOrderByAggregateInput = {
    idInfoEmployee?: SortOrder
    peopleName?: SortOrder
    surname?: SortOrder
    email?: SortOrder
    phoneNumber?: SortOrder
    birthDate?: SortOrder
    employeeAddress?: SortOrder
    idCountry?: SortOrder
  }

  export type InfoEmployeeSumOrderByAggregateInput = {
    idInfoEmployee?: SortOrder
    phoneNumber?: SortOrder
    idCountry?: SortOrder
  }

  export type DateTimeWithAggregatesFilter = {
    equals?: Date | string
    in?: Enumerable<Date> | Enumerable<string>
    notIn?: Enumerable<Date> | Enumerable<string>
    lt?: Date | string
    lte?: Date | string
    gt?: Date | string
    gte?: Date | string
    not?: NestedDateTimeWithAggregatesFilter | Date | string
    _count?: NestedIntFilter
    _min?: NestedDateTimeFilter
    _max?: NestedDateTimeFilter
  }

  export type DepartmentRelationFilter = {
    is?: DepartmentWhereInput
    isNot?: DepartmentWhereInput
  }

  export type JobCountOrderByAggregateInput = {
    idJob?: SortOrder
    jobName?: SortOrder
    idDepartment?: SortOrder
  }

  export type JobAvgOrderByAggregateInput = {
    idJob?: SortOrder
    idDepartment?: SortOrder
  }

  export type JobMaxOrderByAggregateInput = {
    idJob?: SortOrder
    jobName?: SortOrder
    idDepartment?: SortOrder
  }

  export type JobMinOrderByAggregateInput = {
    idJob?: SortOrder
    jobName?: SortOrder
    idDepartment?: SortOrder
  }

  export type JobSumOrderByAggregateInput = {
    idJob?: SortOrder
    idDepartment?: SortOrder
  }

  export type InfoEmployeeCreateNestedManyWithoutCountryInput = {
    create?: XOR<Enumerable<InfoEmployeeCreateWithoutCountryInput>, Enumerable<InfoEmployeeUncheckedCreateWithoutCountryInput>>
    connectOrCreate?: Enumerable<InfoEmployeeCreateOrConnectWithoutCountryInput>
    createMany?: InfoEmployeeCreateManyCountryInputEnvelope
    connect?: Enumerable<InfoEmployeeWhereUniqueInput>
  }

  export type InfoEmployeeUncheckedCreateNestedManyWithoutCountryInput = {
    create?: XOR<Enumerable<InfoEmployeeCreateWithoutCountryInput>, Enumerable<InfoEmployeeUncheckedCreateWithoutCountryInput>>
    connectOrCreate?: Enumerable<InfoEmployeeCreateOrConnectWithoutCountryInput>
    createMany?: InfoEmployeeCreateManyCountryInputEnvelope
    connect?: Enumerable<InfoEmployeeWhereUniqueInput>
  }

  export type IntFieldUpdateOperationsInput = {
    set?: number
    increment?: number
    decrement?: number
    multiply?: number
    divide?: number
  }

  export type StringFieldUpdateOperationsInput = {
    set?: string
  }

  export type InfoEmployeeUpdateManyWithoutCountryInput = {
    create?: XOR<Enumerable<InfoEmployeeCreateWithoutCountryInput>, Enumerable<InfoEmployeeUncheckedCreateWithoutCountryInput>>
    connectOrCreate?: Enumerable<InfoEmployeeCreateOrConnectWithoutCountryInput>
    upsert?: Enumerable<InfoEmployeeUpsertWithWhereUniqueWithoutCountryInput>
    createMany?: InfoEmployeeCreateManyCountryInputEnvelope
    set?: Enumerable<InfoEmployeeWhereUniqueInput>
    disconnect?: Enumerable<InfoEmployeeWhereUniqueInput>
    delete?: Enumerable<InfoEmployeeWhereUniqueInput>
    connect?: Enumerable<InfoEmployeeWhereUniqueInput>
    update?: Enumerable<InfoEmployeeUpdateWithWhereUniqueWithoutCountryInput>
    updateMany?: Enumerable<InfoEmployeeUpdateManyWithWhereWithoutCountryInput>
    deleteMany?: Enumerable<InfoEmployeeScalarWhereInput>
  }

  export type InfoEmployeeUncheckedUpdateManyWithoutCountryInput = {
    create?: XOR<Enumerable<InfoEmployeeCreateWithoutCountryInput>, Enumerable<InfoEmployeeUncheckedCreateWithoutCountryInput>>
    connectOrCreate?: Enumerable<InfoEmployeeCreateOrConnectWithoutCountryInput>
    upsert?: Enumerable<InfoEmployeeUpsertWithWhereUniqueWithoutCountryInput>
    createMany?: InfoEmployeeCreateManyCountryInputEnvelope
    set?: Enumerable<InfoEmployeeWhereUniqueInput>
    disconnect?: Enumerable<InfoEmployeeWhereUniqueInput>
    delete?: Enumerable<InfoEmployeeWhereUniqueInput>
    connect?: Enumerable<InfoEmployeeWhereUniqueInput>
    update?: Enumerable<InfoEmployeeUpdateWithWhereUniqueWithoutCountryInput>
    updateMany?: Enumerable<InfoEmployeeUpdateManyWithWhereWithoutCountryInput>
    deleteMany?: Enumerable<InfoEmployeeScalarWhereInput>
  }

  export type EmployeeCreateNestedManyWithoutCashClubInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutCashClubInput>, Enumerable<EmployeeUncheckedCreateWithoutCashClubInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutCashClubInput>
    createMany?: EmployeeCreateManyCashClubInputEnvelope
    connect?: Enumerable<EmployeeWhereUniqueInput>
  }

  export type EmployeeUncheckedCreateNestedManyWithoutCashClubInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutCashClubInput>, Enumerable<EmployeeUncheckedCreateWithoutCashClubInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutCashClubInput>
    createMany?: EmployeeCreateManyCashClubInputEnvelope
    connect?: Enumerable<EmployeeWhereUniqueInput>
  }

  export type EmployeeUpdateManyWithoutCashClubInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutCashClubInput>, Enumerable<EmployeeUncheckedCreateWithoutCashClubInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutCashClubInput>
    upsert?: Enumerable<EmployeeUpsertWithWhereUniqueWithoutCashClubInput>
    createMany?: EmployeeCreateManyCashClubInputEnvelope
    set?: Enumerable<EmployeeWhereUniqueInput>
    disconnect?: Enumerable<EmployeeWhereUniqueInput>
    delete?: Enumerable<EmployeeWhereUniqueInput>
    connect?: Enumerable<EmployeeWhereUniqueInput>
    update?: Enumerable<EmployeeUpdateWithWhereUniqueWithoutCashClubInput>
    updateMany?: Enumerable<EmployeeUpdateManyWithWhereWithoutCashClubInput>
    deleteMany?: Enumerable<EmployeeScalarWhereInput>
  }

  export type EmployeeUncheckedUpdateManyWithoutCashClubInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutCashClubInput>, Enumerable<EmployeeUncheckedCreateWithoutCashClubInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutCashClubInput>
    upsert?: Enumerable<EmployeeUpsertWithWhereUniqueWithoutCashClubInput>
    createMany?: EmployeeCreateManyCashClubInputEnvelope
    set?: Enumerable<EmployeeWhereUniqueInput>
    disconnect?: Enumerable<EmployeeWhereUniqueInput>
    delete?: Enumerable<EmployeeWhereUniqueInput>
    connect?: Enumerable<EmployeeWhereUniqueInput>
    update?: Enumerable<EmployeeUpdateWithWhereUniqueWithoutCashClubInput>
    updateMany?: Enumerable<EmployeeUpdateManyWithWhereWithoutCashClubInput>
    deleteMany?: Enumerable<EmployeeScalarWhereInput>
  }

  export type JobCreateNestedManyWithoutDepartmentInput = {
    create?: XOR<Enumerable<JobCreateWithoutDepartmentInput>, Enumerable<JobUncheckedCreateWithoutDepartmentInput>>
    connectOrCreate?: Enumerable<JobCreateOrConnectWithoutDepartmentInput>
    createMany?: JobCreateManyDepartmentInputEnvelope
    connect?: Enumerable<JobWhereUniqueInput>
  }

  export type JobUncheckedCreateNestedManyWithoutDepartmentInput = {
    create?: XOR<Enumerable<JobCreateWithoutDepartmentInput>, Enumerable<JobUncheckedCreateWithoutDepartmentInput>>
    connectOrCreate?: Enumerable<JobCreateOrConnectWithoutDepartmentInput>
    createMany?: JobCreateManyDepartmentInputEnvelope
    connect?: Enumerable<JobWhereUniqueInput>
  }

  export type JobUpdateManyWithoutDepartmentInput = {
    create?: XOR<Enumerable<JobCreateWithoutDepartmentInput>, Enumerable<JobUncheckedCreateWithoutDepartmentInput>>
    connectOrCreate?: Enumerable<JobCreateOrConnectWithoutDepartmentInput>
    upsert?: Enumerable<JobUpsertWithWhereUniqueWithoutDepartmentInput>
    createMany?: JobCreateManyDepartmentInputEnvelope
    set?: Enumerable<JobWhereUniqueInput>
    disconnect?: Enumerable<JobWhereUniqueInput>
    delete?: Enumerable<JobWhereUniqueInput>
    connect?: Enumerable<JobWhereUniqueInput>
    update?: Enumerable<JobUpdateWithWhereUniqueWithoutDepartmentInput>
    updateMany?: Enumerable<JobUpdateManyWithWhereWithoutDepartmentInput>
    deleteMany?: Enumerable<JobScalarWhereInput>
  }

  export type JobUncheckedUpdateManyWithoutDepartmentInput = {
    create?: XOR<Enumerable<JobCreateWithoutDepartmentInput>, Enumerable<JobUncheckedCreateWithoutDepartmentInput>>
    connectOrCreate?: Enumerable<JobCreateOrConnectWithoutDepartmentInput>
    upsert?: Enumerable<JobUpsertWithWhereUniqueWithoutDepartmentInput>
    createMany?: JobCreateManyDepartmentInputEnvelope
    set?: Enumerable<JobWhereUniqueInput>
    disconnect?: Enumerable<JobWhereUniqueInput>
    delete?: Enumerable<JobWhereUniqueInput>
    connect?: Enumerable<JobWhereUniqueInput>
    update?: Enumerable<JobUpdateWithWhereUniqueWithoutDepartmentInput>
    updateMany?: Enumerable<JobUpdateManyWithWhereWithoutDepartmentInput>
    deleteMany?: Enumerable<JobScalarWhereInput>
  }

  export type CashClubCreateNestedOneWithoutEmployeeInput = {
    create?: XOR<CashClubCreateWithoutEmployeeInput, CashClubUncheckedCreateWithoutEmployeeInput>
    connectOrCreate?: CashClubCreateOrConnectWithoutEmployeeInput
    connect?: CashClubWhereUniqueInput
  }

  export type EmployeeUserCreateNestedOneWithoutEmployeeInput = {
    create?: XOR<EmployeeUserCreateWithoutEmployeeInput, EmployeeUserUncheckedCreateWithoutEmployeeInput>
    connectOrCreate?: EmployeeUserCreateOrConnectWithoutEmployeeInput
    connect?: EmployeeUserWhereUniqueInput
  }

  export type InfoEmployeeCreateNestedOneWithoutEmployeeInput = {
    create?: XOR<InfoEmployeeCreateWithoutEmployeeInput, InfoEmployeeUncheckedCreateWithoutEmployeeInput>
    connectOrCreate?: InfoEmployeeCreateOrConnectWithoutEmployeeInput
    connect?: InfoEmployeeWhereUniqueInput
  }

  export type JobCreateNestedOneWithoutEmployeeInput = {
    create?: XOR<JobCreateWithoutEmployeeInput, JobUncheckedCreateWithoutEmployeeInput>
    connectOrCreate?: JobCreateOrConnectWithoutEmployeeInput
    connect?: JobWhereUniqueInput
  }

  export type BoolFieldUpdateOperationsInput = {
    set?: boolean
  }

  export type FloatFieldUpdateOperationsInput = {
    set?: number
    increment?: number
    decrement?: number
    multiply?: number
    divide?: number
  }

  export type CashClubUpdateOneRequiredWithoutEmployeeInput = {
    create?: XOR<CashClubCreateWithoutEmployeeInput, CashClubUncheckedCreateWithoutEmployeeInput>
    connectOrCreate?: CashClubCreateOrConnectWithoutEmployeeInput
    upsert?: CashClubUpsertWithoutEmployeeInput
    connect?: CashClubWhereUniqueInput
    update?: XOR<CashClubUpdateWithoutEmployeeInput, CashClubUncheckedUpdateWithoutEmployeeInput>
  }

  export type EmployeeUserUpdateOneRequiredWithoutEmployeeInput = {
    create?: XOR<EmployeeUserCreateWithoutEmployeeInput, EmployeeUserUncheckedCreateWithoutEmployeeInput>
    connectOrCreate?: EmployeeUserCreateOrConnectWithoutEmployeeInput
    upsert?: EmployeeUserUpsertWithoutEmployeeInput
    connect?: EmployeeUserWhereUniqueInput
    update?: XOR<EmployeeUserUpdateWithoutEmployeeInput, EmployeeUserUncheckedUpdateWithoutEmployeeInput>
  }

  export type InfoEmployeeUpdateOneRequiredWithoutEmployeeInput = {
    create?: XOR<InfoEmployeeCreateWithoutEmployeeInput, InfoEmployeeUncheckedCreateWithoutEmployeeInput>
    connectOrCreate?: InfoEmployeeCreateOrConnectWithoutEmployeeInput
    upsert?: InfoEmployeeUpsertWithoutEmployeeInput
    connect?: InfoEmployeeWhereUniqueInput
    update?: XOR<InfoEmployeeUpdateWithoutEmployeeInput, InfoEmployeeUncheckedUpdateWithoutEmployeeInput>
  }

  export type JobUpdateOneWithoutEmployeeInput = {
    create?: XOR<JobCreateWithoutEmployeeInput, JobUncheckedCreateWithoutEmployeeInput>
    connectOrCreate?: JobCreateOrConnectWithoutEmployeeInput
    upsert?: JobUpsertWithoutEmployeeInput
    disconnect?: boolean
    delete?: boolean
    connect?: JobWhereUniqueInput
    update?: XOR<JobUpdateWithoutEmployeeInput, JobUncheckedUpdateWithoutEmployeeInput>
  }

  export type NullableIntFieldUpdateOperationsInput = {
    set?: number | null
    increment?: number
    decrement?: number
    multiply?: number
    divide?: number
  }

  export type EmployeeCreateNestedManyWithoutEmployeeUserInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutEmployeeUserInput>, Enumerable<EmployeeUncheckedCreateWithoutEmployeeUserInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutEmployeeUserInput>
    createMany?: EmployeeCreateManyEmployeeUserInputEnvelope
    connect?: Enumerable<EmployeeWhereUniqueInput>
  }

  export type EmployeeUncheckedCreateNestedManyWithoutEmployeeUserInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutEmployeeUserInput>, Enumerable<EmployeeUncheckedCreateWithoutEmployeeUserInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutEmployeeUserInput>
    createMany?: EmployeeCreateManyEmployeeUserInputEnvelope
    connect?: Enumerable<EmployeeWhereUniqueInput>
  }

  export type BytesFieldUpdateOperationsInput = {
    set?: Buffer
  }

  export type NullableBoolFieldUpdateOperationsInput = {
    set?: boolean | null
  }

  export type EmployeeUpdateManyWithoutEmployeeUserInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutEmployeeUserInput>, Enumerable<EmployeeUncheckedCreateWithoutEmployeeUserInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutEmployeeUserInput>
    upsert?: Enumerable<EmployeeUpsertWithWhereUniqueWithoutEmployeeUserInput>
    createMany?: EmployeeCreateManyEmployeeUserInputEnvelope
    set?: Enumerable<EmployeeWhereUniqueInput>
    disconnect?: Enumerable<EmployeeWhereUniqueInput>
    delete?: Enumerable<EmployeeWhereUniqueInput>
    connect?: Enumerable<EmployeeWhereUniqueInput>
    update?: Enumerable<EmployeeUpdateWithWhereUniqueWithoutEmployeeUserInput>
    updateMany?: Enumerable<EmployeeUpdateManyWithWhereWithoutEmployeeUserInput>
    deleteMany?: Enumerable<EmployeeScalarWhereInput>
  }

  export type EmployeeUncheckedUpdateManyWithoutEmployeeUserInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutEmployeeUserInput>, Enumerable<EmployeeUncheckedCreateWithoutEmployeeUserInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutEmployeeUserInput>
    upsert?: Enumerable<EmployeeUpsertWithWhereUniqueWithoutEmployeeUserInput>
    createMany?: EmployeeCreateManyEmployeeUserInputEnvelope
    set?: Enumerable<EmployeeWhereUniqueInput>
    disconnect?: Enumerable<EmployeeWhereUniqueInput>
    delete?: Enumerable<EmployeeWhereUniqueInput>
    connect?: Enumerable<EmployeeWhereUniqueInput>
    update?: Enumerable<EmployeeUpdateWithWhereUniqueWithoutEmployeeUserInput>
    updateMany?: Enumerable<EmployeeUpdateManyWithWhereWithoutEmployeeUserInput>
    deleteMany?: Enumerable<EmployeeScalarWhereInput>
  }

  export type CountryCreateNestedOneWithoutInfoEmployeeInput = {
    create?: XOR<CountryCreateWithoutInfoEmployeeInput, CountryUncheckedCreateWithoutInfoEmployeeInput>
    connectOrCreate?: CountryCreateOrConnectWithoutInfoEmployeeInput
    connect?: CountryWhereUniqueInput
  }

  export type EmployeeCreateNestedManyWithoutInfoEmployeeInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutInfoEmployeeInput>, Enumerable<EmployeeUncheckedCreateWithoutInfoEmployeeInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutInfoEmployeeInput>
    createMany?: EmployeeCreateManyInfoEmployeeInputEnvelope
    connect?: Enumerable<EmployeeWhereUniqueInput>
  }

  export type EmployeeUncheckedCreateNestedManyWithoutInfoEmployeeInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutInfoEmployeeInput>, Enumerable<EmployeeUncheckedCreateWithoutInfoEmployeeInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutInfoEmployeeInput>
    createMany?: EmployeeCreateManyInfoEmployeeInputEnvelope
    connect?: Enumerable<EmployeeWhereUniqueInput>
  }

  export type DateTimeFieldUpdateOperationsInput = {
    set?: Date | string
  }

  export type CountryUpdateOneRequiredWithoutInfoEmployeeInput = {
    create?: XOR<CountryCreateWithoutInfoEmployeeInput, CountryUncheckedCreateWithoutInfoEmployeeInput>
    connectOrCreate?: CountryCreateOrConnectWithoutInfoEmployeeInput
    upsert?: CountryUpsertWithoutInfoEmployeeInput
    connect?: CountryWhereUniqueInput
    update?: XOR<CountryUpdateWithoutInfoEmployeeInput, CountryUncheckedUpdateWithoutInfoEmployeeInput>
  }

  export type EmployeeUpdateManyWithoutInfoEmployeeInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutInfoEmployeeInput>, Enumerable<EmployeeUncheckedCreateWithoutInfoEmployeeInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutInfoEmployeeInput>
    upsert?: Enumerable<EmployeeUpsertWithWhereUniqueWithoutInfoEmployeeInput>
    createMany?: EmployeeCreateManyInfoEmployeeInputEnvelope
    set?: Enumerable<EmployeeWhereUniqueInput>
    disconnect?: Enumerable<EmployeeWhereUniqueInput>
    delete?: Enumerable<EmployeeWhereUniqueInput>
    connect?: Enumerable<EmployeeWhereUniqueInput>
    update?: Enumerable<EmployeeUpdateWithWhereUniqueWithoutInfoEmployeeInput>
    updateMany?: Enumerable<EmployeeUpdateManyWithWhereWithoutInfoEmployeeInput>
    deleteMany?: Enumerable<EmployeeScalarWhereInput>
  }

  export type EmployeeUncheckedUpdateManyWithoutInfoEmployeeInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutInfoEmployeeInput>, Enumerable<EmployeeUncheckedCreateWithoutInfoEmployeeInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutInfoEmployeeInput>
    upsert?: Enumerable<EmployeeUpsertWithWhereUniqueWithoutInfoEmployeeInput>
    createMany?: EmployeeCreateManyInfoEmployeeInputEnvelope
    set?: Enumerable<EmployeeWhereUniqueInput>
    disconnect?: Enumerable<EmployeeWhereUniqueInput>
    delete?: Enumerable<EmployeeWhereUniqueInput>
    connect?: Enumerable<EmployeeWhereUniqueInput>
    update?: Enumerable<EmployeeUpdateWithWhereUniqueWithoutInfoEmployeeInput>
    updateMany?: Enumerable<EmployeeUpdateManyWithWhereWithoutInfoEmployeeInput>
    deleteMany?: Enumerable<EmployeeScalarWhereInput>
  }

  export type DepartmentCreateNestedOneWithoutJobInput = {
    create?: XOR<DepartmentCreateWithoutJobInput, DepartmentUncheckedCreateWithoutJobInput>
    connectOrCreate?: DepartmentCreateOrConnectWithoutJobInput
    connect?: DepartmentWhereUniqueInput
  }

  export type EmployeeCreateNestedManyWithoutJobInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutJobInput>, Enumerable<EmployeeUncheckedCreateWithoutJobInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutJobInput>
    createMany?: EmployeeCreateManyJobInputEnvelope
    connect?: Enumerable<EmployeeWhereUniqueInput>
  }

  export type EmployeeUncheckedCreateNestedManyWithoutJobInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutJobInput>, Enumerable<EmployeeUncheckedCreateWithoutJobInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutJobInput>
    createMany?: EmployeeCreateManyJobInputEnvelope
    connect?: Enumerable<EmployeeWhereUniqueInput>
  }

  export type DepartmentUpdateOneRequiredWithoutJobInput = {
    create?: XOR<DepartmentCreateWithoutJobInput, DepartmentUncheckedCreateWithoutJobInput>
    connectOrCreate?: DepartmentCreateOrConnectWithoutJobInput
    upsert?: DepartmentUpsertWithoutJobInput
    connect?: DepartmentWhereUniqueInput
    update?: XOR<DepartmentUpdateWithoutJobInput, DepartmentUncheckedUpdateWithoutJobInput>
  }

  export type EmployeeUpdateManyWithoutJobInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutJobInput>, Enumerable<EmployeeUncheckedCreateWithoutJobInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutJobInput>
    upsert?: Enumerable<EmployeeUpsertWithWhereUniqueWithoutJobInput>
    createMany?: EmployeeCreateManyJobInputEnvelope
    set?: Enumerable<EmployeeWhereUniqueInput>
    disconnect?: Enumerable<EmployeeWhereUniqueInput>
    delete?: Enumerable<EmployeeWhereUniqueInput>
    connect?: Enumerable<EmployeeWhereUniqueInput>
    update?: Enumerable<EmployeeUpdateWithWhereUniqueWithoutJobInput>
    updateMany?: Enumerable<EmployeeUpdateManyWithWhereWithoutJobInput>
    deleteMany?: Enumerable<EmployeeScalarWhereInput>
  }

  export type EmployeeUncheckedUpdateManyWithoutJobInput = {
    create?: XOR<Enumerable<EmployeeCreateWithoutJobInput>, Enumerable<EmployeeUncheckedCreateWithoutJobInput>>
    connectOrCreate?: Enumerable<EmployeeCreateOrConnectWithoutJobInput>
    upsert?: Enumerable<EmployeeUpsertWithWhereUniqueWithoutJobInput>
    createMany?: EmployeeCreateManyJobInputEnvelope
    set?: Enumerable<EmployeeWhereUniqueInput>
    disconnect?: Enumerable<EmployeeWhereUniqueInput>
    delete?: Enumerable<EmployeeWhereUniqueInput>
    connect?: Enumerable<EmployeeWhereUniqueInput>
    update?: Enumerable<EmployeeUpdateWithWhereUniqueWithoutJobInput>
    updateMany?: Enumerable<EmployeeUpdateManyWithWhereWithoutJobInput>
    deleteMany?: Enumerable<EmployeeScalarWhereInput>
  }

  export type NestedIntFilter = {
    equals?: number
    in?: Enumerable<number>
    notIn?: Enumerable<number>
    lt?: number
    lte?: number
    gt?: number
    gte?: number
    not?: NestedIntFilter | number
  }

  export type NestedStringFilter = {
    equals?: string
    in?: Enumerable<string>
    notIn?: Enumerable<string>
    lt?: string
    lte?: string
    gt?: string
    gte?: string
    contains?: string
    startsWith?: string
    endsWith?: string
    not?: NestedStringFilter | string
  }

  export type NestedIntWithAggregatesFilter = {
    equals?: number
    in?: Enumerable<number>
    notIn?: Enumerable<number>
    lt?: number
    lte?: number
    gt?: number
    gte?: number
    not?: NestedIntWithAggregatesFilter | number
    _count?: NestedIntFilter
    _avg?: NestedFloatFilter
    _sum?: NestedIntFilter
    _min?: NestedIntFilter
    _max?: NestedIntFilter
  }

  export type NestedFloatFilter = {
    equals?: number
    in?: Enumerable<number>
    notIn?: Enumerable<number>
    lt?: number
    lte?: number
    gt?: number
    gte?: number
    not?: NestedFloatFilter | number
  }

  export type NestedStringWithAggregatesFilter = {
    equals?: string
    in?: Enumerable<string>
    notIn?: Enumerable<string>
    lt?: string
    lte?: string
    gt?: string
    gte?: string
    contains?: string
    startsWith?: string
    endsWith?: string
    not?: NestedStringWithAggregatesFilter | string
    _count?: NestedIntFilter
    _min?: NestedStringFilter
    _max?: NestedStringFilter
  }

  export type NestedBoolFilter = {
    equals?: boolean
    not?: NestedBoolFilter | boolean
  }

  export type NestedIntNullableFilter = {
    equals?: number | null
    in?: Enumerable<number> | null
    notIn?: Enumerable<number> | null
    lt?: number
    lte?: number
    gt?: number
    gte?: number
    not?: NestedIntNullableFilter | number | null
  }

  export type NestedBoolWithAggregatesFilter = {
    equals?: boolean
    not?: NestedBoolWithAggregatesFilter | boolean
    _count?: NestedIntFilter
    _min?: NestedBoolFilter
    _max?: NestedBoolFilter
  }

  export type NestedFloatWithAggregatesFilter = {
    equals?: number
    in?: Enumerable<number>
    notIn?: Enumerable<number>
    lt?: number
    lte?: number
    gt?: number
    gte?: number
    not?: NestedFloatWithAggregatesFilter | number
    _count?: NestedIntFilter
    _avg?: NestedFloatFilter
    _sum?: NestedFloatFilter
    _min?: NestedFloatFilter
    _max?: NestedFloatFilter
  }

  export type NestedIntNullableWithAggregatesFilter = {
    equals?: number | null
    in?: Enumerable<number> | null
    notIn?: Enumerable<number> | null
    lt?: number
    lte?: number
    gt?: number
    gte?: number
    not?: NestedIntNullableWithAggregatesFilter | number | null
    _count?: NestedIntNullableFilter
    _avg?: NestedFloatNullableFilter
    _sum?: NestedIntNullableFilter
    _min?: NestedIntNullableFilter
    _max?: NestedIntNullableFilter
  }

  export type NestedFloatNullableFilter = {
    equals?: number | null
    in?: Enumerable<number> | null
    notIn?: Enumerable<number> | null
    lt?: number
    lte?: number
    gt?: number
    gte?: number
    not?: NestedFloatNullableFilter | number | null
  }

  export type NestedBytesFilter = {
    equals?: Buffer
    in?: Enumerable<Buffer>
    notIn?: Enumerable<Buffer>
    not?: NestedBytesFilter | Buffer
  }

  export type NestedBoolNullableFilter = {
    equals?: boolean | null
    not?: NestedBoolNullableFilter | boolean | null
  }

  export type NestedBytesWithAggregatesFilter = {
    equals?: Buffer
    in?: Enumerable<Buffer>
    notIn?: Enumerable<Buffer>
    not?: NestedBytesWithAggregatesFilter | Buffer
    _count?: NestedIntFilter
    _min?: NestedBytesFilter
    _max?: NestedBytesFilter
  }

  export type NestedBoolNullableWithAggregatesFilter = {
    equals?: boolean | null
    not?: NestedBoolNullableWithAggregatesFilter | boolean | null
    _count?: NestedIntNullableFilter
    _min?: NestedBoolNullableFilter
    _max?: NestedBoolNullableFilter
  }

  export type NestedDateTimeFilter = {
    equals?: Date | string
    in?: Enumerable<Date> | Enumerable<string>
    notIn?: Enumerable<Date> | Enumerable<string>
    lt?: Date | string
    lte?: Date | string
    gt?: Date | string
    gte?: Date | string
    not?: NestedDateTimeFilter | Date | string
  }

  export type NestedDateTimeWithAggregatesFilter = {
    equals?: Date | string
    in?: Enumerable<Date> | Enumerable<string>
    notIn?: Enumerable<Date> | Enumerable<string>
    lt?: Date | string
    lte?: Date | string
    gt?: Date | string
    gte?: Date | string
    not?: NestedDateTimeWithAggregatesFilter | Date | string
    _count?: NestedIntFilter
    _min?: NestedDateTimeFilter
    _max?: NestedDateTimeFilter
  }

  export type InfoEmployeeCreateWithoutCountryInput = {
    idInfoEmployee: number
    peopleName: string
    surname: string
    email: string
    phoneNumber: number
    birthDate: Date | string
    employeeAddress: string
    Employee?: EmployeeCreateNestedManyWithoutInfoEmployeeInput
  }

  export type InfoEmployeeUncheckedCreateWithoutCountryInput = {
    idInfoEmployee: number
    peopleName: string
    surname: string
    email: string
    phoneNumber: number
    birthDate: Date | string
    employeeAddress: string
    Employee?: EmployeeUncheckedCreateNestedManyWithoutInfoEmployeeInput
  }

  export type InfoEmployeeCreateOrConnectWithoutCountryInput = {
    where: InfoEmployeeWhereUniqueInput
    create: XOR<InfoEmployeeCreateWithoutCountryInput, InfoEmployeeUncheckedCreateWithoutCountryInput>
  }

  export type InfoEmployeeCreateManyCountryInputEnvelope = {
    data: Enumerable<InfoEmployeeCreateManyCountryInput>
  }

  export type InfoEmployeeUpsertWithWhereUniqueWithoutCountryInput = {
    where: InfoEmployeeWhereUniqueInput
    update: XOR<InfoEmployeeUpdateWithoutCountryInput, InfoEmployeeUncheckedUpdateWithoutCountryInput>
    create: XOR<InfoEmployeeCreateWithoutCountryInput, InfoEmployeeUncheckedCreateWithoutCountryInput>
  }

  export type InfoEmployeeUpdateWithWhereUniqueWithoutCountryInput = {
    where: InfoEmployeeWhereUniqueInput
    data: XOR<InfoEmployeeUpdateWithoutCountryInput, InfoEmployeeUncheckedUpdateWithoutCountryInput>
  }

  export type InfoEmployeeUpdateManyWithWhereWithoutCountryInput = {
    where: InfoEmployeeScalarWhereInput
    data: XOR<InfoEmployeeUpdateManyMutationInput, InfoEmployeeUncheckedUpdateManyWithoutInfoEmployeeInput>
  }

  export type InfoEmployeeScalarWhereInput = {
    AND?: Enumerable<InfoEmployeeScalarWhereInput>
    OR?: Enumerable<InfoEmployeeScalarWhereInput>
    NOT?: Enumerable<InfoEmployeeScalarWhereInput>
    idInfoEmployee?: IntFilter | number
    peopleName?: StringFilter | string
    surname?: StringFilter | string
    email?: StringFilter | string
    phoneNumber?: IntFilter | number
    birthDate?: DateTimeFilter | Date | string
    employeeAddress?: StringFilter | string
    idCountry?: IntFilter | number
  }

  export type EmployeeCreateWithoutCashClubInput = {
    idEmployee: number
    isActive?: boolean
    salary: number
    calification?: number
    EmployeeUser: EmployeeUserCreateNestedOneWithoutEmployeeInput
    InfoEmployee: InfoEmployeeCreateNestedOneWithoutEmployeeInput
    Job?: JobCreateNestedOneWithoutEmployeeInput
  }

  export type EmployeeUncheckedCreateWithoutCashClubInput = {
    idEmployee: number
    idInfoEmployee: number
    isActive?: boolean
    salary: number
    idJob?: number | null
    idEmployeeUser: number
    calification?: number
  }

  export type EmployeeCreateOrConnectWithoutCashClubInput = {
    where: EmployeeWhereUniqueInput
    create: XOR<EmployeeCreateWithoutCashClubInput, EmployeeUncheckedCreateWithoutCashClubInput>
  }

  export type EmployeeCreateManyCashClubInputEnvelope = {
    data: Enumerable<EmployeeCreateManyCashClubInput>
  }

  export type EmployeeUpsertWithWhereUniqueWithoutCashClubInput = {
    where: EmployeeWhereUniqueInput
    update: XOR<EmployeeUpdateWithoutCashClubInput, EmployeeUncheckedUpdateWithoutCashClubInput>
    create: XOR<EmployeeCreateWithoutCashClubInput, EmployeeUncheckedCreateWithoutCashClubInput>
  }

  export type EmployeeUpdateWithWhereUniqueWithoutCashClubInput = {
    where: EmployeeWhereUniqueInput
    data: XOR<EmployeeUpdateWithoutCashClubInput, EmployeeUncheckedUpdateWithoutCashClubInput>
  }

  export type EmployeeUpdateManyWithWhereWithoutCashClubInput = {
    where: EmployeeScalarWhereInput
    data: XOR<EmployeeUpdateManyMutationInput, EmployeeUncheckedUpdateManyWithoutEmployeeInput>
  }

  export type EmployeeScalarWhereInput = {
    AND?: Enumerable<EmployeeScalarWhereInput>
    OR?: Enumerable<EmployeeScalarWhereInput>
    NOT?: Enumerable<EmployeeScalarWhereInput>
    idEmployee?: IntFilter | number
    idInfoEmployee?: IntFilter | number
    isActive?: BoolFilter | boolean
    salary?: FloatFilter | number
    idJob?: IntNullableFilter | number | null
    idEmployeeUser?: IntFilter | number
    idCashClub?: IntFilter | number
    calification?: FloatFilter | number
  }

  export type JobCreateWithoutDepartmentInput = {
    jobName: string
    Employee?: EmployeeCreateNestedManyWithoutJobInput
  }

  export type JobUncheckedCreateWithoutDepartmentInput = {
    idJob?: number
    jobName: string
    Employee?: EmployeeUncheckedCreateNestedManyWithoutJobInput
  }

  export type JobCreateOrConnectWithoutDepartmentInput = {
    where: JobWhereUniqueInput
    create: XOR<JobCreateWithoutDepartmentInput, JobUncheckedCreateWithoutDepartmentInput>
  }

  export type JobCreateManyDepartmentInputEnvelope = {
    data: Enumerable<JobCreateManyDepartmentInput>
  }

  export type JobUpsertWithWhereUniqueWithoutDepartmentInput = {
    where: JobWhereUniqueInput
    update: XOR<JobUpdateWithoutDepartmentInput, JobUncheckedUpdateWithoutDepartmentInput>
    create: XOR<JobCreateWithoutDepartmentInput, JobUncheckedCreateWithoutDepartmentInput>
  }

  export type JobUpdateWithWhereUniqueWithoutDepartmentInput = {
    where: JobWhereUniqueInput
    data: XOR<JobUpdateWithoutDepartmentInput, JobUncheckedUpdateWithoutDepartmentInput>
  }

  export type JobUpdateManyWithWhereWithoutDepartmentInput = {
    where: JobScalarWhereInput
    data: XOR<JobUpdateManyMutationInput, JobUncheckedUpdateManyWithoutJobInput>
  }

  export type JobScalarWhereInput = {
    AND?: Enumerable<JobScalarWhereInput>
    OR?: Enumerable<JobScalarWhereInput>
    NOT?: Enumerable<JobScalarWhereInput>
    idJob?: IntFilter | number
    jobName?: StringFilter | string
    idDepartment?: IntFilter | number
  }

  export type CashClubCreateWithoutEmployeeInput = {
    cashType: string
    idClub: number
  }

  export type CashClubUncheckedCreateWithoutEmployeeInput = {
    idCashClub?: number
    cashType: string
    idClub: number
  }

  export type CashClubCreateOrConnectWithoutEmployeeInput = {
    where: CashClubWhereUniqueInput
    create: XOR<CashClubCreateWithoutEmployeeInput, CashClubUncheckedCreateWithoutEmployeeInput>
  }

  export type EmployeeUserCreateWithoutEmployeeInput = {
    idEmployeeUser: number
    pasword: Buffer
    isActive?: boolean | null
  }

  export type EmployeeUserUncheckedCreateWithoutEmployeeInput = {
    idEmployeeUser: number
    pasword: Buffer
    isActive?: boolean | null
  }

  export type EmployeeUserCreateOrConnectWithoutEmployeeInput = {
    where: EmployeeUserWhereUniqueInput
    create: XOR<EmployeeUserCreateWithoutEmployeeInput, EmployeeUserUncheckedCreateWithoutEmployeeInput>
  }

  export type InfoEmployeeCreateWithoutEmployeeInput = {
    idInfoEmployee: number
    peopleName: string
    surname: string
    email: string
    phoneNumber: number
    birthDate: Date | string
    employeeAddress: string
    Country: CountryCreateNestedOneWithoutInfoEmployeeInput
  }

  export type InfoEmployeeUncheckedCreateWithoutEmployeeInput = {
    idInfoEmployee: number
    peopleName: string
    surname: string
    email: string
    phoneNumber: number
    birthDate: Date | string
    employeeAddress: string
    idCountry: number
  }

  export type InfoEmployeeCreateOrConnectWithoutEmployeeInput = {
    where: InfoEmployeeWhereUniqueInput
    create: XOR<InfoEmployeeCreateWithoutEmployeeInput, InfoEmployeeUncheckedCreateWithoutEmployeeInput>
  }

  export type JobCreateWithoutEmployeeInput = {
    jobName: string
    Department: DepartmentCreateNestedOneWithoutJobInput
  }

  export type JobUncheckedCreateWithoutEmployeeInput = {
    idJob?: number
    jobName: string
    idDepartment: number
  }

  export type JobCreateOrConnectWithoutEmployeeInput = {
    where: JobWhereUniqueInput
    create: XOR<JobCreateWithoutEmployeeInput, JobUncheckedCreateWithoutEmployeeInput>
  }

  export type CashClubUpsertWithoutEmployeeInput = {
    update: XOR<CashClubUpdateWithoutEmployeeInput, CashClubUncheckedUpdateWithoutEmployeeInput>
    create: XOR<CashClubCreateWithoutEmployeeInput, CashClubUncheckedCreateWithoutEmployeeInput>
  }

  export type CashClubUpdateWithoutEmployeeInput = {
    cashType?: StringFieldUpdateOperationsInput | string
    idClub?: IntFieldUpdateOperationsInput | number
  }

  export type CashClubUncheckedUpdateWithoutEmployeeInput = {
    idCashClub?: IntFieldUpdateOperationsInput | number
    cashType?: StringFieldUpdateOperationsInput | string
    idClub?: IntFieldUpdateOperationsInput | number
  }

  export type EmployeeUserUpsertWithoutEmployeeInput = {
    update: XOR<EmployeeUserUpdateWithoutEmployeeInput, EmployeeUserUncheckedUpdateWithoutEmployeeInput>
    create: XOR<EmployeeUserCreateWithoutEmployeeInput, EmployeeUserUncheckedCreateWithoutEmployeeInput>
  }

  export type EmployeeUserUpdateWithoutEmployeeInput = {
    idEmployeeUser?: IntFieldUpdateOperationsInput | number
    pasword?: BytesFieldUpdateOperationsInput | Buffer
    isActive?: NullableBoolFieldUpdateOperationsInput | boolean | null
  }

  export type EmployeeUserUncheckedUpdateWithoutEmployeeInput = {
    idEmployeeUser?: IntFieldUpdateOperationsInput | number
    pasword?: BytesFieldUpdateOperationsInput | Buffer
    isActive?: NullableBoolFieldUpdateOperationsInput | boolean | null
  }

  export type InfoEmployeeUpsertWithoutEmployeeInput = {
    update: XOR<InfoEmployeeUpdateWithoutEmployeeInput, InfoEmployeeUncheckedUpdateWithoutEmployeeInput>
    create: XOR<InfoEmployeeCreateWithoutEmployeeInput, InfoEmployeeUncheckedCreateWithoutEmployeeInput>
  }

  export type InfoEmployeeUpdateWithoutEmployeeInput = {
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    peopleName?: StringFieldUpdateOperationsInput | string
    surname?: StringFieldUpdateOperationsInput | string
    email?: StringFieldUpdateOperationsInput | string
    phoneNumber?: IntFieldUpdateOperationsInput | number
    birthDate?: DateTimeFieldUpdateOperationsInput | Date | string
    employeeAddress?: StringFieldUpdateOperationsInput | string
    Country?: CountryUpdateOneRequiredWithoutInfoEmployeeInput
  }

  export type InfoEmployeeUncheckedUpdateWithoutEmployeeInput = {
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    peopleName?: StringFieldUpdateOperationsInput | string
    surname?: StringFieldUpdateOperationsInput | string
    email?: StringFieldUpdateOperationsInput | string
    phoneNumber?: IntFieldUpdateOperationsInput | number
    birthDate?: DateTimeFieldUpdateOperationsInput | Date | string
    employeeAddress?: StringFieldUpdateOperationsInput | string
    idCountry?: IntFieldUpdateOperationsInput | number
  }

  export type JobUpsertWithoutEmployeeInput = {
    update: XOR<JobUpdateWithoutEmployeeInput, JobUncheckedUpdateWithoutEmployeeInput>
    create: XOR<JobCreateWithoutEmployeeInput, JobUncheckedCreateWithoutEmployeeInput>
  }

  export type JobUpdateWithoutEmployeeInput = {
    jobName?: StringFieldUpdateOperationsInput | string
    Department?: DepartmentUpdateOneRequiredWithoutJobInput
  }

  export type JobUncheckedUpdateWithoutEmployeeInput = {
    idJob?: IntFieldUpdateOperationsInput | number
    jobName?: StringFieldUpdateOperationsInput | string
    idDepartment?: IntFieldUpdateOperationsInput | number
  }

  export type EmployeeCreateWithoutEmployeeUserInput = {
    idEmployee: number
    isActive?: boolean
    salary: number
    calification?: number
    CashClub: CashClubCreateNestedOneWithoutEmployeeInput
    InfoEmployee: InfoEmployeeCreateNestedOneWithoutEmployeeInput
    Job?: JobCreateNestedOneWithoutEmployeeInput
  }

  export type EmployeeUncheckedCreateWithoutEmployeeUserInput = {
    idEmployee: number
    idInfoEmployee: number
    isActive?: boolean
    salary: number
    idJob?: number | null
    idCashClub: number
    calification?: number
  }

  export type EmployeeCreateOrConnectWithoutEmployeeUserInput = {
    where: EmployeeWhereUniqueInput
    create: XOR<EmployeeCreateWithoutEmployeeUserInput, EmployeeUncheckedCreateWithoutEmployeeUserInput>
  }

  export type EmployeeCreateManyEmployeeUserInputEnvelope = {
    data: Enumerable<EmployeeCreateManyEmployeeUserInput>
  }

  export type EmployeeUpsertWithWhereUniqueWithoutEmployeeUserInput = {
    where: EmployeeWhereUniqueInput
    update: XOR<EmployeeUpdateWithoutEmployeeUserInput, EmployeeUncheckedUpdateWithoutEmployeeUserInput>
    create: XOR<EmployeeCreateWithoutEmployeeUserInput, EmployeeUncheckedCreateWithoutEmployeeUserInput>
  }

  export type EmployeeUpdateWithWhereUniqueWithoutEmployeeUserInput = {
    where: EmployeeWhereUniqueInput
    data: XOR<EmployeeUpdateWithoutEmployeeUserInput, EmployeeUncheckedUpdateWithoutEmployeeUserInput>
  }

  export type EmployeeUpdateManyWithWhereWithoutEmployeeUserInput = {
    where: EmployeeScalarWhereInput
    data: XOR<EmployeeUpdateManyMutationInput, EmployeeUncheckedUpdateManyWithoutEmployeeInput>
  }

  export type CountryCreateWithoutInfoEmployeeInput = {
    idCountry: number
    countryName: string
  }

  export type CountryUncheckedCreateWithoutInfoEmployeeInput = {
    idCountry: number
    countryName: string
  }

  export type CountryCreateOrConnectWithoutInfoEmployeeInput = {
    where: CountryWhereUniqueInput
    create: XOR<CountryCreateWithoutInfoEmployeeInput, CountryUncheckedCreateWithoutInfoEmployeeInput>
  }

  export type EmployeeCreateWithoutInfoEmployeeInput = {
    idEmployee: number
    isActive?: boolean
    salary: number
    calification?: number
    CashClub: CashClubCreateNestedOneWithoutEmployeeInput
    EmployeeUser: EmployeeUserCreateNestedOneWithoutEmployeeInput
    Job?: JobCreateNestedOneWithoutEmployeeInput
  }

  export type EmployeeUncheckedCreateWithoutInfoEmployeeInput = {
    idEmployee: number
    isActive?: boolean
    salary: number
    idJob?: number | null
    idEmployeeUser: number
    idCashClub: number
    calification?: number
  }

  export type EmployeeCreateOrConnectWithoutInfoEmployeeInput = {
    where: EmployeeWhereUniqueInput
    create: XOR<EmployeeCreateWithoutInfoEmployeeInput, EmployeeUncheckedCreateWithoutInfoEmployeeInput>
  }

  export type EmployeeCreateManyInfoEmployeeInputEnvelope = {
    data: Enumerable<EmployeeCreateManyInfoEmployeeInput>
  }

  export type CountryUpsertWithoutInfoEmployeeInput = {
    update: XOR<CountryUpdateWithoutInfoEmployeeInput, CountryUncheckedUpdateWithoutInfoEmployeeInput>
    create: XOR<CountryCreateWithoutInfoEmployeeInput, CountryUncheckedCreateWithoutInfoEmployeeInput>
  }

  export type CountryUpdateWithoutInfoEmployeeInput = {
    idCountry?: IntFieldUpdateOperationsInput | number
    countryName?: StringFieldUpdateOperationsInput | string
  }

  export type CountryUncheckedUpdateWithoutInfoEmployeeInput = {
    idCountry?: IntFieldUpdateOperationsInput | number
    countryName?: StringFieldUpdateOperationsInput | string
  }

  export type EmployeeUpsertWithWhereUniqueWithoutInfoEmployeeInput = {
    where: EmployeeWhereUniqueInput
    update: XOR<EmployeeUpdateWithoutInfoEmployeeInput, EmployeeUncheckedUpdateWithoutInfoEmployeeInput>
    create: XOR<EmployeeCreateWithoutInfoEmployeeInput, EmployeeUncheckedCreateWithoutInfoEmployeeInput>
  }

  export type EmployeeUpdateWithWhereUniqueWithoutInfoEmployeeInput = {
    where: EmployeeWhereUniqueInput
    data: XOR<EmployeeUpdateWithoutInfoEmployeeInput, EmployeeUncheckedUpdateWithoutInfoEmployeeInput>
  }

  export type EmployeeUpdateManyWithWhereWithoutInfoEmployeeInput = {
    where: EmployeeScalarWhereInput
    data: XOR<EmployeeUpdateManyMutationInput, EmployeeUncheckedUpdateManyWithoutEmployeeInput>
  }

  export type DepartmentCreateWithoutJobInput = {
    departmentName: string
  }

  export type DepartmentUncheckedCreateWithoutJobInput = {
    idDepartment?: number
    departmentName: string
  }

  export type DepartmentCreateOrConnectWithoutJobInput = {
    where: DepartmentWhereUniqueInput
    create: XOR<DepartmentCreateWithoutJobInput, DepartmentUncheckedCreateWithoutJobInput>
  }

  export type EmployeeCreateWithoutJobInput = {
    idEmployee: number
    isActive?: boolean
    salary: number
    calification?: number
    CashClub: CashClubCreateNestedOneWithoutEmployeeInput
    EmployeeUser: EmployeeUserCreateNestedOneWithoutEmployeeInput
    InfoEmployee: InfoEmployeeCreateNestedOneWithoutEmployeeInput
  }

  export type EmployeeUncheckedCreateWithoutJobInput = {
    idEmployee: number
    idInfoEmployee: number
    isActive?: boolean
    salary: number
    idEmployeeUser: number
    idCashClub: number
    calification?: number
  }

  export type EmployeeCreateOrConnectWithoutJobInput = {
    where: EmployeeWhereUniqueInput
    create: XOR<EmployeeCreateWithoutJobInput, EmployeeUncheckedCreateWithoutJobInput>
  }

  export type EmployeeCreateManyJobInputEnvelope = {
    data: Enumerable<EmployeeCreateManyJobInput>
  }

  export type DepartmentUpsertWithoutJobInput = {
    update: XOR<DepartmentUpdateWithoutJobInput, DepartmentUncheckedUpdateWithoutJobInput>
    create: XOR<DepartmentCreateWithoutJobInput, DepartmentUncheckedCreateWithoutJobInput>
  }

  export type DepartmentUpdateWithoutJobInput = {
    departmentName?: StringFieldUpdateOperationsInput | string
  }

  export type DepartmentUncheckedUpdateWithoutJobInput = {
    idDepartment?: IntFieldUpdateOperationsInput | number
    departmentName?: StringFieldUpdateOperationsInput | string
  }

  export type EmployeeUpsertWithWhereUniqueWithoutJobInput = {
    where: EmployeeWhereUniqueInput
    update: XOR<EmployeeUpdateWithoutJobInput, EmployeeUncheckedUpdateWithoutJobInput>
    create: XOR<EmployeeCreateWithoutJobInput, EmployeeUncheckedCreateWithoutJobInput>
  }

  export type EmployeeUpdateWithWhereUniqueWithoutJobInput = {
    where: EmployeeWhereUniqueInput
    data: XOR<EmployeeUpdateWithoutJobInput, EmployeeUncheckedUpdateWithoutJobInput>
  }

  export type EmployeeUpdateManyWithWhereWithoutJobInput = {
    where: EmployeeScalarWhereInput
    data: XOR<EmployeeUpdateManyMutationInput, EmployeeUncheckedUpdateManyWithoutEmployeeInput>
  }

  export type InfoEmployeeCreateManyCountryInput = {
    idInfoEmployee: number
    peopleName: string
    surname: string
    email: string
    phoneNumber: number
    birthDate: Date | string
    employeeAddress: string
  }

  export type InfoEmployeeUpdateWithoutCountryInput = {
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    peopleName?: StringFieldUpdateOperationsInput | string
    surname?: StringFieldUpdateOperationsInput | string
    email?: StringFieldUpdateOperationsInput | string
    phoneNumber?: IntFieldUpdateOperationsInput | number
    birthDate?: DateTimeFieldUpdateOperationsInput | Date | string
    employeeAddress?: StringFieldUpdateOperationsInput | string
    Employee?: EmployeeUpdateManyWithoutInfoEmployeeInput
  }

  export type InfoEmployeeUncheckedUpdateWithoutCountryInput = {
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    peopleName?: StringFieldUpdateOperationsInput | string
    surname?: StringFieldUpdateOperationsInput | string
    email?: StringFieldUpdateOperationsInput | string
    phoneNumber?: IntFieldUpdateOperationsInput | number
    birthDate?: DateTimeFieldUpdateOperationsInput | Date | string
    employeeAddress?: StringFieldUpdateOperationsInput | string
    Employee?: EmployeeUncheckedUpdateManyWithoutInfoEmployeeInput
  }

  export type InfoEmployeeUncheckedUpdateManyWithoutInfoEmployeeInput = {
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    peopleName?: StringFieldUpdateOperationsInput | string
    surname?: StringFieldUpdateOperationsInput | string
    email?: StringFieldUpdateOperationsInput | string
    phoneNumber?: IntFieldUpdateOperationsInput | number
    birthDate?: DateTimeFieldUpdateOperationsInput | Date | string
    employeeAddress?: StringFieldUpdateOperationsInput | string
  }

  export type EmployeeCreateManyCashClubInput = {
    idEmployee: number
    idInfoEmployee: number
    isActive?: boolean
    salary: number
    idJob?: number | null
    idEmployeeUser: number
    calification?: number
  }

  export type EmployeeUpdateWithoutCashClubInput = {
    idEmployee?: IntFieldUpdateOperationsInput | number
    isActive?: BoolFieldUpdateOperationsInput | boolean
    salary?: FloatFieldUpdateOperationsInput | number
    calification?: FloatFieldUpdateOperationsInput | number
    EmployeeUser?: EmployeeUserUpdateOneRequiredWithoutEmployeeInput
    InfoEmployee?: InfoEmployeeUpdateOneRequiredWithoutEmployeeInput
    Job?: JobUpdateOneWithoutEmployeeInput
  }

  export type EmployeeUncheckedUpdateWithoutCashClubInput = {
    idEmployee?: IntFieldUpdateOperationsInput | number
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    isActive?: BoolFieldUpdateOperationsInput | boolean
    salary?: FloatFieldUpdateOperationsInput | number
    idJob?: NullableIntFieldUpdateOperationsInput | number | null
    idEmployeeUser?: IntFieldUpdateOperationsInput | number
    calification?: FloatFieldUpdateOperationsInput | number
  }

  export type EmployeeUncheckedUpdateManyWithoutEmployeeInput = {
    idEmployee?: IntFieldUpdateOperationsInput | number
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    isActive?: BoolFieldUpdateOperationsInput | boolean
    salary?: FloatFieldUpdateOperationsInput | number
    idJob?: NullableIntFieldUpdateOperationsInput | number | null
    idEmployeeUser?: IntFieldUpdateOperationsInput | number
    calification?: FloatFieldUpdateOperationsInput | number
  }

  export type JobCreateManyDepartmentInput = {
    jobName: string
  }

  export type JobUpdateWithoutDepartmentInput = {
    jobName?: StringFieldUpdateOperationsInput | string
    Employee?: EmployeeUpdateManyWithoutJobInput
  }

  export type JobUncheckedUpdateWithoutDepartmentInput = {
    idJob?: IntFieldUpdateOperationsInput | number
    jobName?: StringFieldUpdateOperationsInput | string
    Employee?: EmployeeUncheckedUpdateManyWithoutJobInput
  }

  export type JobUncheckedUpdateManyWithoutJobInput = {
    idJob?: IntFieldUpdateOperationsInput | number
    jobName?: StringFieldUpdateOperationsInput | string
  }

  export type EmployeeCreateManyEmployeeUserInput = {
    idEmployee: number
    idInfoEmployee: number
    isActive?: boolean
    salary: number
    idJob?: number | null
    idCashClub: number
    calification?: number
  }

  export type EmployeeUpdateWithoutEmployeeUserInput = {
    idEmployee?: IntFieldUpdateOperationsInput | number
    isActive?: BoolFieldUpdateOperationsInput | boolean
    salary?: FloatFieldUpdateOperationsInput | number
    calification?: FloatFieldUpdateOperationsInput | number
    CashClub?: CashClubUpdateOneRequiredWithoutEmployeeInput
    InfoEmployee?: InfoEmployeeUpdateOneRequiredWithoutEmployeeInput
    Job?: JobUpdateOneWithoutEmployeeInput
  }

  export type EmployeeUncheckedUpdateWithoutEmployeeUserInput = {
    idEmployee?: IntFieldUpdateOperationsInput | number
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    isActive?: BoolFieldUpdateOperationsInput | boolean
    salary?: FloatFieldUpdateOperationsInput | number
    idJob?: NullableIntFieldUpdateOperationsInput | number | null
    idCashClub?: IntFieldUpdateOperationsInput | number
    calification?: FloatFieldUpdateOperationsInput | number
  }

  export type EmployeeCreateManyInfoEmployeeInput = {
    idEmployee: number
    isActive?: boolean
    salary: number
    idJob?: number | null
    idEmployeeUser: number
    idCashClub: number
    calification?: number
  }

  export type EmployeeUpdateWithoutInfoEmployeeInput = {
    idEmployee?: IntFieldUpdateOperationsInput | number
    isActive?: BoolFieldUpdateOperationsInput | boolean
    salary?: FloatFieldUpdateOperationsInput | number
    calification?: FloatFieldUpdateOperationsInput | number
    CashClub?: CashClubUpdateOneRequiredWithoutEmployeeInput
    EmployeeUser?: EmployeeUserUpdateOneRequiredWithoutEmployeeInput
    Job?: JobUpdateOneWithoutEmployeeInput
  }

  export type EmployeeUncheckedUpdateWithoutInfoEmployeeInput = {
    idEmployee?: IntFieldUpdateOperationsInput | number
    isActive?: BoolFieldUpdateOperationsInput | boolean
    salary?: FloatFieldUpdateOperationsInput | number
    idJob?: NullableIntFieldUpdateOperationsInput | number | null
    idEmployeeUser?: IntFieldUpdateOperationsInput | number
    idCashClub?: IntFieldUpdateOperationsInput | number
    calification?: FloatFieldUpdateOperationsInput | number
  }

  export type EmployeeCreateManyJobInput = {
    idEmployee: number
    idInfoEmployee: number
    isActive?: boolean
    salary: number
    idEmployeeUser: number
    idCashClub: number
    calification?: number
  }

  export type EmployeeUpdateWithoutJobInput = {
    idEmployee?: IntFieldUpdateOperationsInput | number
    isActive?: BoolFieldUpdateOperationsInput | boolean
    salary?: FloatFieldUpdateOperationsInput | number
    calification?: FloatFieldUpdateOperationsInput | number
    CashClub?: CashClubUpdateOneRequiredWithoutEmployeeInput
    EmployeeUser?: EmployeeUserUpdateOneRequiredWithoutEmployeeInput
    InfoEmployee?: InfoEmployeeUpdateOneRequiredWithoutEmployeeInput
  }

  export type EmployeeUncheckedUpdateWithoutJobInput = {
    idEmployee?: IntFieldUpdateOperationsInput | number
    idInfoEmployee?: IntFieldUpdateOperationsInput | number
    isActive?: BoolFieldUpdateOperationsInput | boolean
    salary?: FloatFieldUpdateOperationsInput | number
    idEmployeeUser?: IntFieldUpdateOperationsInput | number
    idCashClub?: IntFieldUpdateOperationsInput | number
    calification?: FloatFieldUpdateOperationsInput | number
  }



  /**
   * Batch Payload for updateMany & deleteMany & createMany
   */

  export type BatchPayload = {
    count: number
  }

  /**
   * DMMF
   */
  export const dmmf: runtime.DMMF.Document;
}