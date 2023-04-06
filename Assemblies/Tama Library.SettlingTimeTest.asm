# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: SettlingTimeTest, C:\Skyverse_Dragon\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 25.10.2021 13:53:23
# Target register layout (RLID): 0x00000013
# Space for static fields: 0x00000002
# Maximal stack size: 0x00000011
# Init entry point                 : 0x00000001 (local stack size = 0x00000000)
# Task entry point AsynchronousMain: 0x00000000 (local stack size = 0x00000000)
# Task entry point IsochronousMain : 0x00000060 (local stack size = 0x00000000)
# Task entry point Axis1Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Coupling   : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Coupling   : 0x00000000 (local stack size = 0x00000000)
0x00000000   halt                                             # precautious halt

# Method SettlingTimeTest..cctor
0x00000001   ldc.0                                            # 0
0x00000002   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000005   ldc.1                                            # 1
0x00000006   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000009   new       0x00000005   0x00000002                # allocate space on the heap for a new instance of class SettlingTime
0x0000000c   call      0x00000000   0x00000003   0x00000024   # call SettlingTime..ctor(System.Single, System.Single)
0x00000010   stabs     0x00000000                             # store static field settlingTimeA0 : SettlingTime
0x00000012   ldc.2                                            # 2
0x00000013   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000016   ldc.3                                            # 3
0x00000017   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x0000001a   new       0x00000005   0x00000002                # allocate space on the heap for a new instance of class SettlingTime
0x0000001d   call      0x00000000   0x00000003   0x00000024   # call SettlingTime..ctor(System.Single, System.Single)
0x00000021   stabs     0x00000001                             # store static field settlingTimeA1 : SettlingTime
0x00000023   halt                                             # return from Tama task routine

# Method SettlingTime..ctor
0x00000024   ldloc     0x00000000                             # load this : SettlingTime
0x00000026   call      0x00000000   0x00000001   0x00000036   # call System.Object..ctor()
0x0000002a   ldloc     0x00000000                             # load this : SettlingTime
0x0000002c   ldloc     0x00000001                             # load 0th argument settlingWindow : float
0x0000002e   ldloc     0x00000002                             # load 1th argument minSettleDuration : float
0x00000030   call      0x00000000   0x00000003   0x00000038   # call SettlingTime.Init(System.Single, System.Single)
0x00000034   ret       0x00000000                             # return from routine

# Method System.Object..ctor
0x00000036   ret       0x00000000                             # return from routine

# Method SettlingTime.Init
0x00000038   ldloc     0x00000000                             # load this : SettlingTime
0x0000003a   ldc.0                                            # 0
0x0000003b   stfld     0x00000003                             # store field moveTimer : int
0x0000003d   ldloc     0x00000000                             # load this : SettlingTime
0x0000003f   ldc.0                                            # 0
0x00000040   stfld     0x00000004                             # store field settlingTimer : int
0x00000042   ldloc     0x00000000                             # load this : SettlingTime
0x00000044   ldloc     0x00000001                             # load 0th argument settlingWindow : float
0x00000046   ldloc     0x00000002                             # load 1th argument minSettleDuration : float
0x00000048   call      0x00000000   0x00000003   0x0000004e   # call SettlingTime.Set(System.Single, System.Single)
0x0000004c   ret       0x00000000                             # return from routine

# Method SettlingTime.Set
0x0000004e   ldloc     0x00000000                             # load this : SettlingTime
0x00000050   ldloc     0x00000001                             # load 0th argument settlingWindow : float
0x00000052   stfld     0x00000000                             # store field settlingWindow : float
0x00000054   ldloc     0x00000000                             # load this : SettlingTime
0x00000056   ldloc     0x00000002                             # load 1th argument minSettleDuration : float
0x00000058   ldc       0x461c4000                             # 10000
0x0000005a   mul.r4                                           # float multiplication
0x0000005b   conv.r4.i4                                       # convert float to int
0x0000005c   stfld     0x00000001                             # store field minSettleDuration : int
0x0000005e   ret       0x00000000                             # return from routine

