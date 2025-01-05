## Cisco (Hard Level)

Convert the first letter of each word found in content_text to uppercase, while keeping the rest of the letters lowercase. Your output should include the original text in one column and the modified text in another column.

🌀 Trust me, this one will seriously twist your brain! Give it a try and share the output! 👇

## 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭:

CREATE TABLE user_content (content_id INT PRIMARY KEY,customer_id INT,content_type VARCHAR(50),content_text VARCHAR(255));

INSERT INTO user_content (content_id, customer_id, content_type, content_text) VALUES(1, 2, 'comment', 'hello world! this is a TEST.'),(2, 8, 'comment', 'what a great day'),(3, 4, 'comment', 'WELCOME to the event.'),(4, 2, 'comment', 'e-commerce is booming.'),(5, 6, 'comment', 'Python is fun!!'),(6, 6, 'review', '123 numbers in text.'),(7, 10, 'review', 'special chars: @#$$%^&*()'),(8, 4, 'comment', 'multiple CAPITALS here.'),(9, 6, 'review', 'sentence. and ANOTHER sentence!'),(10, 2, 'post', 'goodBYE!');
