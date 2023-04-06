# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: ZDualloop, C:\Skyverse_Dragon\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 11.01.2023 15:01:00
# Target register layout (RLID): 0x00000013
# Space for static fields: 0x00000002
# Maximal stack size: 0x0000002d
# Init entry point                 : 0x00000001 (local stack size = 0x00000000)
# Task entry point AsynchronousMain: 0x00000000 (local stack size = 0x00000000)
# Task entry point IsochronousMain : 0x00000066 (local stack size = 0x00000003)
# Task entry point Axis1Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Coupling   : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Coupling   : 0x00000000 (local stack size = 0x00000000)
0x00000000   halt                                             # precautious halt

# Method ZDualloop..cctor
0x00000001   ldc.0                                            # 0
0x00000002   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000005   ldc.1                                            # 1
0x00000006   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000009   new       0x00000005   0x00000002                # allocate space on the heap for a new instance of class MoveTime
0x0000000c   call      0x00000000   0x00000003   0x0000001d   # call MoveTime..ctor(System.Single, System.Single)
0x00000010   stabs     0x00000000                             # store static field settlingTimeA0 : MoveTime
0x00000012   ldc.1                                            # 1
0x00000013   new       0x00000003   0x00000001                # allocate space on the heap for a new instance of class AxisCompensation
0x00000016   call      0x00000000   0x00000002   0x0000004d   # call AxisCompensation..ctor(System.Int32)
0x0000001a   stabs     0x00000001                             # store static field axis0Compensation : AxisCompensation
0x0000001c   halt                                             # return from Tama task routine

# Method MoveTime..ctor
0x0000001d   ldloc     0x00000000                             # load this : MoveTime
0x0000001f   call      0x00000000   0x00000001   0x00000039   # call System.Object..ctor()
0x00000023   ldloc     0x00000000                             # load this : MoveTime
0x00000025   ldc.0                                            # 0
0x00000026   stfld     0x00000003                             # store field moveTimer : int
0x00000028   ldloc     0x00000000                             # load this : MoveTime
0x0000002a   ldc.0                                            # 0
0x0000002b   stfld     0x00000004                             # store field settlingTimer : int
0x0000002d   ldloc     0x00000000                             # load this : MoveTime
0x0000002f   ldloc     0x00000001                             # load 0th argument settlingWindow : float
0x00000031   ldloc     0x00000002                             # load 1th argument minSettleDuration : float
0x00000033   call      0x00000000   0x00000003   0x0000003b   # call MoveTime.Set(System.Single, System.Single)
0x00000037   ret       0x00000000                             # return from routine

# Method System.Object..ctor
0x00000039   ret       0x00000000                             # return from routine

# Method MoveTime.Set
0x0000003b   ldloc     0x00000000                             # load this : MoveTime
0x0000003d   ldloc     0x00000001                             # load 0th argument settlingWindow : float
0x0000003f   stfld     0x00000002                             # store field settlingWindow : float
0x00000041   ldloc     0x00000000                             # load this : MoveTime
0x00000043   ldloc     0x00000002                             # load 1th argument minSettleDuration : float
0x00000045   ldc       0x461c4000                             # 10000
0x00000047   mul.r4                                           # float multiplication
0x00000048   conv.r4.i4                                       # convert float to int
0x00000049   stfld     0x00000000                             # store field minSettleDuration : int
0x0000004b   ret       0x00000000                             # return from routine

# Method AxisCompensation..ctor
0x0000004d   ldloc     0x00000000                             # load this : AxisCompensation
0x0000004f   call      0x00000000   0x00000001   0x00000039   # call System.Object..ctor()
0x00000053   ldloc     0x00000000                             # load this : AxisCompensation
0x00000055   ldc       0x00000000                             # 0
0x00000057   stfld     0x00000002                             # store field compGain : float
0x00000059   ldloc     0x00000000                             # load this : AxisCompensation
0x0000005b   ldc.0                                            # 0
0x0000005c   stfld     0x00000000                             # store field state : AxisCompensation.State
0x0000005e   ldloc     0x00000000                             # load this : AxisCompensation
0x00000060   ldloc     0x00000001                             # load 0th argument tableIndex : int
0x00000062   stfld     0x00000001                             # store field tblIdx : int
0x00000064   ret       0x00000000                             # return from routine

