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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,264) ([61440,2,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,65522,16383,61440,2,0,0,0,0,0,12,0,61440,10,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,61440,2,0,32768,0,0,32768,0,0,32768,0,0,61440,2,0,61440,2,0,32768,0,0,0,2,0,0,2,0,0,0,0,61440,2,0,4096,0,0,0,1,0,0,1,0,32768,0,0,4096,0,0,32768,0,0,0,1,0,0,1,0,61440,2,0,61440,2,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,61440,2,0,61440,3,0,61440,3,0,61440,3,0,61440,3,0,61440,3,0,61440,3,0,61440,3,0,61440,3,0,61440,3,0,61440,3,0,0,0,0,61440,3,0,61440,2,0,0,0,0,61440,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,2,0,61440,2,0,0,0,0,0,0,0,32768,1,0,0,0,0,4096,0,0,61440,2,0,32768,1,0,0,0,0,0,0,0,4096,1,0,0,0,0,61440,2,0,0,0,0,61440,2,16384,61440,2,0,0,4,0,0,0,0,61440,2,0,0,0,0,61440,2,0,0,1,0,61440,2,0,61440,2,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,61440,2,0,0,1,0,0,1,0,0,0,0,0,4,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","ASA","opArgs","ids","id","vars","appArgs","listArgs","condis","condy","var","num","boolean","'('","')'","'['","']'","','","'+'","'-'","'*'","'/'","'='","'<'","'>'","\"!=\"","\"<=\"","\">=\"","\"++\"","\"--\"","\"sqrt\"","\"**\"","\"not\"","\"if0\"","\"if\"","\"fst\"","\"snd\"","\"let\"","\"letrec\"","\"let*\"","\"head\"","\"tail\"","\"lambda\"","\"cond\"","\"else\"","%eof"]
        bit_start = st Prelude.* 48
        bit_end = (st Prelude.+ 1) Prelude.* 48
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..47]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (13) = happyShift action_2
action_0 (14) = happyShift action_4
action_0 (15) = happyShift action_5
action_0 (16) = happyShift action_6
action_0 (18) = happyShift action_7
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (13) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (48) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 _ = happyReduce_3

action_6 (13) = happyShift action_2
action_6 (14) = happyShift action_4
action_6 (15) = happyShift action_5
action_6 (16) = happyShift action_6
action_6 (18) = happyShift action_7
action_6 (21) = happyShift action_11
action_6 (22) = happyShift action_12
action_6 (23) = happyShift action_13
action_6 (24) = happyShift action_14
action_6 (25) = happyShift action_15
action_6 (26) = happyShift action_16
action_6 (27) = happyShift action_17
action_6 (28) = happyShift action_18
action_6 (29) = happyShift action_19
action_6 (30) = happyShift action_20
action_6 (31) = happyShift action_21
action_6 (32) = happyShift action_22
action_6 (33) = happyShift action_23
action_6 (34) = happyShift action_24
action_6 (35) = happyShift action_25
action_6 (36) = happyShift action_26
action_6 (37) = happyShift action_27
action_6 (38) = happyShift action_28
action_6 (39) = happyShift action_29
action_6 (40) = happyShift action_30
action_6 (41) = happyShift action_31
action_6 (42) = happyShift action_32
action_6 (43) = happyShift action_33
action_6 (44) = happyShift action_34
action_6 (45) = happyShift action_35
action_6 (46) = happyShift action_36
action_6 (4) = happyGoto action_10
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (13) = happyShift action_2
action_7 (14) = happyShift action_4
action_7 (15) = happyShift action_5
action_7 (16) = happyShift action_6
action_7 (18) = happyShift action_7
action_7 (4) = happyGoto action_8
action_7 (10) = happyGoto action_9
action_7 _ = happyReduce_42

action_8 _ = happyReduce_43

