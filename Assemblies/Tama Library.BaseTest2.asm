# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: BaseTest2, C:\Skyverse_Dragon\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 16.12.2021 14:58:21
# Target register layout (RLID): 0x00000004
# Space for static fields: 0x00000001
# Maximal stack size: 0x00000007
# Init entry point                 : 0x00000019 (local stack size = 0x00000000)
# Task entry point AsynchronousMain: 0x00000000 (local stack size = 0x00000000)
# Task entry point IsochronousMain : 0x00000001 (local stack size = 0x00000000)
# Task entry point Axis1Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Coupling   : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Coupling   : 0x00000000 (local stack size = 0x00000000)
0x00000000   halt                                             # precautious halt

# Method BaseTest2.IsochronousTamaMain
0x00000001   ldabs     0x00000000                             # load static field BaseTest : BaseTest
0x00000003   call      0x00000000   0x00000001   0x00000008   # call BaseTest.IsochronousPart()
0x00000007   halt                                             # return from Tama task routine

# Method BaseTest.IsochronousPart
0x00000008   ldloc     0x00000000                             # load this : BaseTest
0x0000000a   ldfld     0x00000000                             # load field _myConst : int
0x0000000c   rst       0x000009f6                             # set Register.Tama.Variables.GenPurposeIntVar0 : int
0x0000000e   ldc.4                                            # 4
0x0000000f   rst       0x000009f7                             # set Register.Tama.Variables.GenPurposeIntVar1 : int
0x00000011   ldloc     0x00000000                             # load this : BaseTest
0x00000013   ldfld     0x00000001                             # load field _baseField : int
0x00000015   rst       0x000009f8                             # set Register.Tama.Variables.GenPurposeIntVar2 : int
0x00000017   ret       0x00000000                             # return from routine

# Method BaseTest2..cctor
0x00000019   ldc.5                                            # 5
0x0000001a   new       0x00000002   0x00000001                # allocate space on the heap for a new instance of class BaseTest
0x0000001d   call      0x00000000   0x00000002   0x00000024   # call BaseTest..ctor(System.Int32)
0x00000021   stabs     0x00000000                             # store static field BaseTest : BaseTest
0x00000023   halt                                             # return from Tama task routine

# Method BaseTest..ctor
0x00000024   ldloc     0x00000000                             # load this : BaseTest
0x00000026   ldc.7                                            # 7
0x00000027   stfld     0x00000001                             # store field _baseField : int
0x00000029   ldloc     0x00000000                             # load this : BaseTest
0x0000002b   call      0x00000000   0x00000001   0x00000037   # call System.Object..ctor()
0x0000002f   ldloc     0x00000000                             # load this : BaseTest
0x00000031   ldloc     0x00000001                             # load 0th argument myConst : int
0x00000033   stfld     0x00000000                             # store field _myConst : int
0x00000035   ret       0x00000000                             # return from routine

# Method System.Object..ctor
0x00000037   ret       0x00000000                             # return from routine
