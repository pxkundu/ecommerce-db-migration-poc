USE ecommerce_db;

CREATE INDEX idx_product_name ON products (name);

DELIMITER //
CREATE TRIGGER update_product_timestamp
AFTER UPDATE ON inventory
FOR EACH ROW
BEGIN
    UPDATE products
    SET updated_at = CURRENT_TIMESTAMP
    WHERE product_id = NEW.product_id;
END;
//
DELIMITER ;

INSERT INTO schema_versions (version_label, applied_by) VALUES ('1.0.1', 'flyway');