action_9 (19) = happyShift action_69
action_9 (20) = happyShift action_70
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (13) = happyShift action_2
action_10 (14) = happyShift action_4
action_10 (15) = happyShift action_5
action_10 (16) = happyShift action_6
action_10 (18) = happyShift action_7
action_10 (20) = happyShift action_68
action_10 (4) = happyGoto action_66
action_10 (9) = happyGoto action_67
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (13) = happyShift action_2
action_11 (14) = happyShift action_4
action_11 (15) = happyShift action_5
action_11 (16) = happyShift action_6
action_11 (18) = happyShift action_7
action_11 (4) = happyGoto action_55
action_11 (5) = happyGoto action_65
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (13) = happyShift action_2
action_12 (14) = happyShift action_4
action_12 (15) = happyShift action_5
action_12 (16) = happyShift action_6
action_12 (18) = happyShift action_7
action_12 (4) = happyGoto action_55
action_12 (5) = happyGoto action_64
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (13) = happyShift action_2
action_13 (14) = happyShift action_4
action_13 (15) = happyShift action_5
action_13 (16) = happyShift action_6
action_13 (18) = happyShift action_7
action_13 (4) = happyGoto action_55
action_13 (5) = happyGoto action_63
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (13) = happyShift action_2
action_14 (14) = happyShift action_4
action_14 (15) = happyShift action_5
action_14 (16) = happyShift action_6
action_14 (18) = happyShift action_7
action_14 (4) = happyGoto action_55
action_14 (5) = happyGoto action_62
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (13) = happyShift action_2
action_15 (14) = happyShift action_4
action_15 (15) = happyShift action_5
action_15 (16) = happyShift action_6
action_15 (18) = happyShift action_7
action_15 (4) = happyGoto action_55
action_15 (5) = happyGoto action_61
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (13) = happyShift action_2
action_16 (14) = happyShift action_4
action_16 (15) = happyShift action_5
action_16 (16) = happyShift action_6
action_16 (18) = happyShift action_7
action_16 (4) = happyGoto action_55
action_16 (5) = happyGoto action_60
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (13) = happyShift action_2
action_17 (14) = happyShift action_4
action_17 (15) = happyShift action_5
action_17 (16) = happyShift action_6
action_17 (18) = happyShift action_7
action_17 (4) = happyGoto action_55
action_17 (5) = happyGoto action_59
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (13) = happyShift action_2
action_18 (14) = happyShift action_4
action_18 (15) = happyShift action_5
action_18 (16) = happyShift action_6
action_18 (18) = happyShift action_7
action_18 (4) = happyGoto action_55
action_18 (5) = happyGoto action_58
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (13) = happyShift action_2
action_19 (14) = happyShift action_4
action_19 (15) = happyShift action_5
action_19 (16) = happyShift action_6
action_19 (18) = happyShift action_7
action_19 (4) = happyGoto action_55
action_19 (5) = happyGoto action_57
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (13) = happyShift action_2
action_20 (14) = happyShift action_4
action_20 (15) = happyShift action_5
action_20 (16) = happyShift action_6
action_20 (18) = happyShift action_7
action_20 (4) = happyGoto action_55
action_20 (5) = happyGoto action_56
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (13) = happyShift action_2
action_21 (14) = happyShift action_4
action_21 (15) = happyShift action_5
action_21 (16) = happyShift action_6
action_21 (18) = happyShift action_7
action_21 (4) = happyGoto action_54
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (13) = happyShift action_2
action_22 (14) = happyShift action_4
action_22 (15) = happyShift action_5
action_22 (16) = happyShift action_6
action_22 (18) = happyShift action_7
action_22 (4) = happyGoto action_53
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (13) = happyShift action_2
action_23 (14) = happyShift action_4
action_23 (15) = happyShift action_5
action_23 (16) = happyShift action_6
action_23 (18) = happyShift action_7
action_23 (4) = happyGoto action_52
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (13) = happyShift action_2
action_24 (14) = happyShift action_4
action_24 (15) = happyShift action_5
action_24 (16) = happyShift action_6
action_24 (18) = happyShift action_7
action_24 (4) = happyGoto action_51
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (13) = happyShift action_2
action_25 (14) = happyShift action_4
action_25 (15) = happyShift action_5
action_25 (16) = happyShift action_6
action_25 (18) = happyShift action_7
action_25 (4) = happyGoto action_50
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (13) = happyShift action_2
action_26 (14) = happyShift action_4
action_26 (15) = happyShift action_5
action_26 (16) = happyShift action_6
action_26 (18) = happyShift action_7
action_26 (4) = happyGoto action_49
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (13) = happyShift action_2
action_27 (14) = happyShift action_4
action_27 (15) = happyShift action_5
action_27 (16) = happyShift action_6
action_27 (18) = happyShift action_7
action_27 (4) = happyGoto action_48
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (13) = happyShift action_2
action_28 (14) = happyShift action_4
action_28 (15) = happyShift action_5
action_28 (16) = happyShift action_6
action_28 (18) = happyShift action_7
action_28 (4) = happyGoto action_47
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (13) = happyShift action_2
action_29 (14) = happyShift action_4
action_29 (15) = happyShift action_5
action_29 (16) = happyShift action_6
action_29 (18) = happyShift action_7
action_29 (4) = happyGoto action_46
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (16) = happyShift action_45
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (16) = happyShift action_44
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (16) = happyShift action_43
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (13) = happyShift action_2
action_33 (14) = happyShift action_4
action_33 (15) = happyShift action_5
action_33 (16) = happyShift action_6
action_33 (18) = happyShift action_7
action_33 (4) = happyGoto action_42
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (13) = happyShift action_2
action_34 (14) = happyShift action_4
action_34 (15) = happyShift action_5
action_34 (16) = happyShift action_6
action_34 (18) = happyShift action_7
action_34 (4) = happyGoto action_41
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (16) = happyShift action_40
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (18) = happyShift action_39
action_36 (11) = happyGoto action_37
action_36 (12) = happyGoto action_38
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (18) = happyShift action_107
action_37 (12) = happyGoto action_106
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_45

