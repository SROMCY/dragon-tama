# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: Homing16, C:\Skyverse_Dragon\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 11.01.2023 15:01:00
# Target register layout (RLID): 0x00000010
# Space for static fields: 0x00000007
# Maximal stack size: 0x0000000c
# Init entry point                 : 0x00000000 (local stack size = 0x00000000)
# Task entry point AsynchronousMain: 0x00000001 (local stack size = 0x00000002)
# Task entry point IsochronousMain : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Coupling   : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Coupling   : 0x00000000 (local stack size = 0x00000000)
0x00000000   halt                                             # precautious halt

# Method Homing16.Homer
0x00000001   rld       0x00000a16                             # get Register.Tama.AsynchronousMainState : int
0x00000003   stloc     0x00000000                             # store local variable local_0 : int
0x00000005   ldloc     0x00000000                             # load local variable local_0 : int
0x00000007   switch.   0x00000007                             # switch table
      (   0x00000011   0x00000025   0x00000046   0x0000005c   0x00000082   0x00000091   0x000000a6   )
0x00000010   halt                                             # return from Tama task routine
0x00000011   rld       0x00000a15                             # get Register.Tama.AsynchronousMainCommand : int
0x00000013   stloc     0x00000001                             # store local variable local_1 : int
0x00000015   ldloc     0x00000001                             # load local variable local_1 : int
0x00000017   ldc.1                                            # 1
0x00000018   bne       0x000000bf                             # branch if not equal
0x0000001a   call      0x00000000   0x00000000   0x000000c0   # call Homing16.GetSearchDynamicParameters()
0x0000001e   ldc.1                                            # 1
0x0000001f   rst       0x00000a16                             # set Register.Tama.AsynchronousMainState : int
0x00000021   ldc.0                                            # 0
0x00000022   rst       0x00000a15                             # set Register.Tama.AsynchronousMainCommand : int
0x00000024   halt                                             # return from Tama task routine
0x00000025   call      0x00000000   0x00000000   0x00000118   # call Homing16.StopRequestedOrError()
0x00000029   brtrue    0x000000bf                             # branch if not zero
0x0000002b   call      0x00000000   0x00000000   0x00000143   # call Homing16.IsAxisAtIndex()
0x0000002f   brfalse   0x0000003a                             # branch if zero
0x00000031   ldc.0                                            # 0
0x00000032   call      0x00000000   0x00000001   0x00000151   # call Homing16.StartSearchMove(System.Boolean)
0x00000036   ldc.2                                            # 2
0x00000037   rst       0x00000a16                             # set Register.Tama.AsynchronousMainState : int
0x00000039   halt                                             # return from Tama task routine
0x0000003a   ldc.1                                            # 1
0x0000003b   rst       0x0000015e                             # set Register.Axes_0.Commands.General.EncoderIndexLatchEnable : bool
0x0000003d   ldc.1                                            # 1
0x0000003e   call      0x00000000   0x00000001   0x00000151   # call Homing16.StartSearchMove(System.Boolean)
0x00000042   ldc.3                                            # 3
0x00000043   rst       0x00000a16                             # set Register.Tama.AsynchronousMainState : int
0x00000045   halt                                             # return from Tama task routine
0x00000046   call      0x00000000   0x00000000   0x00000118   # call Homing16.StopRequestedOrError()
0x0000004a   brtrue    0x000000bf                             # branch if not zero
0x0000004c   call      0x00000000   0x00000000   0x00000143   # call Homing16.IsAxisAtIndex()
0x00000050   brtrue    0x000000bf                             # branch if not zero
0x00000052   ldc.8                                            # 8
0x00000053   rst       0x00000163                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x00000055   ldc.6                                            # 6
0x00000056   rst       0x00000a16                             # set Register.Tama.AsynchronousMainState : int
0x00000058   ldc.1                                            # 1
0x00000059   stabs     0x00000000                             # store static field _stateAfterMoveDone : int
0x0000005b   halt                                             # return from Tama task routine
0x0000005c   call      0x00000000   0x00000000   0x00000118   # call Homing16.StopRequestedOrError()
0x00000060   brtrue    0x000000bf                             # branch if not zero
0x00000062   call      0x00000000   0x00000000   0x00000179   # call Homing16.IndexLatched()
0x00000066   brfalse   0x000000bf                             # branch if zero
0x00000068   rld       0x00000194                             # get Register.Axes_0.Signals.PositionController.LatchedPosition.Float32 : float
0x0000006a   stabs     0x00000005                             # store static field _indexPosition : float
0x0000006c   rld       0x00000195                             # get Register.Axes_0.Signals.PositionController.LatchedPosition.Extension : int
0x0000006e   stabs     0x00000006                             # store static field _indexPositionExtension : int
0x00000070   ldabs     0x00000005                             # load static field _indexPosition : float
0x00000072   rst       0x00000166                             # set Register.Axes_0.Commands.PathPlanner.Xnew.Float32 : float
0x00000074   ldabs     0x00000006                             # load static field _indexPositionExtension : int
0x00000076   rst       0x00000167                             # set Register.Axes_0.Commands.PathPlanner.Xnew.Extension : int
0x00000078   ldc.2                                            # 2
0x00000079   rst       0x00000163                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x0000007b   ldc.6                                            # 6
0x0000007c   rst       0x00000a16                             # set Register.Tama.AsynchronousMainState : int
0x0000007e   ldc.4                                            # 4
0x0000007f   stabs     0x00000000                             # store static field _stateAfterMoveDone : int
0x00000081   halt                                             # return from Tama task routine
0x00000082   rld       0x0000012d                             # get Register.Axes_0.Parameters.Environment.ReferencePosition : float
0x00000084   rst       0x00000166                             # set Register.Axes_0.Commands.PathPlanner.Xnew.Float32 : float
0x00000086   ldc.0                                            # 0
0x00000087   rst       0x00000167                             # set Register.Axes_0.Commands.PathPlanner.Xnew.Extension : int
0x00000089   ldc       0x0000000a                             # 10
0x0000008b   rst       0x00000163                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x0000008d   ldc.5                                            # 5
0x0000008e   rst       0x00000a16                             # set Register.Tama.AsynchronousMainState : int
0x00000090   halt                                             # return from Tama task routine
0x00000091   rld       0x0000018c                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x00000093   brfalse   0x000000bf                             # branch if zero
0x00000095   ldc       0x00000000                             # 0
0x00000097   rst       0x00000166                             # set Register.Axes_0.Commands.PathPlanner.Xnew.Float32 : float
0x00000099   ldc.0                                            # 0
0x0000009a   rst       0x00000167                             # set Register.Axes_0.Commands.PathPlanner.Xnew.Extension : int
0x0000009c   ldc.2                                            # 2
0x0000009d   rst       0x00000163                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x0000009f   ldc.6                                            # 6
0x000000a0   rst       0x00000a16                             # set Register.Tama.AsynchronousMainState : int
0x000000a2   ldc.0                                            # 0
0x000000a3   stabs     0x00000000                             # store static field _stateAfterMoveDone : int
0x000000a5   halt                                             # return from Tama task routine
0x000000a6   rld       0x0000018c                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000000a8   brfalse   0x000000ba                             # branch if zero
0x000000aa   ldabs     0x00000000                             # load static field _stateAfterMoveDone : int
0x000000ac   brtrue    0x000000b5                             # branch if not zero
0x000000ae   ldabs     0x00000001                             # load static field _originalDrf : float
0x000000b0   rst       0x00000102                             # set Register.Axes_0.Parameters.PathPlanner.DynamicReductionFactor : float
0x000000b2   ldc.1                                            # 1
0x000000b3   rst       0x00000162                             # set Register.Axes_0.Commands.PathPlanner.CommitParameter : bool
0x000000b5   ldabs     0x00000000                             # load static field _stateAfterMoveDone : int
0x000000b7   rst       0x00000a16                             # set Register.Tama.AsynchronousMainState : int
0x000000b9   halt                                             # return from Tama task routine
0x000000ba   call      0x00000000   0x00000000   0x00000118   # call Homing16.StopRequestedOrError()
0x000000be   pop                                              # discard top of stack
0x000000bf   halt                                             # return from Tama task routine

