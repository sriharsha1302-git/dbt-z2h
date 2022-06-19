WITH reviews AS
  (SELECT *
   FROM {{ ref('fct_reviews') }}),
     listings AS
  (SELECT *
   FROM {{ ref('dim_listings_cleansed') }})
SELECT *
FROM reviews
JOIN listings ON (listings.listing_id = reviews.listing_id)
WHERE listings.created_at > reviews.review_date