action_39 (13) = happyShift action_2
action_39 (14) = happyShift action_4
action_39 (15) = happyShift action_5
action_39 (16) = happyShift action_6
action_39 (18) = happyShift action_7
action_39 (4) = happyGoto action_105
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (13) = happyShift action_104
action_40 (8) = happyGoto action_103
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (17) = happyShift action_102
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (17) = happyShift action_101
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (16) = happyShift action_98
action_43 (6) = happyGoto action_100
action_43 (7) = happyGoto action_97
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (13) = happyShift action_99
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (16) = happyShift action_98
action_45 (6) = happyGoto action_96
action_45 (7) = happyGoto action_97
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (17) = happyShift action_95
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (17) = happyShift action_94
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (13) = happyShift action_2
action_48 (14) = happyShift action_4
action_48 (15) = happyShift action_5
action_48 (16) = happyShift action_6
action_48 (18) = happyShift action_7
action_48 (4) = happyGoto action_93
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (13) = happyShift action_2
action_49 (14) = happyShift action_4
action_49 (15) = happyShift action_5
action_49 (16) = happyShift action_6
action_49 (18) = happyShift action_7
action_49 (4) = happyGoto action_92
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (17) = happyShift action_91
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (17) = happyShift action_90
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (17) = happyShift action_89
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (17) = happyShift action_88
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (17) = happyShift action_87
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (13) = happyShift action_2
action_55 (14) = happyShift action_4
action_55 (15) = happyShift action_5
action_55 (16) = happyShift action_6
action_55 (18) = happyShift action_7
action_55 (4) = happyGoto action_86
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (13) = happyShift action_2
action_56 (14) = happyShift action_4
action_56 (15) = happyShift action_5
action_56 (16) = happyShift action_6
action_56 (17) = happyShift action_85
action_56 (18) = happyShift action_7
action_56 (4) = happyGoto action_75
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (13) = happyShift action_2
action_57 (14) = happyShift action_4
action_57 (15) = happyShift action_5
action_57 (16) = happyShift action_6
action_57 (17) = happyShift action_84
action_57 (18) = happyShift action_7
action_57 (4) = happyGoto action_75
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (13) = happyShift action_2
action_58 (14) = happyShift action_4
action_58 (15) = happyShift action_5
action_58 (16) = happyShift action_6
action_58 (17) = happyShift action_83
action_58 (18) = happyShift action_7
action_58 (4) = happyGoto action_75
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (13) = happyShift action_2
action_59 (14) = happyShift action_4
action_59 (15) = happyShift action_5
action_59 (16) = happyShift action_6
action_59 (17) = happyShift action_82
action_59 (18) = happyShift action_7
action_59 (4) = happyGoto action_75
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (13) = happyShift action_2
action_60 (14) = happyShift action_4
action_60 (15) = happyShift action_5
action_60 (16) = happyShift action_6
action_60 (17) = happyShift action_81
action_60 (18) = happyShift action_7
action_60 (4) = happyGoto action_75
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (13) = happyShift action_2
action_61 (14) = happyShift action_4
action_61 (15) = happyShift action_5
action_61 (16) = happyShift action_6
action_61 (17) = happyShift action_80
action_61 (18) = happyShift action_7
action_61 (4) = happyGoto action_75
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (13) = happyShift action_2
action_62 (14) = happyShift action_4
action_62 (15) = happyShift action_5
action_62 (16) = happyShift action_6
action_62 (17) = happyShift action_79
action_62 (18) = happyShift action_7
action_62 (4) = happyGoto action_75
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (13) = happyShift action_2
action_63 (14) = happyShift action_4
action_63 (15) = happyShift action_5
action_63 (16) = happyShift action_6
action_63 (17) = happyShift action_78
action_63 (18) = happyShift action_7
action_63 (4) = happyGoto action_75
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (13) = happyShift action_2
action_64 (14) = happyShift action_4
action_64 (15) = happyShift action_5
action_64 (16) = happyShift action_6
action_64 (17) = happyShift action_77
action_64 (18) = happyShift action_7
action_64 (4) = happyGoto action_75
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (13) = happyShift action_2
action_65 (14) = happyShift action_4
action_65 (15) = happyShift action_5
action_65 (16) = happyShift action_6
action_65 (17) = happyShift action_76
action_65 (18) = happyShift action_7
action_65 (4) = happyGoto action_75
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_40

