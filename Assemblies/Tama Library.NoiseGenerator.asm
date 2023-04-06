# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: NoiseGenerator, C:\Skyverse_Dragon\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 16.12.2021 14:58:21
# Target register layout (RLID): 0x00000004
# Space for static fields: 0x00000001
# Maximal stack size: 0x00000010
# Init entry point                 : 0x00000071 (local stack size = 0x00000000)
# Task entry point AsynchronousMain: 0x00000000 (local stack size = 0x00000000)
# Task entry point IsochronousMain : 0x00000001 (local stack size = 0x00000003)
# Task entry point Axis1Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Coupling   : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Coupling   : 0x00000000 (local stack size = 0x00000000)
0x00000000   halt                                             # precautious halt

# Method NoiseGenerator.IsochronApplication
0x00000001   rld       0x000001c6                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x00000003   ldc.3                                            # 3
0x00000004   blt.i     0x00000032                             # branch if less
0x00000006   rld       0x000001c6                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x00000008   ldc.7                                            # 7
0x00000009   bgt.i     0x00000032                             # branch if greater
0x0000000b   ldabs     0x00000000                             # load static field Srg : SchragesRandGen
0x0000000d   call      0x00000003   0x00000004   0x00000033   # call Triamec.Tam.Samples.SchragesRandGen.Next()
0x00000011   stloc     0x00000000                             # store local variable u1 : float
0x00000013   ldabs     0x00000000                             # load static field Srg : SchragesRandGen
0x00000015   call      0x00000003   0x00000004   0x00000033   # call Triamec.Tam.Samples.SchragesRandGen.Next()
0x00000019   stloc     0x00000001                             # store local variable u2 : float
0x0000001b   ldc       0xc0000000                             # -2
0x0000001d   ldloc     0x00000000                             # load local variable u1 : float
0x0000001f   log                                              # logarithm
0x00000020   mul.r4                                           # float multiplication
0x00000021   sqrt                                             # square root
0x00000022   ldc       0x40c90fdb                             # 6.283185
0x00000024   ldloc     0x00000001                             # load local variable u2 : float
0x00000026   mul.r4                                           # float multiplication
0x00000027   cos                                              # cosine
0x00000028   mul.r4                                           # float multiplication
0x00000029   stloc     0x00000002                             # store local variable result : float
0x0000002b   ldloc     0x00000002                             # load local variable result : float
0x0000002d   rld       0x000009dd                             # get Register.Tama.Variables.GenPurposeVar0 : float
0x0000002f   mul.r4                                           # float multiplication
0x00000030   rst       0x000009f5                             # set Register.Tama.Variables.GenPurposeVar24 : float
0x00000032   halt                                             # return from Tama task routine

# Method Triamec.Tam.Samples.SchragesRandGen.Next
0x00000033   ldloc     0x00000000                             # load this : SchragesRandGen
0x00000035   ldfld     0x00000000                             # load field _seed : int
0x00000037   ldc       0x0000adc8                             # 44488
0x00000039   div.i4                                           # integer division
0x0000003a   stloc     0x00000001                             # store local variable hi : int
0x0000003c   ldloc     0x00000000                             # load this : SchragesRandGen
0x0000003e   ldfld     0x00000000                             # load field _seed : int
0x00000040   ldloc     0x00000001                             # load local variable hi : int
0x00000042   ldc       0x0000adc8                             # 44488
0x00000044   mul.i4                                           # integer multiplication
0x00000045   sub.i4                                           # integer subtraction
0x00000046   stloc     0x00000002                             # store local variable lo : int
0x00000048   ldc       0x0000bc8f                             # 48271
0x0000004a   ldloc     0x00000002                             # load local variable lo : int
0x0000004c   mul.i4                                           # integer multiplication
0x0000004d   ldc       0x00000d47                             # 3399
0x0000004f   ldloc     0x00000001                             # load local variable hi : int
0x00000051   mul.i4                                           # integer multiplication
0x00000052   sub.i4                                           # integer subtraction
0x00000053   stloc     0x00000003                             # store local variable test : int
0x00000055   ldloc     0x00000000                             # load this : SchragesRandGen
0x00000057   ldloc     0x00000003                             # load local variable test : int
0x00000059   ldc.0                                            # 0
0x0000005a   bgt.i     0x00000063                             # branch if greater
0x0000005c   ldloc     0x00000003                             # load local variable test : int
0x0000005e   ldc       0x7fffffff                             # 2147483647
0x00000060   add.i4                                           # integer addition
0x00000061   br        0x00000065                             # branch unconditionally
0x00000063   ldloc     0x00000003                             # load local variable test : int
0x00000065   stfld     0x00000000                             # store field _seed : int
0x00000067   ldloc     0x00000000                             # load this : SchragesRandGen
0x00000069   ldfld     0x00000000                             # load field _seed : int
0x0000006b   conv.i4.r4                                       # convert int to float
0x0000006c   ldc       0x4f000000                             # 2.147484E+09
0x0000006e   div.r4                                           # float division
0x0000006f   ret       0x00000001                             # return from routine

# Method NoiseGenerator..cctor
0x00000071   new       0x00000001   0x00000000                # allocate space on the heap for a new instance of class SchragesRandGen
0x00000074   call      0x00000000   0x00000001   0x0000007b   # call Triamec.Tam.Samples.SchragesRandGen..ctor()
0x00000078   stabs     0x00000000                             # store static field Srg : SchragesRandGen
0x0000007a   halt                                             # return from Tama task routine

# Method Triamec.Tam.Samples.SchragesRandGen..ctor
0x0000007b   ldloc     0x00000000                             # load this : SchragesRandGen
0x0000007d   ldc.1                                            # 1
0x0000007e   stfld     0x00000000                             # store field _seed : int
0x00000080   ldloc     0x00000000                             # load this : SchragesRandGen
0x00000082   call      0x00000000   0x00000001   0x00000088   # call System.Object..ctor()
0x00000086   ret       0x00000000                             # return from routine

# Method System.Object..ctor
0x00000088   ret       0x00000000                             # return from routine
