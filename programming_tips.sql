-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Sob 17. srp 2024, 05:58
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `programming_tips`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `tips`
--

DROP TABLE IF EXISTS `tips`;
CREATE TABLE `tips` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `code_example` text DEFAULT NULL,
  `language` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `tips`
--

INSERT INTO `tips` (`id`, `title`, `description`, `code_example`, `language`) VALUES
(1, 'Python tips', 'List comprehensions in Python are a concise way to create lists. They can replace loops for simple tasks and often make your code more readable and efficient.', NULL, 'Python'),
(2, 'Javascript loops', 'The for/of loop in JavaScript is a cleaner and more readable way to iterate over arrays, especially when you only need the values of the elements.', NULL, 'JavaScript'),
(3, 'Use Enhanced for Loop for Cleaner Code', 'In Java, the enhanced for loop (also known as the \'foreach\' loop) is a simpler and more readable way to iterate over arrays or collections, without needing to manage an index manually. For example: String[] names = {\'Alice\', \'Bob\', \'Charlie\'};\nfor (String name : names) {\n    System.out.println(name);\n}', NULL, 'Java'),
(4, 'Use isset() to Check for Variables in PHP', 'In PHP, before using a variable, especially from forms or queries, it&#039;s good practice to check if the variable is set to avoid &quot;undefined variable&quot; notices. The isset() function is perfect for this.\r\n\r\nExample:\r\nif (isset($_POST[&#039;username&#039;])) {\r\n    $username = $_POST[&#039;username&#039;];\r\n    // Process the username\r\n} else {\r\n    echo &quot;Username is not set.&quot;;\r\n}\r\n', NULL, 'PHP'),
(6, 'Using Statements for Resource Management', 'When working with resources that need to be explicitly released, such as file handles, database connections, or network streams, it&#039;s important to ensure that these resources are properly disposed of, even if an exception occurs. C# provides a using statement that makes this easy and clean.\r\n\r\nExample:\r\n\r\nusing (var stream = new FileStream(&quot;example.txt&quot;, FileMode.Open))\r\n{\r\n    // Perform file operations\r\n    using (var reader = new StreamReader(stream))\r\n    {\r\n        string content = reader.ReadToEnd();\r\n        Console.WriteLine(content);\r\n    }\r\n}\r\n// The StreamReader and FileStream are automatically disposed of here.\r\n', NULL, 'C#'),
(7, 'Use filter_var() for Input Validation', 'When dealing with user input, always validate and sanitize the data to prevent security vulnerabilities like SQL injection and cross-site scripting (XSS). PHP provides the filter_var() function, which is a powerful and flexible way to validate and sanitize data.\r\n\r\nExample: \r\n\r\n&lt;?php\r\n$email = $_POST[&#039;email&#039;] ?? &#039;&#039;;\r\n\r\n// Validate email format\r\nif (filter_var($email, FILTER_VALIDATE_EMAIL)) {\r\n    echo &quot;Valid email address.&quot;;\r\n} else {\r\n    echo &quot;Invalid email address.&quot;;\r\n}\r\n?&gt;\r\n', NULL, 'PHP'),
(8, 'PHP Tip: Use PDO for Secure Database Access', 'When interacting with databases in PHP, using the PDO (PHP Data Objects) extension is recommended for secure and flexible database access. PDO supports prepared statements, which help prevent SQL injection.', NULL, 'PHP'),
(9, 'Tip: Use Object.keys() and Object.values() for Easy Object Iteration', 'When working with objects in JavaScript, you can easily iterate over the keys or values using the Object.keys() and Object.values() methods. This is particularly useful when you want to access just the keys or just the values of an object.', 'const user = {\n    name: \'Alice\',\n    age: 30,\n    occupation: \'Developer\'\n};\n\n// Iterate over the keys\nObject.keys(user).forEach(key => {\n    console.log(key);  // Outputs: name, age, occupation\n});\n\n// Iterate over the values\nObject.values(user).forEach(value => {\n    console.log(value);  // Outputs: Alice, 30, Developer\n});\n', 'JavaScript'),
(10, 'Use List Slicing for Reversing Lists', 'In Python, you can reverse a list quickly and elegantly using slicing. This method is both concise and easy to understand.\r\n\r\n', 'numbers = [1, 2, 3, 4, 5]\r\n\r\n# Reverse the list using slicing\r\nreversed_numbers = numbers[::-1]\r\n\r\nprint(reversed_numbers)\r\n\r\noutput: [5, 4, 3, 2, 1]\r\n\r\n', 'Python'),
(11, 'Use StringBuilder for Efficient String Concatenation in Java', 'In Java, using StringBuilder is a more efficient way to concatenate strings, especially in loops or when dealing with large amounts of text. Unlike String, StringBuilder is mutable, meaning it can be modified without creating new objects each time, which significantly improves performance.', '', 'Java'),
(13, 'include_once and require_once to Prevent Duplicate Inclusions', 'When you\'re working on a PHP project that involves including files, it’s a good practice to use include_once or require_once instead of include or require. These functions ensure that a file is included only once, preventing issues related to multiple inclusions.', '// Using include_once\r\ninclude_once \'config.php\';\r\n\r\n// Or using require_once\r\nrequire_once \'config.php\';\r\n', 'PHP'),
(14, 'PHP Tip: Use array_key_exists() to Check if a Key Exists in an Array', 'When working with associative arrays in PHP, it\'s important to verify whether a specific key exists before accessing its value. This can prevent errors and make your code more robust. The array_key_exists() function is designed for this purpose.', '$user = [\r\n    \'name\' => \'Alice\',\r\n    \'email\' => \'alice@example.com\',\r\n    \'age\' => 30\r\n];\r\n\r\n// Check if the key \'email\' exists\r\nif (array_key_exists(\'email\', $user)) {\r\n    echo \"User\'s email: \" . $user[\'email\'];\r\n} else {\r\n    echo \"Email key does not exist.\";\r\n}\r\n', 'PHP'),
(15, 'Python Tip: Use enumerate() for Indexing in Loops', 'When you need both the index and the value while looping through a list (or any iterable), the enumerate() function is a clean and efficient way to get both.', 'Suppose you have a list of items and you want to print each item along with its index:\r\n\r\nWithout enumerate():\r\n\r\nitems = [\'apple\', \'banana\', \'cherry\']\r\n\r\nfor i in range(len(items)):\r\n    print(f\"{i}: {items[i]}\")\r\n\r\nWith enumerate():\r\n\r\nitems = [\'apple\', \'banana\', \'cherry\']\r\n\r\nfor index, item in enumerate(items):\r\n    print(f\"{index}: {item}\")\r\n\r\n\r\n\r\n', 'Python'),
(16, 'C# Tip: Use using Statements for Proper Resource Management', 'In C#, the using statement is a powerful tool for managing resources that need to be disposed of after use, such as file handles, database connections, or any objects that implement the IDisposable interface.\r\n\r\n', 'Suppose you want to read a file and ensure that the file is properly closed after reading:\r\n\r\nWithout using:\r\n\r\nStreamReader reader = null;\r\ntry\r\n{\r\n    reader = new StreamReader(\"example.txt\");\r\n    string content = reader.ReadToEnd();\r\n    Console.WriteLine(content);\r\n}\r\nfinally\r\n{\r\n    if (reader != null)\r\n    {\r\n        reader.Dispose();\r\n    }\r\n}\r\n\r\nWith using:\r\n\r\nusing (StreamReader reader = new StreamReader(\"example.txt\"))\r\n{\r\n    string content = reader.ReadToEnd();\r\n    Console.WriteLine(content);\r\n}\r\n\r\n\r\n\r\n\r\n\r\n', 'C#'),
(17, 'Go Tip: Use defer for Clean and Safe Resource Management', 'In Go, the defer keyword is used to ensure that a function call is performed later in the program’s execution, usually for cleanup purposes. This is particularly useful for managing resources like file handles, database connections, or locks.\r\n\r\n', 'Suppose you are working with a file that needs to be closed after processing:\r\n\r\n\r\npackage main\r\n\r\nimport (\r\n    \"fmt\"\r\n    \"os\"\r\n)\r\n\r\nfunc main() {\r\n    file, err := os.Open(\"example.txt\")\r\n    if err != nil {\r\n        fmt.Println(\"Error opening file:\", err)\r\n        return\r\n    }\r\n    // Ensure the file is closed when the function ends\r\n    defer file.Close()\r\n\r\n    // Process the file\r\n    // ...\r\n}\r\n', 'Go'),
(18, 'C++ Avoid Including Multiple Libraries', 'Generally, we include libraries at the start of the C++ code to perform certain operations as shown below.\r\n\r\nBut, we have a better approach to replace these many libraries with just one library i.e, #include bits/stdc++.h> to include all standard libraries without adding them one at a time. It is especially useful in programming competitions where time is limited.\r\n\r\nThis includes all the standard libraries required in the program. So, we can avoid adding these many libraries separately to keep code as efficient and effective as possible.\r\n\r\n\r\n\r\n\r\n', 'Generally, we include libraries at the start of the C++ code to perform certain operations as shown below.\r\n\r\n\r\n#include <iostream>\r\n#include <set>\r\n#include <string>\r\n#include <vector>\r\nusing namespace std;\r\n\r\nint main()\r\n{\r\n\r\n    cout << \"GFG!\";\r\n    return 0;\r\n}\r\n\r\n\r\nThis “iostream”  library performs the input-output operations in C++ code.\r\n\r\n#include <iostream>\r\n\r\nThe “vector” library allows us to perform operations on vectors.\r\n\r\n#include<set>\r\n\r\nThis includes all the standard libraries required in the program. So, we can avoid adding these many libraries separately to keep code as efficient and effective as possible.\r\n\r\n#include<bits/stdc++.h>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'C++');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `tips`
--
ALTER TABLE `tips`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `tips`
--
ALTER TABLE `tips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
