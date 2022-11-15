import { Request, Response } from "express";
import { UsersRepository } from "../repositories/UsersRepository";

const userRepository = new UsersRepository();

export class UserController {
    async store(request: Request, response: Response) {
        const { username, password } = request.body;

        const userExists = await userRepository.findByName(username);

        if (userExists) {
            return response.status(400).json({ error: "User exists" });
        }

        const user = await userRepository.create({ username, password });

        return response.json(user);
    }
}
