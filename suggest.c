/////////////////////////////////////////////////////////////////////////////
// INTEGRITY INSTRUCTIONS

// Explicitly state the level of collaboration on this question
// Examples:
//   * I discussed ideas with classmate(s) [include name(s)]
//   * I worked together with classmate(s) in the lab [include name(s)]
//   * Classmate [include name] helped me debug my code
//   * I consulted website [include url]
//   * None
// A "None" indicates you completed this question entirely by yourself
// (or with assistance from course staff)
/////////////////////////////////////////////////////////////////////////////
// INTEGRITY STATEMENT:
// I received help from the following sources:

// none

// Name: Miaoqi Zhang
// login ID: m337zhan
/////////////////////////////////////////////////////////////////////////////

#include <stdlib.h>
#include "suggest.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>

static char *my_strdup(const char *s) {
  char *newstr = malloc((strlen(s) + 1) * sizeof(char));
  strcpy(newstr, s);
  return newstr;
}


static char *sigle_deletion(const char *s, int index) {
  char *new_s = my_strdup(s);
  int len = strlen(new_s);
  assert(index < len);
  for (int i = index; i < len; i++) {
    new_s[i] = new_s[i + 1];
  }
  return new_s;
}


static char *single_insertion(const char *s, int index, char c) {
  assert('a' <= c && c <= 'z');
  char *new_s = my_strdup(s);
  int len = strlen(new_s);
  assert(index < len + 1);
  new_s = realloc(new_s, (len + 2) * sizeof(char));
  for (int i = len; i >= index; i--) {
    new_s[i + 1] = new_s[i];
  }
  new_s[index] = c;
  return new_s;
}


static char *single_substitution(const char *s, int index, char c) {
  assert('a' <= c && c <= 'z');
  char *new_s = my_strdup(s);
  new_s[index] = c;
  return new_s;
}


static void swap(char *a, char *b) {
  char backup = *a;
  *a = *b;
  *b = backup;
}


static char *adjacent_swap(const char *s, int index) {
  char *new_s = my_strdup(s);
  swap(&new_s[index], &new_s[index + 1]);
  return new_s;
}


struct wordlist *suggest(const char *s,
                         bool (*is_word)(const char *)) {
  struct wordlist *wl = wordlist_create();
  int len = strlen(s);
  char *cur = NULL;
  for (int i = 0; i < len; i++) {
    cur = sigle_deletion(s, i);
    if (is_word(cur) && strcmp(cur, s) && strcmp(cur, "")) {
      wordlist_add(cur, wl);
    }
    free(cur);
  }
  for (int i = 0; i <= len; i++) {
    for (int j = 0; j < 26; j++) {
      char c = 'a' + j;
      cur = single_insertion(s, i, c);
      if (is_word(cur) && strcmp(cur, s) && strcmp(cur, "")) {
        wordlist_add(cur, wl);
      }
      free(cur);
    }
  }
  for (int i = 0; i < len; i++) {
    for (int j = 0; j < 26; j++) {
      char c = 'a' + j;
      cur = single_substitution(s, i ,c);
      if (is_word(cur) && strcmp(cur, s) && strcmp(cur, "")) {
        wordlist_add(cur, wl);
      }
      free(cur);
    }
  }
  for (int i = 0; i < len - 1; i++) {
    cur = adjacent_swap(s, i);
    if (is_word(cur) && strcmp(cur, s) && strcmp(cur, "")) {
      wordlist_add(cur, wl);
    }
    free(cur);
  }
  return wl;
}