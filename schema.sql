DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS challenges;
DROP TABLE IF EXISTS saved_challenges;
DROP TABLE IF EXISTS challenges_test;
DROP TABLE IF EXISTS test;

CREATE TABLE IF NOT EXISTS user(
  id SERIAL PRIMARY KEY,
  username VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS challenges(
  id SERIAL PRIMARY KEY,
  challenges VARCHAR,
  data_type VARCHAR(255),
  hint VARCHAR
);

CREATE TABLE IF NOT EXISTS saved_challenges(
  user_id VARCHAR REFERENCES user(id),
  challenge_id VARCHAR REFERENCES challenges(id),
  completed VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS test(
  challenge_id VARCHAR REFERENCES challenges(id),
  input VARCHAR,
  output VARCHAR
);

-- Inserting individual challenges into the challenges table

-- 1
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  '',
  '',
  ''
);

-- 2
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function called pretty Print that uses a while loop to print every value in a linked list',
  'linked list',
  ''
);

-- 3
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function called to Array, it takes in a list, that creates an array of the values of a linked list',
  'linked list',
  ''
);

-- 4
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function called contains, it takes in a list and value, that returns the first node in a linked list that contains a value or null if not found',
  'linked list',
  ''
);

-- 5
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that will concact union two linked lists',
  'linked list',
  'there is a simple way to do it, a way to do it with merge sort and then a way to do it with hashing'
);

-- 6
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that will concact intersect two linked lists',
  'linked list',
  'there is a simple way to do it, a way to do it with merge sort and then a way to do it with hashing'
);

-- 7
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function called reverse, it takes in a linked list, that will reverse a linked list using a stack',
  'stack/queue',
  'there is going to need to be more than one traversal'
);

-- 8
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function called dedupe, it takes in a linked list, that will remove consective duplicate values of a linked list using a stack',
  'stack/queue',
  ''
);

-- 9
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'use queues to call a list of async, error and data, node functions one after the other',
  'stack/queue',
  ''
);

-- 10
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that determines if a string has matching braces using a stack',
  'stack/queue',
  ''
);

-- 11
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a rotate function that uses a stack to rotate a queue to rotate an array n times',
  'stack/queue',
  ''
);

-- 12
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'validate a palindrome',
  'stack/queue',
  ''
);

-- 13
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'implament a stack using queues',
  'stack/queue',
  ''
);

-- 14
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that uses a while loop to pretty Print a trees value',
  'tree',
  ''
);

-- 15
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that uses recursion to pretty Print a trees value',
  'tree',
  ''
);

-- 16
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function called get Leaf Count that computes the number of leaves in a tree',
  'tree',
  ''
);

-- 17
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function called get Edge that computes the number of edges in a tree',
  'tree',
  ''
);

-- 18
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that determines the max child count of a node in the tree',
  'tree',
  ''
);

-- 19
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'remove nth child from a tree, return true or false on success',
  'tree',
  ''
);

-- 20
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that will find a value in a binary search tree',
  'binary search tree',
  ''
);

-- 21
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that compute the sum of all the elements in a binary search tree',
  'binary search tree',
  ''
);

-- 22
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that will compute the depth of the binary search tree',
  'binary search tree',
  ''
);

-- 23
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that will compare two binary trees and determine if they are structurally identical',
  'binary search tree',
  ''
);

-- 24
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that will union two binary search trees',
  'binary search tree',
  ''
);

-- 25
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that will intersect two binary search trees',
  'binary search tree',
  ''
);

-- 26
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that will validate a binary search tree',
  'binary search tree',
  ''
);

-- 27
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function to flatten a binary search tree into a linked list (bonus sorted linked list)',
  'binary search tree',
  'can be done using either a queue or by using recursion'
);

-- 28
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that will hash a string into a number with a size limit',
  'hash table',
  ''
);

-- 29
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that finds the first duplicate letter in a string (using a hashmap)',
  'hash table',
  ''
);

-- 30
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a historam function that prints the count of each letter in a string',
  'hash table',
  ''
);

-- 31
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that will union two hash tables',
  'hash table',
  ''
);

-- 32
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'implanent a linked list using your hashtable',
  'hash table',
  ''
);

-- Inserting tests into the test table here

-- 1
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 2
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 3
INSERT INTO test (input, output) VALUES (
  'Linked list',
  'Array of all the values from the linked list'
);

-- 4
INSERT INTO test (input, output) VALUES (
  'Linked list',
  'The value of the first node, but if list is empty it returns null'
);

-- 5
INSERT INTO test (input, output) VALUES (
  'Two linked list',
  'One linked list that only has the values that are the same from the inputed two linked lists'
);

-- 6
INSERT INTO test (input, output) VALUES (
  'Two linked list',
  'One linked list that contains all of the values from the original two linked lists, if there is any repeating values than that value will only show up once'
);

-- 7
INSERT INTO test (input, output) VALUES (
  'Linked list',
  'Reversed linked list'
);

-- 8
INSERT INTO test (input, output) VALUES (
  'Linked list',
  'Linked list with consective duplicate values removed'
);

-- 9
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 10
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 11
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 12
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 13
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 14
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 15
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 16
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 17
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 18
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 19
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 20
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 21
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 22
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 23
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 24
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 25
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 26
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 27
INSERT INTO test (input, output) VALUES (
  'Binary search tree',
  'Linked List of all the nodes that were in the binary search tree, bonus if they are sorted in order'
);

-- 28
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 29
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 30
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 31
INSERT INTO test (input, output) VALUES (
  '',
  ''
);

-- 32
INSERT INTO test (input, output) VALUES (
  '',
  ''
);
