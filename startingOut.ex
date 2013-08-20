# *** Numbers ***

iex(1)> 2 + 15
17
iex(2)> 49 * 100
4900
iex(3)> 1892 - 1472
420
iex(4)> 5 / 2
2.5

# div and rem are prefix instead of infix
iex(5)> div 5, 2
2
iex(6)> rem 5, 2
1

iex(7)> (50 * 100) - 4999
1
iex(8)> -(50 * 100 - 4999)
-1
iex(9)> -50 * (100 - 4999)
244950

# Built-in binary and hex conversion, cannot specify other bases
iex(18)> 0b101010
42
iex(19)> 0xAE
174

# Using lowercase variable names instead of beginning with caps
iex(21)> one = 1
1
iex(22)> un = uno = one = 1
1
iex(23)> two = one + one
2
iex(24)> two = 2
2
iex(25)> two = two + 1
3
iex(26)> two = 2
2
iex(27)> ^two = two + 1
** (MatchError) no match of right hand side value: 3
    :erl_eval.expr/3
# Using ^ refers to the value of the variable

iex(28)> 47 = 45 + 2
47
iex(29)> 47 = 45 + 3
** (MatchError) no match of right hand side value: 48
    :erl_eval.expr/3


iex(29)> Two = 2
** (MatchError) no match of right hand side value: 2
    :erl_eval.expr/3
# Opposite of erlang, variables start with lowercase instead of capital

iex(30)> _ = 14 + 3
17
iex(31)> _
** (ErlangError) erlang error: {:unbound_var, :_}
    :erl_eval.exprs/2

# *** Atoms ***
# Uses : to indicate atom instead of lowercase
iex(32)> :atom
:atom
iex(33)> :atoms_rule
:atoms_rule
iex(34)> :atoms_rule@elixir
:"atoms_rule@elixir"
iex(35)> :'Atoms can be cheated!'
:"Atoms can be cheated!"

# In Elixir, booleans are also atoms
iex(36)> :true = true
true
iex(37)> true = :true
true

# *** Boolean Algebra & Comparison operators ***
iex(38)> true and false
false
iex(39)> true or false
true
iex(40)> true xor false
true
iex(41)> not false
true
iex(42)> not (true and true)
false

# Elixir uses more traditional symbols for equality
iex(43)> 5 == 5
true
iex(44)> 1 == 0
false
iex(45)> 1 != 0
true
iex(46)> 5 == 5.0
true
iex(47)> 5 === 5.0
false
iex(48)> 5 != 5.0
false
iex(49)> 1 < 2
true
iex(50)> 1 < 1
false
iex(51)> 1 >= 1
true
iex(52)> 1 <= 1
true

iex(54)> 5 + "llama"
** (ArithmeticError) bad argument in arithmetic expression
    :erlang.+(5, "llama")
    erl_eval.erl:569: :erl_eval.do_apply/6
    src/elixir.erl:147: :elixir.eval_forms/3
iex(53)> 5 == true
false

iex(54)> 0 == false
false
iex(55)> 1 < false
true

# *** tuples ***
iex(62)> x = 10; y = 4
4
iex(63)> point = {x, y}
{10, 4}
iex(64)> point = {4, 5}
{4, 5}
iex(65)> {x, y} = point
{4, 5}
iex(66)> x
4
iex(67)> {x, _} = point
{4, 5}
iex(68)> {_, _} = {4, 5}
{4, 5}
iex(69)> {_, _, _} = {4, 5, 6}
{4, 5, 6}
iex(70)> temperature = 23.213
23.213
iex(71)> preciseTemperature = {:celsius, 23.213}
{:celsius, 23.213}
iex(72)> {:kelvin, t} = preciseTemperature
** (MatchError) no match of right hand side value: {:celsius, 23.213}
    :erl_eval.expr/3

# tagged tuple
iex(72)> {:point, {x,y}}
{:point, {4, 5}}

# *** Lists ***
iex(73)> [1, 2, 3, {:numbers, [4, 5, 6]}, 5.34, :atom]
[1, 2, 3, {:numbers, [4, 5, 6]}, 5.34, :atom]
iex(74)> [97, 98, 99]  
'abc'
iex(75)> [97, 98, 99, 4, 5, 6]
[97, 98, 99, 4, 5, 6]
iex(76)> [233]
'��'
iex(77)> [1,2,3] ++ [4,5]
[1, 2, 3, 4, 5]
iex(78)> [1,2,3,4,5] -- [1,2,3]
[4, 5]
iex(79)> [2,4,2] -- [2,4]
[2]
iex(80)> [2,4,2] -- [2,4,2]
[]
iex(81)> [1,2,3] -- [1,2] -- [3]
[3]
iex(82)> [1,2,3] -- [1,2] -- [2]
[2, 3]

iex(83)> list = [2,3,4]
[2, 3, 4]
iex(84)> newList = [1 | list]
[1, 2, 3, 4]
iex(85)> [head|tail] = newList
[1, 2, 3, 4]
iex(86)> head
1
iex(87)> tail
[2, 3, 4]
iex(88)> [newhead|newtail] = tail
[2, 3, 4]
iex(89)> newhead
2

iex(90)> [1|[]]
[1]
iex(91)> [2 | [1 | []]]
[2, 1]
iex(92)> [3 | [2 | [1 | []]]]
[3, 2, 1]

# these do not work
iex(93)> [a, b | [c, d]]
** (UndefinedFunctionError) undefined function: IEx.Helpers.a/0
    IEx.Helpers.a()
    erl_eval.erl:569: :erl_eval.do_apply/6
    erl_eval.erl:220: :erl_eval.expr/5
    src/elixir.erl:147: :elixir.eval_forms/3
iex(93)> [a, b | [c | [d]]] 
** (UndefinedFunctionError) undefined function: IEx.Helpers.a/0
    IEx.Helpers.a()
    erl_eval.erl:569: :erl_eval.do_apply/6
    erl_eval.erl:220: :erl_eval.expr/5
    src/elixir.erl:147: :elixir.eval_forms/3

    # *** List comprehensions ***
    