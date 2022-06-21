import { PrismaClient } from './generated/Company'

const prisma = new PrismaClient()

async function func() {
    // ... you will write your Prisma Client queries here
    let name = 'zoila'
    let idDep = 1

/*
    let result = await prisma.$queryRaw`EXEC CDepartment @idUser = ${idDep}, @departmentname = 'todo un poco2'`
    console.log(result)

    result = await prisma.$queryRaw`EXEC CJob ${name}, ${idDep}`
    console.log(result)
*/

    let result = await prisma.$queryRaw`Select * from Country`
    console.log(result)

}

func()
    .catch((e) => {
        throw e
    })
    .finally(async () => {
        await prisma.$disconnect()
    })