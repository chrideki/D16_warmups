-- We're going to produce unique labels for our products to be printed off on reciepts and shipping labels.
-- The Rule for this label (using product_name):
-- all special characters should be removed/replaced with standard characters (eg. cöté -> cote, 's -> s)
-- The first letter of every word needs to be capitalized
-- no spaces between words
-- max of 11 characters total

-- keywords to google: translate, initcap, replace, regex_replace
-- also play around with the examples here: 
-- https://stackoverflow.com/questions/4428645/postgres-regexp-replace-want-to-allow-only-a-z-and-a-z


SELECT
    product_name,
    TRANSLATE(LEFT(TRANSLATE(initcap(product_name), ' ', ''), 11),
     'ßàáâãäéèëêíìïîóòõöôúùüûçÇ-''', 'saaaaaeeeeiiiiooooouuuucc') AS label
FROM products;