# Method ZDualloop.IsochronousTask
0x00000066   ldc       0x0000000a                             # 10
0x00000068   rlde      0x00000008   0x00238801                # get Register.Application.Variables.Booleans[TOS] : bool
0x0000006b   brtrue    0x0000007b                             # branch if not zero
0x0000006d   ldc       0x0000000b                             # 11
0x0000006f   rlde      0x00000008   0x00238801                # get Register.Application.Variables.Booleans[TOS] : bool
0x00000072   brtrue    0x0000007b                             # branch if not zero
0x00000074   ldc       0x0000000c                             # 12
0x00000076   rlde      0x00000008   0x00238801                # get Register.Application.Variables.Booleans[TOS] : bool
0x00000079   br        0x0000007c                             # branch unconditionally
0x0000007b   ldc.1                                            # 1
0x0000007c   rst       0x00214000                             # set Register.General.Commands.ExternalError : bool
0x0000007e   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x00000080   ldc.0                                            # 0
0x00000081   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000084   ldc.1                                            # 1
0x00000085   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000088   call      0x00000000   0x00000003   0x0000003b   # call MoveTime.Set(System.Single, System.Single)
0x0000008c   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x0000008e   rld       0x0022e500                             # get Register.Axes_0.Signals.PositionController.Controllers_1.PositionError : float
0x00000090   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x00000092   ldc.0                                            # 0
0x00000093   ceq                                              # compare if equal
0x00000094   call      0x00000000   0x00000003   0x000000d2   # call MoveTime.Run(System.Single, System.Boolean)
0x00000098   ldc.0                                            # 0
0x00000099   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x0000009b   call      0x00000000   0x00000001   0x00000144   # call MoveTime.GetMoveTime()
0x0000009f   rste      0x00000020   0x00238601                # set Register.Application.Variables.Floats[TOS] : float
0x000000a2   ldc.0                                            # 0
0x000000a3   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x000000a5   call      0x00000000   0x00000001   0x00000136   # call MoveTime.IsSettled.get()
0x000000a9   rste      0x00000008   0x00238801                # set Register.Application.Variables.Booleans[TOS] : bool
0x000000ac   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x000000ae   stloc     0x00000000                             # store local variable linEnc : float
0x000000b0   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x000000b2   ldc       0x00000014                             # 20
0x000000b4   bne       0x000000be                             # branch if not equal
0x000000b6   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x000000b8   ldc.3                                            # 3
0x000000b9   clt.i                                            # compare if less
0x000000ba   ldc.0                                            # 0
0x000000bb   ceq                                              # compare if equal
0x000000bc   br        0x000000bf                             # branch unconditionally
0x000000be   ldc.0                                            # 0
0x000000bf   stloc     0x00000001                             # store local variable enable : bool
0x000000c1   ldabs     0x00000001                             # load static field axis0Compensation : AxisCompensation
0x000000c3   ldloc     0x00000001                             # load local variable enable : bool
0x000000c5   ldloc     0x00000000                             # load local variable linEnc : float
0x000000c7   call      0x00000001   0x00000004   0x0000014e   # call AxisCompensation.Run1D(System.Boolean, System.Single)
0x000000cb   stloc     0x00000002                             # store local variable compensation : float
0x000000cd   ldloc     0x00000002                             # load local variable compensation : float
0x000000cf   rst       0x00208300                             # set Register.Axes_0.Commands.PositionController.Encoders_1.InjectedPosition : float
0x000000d1   halt                                             # return from Tama task routine