# Method Homing16.GetSearchDynamicParameters
0x000000c0   rld       0x00000a1c                             # get Register.Tama.Variables.GenPurposeVar0 : float
0x000000c2   ldc       0x00000000                             # 0
0x000000c4   ble.f     0x000000cc                             # branch if less than or equal
0x000000c6   rld       0x00000a1c                             # get Register.Tama.Variables.GenPurposeVar0 : float
0x000000c8   stabs     0x00000002                             # store static field _searchSpeed : float
0x000000ca   br        0x000000d0                             # branch unconditionally
0x000000cc   ldc       0x3dcccccd                             # 0.1
0x000000ce   stabs     0x00000002                             # store static field _searchSpeed : float
0x000000d0   ldabs     0x00000002                             # load static field _searchSpeed : float
0x000000d2   rst       0x00000a1c                             # set Register.Tama.Variables.GenPurposeVar0 : float
0x000000d4   rld       0x00000a35                             # get Register.Tama.Variables.GenPurposeIntVar0 : int
0x000000d6   ldc.0                                            # 0
0x000000d7   ble.i     0x000000e1                             # branch if less than or equal
0x000000d9   rld       0x00000a35                             # get Register.Tama.Variables.GenPurposeIntVar0 : int
0x000000db   ldc.0                                            # 0
0x000000dc   cgt.i                                            # compare if greater
0x000000dd   stabs     0x00000003                             # store static field _homeDirectionPositive : bool
0x000000df   br        0x000000e4                             # branch unconditionally
0x000000e1   ldc.0                                            # 0
0x000000e2   stabs     0x00000003                             # store static field _homeDirectionPositive : bool
0x000000e4   ldabs     0x00000003                             # load static field _homeDirectionPositive : bool
0x000000e6   brtrue    0x000000eb                             # branch if not zero
0x000000e8   ldc.0                                            # 0
0x000000e9   br        0x000000ec                             # branch unconditionally
0x000000eb   ldc.1                                            # 1
0x000000ec   rst       0x00000a35                             # set Register.Tama.Variables.GenPurposeIntVar0 : int
0x000000ee   rld       0x00000a36                             # get Register.Tama.Variables.GenPurposeIntVar1 : int
0x000000f0   ldc.0                                            # 0
0x000000f1   ble.i     0x000000fb                             # branch if less than or equal
0x000000f3   rld       0x00000a36                             # get Register.Tama.Variables.GenPurposeIntVar1 : int
0x000000f5   ldc.0                                            # 0
0x000000f6   cgt.i                                            # compare if greater
0x000000f7   stabs     0x00000004                             # store static field _indexLogicNegative : bool
0x000000f9   br        0x000000fe                             # branch unconditionally
0x000000fb   ldc.0                                            # 0
0x000000fc   stabs     0x00000004                             # store static field _indexLogicNegative : bool
0x000000fe   ldabs     0x00000004                             # load static field _indexLogicNegative : bool
0x00000100   brtrue    0x00000105                             # branch if not zero
0x00000102   ldc.0                                            # 0
0x00000103   br        0x00000106                             # branch unconditionally
0x00000105   ldc.1                                            # 1
0x00000106   rst       0x00000a36                             # set Register.Tama.Variables.GenPurposeIntVar1 : int
0x00000108   ldc.0                                            # 0
0x00000109   rst       0x0000015e                             # set Register.Axes_0.Commands.General.EncoderIndexLatchEnable : bool
0x0000010b   rld       0x00000136                             # get Register.Axes_0.Parameters.PathPlanner.DynamicReductionFactor : float
0x0000010d   stabs     0x00000001                             # store static field _originalDrf : float
0x0000010f   ldc       0x3f800000                             # 1
0x00000111   rst       0x00000102                             # set Register.Axes_0.Parameters.PathPlanner.DynamicReductionFactor : float
0x00000113   ldc.1                                            # 1
0x00000114   rst       0x00000162                             # set Register.Axes_0.Commands.PathPlanner.CommitParameter : bool
0x00000116   ret       0x00000000                             # return from routine

