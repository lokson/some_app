To run tests:
$ bundle
$ ruby test/app_test.rb

Within simple Object design I wanted that it would be easy to add:

- More than one robot on tabletop
  Robot class knows its position and is able to act on tabletop.
  Currently there is only one Robot instance, but it can be changed to list.
  Command syntax (MOVE etc.) would need to be changed to select robot to act.

- Undo/redo command
  Command design pattern was used.
  Command instances could be easily stored in history list.

- Choose file or console for input and output
  Aplication class works on strings, not streams.
  Currently one command line client is provided.
  Writing another client with different streams would be easy.