# Method MoveTime.Run
0x000000d2   ldloc     0x00000000                             # load this : MoveTime
0x000000d4   call      0x00000000   0x00000001   0x00000136   # call MoveTime.IsSettled.get()
0x000000d8   ldloc     0x00000002                             # load 1th argument isMoving : bool
0x000000da   and                                              # integer bitwise AND
0x000000db   brfalse   0x000000e9                             # branch if zero
0x000000dd   ldloc     0x00000000                             # load this : MoveTime
0x000000df   ldc.0                                            # 0
0x000000e0   call      0x00000000   0x00000002   0x0000013c   # call MoveTime.IsSettled.set(System.Boolean)
0x000000e4   ldloc     0x00000000                             # load this : MoveTime
0x000000e6   ldc.0                                            # 0
0x000000e7   stfld     0x00000003                             # store field moveTimer : int
0x000000e9   ldloc     0x00000000                             # load this : MoveTime
0x000000eb   call      0x00000000   0x00000001   0x00000136   # call MoveTime.IsSettled.get()
0x000000ef   brtrue    0x00000134                             # branch if not zero
0x000000f1   ldloc     0x00000000                             # load this : MoveTime
0x000000f3   ldloc     0x00000000                             # load this : MoveTime
0x000000f5   ldfld     0x00000003                             # load field moveTimer : int
0x000000f7   ldc.1                                            # 1
0x000000f8   add.i4                                           # integer addition
0x000000f9   stfld     0x00000003                             # store field moveTimer : int
0x000000fb   ldloc     0x00000001                             # load 0th argument positionError : float
0x000000fd   ldloc     0x00000000                             # load this : MoveTime
0x000000ff   ldfld     0x00000002                             # load field settlingWindow : float
0x00000101   bge.f     0x0000012f                             # branch if greater or equal
0x00000103   ldloc     0x00000001                             # load 0th argument positionError : float
0x00000105   ldloc     0x00000000                             # load this : MoveTime
0x00000107   ldfld     0x00000002                             # load field settlingWindow : float
0x00000109   neg.r4                                           # float negation
0x0000010a   ble.f     0x0000012f                             # branch if less than or equal
0x0000010c   ldloc     0x00000000                             # load this : MoveTime
0x0000010e   ldloc     0x00000000                             # load this : MoveTime
0x00000110   ldfld     0x00000004                             # load field settlingTimer : int
0x00000112   ldc.1                                            # 1
0x00000113   add.i4                                           # integer addition
0x00000114   stfld     0x00000004                             # store field settlingTimer : int
0x00000116   ldloc     0x00000000                             # load this : MoveTime
0x00000118   ldloc     0x00000000                             # load this : MoveTime
0x0000011a   ldfld     0x00000004                             # load field settlingTimer : int
0x0000011c   ldloc     0x00000000                             # load this : MoveTime
0x0000011e   ldfld     0x00000000                             # load field minSettleDuration : int
0x00000120   ble.i     0x00000128                             # branch if less than or equal
0x00000122   ldloc     0x00000002                             # load 1th argument isMoving : bool
0x00000124   ldc.0                                            # 0
0x00000125   ceq                                              # compare if equal
0x00000126   br        0x00000129                             # branch unconditionally
0x00000128   ldc.0                                            # 0
0x00000129   call      0x00000000   0x00000002   0x0000013c   # call MoveTime.IsSettled.set(System.Boolean)
0x0000012d   ret       0x00000000                             # return from routine
0x0000012f   ldloc     0x00000000                             # load this : MoveTime
0x00000131   ldc.0                                            # 0
0x00000132   stfld     0x00000004                             # store field settlingTimer : int
0x00000134   ret       0x00000000                             # return from routine

# Method MoveTime.IsSettled.get
0x00000136   ldloc     0x00000000                             # load this : MoveTime
0x00000138   ldfld     0x00000001                             # load field <IsSettled>k__BackingField : bool
0x0000013a   ret       0x00000001                             # return from routine

# Method MoveTime.IsSettled.set
0x0000013c   ldloc     0x00000000                             # load this : MoveTime
0x0000013e   ldloc     0x00000001                             # load 0th argument value : bool
0x00000140   stfld     0x00000001                             # store field <IsSettled>k__BackingField : bool
0x00000142   ret       0x00000000                             # return from routine

# Method MoveTime.GetMoveTime
0x00000144   ldloc     0x00000000                             # load this : MoveTime
0x00000146   ldfld     0x00000003                             # load field moveTimer : int
0x00000148   conv.i4.r4                                       # convert int to float
0x00000149   ldc       0x38d1b717                             # 0.0001
0x0000014b   mul.r4                                           # float multiplication
0x0000014c   ret       0x00000001                             # return from routine

# Method AxisCompensation.Run1D
0x0000014e   ldloc     0x00000000                             # load this : AxisCompensation
0x00000150   ldloc     0x00000001                             # load 0th argument enable : bool
0x00000152   call      0x00000001   0x00000003   0x00000165   # call AxisCompensation.StateMachine(System.Boolean)
0x00000156   stloc     0x00000003                             # store local variable gain : float
0x00000158   ldloc     0x00000000                             # load this : AxisCompensation
0x0000015a   ldloc     0x00000002                             # load 1th argument xEnc : float
0x0000015c   call      0x00000009   0x0000000b   0x000001df   # call AxisCompensation.GetCompensation1D(System.Single)
0x00000160   ldloc     0x00000003                             # load local variable gain : float
0x00000162   mul.r4                                           # float multiplication
0x00000163   ret       0x00000001                             # return from routine

