defmodule War do
  @moduledoc """
    Documentation for `War`.
  """

  @doc """
    Function stub for deal/1 is given below. Feel free to add
    as many additional helper functions as you want.

    The tests for the deal function can be found in test/war_test.exs.
    You can add your five test cases to this file.

    Run the tester by executing 'mix test' from the war directory
    (the one containing mix.exs)
  """

  #recursively want to call deal until the MAIN DECK is empty, meaning all cards have been handed out
  def deal(shuf), do: deal(shuf, [], [])
  #after handing out all the cards, call playGame with the 2 hands (playerTup)
  defp deal([], player1, player2), do: playGame{player1, player2}
  #recursive case, give the even indexed card to player1, give the odd indexed card to player 2, then call deal again
  defp deal([evencard, oddcard | tail], player1, player2) do
    deal(tail, [evencard | player1], [oddcard | player2])
  end


  #playGame takes in the player tuple
  def playGame(playerTup) do
    #pattern match
    {player1, player2} = playerTup
    #use case statement for the various possibilites
    case {player1, player2} do
      #player 1 is empty, so return player2
      {[], player2} -> player2
      #player 2 is empty so return player1
      {player1, []} -> player1
      #the actual game time, where they are not empty, the winner gets the cards at the END of their hands in the correct order
      {[c1 | restCards1], [c2 | restCards2]} ->
        if ((c1 > c2 && c2 != 1) || (c1 != c2 && c1 == 1)) do
          playGame({restCards1 ++ [c1, c2], restCards2})
        else
          if ((c2 > c1 && c1 != 1) || (c2 != c1 && c2 == 1)) do
            playGame({restCards1, restCards2 ++ [c2, c1]})
          #if the cards are EQUAL, we call the warTime method
          else
            warTime(c1, c2, restCards1, restCards2)
          end
        end
      _ -> nil
      end
  end

  #ok so, the hard part now
  #wartime should take in c1 and c2, both players hands, cause i need to alter them right?
  #what it SHOULD do, it should just add the cards in play to the warchest, then call play again with this warchest now filled with some values!
  def warTime(c1, c2, p1Cards, p2Cards, warchest \\ []) do
  #we should check, are any of them empty after entering this war?
    warchest = warchest ++ [c1, c2]
    #case statement for the various outcomes
    case {p1Cards, p2Cards} do
      #both empty? give the warchest
      {[], []} -> sortChest(warchest)
      #either empty? return the winner
      {[], _} -> playGame({[], p2Cards ++ sortChest(warchest)})
      {_, []} -> playGame({p2Cards ++ sortChest(warchest), []})
      #call warGame, but take the tails of the 2 hands since we grab the FACE DOWN cards, then add those to the warchest
      _ -> warGame({tl(p1Cards), tl(p2Cards)}, warchest ++ [hd(p1Cards), hd(p2Cards)])
    end
  end


  #ok so, if there is something in the warchest, play the game differently based on this, this is warGame
  def warGame(playerTup, warchest) do
    {player1, player2} = playerTup
    case {player1, player2} do
      #after grabbing the face down card, did any players run out? if so....
      #we just return the winner right?
      #both empty, return the warchest
      {[], []} -> sortChest(warchest)
      #if any players are empty
      {[], player2} -> player2 ++ sortChest(warchest)
      {player1, []} -> player1 ++ sortChest(warchest)
      {[c1 | restCards1], [c2 | restCards2]} ->
        #so grab the face up card, if a player wins, add to warchest and give to winning player
        #a player won! yippee, go back to normal game function after giving out the correct cards to the warchest and sorting
        if ((c1 > c2 && c2 != 1) || (c1 != c2 && c1 == 1)) do
          playGame({restCards1 ++ sortChest(warchest ++ [c1, c2]), restCards2})
        else
          if ((c2 > c1 && c1 != 1) || (c2 != c1 && c2 == 1)) do
            playGame({restCards1, restCards2 ++ sortChest(warchest ++ [c1, c2])})
          #Another tie! what are the chances! So now we need to call this whole process again BUT THIS TIME WITH A WARCHEST!
          else
            warTime(c1, c2, restCards1, restCards2, warchest)
          end
        end
      _ -> nil
      end
  end




  #need these helper functions for sorting the warchest before returning it
  def sortChest(list) do
    #this will sort it in ascending order, but i want it in the reverse order with the 1's in the front.
    list = Enum.sort(list)
    #reverse it so that it is decending
    list = Enum.reverse(list)
    #call sortChest2 to make all the 1's go to the front
    sortChest2(list)
  end

  #used for moving the ones to the front after sorting and reversing
  def sortChest2(list) do
    #pattern match ones and not ones, split it by the 1's
    {ones, not_ones} = Enum.split_with(list, &(&1 == 1))
    #return: ones at the front, and not ones at the back but still sorted
    ones ++ not_ones
  end

end
