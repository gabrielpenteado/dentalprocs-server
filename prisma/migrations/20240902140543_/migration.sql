-- CreateTable
CREATE TABLE "procedures" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "procedures_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "procedure_week_days" (
    "id" TEXT NOT NULL,
    "procedure_id" TEXT NOT NULL,
    "week_day" INTEGER NOT NULL,

    CONSTRAINT "procedure_week_days_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "days" (
    "id" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "days_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "day_procedures" (
    "id" TEXT NOT NULL,
    "day_id" TEXT NOT NULL,
    "procedure_id" TEXT NOT NULL,

    CONSTRAINT "day_procedures_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "procedure_week_days_procedure_id_week_day_key" ON "procedure_week_days"("procedure_id", "week_day");

-- CreateIndex
CREATE UNIQUE INDEX "days_date_key" ON "days"("date");

-- CreateIndex
CREATE UNIQUE INDEX "day_procedures_day_id_procedure_id_key" ON "day_procedures"("day_id", "procedure_id");

-- AddForeignKey
ALTER TABLE "procedure_week_days" ADD CONSTRAINT "procedure_week_days_procedure_id_fkey" FOREIGN KEY ("procedure_id") REFERENCES "procedures"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "day_procedures" ADD CONSTRAINT "day_procedures_day_id_fkey" FOREIGN KEY ("day_id") REFERENCES "days"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "day_procedures" ADD CONSTRAINT "day_procedures_procedure_id_fkey" FOREIGN KEY ("procedure_id") REFERENCES "procedures"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
