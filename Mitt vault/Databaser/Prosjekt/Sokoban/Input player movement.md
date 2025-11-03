When an arrow key is pressed and held down:

- The player is moved.
- A timer is started.
    - The timer sends a signal.
    - The player listens for the signal and moves when it happens.

When the arrow key is released:

- The timer is deactivated/destroyed.

  

==Potential problem:== What if the player presses more than one arrow key?

- The last one pressed should be the one used.
- But what happens when the player releases the last one but still holds the first one?
    - BUG happens. The delay timeout is not cancelled, as it should.
    - We should check if there already is a key pressed first.