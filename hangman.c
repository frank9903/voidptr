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

#include <string.h>
#include "hangman-io.h"
#include "words.h"
#include "cs136.h"

// in_word(c, word) returns true if the word has the letter c,
//    and return false otherwise
// efficiency: O(n)
bool in_word(char c, const char *word) {
  assert(word);
  int len = strlen(word);
  for(int i = 0; i < len; i++) {
    if (word[i] == c) {
      return true;
    }
  }
  return false;
}

// to_upper(c) changes the letter to upper case.
// effects: mutates *c
// efficiency: O(1)
void to_upper(char *c) {
  assert(c);
  if('a' <= *c && *c <= 'z') {
    *c = *c - 'a' + 'A';
  }
}

// is_letter(c) determines whether the character c is a letter
// efficiency: O(1)
bool is_letter(char c) {
  return ('a'<= c && c <= 'z') || ('A' <= c && c <= 'Z');
}

// guessed(c, letter) determines whether the letter has already been guessed
// requires: c must be a letter
// efficiency: O(1)
bool guessed(char c, int letter[]) {
  assert(('a' <= c && c <= 'z') ||
         ('A' <= c && c <= 'Z'));
  if (letter[c - 'A'] == 0) {
    return false;
  } else {
    return true;
  }
}

int main(void) {
  while (1) {
    int game_number;
    while (1) {
      printf(enter_game_number, max_words);
      int rv = scanf("%d", &game_number);
      if (rv == 1 && game_number > 1 && game_number < max_words) {
        break;
      }
      printf("%s", invalid_game_number);
    }
    const char *hidden = get_word(game_number);
    const int len = strlen(hidden);
    int strike = 0;
    print_hangman(strike);
    char c = 0;
    int count;
    int letter[26] = {0};
    char current[51];
    for (int i = 0; i < 51; i++) {
      if (hidden[i] == ' ') {
        current[i] = ' ';
      } else {
        current[i] = '*';
      }
    }
    current[len] = 0;
    while (1) {
      printf("%s", letter_prompt);
      printf("%s\n", current);
      count = scanf(" %c", &c);
      if (!is_letter(c)) {
        printf(not_a_letter, c);
        print_hangman(strike);
        continue;
      }
      to_upper(&c);
      if (guessed(c, letter)) {
        printf(already_guessed_letter,c);
        print_hangman(strike);
        continue;
      }
      if (in_word(c, hidden)) {
        for(int i = 0; i < len; i++) {
          if (hidden[i] == c) {
            current[i] = c;
          }
        }
        if (!strcmp(hidden, current)) {
          printf(congratulations, hidden);
          break;
        }
        letter[c - 'A'] = 1;
        print_hangman(strike);
        continue;
      }
      if (!in_word(c, hidden)) {
        letter[c - 'A'] = 1;
        printf(not_in_word, c);
        strike++;
        if (strike == max_strikes) {
          print_hangman(strike);
          printf(game_over, hidden);
          break;
        }
        printf(not_last_guess, max_strikes - strike);
        print_hangman(strike);
        continue;
      }
    }
    char again;
    while (1) {
      printf("%s", play_again);
      int rv_2 = scanf(" %c", &again);
      to_upper(&again);
      if (rv_2 == 1 && (again == 'Y' || again == 'N')) {
        break;
      } else {
        printf("%s", invalid_play_again_response);
        continue;
      }
    }
    if (again == 'Y') {
      continue;
    } else if (again == 'N') {
      break;
    }
  }
}
        
