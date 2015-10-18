## Install
Git clone, bundle and run

    $ ruby cli.rb
    
To run tests:

    $ ruby test/app_test.rb

## Notes on design
App tries to make sense out of wrong syntax as much as possible. `PLACE 0,0,NORTH WRONG-STRING MOVE` will be interpreted as `PLACE` and `MOVE` with WRONG-STRING part ignored.

Due to design, functionality could be easy expanded with:

### More than one robot on tabletop
- Robot has a Class representation
- Each robot instance knows its position and is able to act on tabletop.
- Command syntax (MOVE etc.) would need to be changed to select robot to act.

### Undo/redo command
- Command design pattern was used.
- Command instances could be easily stored in list as history.
- Undo/redo would require pointer to current position in that history
- Undo/redo would be implemented as sibiling method to run.

### Choose file or console for input and output
- Aplication class works on strings, not streams.
- Currently only command line client (cli) is provided.
- Writing another client with different streams would be easy.
