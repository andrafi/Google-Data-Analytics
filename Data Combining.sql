--- data combining

CREATE TABLE `Tripbike.2022_tripbike` as (
  SELECT * FROM `Tripbike.202201`
  UNION ALL
  SElECT * FROM `Tripbike.202202`
  UNION ALL
  SELECT * FROM `Tripbike.202203`
  UNION ALL
  SELECT * FROM `Tripbike.202204`
  UNION ALL
  SELECT * FROM `Tripbike.202205`
  UNION ALL
  SELECT * FROM `Tripbike.202206`
  UNION ALL
  SELECT * FROM `Tripbike.202207`
  UNION ALL
  SElECT * FROM `Tripbike.202208`
  UNION ALL
  SELECT * FROM `Tripbike.202209`
  UNION ALL
  SELECT * FROM `Tripbike.202210`
  UNION ALL
  SELECT * FROM `Tripbike.202211`
  UNION ALL
  SELECT * FROM `Tripbike.202212`
);

--- checking total numbers of rows
SELECT COUNT(*) FROM `Tripbike.2022_tripbike`
