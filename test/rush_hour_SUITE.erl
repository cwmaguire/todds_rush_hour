-module(rush_hour_SUITE).

-include("rush_hour.hrl").

-include_lib("eunit/include/eunit.hrl").

-export([all/0]).


-export([test_red_car_coverage/1]).

-define(CAR_X, #car{id = "X", colour = red, length = 2}).
-define(CAR_A, #car{id = "A", colour = blue, length = 3}).
-define(CAR_B, #car{id = "B", colour = green, length = 2}).

all() ->
    [test_red_car_coverage].

three_car_game() ->
    CarXEntry = #puzzle_entry{car = ?CAR_X,
                              orientation = horizontal,
                              start_square = 14},
    CarAEntry = #puzzle_entry{car = ?CAR_A,
                              orientation = vertical,
                              start_square = 6},
    CarBEntry = #puzzle_entry{car = ?CAR_B,
                              orientation = vertical,
                              start_square = 3},
    PuzzleCard = #puzzle_card{puzzle_entries = [CarXEntry,
                                                CarAEntry,
                                                CarBEntry]},
    #game{vehicle_placements = rush_hour:game(PuzzleCard)}.

puzzle_entry(Car, Orientation, StartSquare) ->
    ok.

test_red_car_coverage(_Config) ->
    Game = three_car_game(),
    CoveredSquares = rush_hour:game_car_squares(Game, ?CAR_X),
    ?assertEqual([14, 15], CoveredSquares).