# Method SettlingTimeTest.IsochronousTask
0x00000060   ldabs     0x00000000                             # load static field settlingTimeA0 : SettlingTime
0x00000062   ldc.0                                            # 0
0x00000063   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000066   ldc.1                                            # 1
0x00000067   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x0000006a   call      0x00000000   0x00000003   0x0000004e   # call SettlingTime.Set(System.Single, System.Single)
0x0000006e   ldabs     0x00000001                             # load static field settlingTimeA1 : SettlingTime
0x00000070   ldc.2                                            # 2
0x00000071   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000074   ldc.3                                            # 3
0x00000075   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000078   call      0x00000000   0x00000003   0x0000004e   # call SettlingTime.Set(System.Single, System.Single)
0x0000007c   ldabs     0x00000000                             # load static field settlingTimeA0 : SettlingTime
0x0000007e   rld       0x0022df00                             # get Register.Axes_0.Signals.PositionController.Controllers_0.PositionError : float
0x00000080   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x00000082   ldc.0                                            # 0
0x00000083   ceq                                              # compare if equal
0x00000084   call      0x00000000   0x00000003   0x000000bd   # call SettlingTime.Run(System.Single, System.Boolean)
0x00000088   ldabs     0x00000001                             # load static field settlingTimeA1 : SettlingTime
0x0000008a   rld       0x002adf00                             # get Register.Axes_1.Signals.PositionController.Controllers_0.PositionError : float
0x0000008c   rld       0x002ab300                             # get Register.Axes_1.Signals.PathPlanner.Done : bool
0x0000008e   ldc.0                                            # 0
0x0000008f   ceq                                              # compare if equal
0x00000090   call      0x00000000   0x00000003   0x000000bd   # call SettlingTime.Run(System.Single, System.Boolean)
0x00000094   ldc.0                                            # 0
0x00000095   ldabs     0x00000000                             # load static field settlingTimeA0 : SettlingTime
0x00000097   call      0x00000000   0x00000001   0x00000127   # call SettlingTime.GetMoveTime()
0x0000009b   rste      0x00000020   0x00238601                # set Register.Application.Variables.Floats[TOS] : float
0x0000009e   ldc.0                                            # 0
0x0000009f   ldabs     0x00000000                             # load static field settlingTimeA0 : SettlingTime
0x000000a1   call      0x00000000   0x00000001   0x00000119   # call SettlingTime.IsSettled.get()
0x000000a5   rste      0x00000008   0x00238801                # set Register.Application.Variables.Booleans[TOS] : bool
0x000000a8   ldc.1                                            # 1
0x000000a9   ldabs     0x00000001                             # load static field settlingTimeA1 : SettlingTime
0x000000ab   call      0x00000000   0x00000001   0x00000127   # call SettlingTime.GetMoveTime()
0x000000af   rste      0x00000020   0x00238601                # set Register.Application.Variables.Floats[TOS] : float
0x000000b2   ldc.1                                            # 1
0x000000b3   ldabs     0x00000001                             # load static field settlingTimeA1 : SettlingTime
0x000000b5   call      0x00000000   0x00000001   0x00000119   # call SettlingTime.IsSettled.get()
0x000000b9   rste      0x00000008   0x00238801                # set Register.Application.Variables.Booleans[TOS] : bool
0x000000bc   halt                                             # return from Tama task routine