# Method AxisCompensation.StateMachine
0x00000165   ldloc     0x00000000                             # load this : AxisCompensation
0x00000167   ldfld     0x00000000                             # load field state : AxisCompensation.State
0x00000169   stloc     0x00000002                             # store local variable local_0 : AxisCompensation.State
0x0000016b   ldloc     0x00000002                             # load local variable local_0 : AxisCompensation.State
0x0000016d   switch.   0x00000003                             # switch table
      (   0x00000174   0x0000019e   0x000001c9   )
0x00000172   br        0x000001d4                             # branch unconditionally
0x00000174   ldloc     0x00000001                             # load 0th argument enable : bool
0x00000176   brfalse   0x00000185                             # branch if zero
0x00000178   ldloc     0x00000000                             # load this : AxisCompensation
0x0000017a   ldfld     0x00000002                             # load field compGain : float
0x0000017c   ldc       0x00000000                             # 0
0x0000017e   bne       0x00000185                             # branch if not equal
0x00000180   ldloc     0x00000000                             # load this : AxisCompensation
0x00000182   ldc.1                                            # 1
0x00000183   stfld     0x00000000                             # store field state : AxisCompensation.State
0x00000185   ldloc     0x00000000                             # load this : AxisCompensation
0x00000187   ldloc     0x00000000                             # load this : AxisCompensation
0x00000189   ldfld     0x00000002                             # load field compGain : float
0x0000018b   ldc       0x3a03126e                             # 0.0005
0x0000018d   blt.f     0x00000198                             # branch if less
0x0000018f   ldloc     0x00000000                             # load this : AxisCompensation
0x00000191   ldfld     0x00000002                             # load field compGain : float
0x00000193   ldc       0x3a03126e                             # 0.0005
0x00000195   sub.r4                                           # float subtraction
0x00000196   br        0x0000019a                             # branch unconditionally
0x00000198   ldc       0x00000000                             # 0
0x0000019a   stfld     0x00000002                             # store field compGain : float
0x0000019c   br        0x000001d9                             # branch unconditionally
0x0000019e   ldloc     0x00000001                             # load 0th argument enable : bool
0x000001a0   brfalse   0x000001c2                             # branch if zero
0x000001a2   ldloc     0x00000000                             # load this : AxisCompensation
0x000001a4   ldloc     0x00000000                             # load this : AxisCompensation
0x000001a6   ldfld     0x00000002                             # load field compGain : float
0x000001a8   ldc       0x3a03126e                             # 0.0005
0x000001aa   add.r4                                           # float addition
0x000001ab   stfld     0x00000002                             # store field compGain : float
0x000001ad   ldloc     0x00000000                             # load this : AxisCompensation
0x000001af   ldfld     0x00000002                             # load field compGain : float
0x000001b1   ldc       0x3f800000                             # 1
0x000001b3   blt.f     0x000001d9                             # branch if less
0x000001b5   ldloc     0x00000000                             # load this : AxisCompensation
0x000001b7   ldc       0x3f800000                             # 1
0x000001b9   stfld     0x00000002                             # store field compGain : float
0x000001bb   ldloc     0x00000000                             # load this : AxisCompensation
0x000001bd   ldc.2                                            # 2
0x000001be   stfld     0x00000000                             # store field state : AxisCompensation.State
0x000001c0   br        0x000001d9                             # branch unconditionally
0x000001c2   ldloc     0x00000000                             # load this : AxisCompensation
0x000001c4   ldc.0                                            # 0
0x000001c5   stfld     0x00000000                             # store field state : AxisCompensation.State
0x000001c7   br        0x000001d9                             # branch unconditionally
0x000001c9   ldloc     0x00000001                             # load 0th argument enable : bool
0x000001cb   brtrue    0x000001d9                             # branch if not zero
0x000001cd   ldloc     0x00000000                             # load this : AxisCompensation
0x000001cf   ldc.0                                            # 0
0x000001d0   stfld     0x00000000                             # store field state : AxisCompensation.State
0x000001d2   br        0x000001d9                             # branch unconditionally
0x000001d4   ldloc     0x00000000                             # load this : AxisCompensation
0x000001d6   ldc.0                                            # 0
0x000001d7   stfld     0x00000000                             # store field state : AxisCompensation.State
0x000001d9   ldloc     0x00000000                             # load this : AxisCompensation
0x000001db   ldfld     0x00000002                             # load field compGain : float
0x000001dd   ret       0x00000001                             # return from routine