# Method Homing16.StopRequestedOrError
0x00000118   rld       0x00000a15                             # get Register.Tama.AsynchronousMainCommand : int
0x0000011a   ldc.2                                            # 2
0x0000011b   bne       0x0000012c                             # branch if not equal
0x0000011d   ldc.0                                            # 0
0x0000011e   rst       0x00000a15                             # set Register.Tama.AsynchronousMainCommand : int
0x00000120   ldc.8                                            # 8
0x00000121   rst       0x00000163                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x00000123   ldc.6                                            # 6
0x00000124   rst       0x00000a16                             # set Register.Tama.AsynchronousMainState : int
0x00000126   ldc.0                                            # 0
0x00000127   stabs     0x00000000                             # store static field _stateAfterMoveDone : int
0x00000129   ldc.1                                            # 1
0x0000012a   ret       0x00000001                             # return from routine
0x0000012c   rld       0x0000017b                             # get Register.Axes_0.Signals.General.AxisError : AxisErrorIdentification
0x0000012e   brfalse   0x00000140                             # branch if zero
0x00000130   ldabs     0x00000001                             # load static field _originalDrf : float
0x00000132   rst       0x00000102                             # set Register.Axes_0.Parameters.PathPlanner.DynamicReductionFactor : float
0x00000134   ldc.1                                            # 1
0x00000135   rst       0x00000162                             # set Register.Axes_0.Commands.PathPlanner.CommitParameter : bool
0x00000137   ldc.0                                            # 0
0x00000138   rst       0x00000a16                             # set Register.Tama.AsynchronousMainState : int
0x0000013a   ldc.0                                            # 0
0x0000013b   rst       0x00000a15                             # set Register.Tama.AsynchronousMainCommand : int
0x0000013d   ldc.1                                            # 1
0x0000013e   ret       0x00000001                             # return from routine
0x00000140   ldc.0                                            # 0
0x00000141   ret       0x00000001                             # return from routine

