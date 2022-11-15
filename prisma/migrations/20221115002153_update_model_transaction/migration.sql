/*
  Warnings:

  - Made the column `account_id` on table `transactions` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "transactions" DROP CONSTRAINT "transactions_account_id_fkey";

-- AlterTable
ALTER TABLE "transactions" ALTER COLUMN "account_id" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "accounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