# Method AxisCompensation.GetCompensation1D
0x000001df   ldloc     0x00000000                             # load this : AxisCompensation
0x000001e1   ldfld     0x00000001                             # load field tblIdx : int
0x000001e3   stloc     0x00000009                             # store local variable local_7 : int
0x000001e5   ldloc     0x00000009                             # load local variable local_7 : int
0x000001e7   ldc.1                                            # 1
0x000001e8   beq       0x000001f1                             # branch if equal
0x000001ea   ldloc     0x00000009                             # load local variable local_7 : int
0x000001ec   ldc.2                                            # 2
0x000001ed   beq       0x000001ff                             # branch if equal
0x000001ef   br        0x0000020d                             # branch unconditionally
0x000001f1   rld       0x0040052b                             # get Register.Application.Tables.Small1.Header.Dim1.StartValue : float
0x000001f3   stloc     0x00000002                             # store local variable startValueX : float
0x000001f5   rld       0x0040052c                             # get Register.Application.Tables.Small1.Header.Dim1.Distance : float
0x000001f7   stloc     0x00000003                             # store local variable distanceX : float
0x000001f9   rld       0x00400529                             # get Register.Application.Tables.Small1.Header.Dim1.Size : int
0x000001fb   stloc     0x00000004                             # store local variable tblSizeX : int
0x000001fd   br        0x00000211                             # branch unconditionally
0x000001ff   rld       0x00400d2b                             # get Register.Application.Tables.Small2.Header.Dim1.StartValue : float
0x00000201   stloc     0x00000002                             # store local variable startValueX : float
0x00000203   rld       0x00400d2c                             # get Register.Application.Tables.Small2.Header.Dim1.Distance : float
0x00000205   stloc     0x00000003                             # store local variable distanceX : float
0x00000207   rld       0x00400d29                             # get Register.Application.Tables.Small2.Header.Dim1.Size : int
0x00000209   stloc     0x00000004                             # store local variable tblSizeX : int
0x0000020b   br        0x00000211                             # branch unconditionally
0x0000020d   ldc       0x00000000                             # 0
0x0000020f   ret       0x00000001                             # return from routine
0x00000211   ldloc     0x00000003                             # load local variable distanceX : float
0x00000213   ldc       0x00000000                             # 0
0x00000215   bgt.f     0x0000021b                             # branch if greater
0x00000217   ldc       0x00000000                             # 0
0x00000219   ret       0x00000001                             # return from routine
0x0000021b   ldloc     0x00000001                             # load 0th argument xEnc : float
0x0000021d   ldloc     0x00000002                             # load local variable startValueX : float
0x0000021f   ldloc     0x00000003                             # load local variable distanceX : float
0x00000221   ldloc     0x00000004                             # load local variable tblSizeX : int
0x00000223   ldloca    0x00000005                             # load home of local variable idx : int
0x00000225   ldloca    0x00000006                             # load home of local variable offset : float
0x00000227   call      0x00000002   0x00000008   0x00000272   # call AxisCompensation.GetIndexAndOffset(System.Single, System.Single, System.Single, System.Int32, System.Int32, System.Single)
0x0000022b   ldloc     0x00000000                             # load this : AxisCompensation
0x0000022d   ldfld     0x00000001                             # load field tblIdx : int
0x0000022f   stloc     0x0000000a                             # store local variable local_8 : int
0x00000231   ldloc     0x0000000a                             # load local variable local_8 : int
0x00000233   ldc.1                                            # 1
0x00000234   beq       0x0000023d                             # branch if equal
0x00000236   ldloc     0x0000000a                             # load local variable local_8 : int
0x00000238   ldc.2                                            # 2
0x00000239   beq       0x0000024f                             # branch if equal
0x0000023b   br        0x00000261                             # branch unconditionally
0x0000023d   ldloc     0x00000005                             # load local variable idx : int
0x0000023f   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x00000242   stloc     0x00000007                             # store local variable c0 : float
0x00000244   ldloc     0x00000005                             # load local variable idx : int
0x00000246   ldc.1                                            # 1
0x00000247   add.i4                                           # integer addition
0x00000248   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x0000024b   stloc     0x00000008                             # store local variable c1 : float
0x0000024d   br        0x00000265                             # branch unconditionally
0x0000024f   ldloc     0x00000005                             # load local variable idx : int
0x00000251   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x00000254   stloc     0x00000007                             # store local variable c0 : float
0x00000256   ldloc     0x00000005                             # load local variable idx : int
0x00000258   ldc.1                                            # 1
0x00000259   add.i4                                           # integer addition
0x0000025a   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x0000025d   stloc     0x00000008                             # store local variable c1 : float
0x0000025f   br        0x00000265                             # branch unconditionally
0x00000261   ldc       0x00000000                             # 0
0x00000263   ret       0x00000001                             # return from routine
0x00000265   ldloc     0x00000007                             # load local variable c0 : float
0x00000267   ldloc     0x00000006                             # load local variable offset : float
0x00000269   ldloc     0x00000008                             # load local variable c1 : float
0x0000026b   ldloc     0x00000007                             # load local variable c0 : float
0x0000026d   sub.r4                                           # float subtraction
0x0000026e   mul.r4                                           # float multiplication
0x0000026f   add.r4                                           # float addition
0x00000270   ret       0x00000001                             # return from routine