# Method Homing16.IsAxisAtIndex
0x00000143   ldabs     0x00000004                             # load static field _indexLogicNegative : bool
0x00000145   brfalse   0x0000014d                             # branch if zero
0x00000147   rld       0x0000017e                             # get Register.Axes_0.Signals.General.EncoderIndex : bool
0x00000149   ldc.0                                            # 0
0x0000014a   ceq                                              # compare if equal
0x0000014b   ret       0x00000001                             # return from routine
0x0000014d   rld       0x0000017e                             # get Register.Axes_0.Signals.General.EncoderIndex : bool
0x0000014f   ret       0x00000001                             # return from routine

# Method Homing16.StartSearchMove
0x00000151   ldabs     0x00000003                             # load static field _homeDirectionPositive : bool
0x00000153   brfalse   0x00000164                             # branch if zero
0x00000155   ldloc     0x00000000                             # load 0th argument moveInHomeDirection : bool
0x00000157   brtrue    0x0000015e                             # branch if not zero
0x00000159   ldabs     0x00000002                             # load static field _searchSpeed : float
0x0000015b   neg.r4                                           # float negation
0x0000015c   br        0x00000160                             # branch unconditionally
0x0000015e   ldabs     0x00000002                             # load static field _searchSpeed : float
0x00000160   rst       0x00000168                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x00000162   br        0x00000171                             # branch unconditionally
0x00000164   ldloc     0x00000000                             # load 0th argument moveInHomeDirection : bool
0x00000166   brtrue    0x0000016c                             # branch if not zero
0x00000168   ldabs     0x00000002                             # load static field _searchSpeed : float
0x0000016a   br        0x0000016f                             # branch unconditionally
0x0000016c   ldabs     0x00000002                             # load static field _searchSpeed : float
0x0000016e   neg.r4                                           # float negation
0x0000016f   rst       0x00000168                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x00000171   ldc.0                                            # 0
0x00000172   rst       0x00000164                             # set Register.Axes_0.Commands.PathPlanner.Direction : PathPlannerDirection
0x00000174   ldc.5                                            # 5
0x00000175   rst       0x00000163                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x00000177   ret       0x00000000                             # return from routine

# Method Homing16.IndexLatched
0x00000179   rld       0x0000017f                             # get Register.Axes_0.Signals.General.EncoderIndexLatch : bool
0x0000017b   ret       0x00000001                             # return from routine
