{-# OPTIONS_GHC -w #-}
module Grammar where

import Lexer
import Token
import ASA
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,147) ([1920,0,4,0,0,0,0,0,0,0,56832,4095,240,32768,7,15360,0,480,0,15,30720,0,960,0,30,61440,0,1920,0,60,57344,1,3840,0,64,0,2,512,0,16,32768,7,16384,0,480,0,31,63488,0,1984,0,62,61440,1,3968,0,124,57344,3,7936,0,248,0,0,15872,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7680,0,240,32768,8,0,0,0,0,15,32768,0,1024,0,0,61440,0,2048,0,0,0,2,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","ASA","opArgs","vars","appArgs","var","num","boolean","'('","')'","'+'","'-'","'*'","'/'","'='","'<'","'>'","\"!=\"","\"<=\"","\">=\"","\"not\"","\"if\"","\"let\"","\"lambda\"","%eof"]
        bit_start = st Prelude.* 27
        bit_end = (st Prelude.+ 1) Prelude.* 27
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..26]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (8) = happyShift action_2
action_0 (9) = happyShift action_4
action_0 (10) = happyShift action_5
action_0 (11) = happyShift action_6
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (8) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (27) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 _ = happyReduce_3

action_6 (8) = happyShift action_2
action_6 (9) = happyShift action_4
action_6 (10) = happyShift action_5
action_6 (11) = happyShift action_6
action_6 (13) = happyShift action_8
action_6 (14) = happyShift action_9
action_6 (15) = happyShift action_10
action_6 (16) = happyShift action_11
action_6 (17) = happyShift action_12
action_6 (18) = happyShift action_13
action_6 (19) = happyShift action_14
action_6 (20) = happyShift action_15
action_6 (21) = happyShift action_16
action_6 (22) = happyShift action_17
action_6 (23) = happyShift action_18
action_6 (24) = happyShift action_19
action_6 (25) = happyShift action_20
action_6 (26) = happyShift action_21
action_6 (4) = happyGoto action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (8) = happyShift action_2
action_7 (9) = happyShift action_4
action_7 (10) = happyShift action_5
action_7 (11) = happyShift action_6
action_7 (4) = happyGoto action_37
action_7 (7) = happyGoto action_38
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (8) = happyShift action_2
action_8 (9) = happyShift action_4
action_8 (10) = happyShift action_5
action_8 (11) = happyShift action_6
action_8 (4) = happyGoto action_26
action_8 (5) = happyGoto action_36
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (8) = happyShift action_2
action_9 (9) = happyShift action_4
action_9 (10) = happyShift action_5
action_9 (11) = happyShift action_6
action_9 (4) = happyGoto action_26
action_9 (5) = happyGoto action_35
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (8) = happyShift action_2
action_10 (9) = happyShift action_4
action_10 (10) = happyShift action_5
action_10 (11) = happyShift action_6
action_10 (4) = happyGoto action_26
action_10 (5) = happyGoto action_34
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (8) = happyShift action_2
action_11 (9) = happyShift action_4
action_11 (10) = happyShift action_5
action_11 (11) = happyShift action_6
action_11 (4) = happyGoto action_26
action_11 (5) = happyGoto action_33
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (8) = happyShift action_2
action_12 (9) = happyShift action_4
action_12 (10) = happyShift action_5
action_12 (11) = happyShift action_6
action_12 (4) = happyGoto action_26
action_12 (5) = happyGoto action_32
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (8) = happyShift action_2
action_13 (9) = happyShift action_4
action_13 (10) = happyShift action_5
action_13 (11) = happyShift action_6
action_13 (4) = happyGoto action_26
action_13 (5) = happyGoto action_31
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (8) = happyShift action_2
action_14 (9) = happyShift action_4
action_14 (10) = happyShift action_5
action_14 (11) = happyShift action_6
action_14 (4) = happyGoto action_26
action_14 (5) = happyGoto action_30
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (8) = happyShift action_2
action_15 (9) = happyShift action_4
action_15 (10) = happyShift action_5
action_15 (11) = happyShift action_6
action_15 (4) = happyGoto action_26
action_15 (5) = happyGoto action_29
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (8) = happyShift action_2
action_16 (9) = happyShift action_4
action_16 (10) = happyShift action_5
action_16 (11) = happyShift action_6
action_16 (4) = happyGoto action_26
action_16 (5) = happyGoto action_28
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (8) = happyShift action_2
action_17 (9) = happyShift action_4
action_17 (10) = happyShift action_5
action_17 (11) = happyShift action_6
action_17 (4) = happyGoto action_26
action_17 (5) = happyGoto action_27
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (8) = happyShift action_2
action_18 (9) = happyShift action_4
action_18 (10) = happyShift action_5
action_18 (11) = happyShift action_6
action_18 (4) = happyGoto action_25
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (8) = happyShift action_2
action_19 (9) = happyShift action_4
action_19 (10) = happyShift action_5
action_19 (11) = happyShift action_6
action_19 (4) = happyGoto action_24
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (11) = happyShift action_23
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (11) = happyShift action_22
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (8) = happyShift action_57
action_22 (6) = happyGoto action_56
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (8) = happyShift action_55
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (8) = happyShift action_2
action_24 (9) = happyShift action_4
action_24 (10) = happyShift action_5
action_24 (11) = happyShift action_6
action_24 (4) = happyGoto action_54
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (12) = happyShift action_53
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (8) = happyShift action_2
action_26 (9) = happyShift action_4
action_26 (10) = happyShift action_5
action_26 (11) = happyShift action_6
action_26 (4) = happyGoto action_52
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (8) = happyShift action_2
action_27 (9) = happyShift action_4
action_27 (10) = happyShift action_5
action_27 (11) = happyShift action_6
action_27 (12) = happyShift action_51
action_27 (4) = happyGoto action_41
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (8) = happyShift action_2
action_28 (9) = happyShift action_4
action_28 (10) = happyShift action_5
action_28 (11) = happyShift action_6
action_28 (12) = happyShift action_50
action_28 (4) = happyGoto action_41
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (8) = happyShift action_2
action_29 (9) = happyShift action_4
action_29 (10) = happyShift action_5
action_29 (11) = happyShift action_6
action_29 (12) = happyShift action_49
action_29 (4) = happyGoto action_41
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (8) = happyShift action_2
action_30 (9) = happyShift action_4
action_30 (10) = happyShift action_5
action_30 (11) = happyShift action_6
action_30 (12) = happyShift action_48
action_30 (4) = happyGoto action_41
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (8) = happyShift action_2
action_31 (9) = happyShift action_4
action_31 (10) = happyShift action_5
action_31 (11) = happyShift action_6
action_31 (12) = happyShift action_47
action_31 (4) = happyGoto action_41
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (8) = happyShift action_2
action_32 (9) = happyShift action_4
action_32 (10) = happyShift action_5
action_32 (11) = happyShift action_6
action_32 (12) = happyShift action_46
action_32 (4) = happyGoto action_41
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (8) = happyShift action_2
action_33 (9) = happyShift action_4
action_33 (10) = happyShift action_5
action_33 (11) = happyShift action_6
action_33 (12) = happyShift action_45
action_33 (4) = happyGoto action_41
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (8) = happyShift action_2
action_34 (9) = happyShift action_4
action_34 (10) = happyShift action_5
action_34 (11) = happyShift action_6
action_34 (12) = happyShift action_44
action_34 (4) = happyGoto action_41
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (8) = happyShift action_2
action_35 (9) = happyShift action_4
action_35 (10) = happyShift action_5
action_35 (11) = happyShift action_6
action_35 (12) = happyShift action_43
action_35 (4) = happyGoto action_41
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (8) = happyShift action_2
action_36 (9) = happyShift action_4
action_36 (10) = happyShift action_5
action_36 (11) = happyShift action_6
action_36 (12) = happyShift action_42
action_36 (4) = happyGoto action_41
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_23