# Method AxisCompensation.GetIndexAndOffset
0x00000272   ldloc     0x00000000                             # load 0th argument posAbs : float
0x00000274   ldloc     0x00000001                             # load 1th argument startValue : float
0x00000276   sub.r4                                           # float subtraction
0x00000277   stloc     0x00000006                             # store local variable posRel : float
0x00000279   ldloc     0x00000006                             # load local variable posRel : float
0x0000027b   ldloc     0x00000002                             # load 2th argument distance : float
0x0000027d   div.r4                                           # float division
0x0000027e   stloc     0x00000007                             # store local variable idxFloat : float
0x00000280   ldloc     0x00000004                             # load 4th argument index : int*
0x00000282   ldloc     0x00000007                             # load local variable idxFloat : float
0x00000284   floor                                            # floor
0x00000285   conv.r4.i4                                       # convert float to int
0x00000286   stind                                            # store value at address : int
0x00000287   ldloc     0x00000004                             # load 4th argument index : int*
0x00000289   ldind                                            # load value at address : int
0x0000028a   ldc.0                                            # 0
0x0000028b   bge.i     0x00000298                             # branch if greater
0x0000028d   ldloc     0x00000004                             # load 4th argument index : int*
0x0000028f   ldc.0                                            # 0
0x00000290   stind                                            # store value at address : int
0x00000291   ldloc     0x00000005                             # load 5th argument offset : float*
0x00000293   ldc       0x00000000                             # 0
0x00000295   stind                                            # store value at address : float
0x00000296   ret       0x00000000                             # return from routine
0x00000298   ldloc     0x00000004                             # load 4th argument index : int*
0x0000029a   ldind                                            # load value at address : int
0x0000029b   ldloc     0x00000003                             # load 3th argument tblSize : int
0x0000029d   ldc.1                                            # 1
0x0000029e   sub.i4                                           # integer subtraction
0x0000029f   blt.i     0x000002af                             # branch if less
0x000002a1   ldloc     0x00000004                             # load 4th argument index : int*
0x000002a3   ldloc     0x00000003                             # load 3th argument tblSize : int
0x000002a5   ldc.2                                            # 2
0x000002a6   sub.i4                                           # integer subtraction
0x000002a7   stind                                            # store value at address : int
0x000002a8   ldloc     0x00000005                             # load 5th argument offset : float*
0x000002aa   ldc       0x3f800000                             # 1
0x000002ac   stind                                            # store value at address : float
0x000002ad   ret       0x00000000                             # return from routine
0x000002af   ldloc     0x00000005                             # load 5th argument offset : float*
0x000002b1   ldloc     0x00000007                             # load local variable idxFloat : float
0x000002b3   ldloc     0x00000004                             # load 4th argument index : int*
0x000002b5   ldind                                            # load value at address : int
0x000002b6   conv.i4.r4                                       # convert int to float
0x000002b7   sub.r4                                           # float subtraction
0x000002b8   stind                                            # store value at address : float
0x000002b9   ret       0x00000000                             # return from routine
