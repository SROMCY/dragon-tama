# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: ZDualloop, Z:\Projekte\Skyverse_Dragon\CHSI\SW-Release\Delivery_0001\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 13.10.2022 14:08:37
# Target register layout (RLID): 0x00000013
# Space for static fields: 0x00000002
# Maximal stack size: 0x0000002c
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
0x00000066   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x00000068   ldc.0                                            # 0
0x00000069   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x0000006c   ldc.1                                            # 1
0x0000006d   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000070   call      0x00000000   0x00000003   0x0000003b   # call MoveTime.Set(System.Single, System.Single)
0x00000074   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x00000076   rld       0x0022e500                             # get Register.Axes_0.Signals.PositionController.Controllers_1.PositionError : float
0x00000078   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x0000007a   ldc.0                                            # 0
0x0000007b   ceq                                              # compare if equal
0x0000007c   call      0x00000000   0x00000003   0x000000ba   # call MoveTime.Run(System.Single, System.Boolean)
0x00000080   ldc.0                                            # 0
0x00000081   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x00000083   call      0x00000000   0x00000001   0x0000012c   # call MoveTime.GetMoveTime()
0x00000087   rste      0x00000020   0x00238601                # set Register.Application.Variables.Floats[TOS] : float
0x0000008a   ldc.0                                            # 0
0x0000008b   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x0000008d   call      0x00000000   0x00000001   0x0000011e   # call MoveTime.IsSettled.get()
0x00000091   rste      0x00000008   0x00238801                # set Register.Application.Variables.Booleans[TOS] : bool
0x00000094   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x00000096   stloc     0x00000000                             # store local variable linEnc : float
0x00000098   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x0000009a   ldc       0x00000014                             # 20
0x0000009c   bne       0x000000a6                             # branch if not equal
0x0000009e   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x000000a0   ldc.3                                            # 3
0x000000a1   clt.i                                            # compare if less
0x000000a2   ldc.0                                            # 0
0x000000a3   ceq                                              # compare if equal
0x000000a4   br        0x000000a7                             # branch unconditionally
0x000000a6   ldc.0                                            # 0
0x000000a7   stloc     0x00000001                             # store local variable enable : bool
0x000000a9   ldabs     0x00000001                             # load static field axis0Compensation : AxisCompensation
0x000000ab   ldloc     0x00000001                             # load local variable enable : bool
0x000000ad   ldloc     0x00000000                             # load local variable linEnc : float
0x000000af   call      0x00000001   0x00000004   0x00000136   # call AxisCompensation.Run1D(System.Boolean, System.Single)
0x000000b3   stloc     0x00000002                             # store local variable compensation : float
0x000000b5   ldloc     0x00000002                             # load local variable compensation : float
0x000000b7   rst       0x00208300                             # set Register.Axes_0.Commands.PositionController.Encoders_1.InjectedPosition : float
0x000000b9   halt                                             # return from Tama task routine

