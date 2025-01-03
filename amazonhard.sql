DROP TABLE IF EXISTS innerwear_amazon_com;

DROP TABLE IF EXISTS innerwear_macys_com;

DROP TABLE IF EXISTS innerwear_topshop_com;

CREATE TABLE innerwear_amazon_com (
  product_name VARCHAR(255),
  mrp VARCHAR(50),
  price VARCHAR(50),
  pdp_url VARCHAR(255),
  brand_name VARCHAR(100),
  product_category VARCHAR(100),
  retailer VARCHAR(100),
  description VARCHAR(255),
  rating FLOAT,
  review_count INT,
  style_attributes VARCHAR(255),
  total_sizes VARCHAR(50),
  available_size VARCHAR(50),
  color VARCHAR(50)
);

CREATE TABLE innerwear_macys_com (
  product_name VARCHAR(255),
  mrp VARCHAR(50),
  price VARCHAR(50),
  pdp_url VARCHAR(255),
  brand_name VARCHAR(100),
  product_category VARCHAR(100),
  retailer VARCHAR(100),
  description VARCHAR(255),
  rating FLOAT,
  review_count FLOAT,
  style_attributes VARCHAR(255),
  total_sizes VARCHAR(50),
  available_size VARCHAR(50),
  color VARCHAR(50)
);

CREATE TABLE innerwear_topshop_com (
  product_name VARCHAR(255),
  mrp VARCHAR(50),
  price VARCHAR(50),
  pdp_url VARCHAR(255),
  brand_name VARCHAR(100),
  product_category VARCHAR(100),
  retailer VARCHAR(100),
  description VARCHAR(255),
  rating FLOAT,
  review_count FLOAT,
  style_attributes VARCHAR(255),
  total_sizes VARCHAR(50),
  available_size VARCHAR(50),
  color VARCHAR(50)
);

INSERT INTO
  innerwear_topshop_com (
    product_name,
    mrp,
    price,
    pdp_url,
    brand_name,
    product_category,
    retailer,
    description,
    rating,
    review_count,
    style_attributes,
    total_sizes,
    available_size,
    color
  )
VALUES
  (
    'ProductB',
    '200',
    '190',
    'url7',
    'BrandB',
    'Category1',
    'TopShop',
    'DescriptionB',
    4.1,
    95,
    'StyleB',
    'S,M,L',
    'M',
    'Blue'
  ),
  (
    'ProductF',
    '100',
    '90',
    'url8',
    'BrandF',
    'Category3',
    'TopShop',
    'DescriptionF',
    3.5,
    50,
    'StyleF',
    'XS,S',
    'S',
    'Pink'
  ),
  (
    'ProductG',
    '300',
    '270',
    'url9',
    'BrandG',
    'Category5',
    'TopShop',
    'DescriptionG',
    4.3,
    70,
    'StyleG',
    'M,L,XL',
    'M',
    'Purple'
  );

INSERT INTO
  innerwear_amazon_com (
    product_name,
    mrp,
    price,
    pdp_url,
    brand_name,
    product_category,
    retailer,
    description,
    rating,
    review_count,
    style_attributes,
    total_sizes,
    available_size,
    color
  )
VALUES
  (
    'ProductA',
    '100',
    '80',
    'url1',
    'BrandA',
    'Category1',
    'Amazon',
    'DescriptionA',
    4.5,
    100,
    'StyleA',
    'M,L',
    'M',
    'Red'
  ),
  (
    'ProductB',
    '200',
    '180',
    'url2',
    'BrandB',
    'Category1',
    'Amazon',
    'DescriptionB',
    4.2,
    150,
    'StyleB',
    'S,M,L',
    'S',
    'Blue'
  ),
  (
    'ProductC',
    '300',
    '250',
    'url3',
    'BrandC',
    'Category2',
    'Amazon',
    'DescriptionC',
    4.8,
    200,
    'StyleC',
    'L,XL',
    'L',
    'Green'
  );

INSERT INTO
  innerwear_macys_com (
    product_name,
    mrp,
    price,
    pdp_url,
    brand_name,
    product_category,
    retailer,
    description,
    rating,
    review_count,
    style_attributes,
    total_sizes,
    available_size,
    color
  )
VALUES
  (
    'ProductA',
    '100',
    '85',
    'url4',
    'BrandA',
    'Category1',
    'Macys',
    'DescriptionA',
    4.5,
    90,
    'StyleA',
    'M,L',
    'M',
    'Red'
  ),
  (
    'ProductD',
    '150',
    '130',
    'url5',
    'BrandD',
    'Category3',
    'Macys',
    'DescriptionD',
    4.0,
    80,
    'StyleD',
    'S,M',
    'S',
    'Yellow'
  ),
  (
    'ProductE',
    '250',
    '210',
    'url6',
    'BrandE',
    'Category4',
    'Macys',
    'DescriptionE',
    3.9,
    60,
    'StyleE',
    'M,L',
    'L',
    'Black'
  );

WITH
  exclude_products AS (
    SELECT
      product_name,
      mrp
    FROM
      innerwear_macys_com
    UNION
    SELECT
      product_name,
      mrp
    FROM
      innerwear_topshop_com
  ),
  EXCLUSIVE AS (
    SELECT
      product_name,
      mrp
    FROM
      innerwear_amazon_com
    EXCEPT
    SELECT
      product_name,
      mrp
    FROM
      exclude_products
  )
SELECT
  e.product_name,
  brand_name,
  e.mrp,
  rating
FROM
  EXCLUSIVE e
  JOIN innerwear_amazon_com iac ON e.product_name = iac.product_name
  AND e.mrp = iac.mrp;

SELECT
  iac.product_name,
  iac.brand_name,
  iac.mrp,
  iac.rating
FROM
  innerwear_amazon_com iac
  LEFT JOIN innerwear_topshop_com itc ON iac.product_name = itc.product_name
  AND iac.mrp = itc.mrp
  LEFT JOIN innerwear_macys_com imc ON iac.product_name = imc.product_name
  AND iac.mrp = imc.mrp
WHERE
  itc.product_name IS NULL
  AND imc.product_name IS NULL;
