/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_accountId_fkey";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "accountId" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "accounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
