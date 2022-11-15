/*
  Warnings:

  - You are about to drop the column `account_id` on the `users` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[user_id]` on the table `accounts` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `user_id` to the `accounts` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "users" DROP CONSTRAINT "users_account_id_fkey";

-- DropIndex
DROP INDEX "users_account_id_key";

-- AlterTable
ALTER TABLE "accounts" ADD COLUMN     "user_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "users" DROP COLUMN "account_id";

-- CreateIndex
CREATE UNIQUE INDEX "accounts_user_id_key" ON "accounts"("user_id");

-- AddForeignKey
ALTER TABLE "accounts" ADD CONSTRAINT "accounts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
