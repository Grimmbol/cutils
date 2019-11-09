# cutils
Trying to add to this repo whenever I need some home-cooked reusable utility functions for C. Implementation quality will vary

## Usage
Call `make` to compile libary. If the make variable SHARED is set to "true", the result will be a dynamic library. Otherwise, the result will be static

`make test` compiles both static and (eventually) shared libraries and runs some simple tests
