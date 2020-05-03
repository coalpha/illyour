import rdstdin
import random
import strutils
import sequtils
import os

randomize()

var respectWords = false

for arg in os.commandLineParams():
   case arg
   of "--help", "/?", "/help":
      if rand(1) == 1:
         echo "illyour\n[--help] [/help] [/?]\n[--respectWords] [-r] [/respectWords] [/r]"
      else:
         echo "illyour\n[/help] [/?] [--help]\n[/respectWords] [/r] [--respectWords] [-r]"
      echo "   with the respect words option on, illyour will not split words"
      system.quit(0)
   of "--respectWords", "-r", "/respectWords", "/r":
      respectWords = true
   else:
      echo "unknown arg \"" & arg & "\":"
      system.quit(1)

randomize()

if respectWords:
   echo "I'll I'll your your input (respectfully)"
else:
   echo "I'll I'll your your input:"

while true:
   var words = readLineFromStdin("> ").split(" ")
   let wordIdx = rand(words.len - 1)
   let word = words[wordIdx]
   if respectWords:
      words.insert(@["your"], wordIdx)
   else:
      let splitPoint = if word.len > 0: rand(word.len - 1) else: 0
      if splitPoint == 0:
         words.insert(@["your"], wordIdx)
      else:
         words.delete(wordIdx)
         words.insert(@[word[0..splitPoint - 1], "your", word[splitPoint..^1]], wordIdx)
   echo "< I'll " & words.join(" ")