action_67 (13) = happyShift action_2
action_67 (14) = happyShift action_4
action_67 (15) = happyShift action_5
action_67 (16) = happyShift action_6
action_67 (17) = happyShift action_74
action_67 (18) = happyShift action_7
action_67 (4) = happyGoto action_73
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (13) = happyShift action_2
action_68 (14) = happyShift action_4
action_68 (15) = happyShift action_5
action_68 (16) = happyShift action_6
action_68 (18) = happyShift action_7
action_68 (4) = happyGoto action_72
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_29

action_70 (13) = happyShift action_2
action_70 (14) = happyShift action_4
action_70 (15) = happyShift action_5
action_70 (16) = happyShift action_6
action_70 (18) = happyShift action_7
action_70 (4) = happyGoto action_71
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_44

action_72 (17) = happyShift action_119
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_41

action_74 _ = happyReduce_28

action_75 _ = happyReduce_34

action_76 _ = happyReduce_4

action_77 _ = happyReduce_5

action_78 _ = happyReduce_6

action_79 _ = happyReduce_7

action_80 _ = happyReduce_8

action_81 _ = happyReduce_9

action_82 _ = happyReduce_10

action_83 _ = happyReduce_11

action_84 _ = happyReduce_12

action_85 _ = happyReduce_13

action_86 _ = happyReduce_33

action_87 _ = happyReduce_14

action_88 _ = happyReduce_15

action_89 _ = happyReduce_16

action_90 _ = happyReduce_17

action_91 _ = happyReduce_18

action_92 (13) = happyShift action_2
action_92 (14) = happyShift action_4
action_92 (15) = happyShift action_5
action_92 (16) = happyShift action_6
action_92 (18) = happyShift action_7
action_92 (4) = happyGoto action_118
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (13) = happyShift action_2
action_93 (14) = happyShift action_4
action_93 (15) = happyShift action_5
action_93 (16) = happyShift action_6
action_93 (18) = happyShift action_7
action_93 (4) = happyGoto action_117
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_20

