USE [onlinetnjustice]
INSERT INTO Regions
SELECT 'Tals'
GO
INSERT INTO Counties
(CountyName, RegionId)
SELECT 'Anderson', 1
UNION ALL SELECT
  'Bedford', 1 UNION ALL SELECT
  'Anderson', 1 UNION ALL SELECT
  'Bedford', 1 UNION ALL SELECT
  'Benton', 1 UNION ALL SELECT
  'Bledsoe', 1 UNION ALL SELECT
  'Blount', 1 UNION ALL SELECT
  'Bradley', 1 UNION ALL SELECT
  'Campbell', 1 UNION ALL SELECT
  'Cannon', 1 UNION ALL SELECT
  'Carroll', 1 UNION ALL SELECT
  'Carter', 1 UNION ALL SELECT
  'Cheatham', 1 UNION ALL SELECT
  'Chester', 1 UNION ALL SELECT
  'Claiborne', 1 UNION ALL SELECT
  'Clay', 1 UNION ALL SELECT
  'Cocke', 1 UNION ALL SELECT
  'Coffee', 1 UNION ALL SELECT
  'Crockett', 1 UNION ALL SELECT
  'Cumberland', 1 UNION ALL SELECT
  'Davidson', 1 UNION ALL SELECT
  'Decatur', 1 UNION ALL SELECT
  'Dekalb', 1 UNION ALL SELECT
  'Dickson', 1 UNION ALL SELECT
  'Dyer', 1 UNION ALL SELECT
  'Fayette', 1 UNION ALL SELECT
  'Fentress', 1 UNION ALL SELECT
  'Franklin', 1 UNION ALL SELECT
  'Gibson', 1 UNION ALL SELECT
  'Giles', 1 UNION ALL SELECT
  'Grainger', 1 UNION ALL SELECT
  'Greene', 1 UNION ALL SELECT
  'Grundy', 1 UNION ALL SELECT
  'Hamblen', 1 UNION ALL SELECT
  'Hamilton', 1 UNION ALL SELECT
  'Hancock', 1 UNION ALL SELECT
  'Hardeman', 1 UNION ALL SELECT
  'Hardin', 1 UNION ALL SELECT
  'Hawkins', 1 UNION ALL SELECT
  'Haywood', 1 UNION ALL SELECT
  'Henderson', 1 UNION ALL SELECT
  'Henry', 1 UNION ALL SELECT
  'Hickman', 1 UNION ALL SELECT
  'Houston', 1 UNION ALL SELECT
  'Humphreys', 1 UNION ALL SELECT
  'Jackson', 1 UNION ALL SELECT
  'Jefferson', 1 UNION ALL SELECT
  'Johnson', 1 UNION ALL SELECT
  'Knox', 1 UNION ALL SELECT
  'Lake', 1 UNION ALL SELECT
  'Lauderdale', 1 UNION ALL SELECT
  'Lawrence', 1 UNION ALL SELECT
  'Lewis', 1 UNION ALL SELECT
  'Lincoln', 1 UNION ALL SELECT
  'Loudon', 1 UNION ALL SELECT
  'Macon', 1 UNION ALL SELECT
  'Madison', 1 UNION ALL SELECT
  'Marion', 1 UNION ALL SELECT
  'Marshall', 1 UNION ALL SELECT
  'Maury', 1 UNION ALL SELECT
  'McMinn', 1 UNION ALL SELECT
  'McNairy', 1 UNION ALL SELECT
  'Meigs', 1 UNION ALL SELECT
  'Monroe', 1 UNION ALL SELECT
  'Montgomery', 1 UNION ALL SELECT
  'Moore', 1 UNION ALL SELECT
  'Morgan', 1 UNION ALL SELECT
  'Obion', 1 UNION ALL SELECT
  'Overton', 1 UNION ALL SELECT
  'Perry', 1 UNION ALL SELECT
  'Pickett', 1 UNION ALL SELECT
  'Polk', 1 UNION ALL SELECT
  'Putnam', 1 UNION ALL SELECT
  'Rhea', 1 UNION ALL SELECT
  'Roane', 1 UNION ALL SELECT
  'Robertson', 1 UNION ALL SELECT
  'Rutherford', 1 UNION ALL SELECT
  'Scott', 1 UNION ALL SELECT
  'Sequatchie', 1 UNION ALL SELECT
  'Sevier', 1 UNION ALL SELECT
  'Shelby', 1 UNION ALL SELECT
  'Smith', 1 UNION ALL SELECT
  'Stewart', 1 UNION ALL SELECT
  'Sullivan', 1 UNION ALL SELECT
  'Sumner', 1 UNION ALL SELECT
  'Tipton', 1 UNION ALL SELECT
  'Trousdale', 1 UNION ALL SELECT
  'Unicoi', 1 UNION ALL SELECT
  'Union', 1 UNION ALL SELECT
  'Van Buren', 1 UNION ALL SELECT
  'Warren', 1 UNION ALL SELECT
  'Washington', 1 UNION ALL SELECT
  'Wayne', 1 UNION ALL SELECT
  'Weakley', 1 UNION ALL SELECT
  'White', 1 UNION ALL SELECT
  'Williamson', 1 UNION ALL SELECT
  'Wilson', 1
  GO
  INSERT INTO Categories
  SELECT 'Family' UNION ALL
  SELECT 'Health Care' UNION ALL
  SELECT 'Debt and Purchases' UNION ALL
  SELECT 'Housing' UNION ALL
  SELECT 'Benefits' UNION ALL
  SELECT 'School/Juvenile' UNION ALL
  SELECT 'Seniors' UNION ALL
  SELECT 'Work' UNION ALL
  SELECT 'Immigration/Citizenship' UNION ALL
  SELECT 'Other'