# Method MoveTime.Run
0x000000ba   ldloc     0x00000000                             # load this : MoveTime
0x000000bc   call      0x00000000   0x00000001   0x0000011e   # call MoveTime.IsSettled.get()
0x000000c0   ldloc     0x00000002                             # load 1th argument isMoving : bool
0x000000c2   and                                              # integer bitwise AND
0x000000c3   brfalse   0x000000d1                             # branch if zero
0x000000c5   ldloc     0x00000000                             # load this : MoveTime
0x000000c7   ldc.0                                            # 0
0x000000c8   call      0x00000000   0x00000002   0x00000124   # call MoveTime.IsSettled.set(System.Boolean)
0x000000cc   ldloc     0x00000000                             # load this : MoveTime
0x000000ce   ldc.0                                            # 0
0x000000cf   stfld     0x00000003                             # store field moveTimer : int
0x000000d1   ldloc     0x00000000                             # load this : MoveTime
0x000000d3   call      0x00000000   0x00000001   0x0000011e   # call MoveTime.IsSettled.get()
0x000000d7   brtrue    0x0000011c                             # branch if not zero
0x000000d9   ldloc     0x00000000                             # load this : MoveTime
0x000000db   ldloc     0x00000000                             # load this : MoveTime
0x000000dd   ldfld     0x00000003                             # load field moveTimer : int
0x000000df   ldc.1                                            # 1
0x000000e0   add.i4                                           # integer addition
0x000000e1   stfld     0x00000003                             # store field moveTimer : int
0x000000e3   ldloc     0x00000001                             # load 0th argument positionError : float
0x000000e5   ldloc     0x00000000                             # load this : MoveTime
0x000000e7   ldfld     0x00000002                             # load field settlingWindow : float
0x000000e9   bge.f     0x00000117                             # branch if greater or equal
0x000000eb   ldloc     0x00000001                             # load 0th argument positionError : float
0x000000ed   ldloc     0x00000000                             # load this : MoveTime
0x000000ef   ldfld     0x00000002                             # load field settlingWindow : float
0x000000f1   neg.r4                                           # float negation
0x000000f2   ble.f     0x00000117                             # branch if less than or equal
0x000000f4   ldloc     0x00000000                             # load this : MoveTime
0x000000f6   ldloc     0x00000000                             # load this : MoveTime
0x000000f8   ldfld     0x00000004                             # load field settlingTimer : int
0x000000fa   ldc.1                                            # 1
0x000000fb   add.i4                                           # integer addition
0x000000fc   stfld     0x00000004                             # store field settlingTimer : int
0x000000fe   ldloc     0x00000000                             # load this : MoveTime
0x00000100   ldloc     0x00000000                             # load this : MoveTime
0x00000102   ldfld     0x00000004                             # load field settlingTimer : int
0x00000104   ldloc     0x00000000                             # load this : MoveTime
0x00000106   ldfld     0x00000000                             # load field minSettleDuration : int
0x00000108   ble.i     0x00000110                             # branch if less than or equal
0x0000010a   ldloc     0x00000002                             # load 1th argument isMoving : bool
0x0000010c   ldc.0                                            # 0
0x0000010d   ceq                                              # compare if equal
0x0000010e   br        0x00000111                             # branch unconditionally
0x00000110   ldc.0                                            # 0
0x00000111   call      0x00000000   0x00000002   0x00000124   # call MoveTime.IsSettled.set(System.Boolean)
0x00000115   ret       0x00000000                             # return from routine
0x00000117   ldloc     0x00000000                             # load this : MoveTime
0x00000119   ldc.0                                            # 0
0x0000011a   stfld     0x00000004                             # store field settlingTimer : int
0x0000011c   ret       0x00000000                             # return from routine

# Method MoveTime.IsSettled.get
0x0000011e   ldloc     0x00000000                             # load this : MoveTime
0x00000120   ldfld     0x00000001                             # load field <IsSettled>k__BackingField : bool
0x00000122   ret       0x00000001                             # return from routine

# Method MoveTime.IsSettled.set
0x00000124   ldloc     0x00000000                             # load this : MoveTime
0x00000126   ldloc     0x00000001                             # load 0th argument value : bool
0x00000128   stfld     0x00000001                             # store field <IsSettled>k__BackingField : bool
0x0000012a   ret       0x00000000                             # return from routine

# Method MoveTime.GetMoveTime
0x0000012c   ldloc     0x00000000                             # load this : MoveTime
0x0000012e   ldfld     0x00000003                             # load field moveTimer : int
0x00000130   conv.i4.r4                                       # convert int to float
0x00000131   ldc       0x38d1b717                             # 0.0001
0x00000133   mul.r4                                           # float multiplication
0x00000134   ret       0x00000001                             # return from routine

# Method AxisCompensation.Run1D
0x00000136   ldloc     0x00000000                             # load this : AxisCompensation
0x00000138   ldloc     0x00000001                             # load 0th argument enable : bool
0x0000013a   call      0x00000001   0x00000003   0x0000014d   # call AxisCompensation.StateMachine(System.Boolean)
0x0000013e   stloc     0x00000003                             # store local variable gain : float
0x00000140   ldloc     0x00000000                             # load this : AxisCompensation
0x00000142   ldloc     0x00000002                             # load 1th argument xEnc : float
0x00000144   call      0x00000009   0x0000000b   0x000001c7   # call AxisCompensation.GetCompensation1D(System.Single)
0x00000148   ldloc     0x00000003                             # load local variable gain : float
0x0000014a   mul.r4                                           # float multiplication
0x0000014b   ret       0x00000001                             # return from routine

