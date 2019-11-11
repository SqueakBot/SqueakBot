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
  'write a function that deletes N nodes after M nodes of a linked list',
  'linked list',
  'main problem is to maintain proper link between nodes, make sure all corner cases'
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
  'implanet counters, make sure that every letter is lowercased'
);

-- 13
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'implement a stack using queues',
  'stack/queue',
  'you can do this with two queues or one single queue'
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
  'use recursion to do this'
);

-- 22
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that will compute the depth of the binary search tree',
  'binary search tree',
  'the best solution is to do a level order traversal'
);

-- 23
INSERT INTO challenges (challenges, data_type, hint) VALUES (
  'write a function that will compare two binary trees and determine if they are structurally identical',
  'binary search tree',
  'both trees are going to have to be traversed simultaneously, while doing that data and children from each tree will need to be compared'
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
  'write a histogram function that prints the count of each letter in a string',
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
  'write a function that implements a hashtable using a linked list',
  'hash table',
  ''
);

-- Inserting tests into the test table here

-- 1
INSERT INTO test (input, output) VALUES (
  'what values that are assigned to N and M, and a linked list',
  'linked list with the values that were after M removed'
);

-- 2
INSERT INTO test (input, output) VALUES (
  'linked list',
  'return all the values of the linked list in it'
);

-- 3
INSERT INTO test (input, output) VALUES (
  'linked list',
  'array of all the values from the linked list'
);

-- 4
INSERT INTO test (input, output) VALUES (
  'linked list',
  'the value of the first node, but if list is empty it returns null'
);

-- 5
INSERT INTO test (input, output) VALUES (
  'two linked list',
  'one linked list that only has the values that are the same from the inputed two linked lists'
);

-- 6
INSERT INTO test (input, output) VALUES (
  'two linked list',
  'one linked list that contains all of the values from the original two linked lists, if there is any repeating values than that value will only show up once'
);

-- 7
INSERT INTO test (input, output) VALUES (
  'linked list',
  'reversed linked list'
);

-- 8
INSERT INTO test (input, output) VALUES (
  'linked list',
  'linked list with consective duplicate values removed'
);

-- 9
INSERT INTO test (input, output) VALUES (
  'functions that are waiting to be called in a queue',
  'whatever those functions do'
);

-- 10
INSERT INTO test (input, output) VALUES (
  'string that has either matching braces or no matching braces',
  'true if the string has matching braces, false if the string does not have matching braces'
);

-- 11
INSERT INTO test (input, output) VALUES (
  'stack',
  'queue that uses an array to rotate'
);

-- 12
INSERT INTO test (input, output) VALUES (
  'a string that either contains a palindrome or not',
  'true if the string is a palindrome, false if the string is not a palindrome'
);

-- 13
INSERT INTO test (input, output) VALUES (
  'seperate node values',
  'stack'
);

-- 14
INSERT INTO test (input, output) VALUES (
  'binary tree',
  'return the value of that tree'
);

-- 15
INSERT INTO test (input, output) VALUES (
  'binary tree',
  'return the value of that tree'
);

-- 16
INSERT INTO test (input, output) VALUES (
  'binary tree',
  'number that is the amount of leaves that, that tree has'
);

-- 17
INSERT INTO test (input, output) VALUES (
  'binary tree',
  'number that is the amount of edges that, that tree has'
);

-- 18
INSERT INTO test (input, output) VALUES (
  'tree',
  'return the number of max childs that a node has'
);

-- 19
INSERT INTO test (input, output) VALUES (
  'binary tree',
  'return true if nth child has been removed, return false if nth child has not been removed'
);

-- 20
INSERT INTO test (input, output) VALUES (
  'binary search tree',
  'return true if that value is within the tree, return false if that value is not within the tree'
);

-- 21
INSERT INTO test (input, output) VALUES (
  'binary search tree',
  'return the value of all the nodes in the tree summed together'
);

-- 22
INSERT INTO test (input, output) VALUES (
  'binary search tree',
  'return the value of the depth of the tree'
);

-- 23
INSERT INTO test (input, output) VALUES (
  'binary search tree',
  'return true if the trees are structurally identical, return false if the trees are not structurally identical'
);

-- 24
INSERT INTO test (input, output) VALUES (
  'two binary search trees',
  'returns one binary search tree, that is a combination of original two binary search trees, if there are repeats it returns only one of them'
);

-- 25
INSERT INTO test (input, output) VALUES (
  'two binary search trees',
  'returns one binary search tree, that is only the nodes that are the same from each of the original trees'
);

-- 26
INSERT INTO test (input, output) VALUES (
  'binary search tree',
  'true if the binary search tree is valid, false if the binary search tree is invalid'
);

-- 27
INSERT INTO test (input, output) VALUES (
  'binary search tree',
  'linked list of all the nodes that were in the binary search tree, bonus if they are sorted in order'
);

-- 28
INSERT INTO test (input, output) VALUES (
  'string',
  'number that is the value of that string'
);

-- 29
INSERT INTO test (input, output) VALUES (
  'string',
  'however you want to return the first letter that duplicates in that string'
);

-- 30
INSERT INTO test (input, output) VALUES (
  'string',
  'however you want to return how many times each letter occurs in a string'
);

-- 31
INSERT INTO test (input, output) VALUES (
  'two seperate hashtables',
  'one hashtable that contains the all the values from the inputed two hashtables'
);

-- 32
INSERT INTO test (input, output) VALUES (
  'linked list',
  'a hashtable containing the values from a linked list'
);
