-module(rush_hour).

-include("rush_hour.hrl").

-export([play/1]).
-export([game/1]).
-export([game_car_squares/2]).


play(#puzzle_card{puzzle_entries = PuzzleEntries}) ->   %% {puzzle_card, _, _, _}
    F = fun vehicle_placement_squares/1,
    VehiclePlacements = [vehicle_placement(PE, F(PE)) || PE <- PuzzleEntries].

vehicle_placement(#puzzle_entry{car = Car,
                                orientation = Orientation},
                  Squares) ->
    ok.

vehicle_placement_squares(#puzzle_entry{start_square = StartingPosition,
                                        car = Car,
                                        orientation = Orientation}) ->
    vehicle_placement_squares(StartingPosition, Car, Orientation).

vehicle_placement_squares(StartSquare, Car, horizontal) ->
    lists:seq(StartSquare, StartSquare + Car#car.length - 1);
vehicle_placement_squares(StartSquare, Car, vertical) ->
    [StartSquare + (Placement * ?SIZE)
       || Placement <-
          lists:seq(StartSquare, StartSquare + Car#car.length - 1)].

game(#puzzle_card{puzzle_entries = PuzzleEntries}) ->
    lists:map(fun vehicle_placement/1, PuzzleEntries).

vehicle_placement(PuzzleEntry = #puzzle_entry{car = Car,
                                              orientation = Orientation}) ->
    VehiclePlacementSquares = vehicle_placement_squares(PuzzleEntry),
    #vehicle_placement{car = Car,
                       orientation = Orientation,
                       coverage = VehiclePlacementSquares}.

game_car_squares(#game{vehicle_placements = Placements},
                 #car{id = Id0}) ->
    [P] =
        [P_ || P_ = #vehicle_placement{car = #car{id = Id1}}
               <- Placements, Id0 == Id1],
    P#vehicle_placement.coverage.

