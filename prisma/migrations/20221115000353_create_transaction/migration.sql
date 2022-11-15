/*
  Warnings:

  - You are about to drop the column `accountId` on the `users` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[account_id]` on the table `users` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "users" DROP CONSTRAINT "users_accountId_fkey";

-- AlterTable
ALTER TABLE "users" DROP COLUMN "accountId",
ADD COLUMN     "account_id" TEXT;

-- CreateTable
CREATE TABLE "transactions" (
    "id" TEXT NOT NULL,
    "debitedAccountId" TEXT NOT NULL,
    "creditedAccountId" TEXT NOT NULL,
    "account_id" TEXT,

    CONSTRAINT "transactions_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "transactions_debitedAccountId_key" ON "transactions"("debitedAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "transactions_creditedAccountId_key" ON "transactions"("creditedAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "users_account_id_key" ON "users"("account_id");

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "accounts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "accounts"("id") ON DELETE SET NULL ON UPDATE CASCADE;
