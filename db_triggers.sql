CREATE TRIGGER on_insert_into_entities AFTER INSERT ON entities FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("new entity ",NEW.id," added in Entities by ",USER()));

CREATE TRIGGER on_insert_into_objects AFTER INSERT ON objects FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("new object ",NEW.id," added in Objects by ",USER()));

CREATE TRIGGER on_insert_into_permissions AFTER INSERT ON permissions FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("new permission ",NEW.entity_id," : ",NEW.permission," : ",NEW.object_id," added in Permissions by ",USER()));

CREATE TRIGGER on_insert_into_stages AFTER INSERT ON stages FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("new stage ",NEW.id," added in Stages by ",USER()));

CREATE TRIGGER on_insert_into_elements AFTER INSERT ON elements FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("new element ",NEW.id," added in Elements by ",USER()));

CREATE TRIGGER on_insert_into_tickets AFTER INSERT ON tickets FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("new ticket ",NEW.id," added in Ticketss by ",USER()));

CREATE TRIGGER on_update_entities AFTER UPDATE ON entities FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("entity ",NEW.id," updated in Entities by ",USER()));

CREATE TRIGGER on_update_objects AFTER UPDATE ON objects FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("object ",NEW.id," updated in Objects by ",USER()));

CREATE TRIGGER on_update_permissions AFTER UPDATE ON permissions FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("permission ",OLD.entity_id," : ",OLD.permission," : ",OLD.object_id, " updated to ",NEW.entity_id," : ",NEW.permission," : ",NEW.object_id," in Permissions by ",USER()));

CREATE TRIGGER on_update_tickets AFTER UPDATE ON tickets FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("ticket ",NEW.id," updated in Ticketss by ",USER()));

CREATE TRIGGER on_delete_from_entities AFTER DELETE ON entities FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("entity ",OLD.id," deleted from Entities by ",USER()));

CREATE TRIGGER on_delete_from_objects AFTER DELETE ON objects FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("object ",OLD.id," deleted from Objectss by ",USER()));

CREATE TRIGGER on_delete_from_permissions AFTER DELETE ON permissions FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("permission ",OLD.entity_id," : ",OLD.permission," : ",OLD.object_id, " deleted from Permissions by ",USER()));

CREATE TRIGGER on_delete_from_stages AFTER DELETE ON stages FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("stage ",OLD.id, " deleted from Stages by ",USER()));

CREATE TRIGGER on_delete_from_elements AFTER DELETE ON elements FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("element ",OLD.id, " deleted from Elements by ",USER()));

CREATE TRIGGER on_delete_from_tickets AFTER DELETE ON tickets FOR EACH ROW INSERT INTO log(id,date,description) values(UUID(),NOW(),CONCAT("ticket ",OLD.id," deleted from Ticketss by ",USER()));

DELIMITER $$

CREATE
TRIGGER AFTER_DELETE_balance_per_day
AFTER DELETE
ON balance_per_day
FOR EACH ROW
BEGIN
  INSERT INTO log (id, date, description)
    VALUES (UUID(), NOW(), CONCAT('the row ', OLD.id, ' of the table balance_per_day was deleted'));
END
$$

CREATE
TRIGGER AFTER_DELETE_transactions
AFTER DELETE
ON transactions
FOR EACH ROW
BEGIN
  INSERT INTO log (id, date, description)
    VALUES (UUID(), NOW(), CONCAT('the transaction ', OLD.id, ' was deleted'));
END
$$

CREATE
TRIGGER AFTER_INSERT_balance_per_day
AFTER INSERT
ON balance_per_day
FOR EACH ROW
BEGIN
  INSERT INTO Log (id, date, description)
    VALUES (UUID(), NOW(), CONCAT('the balance for ', NEW.account_id, ' account is calculated and added to the table balance_per_day'));
END
$$

CREATE
TRIGGER AFTER_INSERT_transactions
AFTER INSERT
ON transactions
FOR EACH ROW
BEGIN
  INSERT INTO log (id, date, description)
    VALUES (UUID(), NOW(), CONCAT('the transaction ', NEW.id, ' was created'));
END
$$

CREATE
TRIGGER AFTER_UPDATE_balance_per_day
AFTER UPDATE
ON balance_per_day
FOR EACH ROW
BEGIN
  INSERT INTO log (id, date, description)
    VALUES (UUID(), NOW(), CONCAT('the row ', OLD.id, ' of the table balance_per_day was updated'));
END
$$

CREATE
TRIGGER AFTER_UPDATE_transactions
AFTER UPDATE
ON transactions
FOR EACH ROW
BEGIN
  INSERT INTO log (id, date, description)
    VALUES (UUID(), NOW(), CONCAT('the transaction ', OLD.id, ' was updated'));
END
$$

DELIMITER ;

