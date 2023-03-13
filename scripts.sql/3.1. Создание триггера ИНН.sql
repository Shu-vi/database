CREATE OR REPLACE FUNCTION validate_inn() RETURNS trigger AS $$
DECLARE
    --Для инн 10значного
    coeff INTEGER[] := ARRAY[2, 4, 10, 3, 5, 9, 4, 6, 8];
    sum INTEGER := 0;
    remainder INTEGER;

    --Для инн 12значного
    coeff1 INTEGER[] := ARRAY[7, 2, 4, 10, 3, 5, 9, 4, 6, 8];
    coeff2 INTEGER[] := ARRAY[3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8];
    sum1 INTEGER := 0;
    sum2 INTEGER := 0;
    remainder1 INTEGER;
    remainder2 INTEGER;
BEGIN
    IF (CHAR_LENGTH(NEW.INN) <> 10) AND (CHAR_LENGTH(NEW.INN) <> 12) THEN
        RAISE EXCEPTION 'ИНН должен состоять из 10 или 12 цифр';
    END IF;

    IF CHAR_LENGTH(NEW.INN) = 10 THEN
        FOR i IN 1..9 LOOP
                sum := sum + coeff[i] * CAST(SUBSTR(NEW.INN, i, 1) AS INTEGER);
            END LOOP;
        remainder := sum % 11 % 10;
        IF remainder <> CAST(SUBSTR(NEW.INN, 10, 1) AS INTEGER) THEN
            RAISE EXCEPTION 'Некорректный ИНН';
        END IF;
    END IF;

    IF CHAR_LENGTH(NEW.INN) = 12 THEN
        FOR i IN 1..10 LOOP
                sum1 := sum1 + coeff1[i] * CAST(SUBSTR(NEW.INN, i, 1) AS INTEGER);
        END LOOP;
        remainder1 := sum1 % 11 % 10;
        IF remainder1 <> CAST(SUBSTR(NEW.INN, 11, 1) AS INTEGER) THEN
            RAISE EXCEPTION 'Некорректный ИНН';
        END IF;
        FOR i IN 1..11 LOOP
                sum2 := sum2 + coeff2[i] * CAST(SUBSTR(NEW.INN, i, 1) AS INTEGER);
        END LOOP;
        remainder2 := sum2 % 11 % 10;
        IF remainder2 <> CAST(SUBSTR(NEW.INN, 12, 1) AS INTEGER) THEN
            RAISE EXCEPTION 'Некорректный ИНН';
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validate_inn_trigger BEFORE INSERT OR UPDATE ON student
    FOR EACH ROW EXECUTE FUNCTION validate_inn();