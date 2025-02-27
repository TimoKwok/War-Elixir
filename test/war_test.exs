defmodule WarTest do
  use ExUnit.Case
  doctest War

  test "deal_1" do
    t1 = [1,1,1,1,13,13,13,13,11,11,11,11,12,12,12,12,10,10,10,10,9,9,9,9,7,7,7,7,8,8,8,8,6,6,6,6,5,5,5,5,4,4,4,4,3,3,3,3,2,2,2,2]
    r1 = [1,1,1,1,13,13,13,13,12,12,12,12,11,11,11,11,10,10,10,10,9,9,9,9,8,8,8,8,7,7,7,7,6,6,6,6,5,5,5,5,4,4,4,4,3,3,3,3,2,2,2,2]
    assert War.deal(t1) == r1
  end

  test "deal_2" do
    t2 = [1,13,1,13,1,13,1,13,12,11,12,11,12,11,12,11,10,9,10,9,10,9,10,9,8,7,8,7,8,7,8,7,6,5,6,5,6,5,6,5,4,3,4,3,4,3,4,3,2,2,2,2]
    r2 = [4,3,2,2,2,2,4,3,4,3,4,3,6,5,6,5,6,5,6,5,8,7,8,7,8,7,8,7,10,9,10,9,10,9,10,9,12,11,12,11,12,11,12,11,1,13,1,13,1,13,1,13]
    assert War.deal(t2) == r2
  end

  test "deal_3" do
    t3 = [13,1,13,1,13,1,13,1,11,12,11,12,11,12,11,12,9,10,9,10,9,10,9,10,7,8,7,8,7,8,7,8,5,6,5,6,5,6,5,6,3,4,3,4,3,4,3,4,2,2,2,2]
    r3 = [4,3,2,2,2,2,4,3,4,3,4,3,6,5,6,5,6,5,6,5,8,7,8,7,8,7,8,7,10,9,10,9,10,9,10,9,12,11,12,11,12,11,12,11,1,13,1,13,1,13,1,13]
    assert War.deal(t3) == r3
  end

  test "deal_4" do
    t4 = [10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9]
    r4 = [1,1,13,12,9,5,11,4,9,3,8,7,7,2,13,10,12,5,10,4,9,6,8,3,1,1,13,12,7,5,11,4,9,3,8,6,7,2,13,10,12,5,11,11,10,8,6,4,6,3,2,2]
    assert War.deal(t4) == r4
  end

  test "deal_5" do
    t5 = [1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13]
    r5 = [1,10,13,8,11,9,8,7,11,8,13,7,13,6,12,6,9,5,8,5,7,4,7,4,11,6,12,10,6,3,2,2,12,5,9,3,10,4,9,2,10,3,5,2,1,1,1,13,12,11,4,3]
    assert War.deal(t5) == r5
  end

  #MY OWN PERSONAL TEST CASES!
  test "deal_6" do
    t6 = [1,1,1,1,13,13,13,13,12,12,12,12,11,11,11,11,10,10,10,10,9,9,9,9,8,8,8,8,7,7,7,7,6,5,6,5,6,5,6,5,4,3,4,3,4,3,4,3,2,2,2,2]
    r6 = [4,3,2,2,2,2,4,3,4,3,4,3,6,5,6,5,6,5,6,5,1,1,1,1,13,13,13,13,12,12,12,12,11,11,11,11,10,10,10,10,9,9,9,9,8,8,8,8,7,7,7,7]
    assert War.deal(t6) == r6
  end

  test "deal_7" do
    t7 = [1,2,1,2,13,12,13,12,13,12,13,12,11,11,11,11,10,10,10,10,9,9,9,9,8,7,8,7,8,7,8,7,6,5,6,5,6,5,6,5,4,3,4,3,4,3,4,3,2,1,2,1]
    r7 = [11,4,1,11,10,10,9,9,8,8,7,5,4,4,3,3,6,3,13,5,12,2,1,1,13,11,7,2,7,2,12,10,1,9,11,5,13,7,10,4,13,8,9,6,12,8,6,3,12,6,5,2]
    assert War.deal(t7) == r7
  end

  test "deal_8" do
    t8 = [12,6,11,7,10,7,5,6,3,3,1,4,2,11,10,7,11,13,8,10,5,13,2,13,5,4,6,8,12,9,12,13,9,9,7,2,2,12,3,3,6,4,1,5,1,11,8,10,4,8,1,9]
    r8 = [8,3,1,13,13,6,11,4,12,11,12,10,6,4,9,8,5,2,1,9,10,5,10,8,8,2,1,7,7,6,5,4,13,3,12,11,12,7,4,2,1,9,13,5,10,3,3,2,11,7,9,6]
    assert War.deal(t8) == r8
  end

  test "deal_9" do
    t9 = [13,6,10,7,1,12,13,4,11,3,2,4,8,12,1,3,6,11,7,1,2,10,3,9,9,5,5,6,11,2,5,8,1,10,4,2,13,3,12,8,9,12,6,9,5,11,10,7,4,13,8,7]
    r9 = [12,7,11,10,6,5,1,6,4,2,13,10,11,7,5,5,4,3,3,3,13,12,10,5,12,11,1,10,9,9,8,8,6,4,4,3,11,2,8,2,7,6,1,12,9,2,1,13,13,9,8,7]
    assert War.deal(t9) == r9
  end

  test "deal_10" do
    t10 = [3,7,6,5,9,8,6,8,9,11,5,4,1,6,2,10,11,13,5,10,1,11,9,6,8,7,10,12,2,5,2,10,4,3,8,11,4,12,4,12,12,13,13,13,9,3,7,2,1,1,3,7]
    r10 = [5,4,12,10,9,4,1,13,12,10,2,2,8,6,12,11,11,9,9,3,8,5,6,3,1,10,5,3,3,2,11,9,1,10,13,6,12,8,6,5,13,7,11,4,1,8,13,4,7,7,7,2]
    assert War.deal(t10) == r10
  end




end
