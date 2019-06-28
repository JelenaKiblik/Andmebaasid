CREATE DOMAIN d_reg_aeg TIMESTAMP without time zone 
NOT NULL DEFAULT localtimestamp(0) 
CONSTRAINT CHK_reg_aeg_vahemikus CHECK 
(VALUE BETWEEN '2010-01-01' AND '2100-12-31 23:59:59');

CREATE DOMAIN d_nimetus AS VARCHAR(50) NOT NULL 
CONSTRAINT CHK_nimetus_pole_tyhi CHECK (VALUE !~ '^[[:space:]]+$')
CONSTRAINT CHK_nimetus_pole_tyhi_string CHECK(VALUE!='');




