CREATE OR REPLACE FUNCTION validate_snils() RETURNS trigger AS $$
DECLARE
    snils_number TEXT;
    control_sum INTEGER;
    check_sum INTEGER;
BEGIN
    snils_number := regexp_replace(NEW.SNILS, '[^0-9]+', '', 'g');

    -- Проверка на наличие одинаковых цифр подряд
    IF regexp_matches(snils_number, '(.)\1{2}', 'g') IS NOT NULL THEN
        RAISE EXCEPTION 'СНИЛС содержит одинаковые цифры подряд';
    END IF;

    -- Вычисление контрольного числа
    control_sum := (substring(snils_number, 1, 1)::integer * 9 +
                    substring(snils_number, 2, 1)::integer * 8 +
                    substring(snils_number, 3, 1)::integer * 7 +
                    substring(snils_number, 4, 1)::integer * 6 +
                    substring(snils_number, 5, 1)::integer * 5 +
                    substring(snils_number, 6, 1)::integer * 4 +
                    substring(snils_number, 7, 1)::integer * 3 +
                    substring(snils_number, 8, 1)::integer * 2 +
                    substring(snils_number, 9, 1)::integer) % 101;

    IF control_sum < 100 THEN
        check_sum := control_sum;
    ELSIF control_sum = 100 OR control_sum = 101 THEN
        check_sum := 0;
    ELSE
        check_sum := control_sum % 100;
    END IF;

    -- Проверка контрольного числа
    IF substring(snils_number, 10, 2)::integer <> check_sum THEN
        RAISE EXCEPTION 'Контрольное число в СНИЛС указано неверно';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validate_snils_trigger
    BEFORE INSERT OR UPDATE ON student
    FOR EACH ROW
EXECUTE FUNCTION validate_snils();