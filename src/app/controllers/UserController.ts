import { Request, Response } from "express";
import { UsersRepository } from "../repositories/UsersRepository";

const userRepository = new UsersRepository();

export class UserController {
    async store(request: Request, response: Response) {
        const { username, password } = request.body;

        if (!username || !password) {
            return response.status(400).json({ error: "Username and password are required" });
        }

        try {
            const userExists = await userRepository.findByName(username);

            if (userExists) {
                return response.status(400).json({ error: "Usurname is already being used" });
            }

            await userRepository.create({ username, password });

            return response.sendStatus(201);
        } catch {
            return response.status(500).json({ error: "Internal server error, try again" });
        }
    }

    async index(request: Request, response: Response) {

    }
}