action_38 (8) = happyShift action_2
action_38 (9) = happyShift action_4
action_38 (10) = happyShift action_5
action_38 (11) = happyShift action_6
action_38 (12) = happyShift action_40
action_38 (4) = happyGoto action_39
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_24

action_40 _ = happyReduce_18

action_41 _ = happyReduce_20

action_42 _ = happyReduce_4

action_43 _ = happyReduce_5

action_44 _ = happyReduce_6

action_45 _ = happyReduce_7

action_46 _ = happyReduce_8

action_47 _ = happyReduce_9

action_48 _ = happyReduce_10

action_49 _ = happyReduce_11

action_50 _ = happyReduce_12

action_51 _ = happyReduce_13

action_52 _ = happyReduce_19

action_53 _ = happyReduce_14

action_54 (8) = happyShift action_2
action_54 (9) = happyShift action_4
action_54 (10) = happyShift action_5
action_54 (11) = happyShift action_6
action_54 (4) = happyGoto action_61
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (8) = happyShift action_2
action_55 (9) = happyShift action_4
action_55 (10) = happyShift action_5
action_55 (11) = happyShift action_6
action_55 (4) = happyGoto action_60
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (8) = happyShift action_58
action_56 (12) = happyShift action_59
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_21

action_58 _ = happyReduce_22

