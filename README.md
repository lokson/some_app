## Install
Git clone, bundle and run

    $ ruby cli.rb
    
To run tests:

    $ ruby test/app_test.rb

## Notes on design
Object design had a purpose to be easy to expand with:

### More than one robot on tabletop
- Each Robot instance knows its position and is able to act on tabletop.
- Single robot instance in app should be changed to list of robots.
- Command syntax (MOVE etc.) would need to be changed to select robot to act.

### Undo/redo command
- Command design pattern was used.
- Command instances could be easily stored in list as history.

### Choose file or console for input and output
- Aplication class works on strings, not streams.
- Currently only command line client (cli) is provided.
- Writing another client with different streams would be easy.
