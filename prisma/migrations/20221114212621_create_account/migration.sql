-- CreateTable
CREATE TABLE "accounts" (
    "id" TEXT NOT NULL,
    "balance" DECIMAL(65,30) NOT NULL,

    CONSTRAINT "accounts_pkey" PRIMARY KEY ("id")
);
