CREATE DATABASE programming_tips COLLATE "utf8mb4_unicode_ci";

CREATE TABLE tips (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    language VARCHAR(150)
);

INSERT INTO tips (title, description, language)
VALUES ("Python tips", "List comprehensions in Python are a concise way to create lists. They can replace loops for simple tasks and often make your code more readable and efficient.", "Python");

INSERT INTO tips (title, description, language)
VALUES ("Javascript loops", "The for/of loop in JavaScript is a cleaner and more readable way to iterate over arrays, especially when you only need the values of the elements.", "JavaScript"), 
("Use Enhanced for Loop for Cleaner Code", "In Java, the enhanced for loop (also known as the 'foreach' loop) is a simpler and more readable way to iterate over arrays or collections, without needing to manage an index manually. For example: String[] names = {'Alice', 'Bob', 'Charlie'};
for (String name : names) {
    System.out.println(name);
}", "Java");

UPDATE tips
SET title = "<script>alert('Hello there')</script>",
    description = "Test for attacks",
    language = "Yes"
WHERE id = 5;

-- Creating new column "code_example"

ALTER TABLE tips ADD code_example TEXT;


DELETE FROM tips
WHERE id = 12;