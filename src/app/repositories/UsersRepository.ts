import { prismaClient } from "../database/prismaClient";
import { User } from "../types/User";

export class UsersRepository {
    async findByAll() {
        const users = await prismaClient.user.findMany();

        return users;
    }
    async findByName(username: string) {
        const user = await prismaClient.user.findUnique({
            where: {
                username
            }
        });

        return user;
    }

    async create({ username, password }: User) {
        const user = await prismaClient.user.create({
            data: { username, password }
        });

        return user;
    }
}