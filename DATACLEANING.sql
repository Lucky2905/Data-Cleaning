-- Data Cleaning
-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null Values or blank values
-- 4. Remove any unecessary cols and rows 

SELECT * 
FROM layoffs;


CREATE TABLE layoff_staging
LIKE layoffs; 

SELECT * 
FROM layoff_staging;

INSERT layoff_staging
SELECT *  
FROM layoffs;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,industry,total_laid_off,percentage_laid_off,`date`) AS row_num 
FROM layoff_staging;

WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num 
FROM layoff_staging
)
SELECT * 
FROM duplicate_cte
WHERE row_num>1;

SELECT * 
FROM layoff_staging
WHERE company='Casper';

WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num 
FROM layoff_staging
)
DELETE
FROM duplicate_cte
WHERE row_num>1;

CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
   `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT * 
FROM layoff_staging2;


INSERT INTO layoff_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num 
FROM layoff_staging;

SELECT * 
FROM layoff_staging2
WHERE row_num>1;

DELETE
FROM layoff_staging2
WHERE row_num>1;


SELECT * 
FROM layoff_staging2;


SELECT company,TRIM(company)
FROM layoff_staging2;

UPDATE layoff_staging2
SET company = TRIM(company);


SELECT *
FROM layoff_staging2
WHERE industry like 'Crypto%';

UPDATE layoff_staging2
SET industry = 'Crypto'
WHERE industry like 'Crypto%';


SELECT DISTINCT(industry)
FROM layoff_staging2
ORDER BY 1;

SELECT *
FROM layoff_staging2
Order by 1;

select distinct(country)
from layoff_staging2
order by 1;

SELECT DISTINCT country,TRIM(TRAILING '.' FROM country)
FROM layoff_staging2
order by 1;

UPDATE layoff_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT `date`,str_to_date(`date`,'%m/%d/%Y')
FROM layoff_staging2;

UPDATE layoff_staging2
SET date = str_to_date(`date`,'%m/%d/%Y');

SELECT `date`
FROM layoff_staging2;

ALTER TABLE layoff_staging2
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoff_staging2
WHERE total_laid_off is null 
and percentage_laid_off is null;

Update layoff_staging2
set industry = NULL
where industry = '';

SELECT *
FROM layoff_staging2
where industry is null or industry = '';


SELECT *
FROM layoff_staging2
where company = 'Airbnb';

SELECT t1.industry,t2.industry
FROM layoff_staging2 t1
JOIN layoff_staging2 t2
	ON t1.company = t2.company
WHERE t1.industry IS NULL AND t2.industry IS NOT NULL;

UPDATE layoff_staging2 t1
JOIN layoff_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL AND t2.industry IS NOT NULL;


SELECT *
FROM layoff_staging2
where company like 'Bally%';


SELECT *
FROM layoff_staging2
WHERE total_laid_off is null 
and percentage_laid_off is null;

DELETE 
FROM layoff_staging2
WHERE total_laid_off is null 
and percentage_laid_off is null;

ALTER TABLE layoff_staging2
DROP COLUMN row_num;

SELECT *
FROM layoff_staging2; 