# Method SettlingTime.Run
0x000000bd   ldloc     0x00000000                             # load this : SettlingTime
0x000000bf   call      0x00000000   0x00000001   0x00000119   # call SettlingTime.IsSettled.get()
0x000000c3   ldloc     0x00000002                             # load 1th argument isMoving : bool
0x000000c5   and                                              # integer bitwise AND
0x000000c6   brfalse   0x000000d4                             # branch if zero
0x000000c8   ldloc     0x00000000                             # load this : SettlingTime
0x000000ca   ldc.0                                            # 0
0x000000cb   call      0x00000000   0x00000002   0x0000011f   # call SettlingTime.IsSettled.set(System.Boolean)
0x000000cf   ldloc     0x00000000                             # load this : SettlingTime
0x000000d1   ldc.0                                            # 0
0x000000d2   stfld     0x00000003                             # store field moveTimer : int
0x000000d4   ldloc     0x00000000                             # load this : SettlingTime
0x000000d6   call      0x00000000   0x00000001   0x00000119   # call SettlingTime.IsSettled.get()
0x000000da   brtrue    0x00000117                             # branch if not zero
0x000000dc   ldloc     0x00000000                             # load this : SettlingTime
0x000000de   ldloc     0x00000000                             # load this : SettlingTime
0x000000e0   ldfld     0x00000003                             # load field moveTimer : int
0x000000e2   ldc.1                                            # 1
0x000000e3   add.i4                                           # integer addition
0x000000e4   stfld     0x00000003                             # store field moveTimer : int
0x000000e6   ldloc     0x00000001                             # load 0th argument positionError : float
0x000000e8   ldloc     0x00000000                             # load this : SettlingTime
0x000000ea   ldfld     0x00000000                             # load field settlingWindow : float
0x000000ec   bge.f     0x00000112                             # branch if greater or equal
0x000000ee   ldloc     0x00000001                             # load 0th argument positionError : float
0x000000f0   ldloc     0x00000000                             # load this : SettlingTime
0x000000f2   ldfld     0x00000000                             # load field settlingWindow : float
0x000000f4   neg.r4                                           # float negation
0x000000f5   ble.f     0x00000112                             # branch if less than or equal
0x000000f7   ldloc     0x00000000                             # load this : SettlingTime
0x000000f9   ldloc     0x00000000                             # load this : SettlingTime
0x000000fb   ldfld     0x00000004                             # load field settlingTimer : int
0x000000fd   ldc.1                                            # 1
0x000000fe   add.i4                                           # integer addition
0x000000ff   stfld     0x00000004                             # store field settlingTimer : int
0x00000101   ldloc     0x00000000                             # load this : SettlingTime
0x00000103   ldloc     0x00000000                             # load this : SettlingTime
0x00000105   ldfld     0x00000004                             # load field settlingTimer : int
0x00000107   ldloc     0x00000000                             # load this : SettlingTime
0x00000109   ldfld     0x00000001                             # load field minSettleDuration : int
0x0000010b   cgt.i                                            # compare if greater
0x0000010c   call      0x00000000   0x00000002   0x0000011f   # call SettlingTime.IsSettled.set(System.Boolean)
0x00000110   ret       0x00000000                             # return from routine
0x00000112   ldloc     0x00000000                             # load this : SettlingTime
0x00000114   ldc.0                                            # 0
0x00000115   stfld     0x00000004                             # store field settlingTimer : int
0x00000117   ret       0x00000000                             # return from routine

# Method SettlingTime.IsSettled.get
0x00000119   ldloc     0x00000000                             # load this : SettlingTime
0x0000011b   ldfld     0x00000002                             # load field <IsSettled>k__BackingField : bool
0x0000011d   ret       0x00000001                             # return from routine

# Method SettlingTime.IsSettled.set
0x0000011f   ldloc     0x00000000                             # load this : SettlingTime
0x00000121   ldloc     0x00000001                             # load 0th argument value : bool
0x00000123   stfld     0x00000002                             # store field <IsSettled>k__BackingField : bool
0x00000125   ret       0x00000000                             # return from routine

# Method SettlingTime.GetMoveTime
0x00000127   ldloc     0x00000000                             # load this : SettlingTime
0x00000129   ldfld     0x00000003                             # load field moveTimer : int
0x0000012b   conv.i4.r4                                       # convert int to float
0x0000012c   ldc       0x38d1b717                             # 0.0001
0x0000012e   mul.r4                                           # float multiplication
0x0000012f   ret       0x00000001                             # return from routine