action_59 (8) = happyShift action_2
action_59 (9) = happyShift action_4
action_59 (10) = happyShift action_5
action_59 (11) = happyShift action_6
action_59 (4) = happyGoto action_64
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (12) = happyShift action_63
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (12) = happyShift action_62
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_15

action_63 (8) = happyShift action_2
action_63 (9) = happyShift action_4
action_63 (10) = happyShift action_5
action_63 (11) = happyShift action_6
action_63 (4) = happyGoto action_66
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (12) = happyShift action_65
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_17

action_66 (12) = happyShift action_67
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_16

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn4
		 (Var happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyTerminal (TokenNum happy_var_1))
	 =  HappyAbsSyn4
		 (Num happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 (HappyTerminal (TokenBool happy_var_1))
	 =  HappyAbsSyn4
		 (Boolean happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happyReduce 4 4 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Add (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 4 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Sub (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 4 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Mul (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 4 4 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Div (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 4 4 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Equal (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 4 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Less (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 4 4 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Greater (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 4 4 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Diff (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 4 4 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Leq (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 4 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Geq (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 4 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Not happy_var_3
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 6 4 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_3 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 8 4 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	(HappyTerminal (TokenVar happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Let happy_var_4 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 7 4 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lambda (reverse happy_var_4) happy_var_6
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 4 4 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (App happy_var_2 (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_2  5 happyReduction_19
happyReduction_19 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_2, happy_var_1]
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  5 happyReduction_20
happyReduction_20 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_2 : happy_var_1
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  6 happyReduction_21
happyReduction_21 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_2  6 happyReduction_22
happyReduction_22 (HappyTerminal (TokenVar happy_var_2))
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_2 : happy_var_1
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  7 happyReduction_23
happyReduction_23 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  7 happyReduction_24
happyReduction_24 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_2 : happy_var_1
	)
happyReduction_24 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 27 27 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenVar happy_dollar_dollar -> cont 8;
	TokenNum happy_dollar_dollar -> cont 9;
	TokenBool happy_dollar_dollar -> cont 10;
	TokenPA -> cont 11;
	TokenPC -> cont 12;
	TokenAdd -> cont 13;
	TokenSub -> cont 14;
	TokenMul -> cont 15;
	TokenDiv -> cont 16;
	TokenEq -> cont 17;
	TokenLt -> cont 18;
	TokenGt -> cont 19;
	TokenNeq -> cont 20;
	TokenLeq -> cont 21;
	TokenGeq -> cont 22;
	TokenNot -> cont 23;
	TokenIf -> cont 24;
	TokenLet -> cont 25;
	TokenLambda -> cont 26;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 27 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Error al Parsear los Tokens"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