action_95 _ = happyReduce_21

action_96 (16) = happyShift action_98
action_96 (17) = happyShift action_116
action_96 (7) = happyGoto action_112
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_35

action_98 (13) = happyShift action_115
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (13) = happyShift action_2
action_99 (14) = happyShift action_4
action_99 (15) = happyShift action_5
action_99 (16) = happyShift action_6
action_99 (18) = happyShift action_7
action_99 (4) = happyGoto action_114
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (16) = happyShift action_98
action_100 (17) = happyShift action_113
action_100 (7) = happyGoto action_112
action_100 _ = happyFail (happyExpListPerState 100)

action_101 _ = happyReduce_30

action_102 _ = happyReduce_31

action_103 (13) = happyShift action_110
action_103 (17) = happyShift action_111
action_103 _ = happyFail (happyExpListPerState 103)

action_104 _ = happyReduce_38

action_105 (13) = happyShift action_2
action_105 (14) = happyShift action_4
action_105 (15) = happyShift action_5
action_105 (16) = happyShift action_6
action_105 (18) = happyShift action_7
action_105 (4) = happyGoto action_109
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_46

action_107 (13) = happyShift action_2
action_107 (14) = happyShift action_4
action_107 (15) = happyShift action_5
action_107 (16) = happyShift action_6
action_107 (18) = happyShift action_7
action_107 (47) = happyShift action_108
action_107 (4) = happyGoto action_105
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (13) = happyShift action_2
action_108 (14) = happyShift action_4
action_108 (15) = happyShift action_5
action_108 (16) = happyShift action_6
action_108 (18) = happyShift action_7
action_108 (4) = happyGoto action_128
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (19) = happyShift action_127
action_109 _ = happyFail (happyExpListPerState 109)

action_110 _ = happyReduce_39

action_111 (13) = happyShift action_2
action_111 (14) = happyShift action_4
action_111 (15) = happyShift action_5
action_111 (16) = happyShift action_6
action_111 (18) = happyShift action_7
action_111 (4) = happyGoto action_126
action_111 _ = happyFail (happyExpListPerState 111)

action_112 _ = happyReduce_36

action_113 (13) = happyShift action_2
action_113 (14) = happyShift action_4
action_113 (15) = happyShift action_5
action_113 (16) = happyShift action_6
action_113 (18) = happyShift action_7
action_113 (4) = happyGoto action_125
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (17) = happyShift action_124
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (13) = happyShift action_2
action_115 (14) = happyShift action_4
action_115 (15) = happyShift action_5
action_115 (16) = happyShift action_6
action_115 (18) = happyShift action_7
action_115 (4) = happyGoto action_123
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (13) = happyShift action_2
action_116 (14) = happyShift action_4
action_116 (15) = happyShift action_5
action_116 (16) = happyShift action_6
action_116 (18) = happyShift action_7
action_116 (4) = happyGoto action_122
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (17) = happyShift action_121
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (17) = happyShift action_120
action_118 _ = happyFail (happyExpListPerState 118)

action_119 _ = happyReduce_19

action_120 _ = happyReduce_25

action_121 _ = happyReduce_26

action_122 (17) = happyShift action_134
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (17) = happyShift action_133
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (13) = happyShift action_2
action_124 (14) = happyShift action_4
action_124 (15) = happyShift action_5
action_124 (16) = happyShift action_6
action_124 (18) = happyShift action_7
action_124 (4) = happyGoto action_132
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (17) = happyShift action_131
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (17) = happyShift action_130
action_126 _ = happyFail (happyExpListPerState 126)

action_127 _ = happyReduce_47

action_128 (19) = happyShift action_129
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (17) = happyShift action_136
action_129 _ = happyFail (happyExpListPerState 129)

action_130 _ = happyReduce_27

action_131 _ = happyReduce_24

action_132 (17) = happyShift action_135
action_132 _ = happyFail (happyExpListPerState 132)