# Method AxisCompensation.StateMachine
0x0000014d   ldloc     0x00000000                             # load this : AxisCompensation
0x0000014f   ldfld     0x00000000                             # load field state : AxisCompensation.State
0x00000151   stloc     0x00000002                             # store local variable local_0 : AxisCompensation.State
0x00000153   ldloc     0x00000002                             # load local variable local_0 : AxisCompensation.State
0x00000155   switch.   0x00000003                             # switch table
      (   0x0000015c   0x00000186   0x000001b1   )
0x0000015a   br        0x000001bc                             # branch unconditionally
0x0000015c   ldloc     0x00000001                             # load 0th argument enable : bool
0x0000015e   brfalse   0x0000016d                             # branch if zero
0x00000160   ldloc     0x00000000                             # load this : AxisCompensation
0x00000162   ldfld     0x00000002                             # load field compGain : float
0x00000164   ldc       0x00000000                             # 0
0x00000166   bne       0x0000016d                             # branch if not equal
0x00000168   ldloc     0x00000000                             # load this : AxisCompensation
0x0000016a   ldc.1                                            # 1
0x0000016b   stfld     0x00000000                             # store field state : AxisCompensation.State
0x0000016d   ldloc     0x00000000                             # load this : AxisCompensation
0x0000016f   ldloc     0x00000000                             # load this : AxisCompensation
0x00000171   ldfld     0x00000002                             # load field compGain : float
0x00000173   ldc       0x3a03126e                             # 0.0005
0x00000175   blt.f     0x00000180                             # branch if less
0x00000177   ldloc     0x00000000                             # load this : AxisCompensation
0x00000179   ldfld     0x00000002                             # load field compGain : float
0x0000017b   ldc       0x3a03126e                             # 0.0005
0x0000017d   sub.r4                                           # float subtraction
0x0000017e   br        0x00000182                             # branch unconditionally
0x00000180   ldc       0x00000000                             # 0
0x00000182   stfld     0x00000002                             # store field compGain : float
0x00000184   br        0x000001c1                             # branch unconditionally
0x00000186   ldloc     0x00000001                             # load 0th argument enable : bool
0x00000188   brfalse   0x000001aa                             # branch if zero
0x0000018a   ldloc     0x00000000                             # load this : AxisCompensation
0x0000018c   ldloc     0x00000000                             # load this : AxisCompensation
0x0000018e   ldfld     0x00000002                             # load field compGain : float
0x00000190   ldc       0x3a03126e                             # 0.0005
0x00000192   add.r4                                           # float addition
0x00000193   stfld     0x00000002                             # store field compGain : float
0x00000195   ldloc     0x00000000                             # load this : AxisCompensation
0x00000197   ldfld     0x00000002                             # load field compGain : float
0x00000199   ldc       0x3f800000                             # 1
0x0000019b   blt.f     0x000001c1                             # branch if less
0x0000019d   ldloc     0x00000000                             # load this : AxisCompensation
0x0000019f   ldc       0x3f800000                             # 1
0x000001a1   stfld     0x00000002                             # store field compGain : float
0x000001a3   ldloc     0x00000000                             # load this : AxisCompensation
0x000001a5   ldc.2                                            # 2
0x000001a6   stfld     0x00000000                             # store field state : AxisCompensation.State
0x000001a8   br        0x000001c1                             # branch unconditionally
0x000001aa   ldloc     0x00000000                             # load this : AxisCompensation
0x000001ac   ldc.0                                            # 0
0x000001ad   stfld     0x00000000                             # store field state : AxisCompensation.State
0x000001af   br        0x000001c1                             # branch unconditionally
0x000001b1   ldloc     0x00000001                             # load 0th argument enable : bool
0x000001b3   brtrue    0x000001c1                             # branch if not zero
0x000001b5   ldloc     0x00000000                             # load this : AxisCompensation
0x000001b7   ldc.0                                            # 0
0x000001b8   stfld     0x00000000                             # store field state : AxisCompensation.State
0x000001ba   br        0x000001c1                             # branch unconditionally
0x000001bc   ldloc     0x00000000                             # load this : AxisCompensation
0x000001be   ldc.0                                            # 0
0x000001bf   stfld     0x00000000                             # store field state : AxisCompensation.State
0x000001c1   ldloc     0x00000000                             # load this : AxisCompensation
0x000001c3   ldfld     0x00000002                             # load field compGain : float
0x000001c5   ret       0x00000001                             # return from routine

