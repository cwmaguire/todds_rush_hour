-type colour() :: blue | red | green | yellow.
-type orientation() :: horizontal | vertical.

-record(car, {id :: string(),
              colour :: colour(),
              length = 1 :: int}).

-record(puzzle_entry, {car :: #car{},
                       orientation :: orientation(),
                       start_square :: integer()}).

-record(puzzle_card, {puzzle_entries = [] :: list()}).

-record(vehicle_placement, {car :: #car{},
                            orientation :: orientation(),
                            coverage :: list(integer())}).

-record(game, {vehicle_placements = [] :: list(),
               moves = [],
               is_puzzle_solved = false :: boolean()}).

-define(SIZE, 6).
-define(EXIT_SQUARE, 18).