action_133 _ = happyReduce_37

action_134 _ = happyReduce_22

action_135 _ = happyReduce_23

action_136 _ = happyReduce_32

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
		 (Add1 happy_var_3
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 4 4 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Sub1 happy_var_3
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 4 4 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Sqrt happy_var_3
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 4 4 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Expt happy_var_3
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 4 4 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Not happy_var_3
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 5 4 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Pair happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 4 4 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Fst happy_var_3
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 4 4 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Snd happy_var_3
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 7 4 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Let (reverse happy_var_4) happy_var_6
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 8 4 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	(HappyTerminal (TokenVar happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (LetRec happy_var_4 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 7 4 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (LetStar (reverse happy_var_4) happy_var_6
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 6 4 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If0 happy_var_3 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 6 4 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_3 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 7 4 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lambda (reverse happy_var_4) happy_var_6
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 4 4 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (App happy_var_2 (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_3  4 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (List (reverse happy_var_2)
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 4 4 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Head happy_var_3
	) `HappyStk` happyRest

happyReduce_31 = happyReduce 4 4 happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Tail happy_var_3
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 8 4 happyReduction_32
happyReduction_32 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Cond (reverse happy_var_3) happy_var_6
	) `HappyStk` happyRest

happyReduce_33 = happySpecReduce_2  5 happyReduction_33
happyReduction_33 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_2, happy_var_1]
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_2  5 happyReduction_34
happyReduction_34 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_2 : happy_var_1
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  6 happyReduction_35
happyReduction_35 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_2  6 happyReduction_36
happyReduction_36 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_2 : happy_var_1
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happyReduce 4 7 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 ((happy_var_2, happy_var_3)
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_1  8 happyReduction_38
happyReduction_38 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  8 happyReduction_39
happyReduction_39 (HappyTerminal (TokenVar happy_var_2))
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_2 : happy_var_1
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  9 happyReduction_40
happyReduction_40 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_2  9 happyReduction_41
happyReduction_41 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_2 : happy_var_1
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_0  10 happyReduction_42
happyReduction_42  =  HappyAbsSyn10
		 ([]
	)

happyReduce_43 = happySpecReduce_1  10 happyReduction_43
happyReduction_43 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  10 happyReduction_44
happyReduction_44 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_3 : happy_var_1
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  11 happyReduction_45
happyReduction_45 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_2  11 happyReduction_46
happyReduction_46 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_2 : happy_var_1
	)
happyReduction_46 _ _  = notHappyAtAll 

happyReduce_47 = happyReduce 4 12 happyReduction_47
happyReduction_47 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 ((happy_var_2, happy_var_3)
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 48 48 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenVar happy_dollar_dollar -> cont 13;
	TokenNum happy_dollar_dollar -> cont 14;
	TokenBool happy_dollar_dollar -> cont 15;
	TokenPA -> cont 16;
	TokenPC -> cont 17;
	TokenLI -> cont 18;
	TokenLD -> cont 19;
	TokenComma -> cont 20;
	TokenAdd -> cont 21;
	TokenSub -> cont 22;
	TokenMul -> cont 23;
	TokenDiv -> cont 24;
	TokenEq -> cont 25;
	TokenLt -> cont 26;
	TokenGt -> cont 27;
	TokenNeq -> cont 28;
	TokenLeq -> cont 29;
	TokenGeq -> cont 30;
	TokenAdd1 -> cont 31;
	TokenSub1 -> cont 32;
	TokenSqrt -> cont 33;
	TokenExpt -> cont 34;
	TokenNot -> cont 35;
	TokenIf0 -> cont 36;
	TokenIf -> cont 37;
	TokenFst -> cont 38;
	TokenSnd -> cont 39;
	TokenLet -> cont 40;
	TokenLetRec -> cont 41;
	TokenLetStar -> cont 42;
	TokenHead -> cont 43;
	TokenTail -> cont 44;
	TokenLambda -> cont 45;
	TokenCond -> cont 46;
	TokenElse -> cont 47;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 48 tk tks = happyError' (tks, explist)
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