# Method AxisCompensation.GetCompensation1D
0x000001c7   ldloc     0x00000000                             # load this : AxisCompensation
0x000001c9   ldfld     0x00000001                             # load field tblIdx : int
0x000001cb   stloc     0x00000009                             # store local variable local_7 : int
0x000001cd   ldloc     0x00000009                             # load local variable local_7 : int
0x000001cf   ldc.1                                            # 1
0x000001d0   beq       0x000001d9                             # branch if equal
0x000001d2   ldloc     0x00000009                             # load local variable local_7 : int
0x000001d4   ldc.2                                            # 2
0x000001d5   beq       0x000001e7                             # branch if equal
0x000001d7   br        0x000001f5                             # branch unconditionally
0x000001d9   rld       0x0040052b                             # get Register.Application.Tables.Small1.Header.Dim1.StartValue : float
0x000001db   stloc     0x00000002                             # store local variable startValueX : float
0x000001dd   rld       0x0040052c                             # get Register.Application.Tables.Small1.Header.Dim1.Distance : float
0x000001df   stloc     0x00000003                             # store local variable distanceX : float
0x000001e1   rld       0x00400529                             # get Register.Application.Tables.Small1.Header.Dim1.Size : int
0x000001e3   stloc     0x00000004                             # store local variable tblSizeX : int
0x000001e5   br        0x000001f9                             # branch unconditionally
0x000001e7   rld       0x00400d2b                             # get Register.Application.Tables.Small2.Header.Dim1.StartValue : float
0x000001e9   stloc     0x00000002                             # store local variable startValueX : float
0x000001eb   rld       0x00400d2c                             # get Register.Application.Tables.Small2.Header.Dim1.Distance : float
0x000001ed   stloc     0x00000003                             # store local variable distanceX : float
0x000001ef   rld       0x00400d29                             # get Register.Application.Tables.Small2.Header.Dim1.Size : int
0x000001f1   stloc     0x00000004                             # store local variable tblSizeX : int
0x000001f3   br        0x000001f9                             # branch unconditionally
0x000001f5   ldc       0x00000000                             # 0
0x000001f7   ret       0x00000001                             # return from routine
0x000001f9   ldloc     0x00000003                             # load local variable distanceX : float
0x000001fb   ldc       0x00000000                             # 0
0x000001fd   bgt.f     0x00000203                             # branch if greater
0x000001ff   ldc       0x00000000                             # 0
0x00000201   ret       0x00000001                             # return from routine
0x00000203   ldloc     0x00000001                             # load 0th argument xEnc : float
0x00000205   ldloc     0x00000002                             # load local variable startValueX : float
0x00000207   ldloc     0x00000003                             # load local variable distanceX : float
0x00000209   ldloc     0x00000004                             # load local variable tblSizeX : int
0x0000020b   ldloca    0x00000005                             # load home of local variable idx : int
0x0000020d   ldloca    0x00000006                             # load home of local variable offset : float
0x0000020f   call      0x00000002   0x00000008   0x0000025a   # call AxisCompensation.GetIndexAndOffset(System.Single, System.Single, System.Single, System.Int32, System.Int32, System.Single)
0x00000213   ldloc     0x00000000                             # load this : AxisCompensation
0x00000215   ldfld     0x00000001                             # load field tblIdx : int
0x00000217   stloc     0x0000000a                             # store local variable local_8 : int
0x00000219   ldloc     0x0000000a                             # load local variable local_8 : int
0x0000021b   ldc.1                                            # 1
0x0000021c   beq       0x00000225                             # branch if equal
0x0000021e   ldloc     0x0000000a                             # load local variable local_8 : int
0x00000220   ldc.2                                            # 2
0x00000221   beq       0x00000237                             # branch if equal
0x00000223   br        0x00000249                             # branch unconditionally
0x00000225   ldloc     0x00000005                             # load local variable idx : int
0x00000227   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x0000022a   stloc     0x00000007                             # store local variable c0 : float
0x0000022c   ldloc     0x00000005                             # load local variable idx : int
0x0000022e   ldc.1                                            # 1
0x0000022f   add.i4                                           # integer addition
0x00000230   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x00000233   stloc     0x00000008                             # store local variable c1 : float
0x00000235   br        0x0000024d                             # branch unconditionally
0x00000237   ldloc     0x00000005                             # load local variable idx : int
0x00000239   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x0000023c   stloc     0x00000007                             # store local variable c0 : float
0x0000023e   ldloc     0x00000005                             # load local variable idx : int
0x00000240   ldc.1                                            # 1
0x00000241   add.i4                                           # integer addition
0x00000242   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x00000245   stloc     0x00000008                             # store local variable c1 : float
0x00000247   br        0x0000024d                             # branch unconditionally
0x00000249   ldc       0x00000000                             # 0
0x0000024b   ret       0x00000001                             # return from routine
0x0000024d   ldloc     0x00000007                             # load local variable c0 : float
0x0000024f   ldloc     0x00000006                             # load local variable offset : float
0x00000251   ldloc     0x00000008                             # load local variable c1 : float
0x00000253   ldloc     0x00000007                             # load local variable c0 : float
0x00000255   sub.r4                                           # float subtraction
0x00000256   mul.r4                                           # float multiplication
0x00000257   add.r4                                           # float addition
0x00000258   ret       0x00000001                             # return from routine

# Method AxisCompensation.GetIndexAndOffset
0x0000025a   ldloc     0x00000000                             # load 0th argument posAbs : float
0x0000025c   ldloc     0x00000001                             # load 1th argument startValue : float
0x0000025e   sub.r4                                           # float subtraction
0x0000025f   stloc     0x00000006                             # store local variable posRel : float
0x00000261   ldloc     0x00000006                             # load local variable posRel : float
0x00000263   ldloc     0x00000002                             # load 2th argument distance : float
0x00000265   div.r4                                           # float division
0x00000266   stloc     0x00000007                             # store local variable idxFloat : float
0x00000268   ldloc     0x00000004                             # load 4th argument index : int*
0x0000026a   ldloc     0x00000007                             # load local variable idxFloat : float
0x0000026c   floor                                            # floor
0x0000026d   conv.r4.i4                                       # convert float to int
0x0000026e   stind                                            # store value at address : int
0x0000026f   ldloc     0x00000004                             # load 4th argument index : int*
0x00000271   ldind                                            # load value at address : int
0x00000272   ldc.0                                            # 0
0x00000273   bge.i     0x00000280                             # branch if greater
0x00000275   ldloc     0x00000004                             # load 4th argument index : int*
0x00000277   ldc.0                                            # 0
0x00000278   stind                                            # store value at address : int
0x00000279   ldloc     0x00000005                             # load 5th argument offset : float*
0x0000027b   ldc       0x00000000                             # 0
0x0000027d   stind                                            # store value at address : float
0x0000027e   ret       0x00000000                             # return from routine
0x00000280   ldloc     0x00000004                             # load 4th argument index : int*
0x00000282   ldind                                            # load value at address : int
0x00000283   ldloc     0x00000003                             # load 3th argument tblSize : int
0x00000285   ldc.1                                            # 1
0x00000286   sub.i4                                           # integer subtraction
0x00000287   blt.i     0x00000297                             # branch if less
0x00000289   ldloc     0x00000004                             # load 4th argument index : int*
0x0000028b   ldloc     0x00000003                             # load 3th argument tblSize : int
0x0000028d   ldc.2                                            # 2
0x0000028e   sub.i4                                           # integer subtraction
0x0000028f   stind                                            # store value at address : int
0x00000290   ldloc     0x00000005                             # load 5th argument offset : float*
0x00000292   ldc       0x3f800000                             # 1
0x00000294   stind                                            # store value at address : float
0x00000295   ret       0x00000000                             # return from routine
0x00000297   ldloc     0x00000005                             # load 5th argument offset : float*
0x00000299   ldloc     0x00000007                             # load local variable idxFloat : float
0x0000029b   ldloc     0x00000004                             # load 4th argument index : int*
0x0000029d   ldind                                            # load value at address : int
0x0000029e   conv.i4.r4                                       # convert int to float
0x0000029f   sub.r4                                           # float subtraction
0x000002a0   stind                                            # store value at address : float
0x000002a1   ret       0x00000000                             # return from routine
