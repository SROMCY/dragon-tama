# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: XGantry, Z:\Projekte\Skyverse_Dragon\CHSI\SW-Release\Delivery_0001\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 13.10.2022 14:08:37
# Target register layout (RLID): 0x00000013
# Space for static fields: 0x00000004
# Maximal stack size: 0x0000003a
# Init entry point                 : 0x00000001 (local stack size = 0x00000000)
# Task entry point AsynchronousMain: 0x00000000 (local stack size = 0x00000000)
# Task entry point IsochronousMain : 0x00000090 (local stack size = 0x00000006)
# Task entry point Axis1Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Coupling   : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Coupling   : 0x00000000 (local stack size = 0x00000000)
0x00000000   halt                                             # precautious halt

# Method XGantry..cctor
0x00000001   new       0x00000011   0x00000000                # allocate space on the heap for a new instance of class GantryEncoderAlignment
0x00000004   call      0x00000000   0x00000001   0x0000003a   # call GantryEncoderAlignment..ctor()
0x00000008   stabs     0x00000003                             # store static field encoderAlignment : GantryEncoderAlignment
0x0000000a   ldc.0                                            # 0
0x0000000b   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x0000000e   ldc.1                                            # 1
0x0000000f   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000012   new       0x00000005   0x00000002                # allocate space on the heap for a new instance of class MoveTime
0x00000015   call      0x00000000   0x00000003   0x00000049   # call MoveTime..ctor(System.Single, System.Single)
0x00000019   stabs     0x00000000                             # store static field settlingTimeA0 : MoveTime
0x0000001b   ldc.2                                            # 2
0x0000001c   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x0000001f   ldc.3                                            # 3
0x00000020   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000023   new       0x00000005   0x00000002                # allocate space on the heap for a new instance of class MoveTime
0x00000026   call      0x00000000   0x00000003   0x00000049   # call MoveTime..ctor(System.Single, System.Single)
0x0000002a   stabs     0x00000001                             # store static field settlingTimeA1 : MoveTime
0x0000002c   ldc.1                                            # 1
0x0000002d   new       0x00000003   0x00000001                # allocate space on the heap for a new instance of class AxisCompensation
0x00000030   call      0x00000000   0x00000002   0x00000077   # call AxisCompensation..ctor(System.Int32)
0x00000034   stabs     0x00000002                             # store static field axis0Compensation : AxisCompensation
0x00000036   ldc.4                                            # 4
0x00000037   rst       0x00237d00                             # set Register.Application.TamaControl.IsochronousMainCommand : int
0x00000039   halt                                             # return from Tama task routine

# Method GantryEncoderAlignment..ctor
0x0000003a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000003c   call      0x00000000   0x00000001   0x00000047   # call System.Object..ctor()
0x00000040   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000042   ldc.0                                            # 0
0x00000043   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x00000045   ret       0x00000000                             # return from routine

# Method System.Object..ctor
0x00000047   ret       0x00000000                             # return from routine

# Method MoveTime..ctor
0x00000049   ldloc     0x00000000                             # load this : MoveTime
0x0000004b   call      0x00000000   0x00000001   0x00000047   # call System.Object..ctor()
0x0000004f   ldloc     0x00000000                             # load this : MoveTime
0x00000051   ldc.0                                            # 0
0x00000052   stfld     0x00000003                             # store field moveTimer : int
0x00000054   ldloc     0x00000000                             # load this : MoveTime
0x00000056   ldc.0                                            # 0
0x00000057   stfld     0x00000004                             # store field settlingTimer : int
0x00000059   ldloc     0x00000000                             # load this : MoveTime
0x0000005b   ldloc     0x00000001                             # load 0th argument settlingWindow : float
0x0000005d   ldloc     0x00000002                             # load 1th argument minSettleDuration : float
0x0000005f   call      0x00000000   0x00000003   0x00000065   # call MoveTime.Set(System.Single, System.Single)
0x00000063   ret       0x00000000                             # return from routine

# Method MoveTime.Set
0x00000065   ldloc     0x00000000                             # load this : MoveTime
0x00000067   ldloc     0x00000001                             # load 0th argument settlingWindow : float
0x00000069   stfld     0x00000002                             # store field settlingWindow : float
0x0000006b   ldloc     0x00000000                             # load this : MoveTime
0x0000006d   ldloc     0x00000002                             # load 1th argument minSettleDuration : float
0x0000006f   ldc       0x461c4000                             # 10000
0x00000071   mul.r4                                           # float multiplication
0x00000072   conv.r4.i4                                       # convert float to int
0x00000073   stfld     0x00000000                             # store field minSettleDuration : int
0x00000075   ret       0x00000000                             # return from routine

# Method AxisCompensation..ctor
0x00000077   ldloc     0x00000000                             # load this : AxisCompensation
0x00000079   call      0x00000000   0x00000001   0x00000047   # call System.Object..ctor()
0x0000007d   ldloc     0x00000000                             # load this : AxisCompensation
0x0000007f   ldc       0x00000000                             # 0
0x00000081   stfld     0x00000002                             # store field compGain : float
0x00000083   ldloc     0x00000000                             # load this : AxisCompensation
0x00000085   ldc.0                                            # 0
0x00000086   stfld     0x00000000                             # store field state : AxisCompensation.State
0x00000088   ldloc     0x00000000                             # load this : AxisCompensation
0x0000008a   ldloc     0x00000001                             # load 0th argument tableIndex : int
0x0000008c   stfld     0x00000001                             # store field tblIdx : int
0x0000008e   ret       0x00000000                             # return from routine

# Method XGantry.IsochronousTask
0x00000090   ldc       0x0000000a                             # 10
0x00000092   rld       0x00229c00                             # get Register.Axes_0.Signals.General.DigitalInputBits : int
0x00000094   ldc.1                                            # 1
0x00000095   and                                              # integer bitwise AND
0x00000096   ldc.0                                            # 0
0x00000097   ceq                                              # compare if equal
0x00000098   rste      0x00000008   0x00238801                # set Register.Application.Variables.Booleans[TOS] : bool
0x0000009b   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x0000009d   ldc.0                                            # 0
0x0000009e   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x000000a1   ldc.1                                            # 1
0x000000a2   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x000000a5   call      0x00000000   0x00000003   0x00000065   # call MoveTime.Set(System.Single, System.Single)
0x000000a9   ldabs     0x00000001                             # load static field settlingTimeA1 : MoveTime
0x000000ab   ldc.2                                            # 2
0x000000ac   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x000000af   ldc.3                                            # 3
0x000000b0   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x000000b3   call      0x00000000   0x00000003   0x00000065   # call MoveTime.Set(System.Single, System.Single)
0x000000b7   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x000000b9   rld       0x0022df00                             # get Register.Axes_0.Signals.PositionController.Controllers_0.PositionError : float
0x000000bb   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000000bd   ldc.0                                            # 0
0x000000be   ceq                                              # compare if equal
0x000000bf   call      0x00000000   0x00000003   0x00000144   # call MoveTime.Run(System.Single, System.Boolean)
0x000000c3   ldabs     0x00000001                             # load static field settlingTimeA1 : MoveTime
0x000000c5   rld       0x002adf00                             # get Register.Axes_1.Signals.PositionController.Controllers_0.PositionError : float
0x000000c7   rld       0x002ab300                             # get Register.Axes_1.Signals.PathPlanner.Done : bool
0x000000c9   ldc.0                                            # 0
0x000000ca   ceq                                              # compare if equal
0x000000cb   call      0x00000000   0x00000003   0x00000144   # call MoveTime.Run(System.Single, System.Boolean)
0x000000cf   ldc.0                                            # 0
0x000000d0   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x000000d2   call      0x00000000   0x00000001   0x000001b6   # call MoveTime.GetMoveTime()
0x000000d6   rste      0x00000020   0x00238601                # set Register.Application.Variables.Floats[TOS] : float
0x000000d9   ldc.0                                            # 0
0x000000da   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x000000dc   call      0x00000000   0x00000001   0x000001a8   # call MoveTime.IsSettled.get()
0x000000e0   rste      0x00000008   0x00238801                # set Register.Application.Variables.Booleans[TOS] : bool
0x000000e3   ldc.1                                            # 1
0x000000e4   ldabs     0x00000001                             # load static field settlingTimeA1 : MoveTime
0x000000e6   call      0x00000000   0x00000001   0x000001b6   # call MoveTime.GetMoveTime()
0x000000ea   rste      0x00000020   0x00238601                # set Register.Application.Variables.Floats[TOS] : float
0x000000ed   ldc.1                                            # 1
0x000000ee   ldabs     0x00000001                             # load static field settlingTimeA1 : MoveTime
0x000000f0   call      0x00000000   0x00000001   0x000001a8   # call MoveTime.IsSettled.get()
0x000000f4   rste      0x00000008   0x00238801                # set Register.Application.Variables.Booleans[TOS] : bool
0x000000f7   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x000000f9   stloc     0x00000000                             # store local variable xEnc : float
0x000000fb   rld.2     0x002a7e01                             # get Register.Axes_1.Commands.PathPlanner.StreamX : double
0x000000fd   conv.r8.r4                                       # convert double to float
0x000000fe   stloc     0x00000001                             # store local variable yEnc : float
0x00000100   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x00000102   ldc       0x00000014                             # 20
0x00000104   bne       0x0000010e                             # branch if not equal
0x00000106   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x00000108   ldc.3                                            # 3
0x00000109   clt.i                                            # compare if less
0x0000010a   ldc.0                                            # 0
0x0000010b   ceq                                              # compare if equal
0x0000010c   br        0x0000010f                             # branch unconditionally
0x0000010e   ldc.0                                            # 0
0x0000010f   stloc     0x00000002                             # store local variable enable : bool
0x00000111   ldabs     0x00000002                             # load static field axis0Compensation : AxisCompensation
0x00000113   ldloc     0x00000002                             # load local variable enable : bool
0x00000115   ldloc     0x00000000                             # load local variable xEnc : float
0x00000117   ldloc     0x00000001                             # load local variable yEnc : float
0x00000119   call      0x00000001   0x00000005   0x000001c0   # call AxisCompensation.Run2D(System.Boolean, System.Single, System.Single)
0x0000011d   stloc     0x00000003                             # store local variable axisCompensationValue : float
0x0000011f   rld       0x00237d00                             # get Register.Application.TamaControl.IsochronousMainCommand : int
0x00000121   stloc     0x00000004                             # store local variable command : GantryEncoderAlignment.Command
0x00000123   ldabs     0x00000003                             # load static field encoderAlignment : GantryEncoderAlignment
0x00000125   ldloc     0x00000004                             # load local variable command : GantryEncoderAlignment.Command
0x00000127   call      0x00000002   0x00000004   0x000003ad   # call GantryEncoderAlignment.Run(GantryEncoderAlignment.Command)
0x0000012b   rst       0x00237d00                             # set Register.Application.TamaControl.IsochronousMainCommand : int
0x0000012d   ldabs     0x00000003                             # load static field encoderAlignment : GantryEncoderAlignment
0x0000012f   call      0x00000000   0x00000001   0x000007eb   # call GantryEncoderAlignment.GetCorrection()
0x00000133   stloc     0x00000005                             # store local variable alignmentCorrectionValue : float
0x00000135   ldloc     0x00000003                             # load local variable axisCompensationValue : float
0x00000137   ldloc     0x00000005                             # load local variable alignmentCorrectionValue : float
0x00000139   add.r4                                           # float addition
0x0000013a   rst       0x00208200                             # set Register.Axes_0.Commands.PositionController.Encoders_0.InjectedPosition : float
0x0000013c   ldloc     0x00000003                             # load local variable axisCompensationValue : float
0x0000013e   ldloc     0x00000005                             # load local variable alignmentCorrectionValue : float
0x00000140   sub.r4                                           # float subtraction
0x00000141   rst       0x00288200                             # set Register.Axes_1.Commands.PositionController.Encoders_0.InjectedPosition : float
0x00000143   halt                                             # return from Tama task routine

# Method MoveTime.Run
0x00000144   ldloc     0x00000000                             # load this : MoveTime
0x00000146   call      0x00000000   0x00000001   0x000001a8   # call MoveTime.IsSettled.get()
0x0000014a   ldloc     0x00000002                             # load 1th argument isMoving : bool
0x0000014c   and                                              # integer bitwise AND
0x0000014d   brfalse   0x0000015b                             # branch if zero
0x0000014f   ldloc     0x00000000                             # load this : MoveTime
0x00000151   ldc.0                                            # 0
0x00000152   call      0x00000000   0x00000002   0x000001ae   # call MoveTime.IsSettled.set(System.Boolean)
0x00000156   ldloc     0x00000000                             # load this : MoveTime
0x00000158   ldc.0                                            # 0
0x00000159   stfld     0x00000003                             # store field moveTimer : int
0x0000015b   ldloc     0x00000000                             # load this : MoveTime
0x0000015d   call      0x00000000   0x00000001   0x000001a8   # call MoveTime.IsSettled.get()
0x00000161   brtrue    0x000001a6                             # branch if not zero
0x00000163   ldloc     0x00000000                             # load this : MoveTime
0x00000165   ldloc     0x00000000                             # load this : MoveTime
0x00000167   ldfld     0x00000003                             # load field moveTimer : int
0x00000169   ldc.1                                            # 1
0x0000016a   add.i4                                           # integer addition
0x0000016b   stfld     0x00000003                             # store field moveTimer : int
0x0000016d   ldloc     0x00000001                             # load 0th argument positionError : float
0x0000016f   ldloc     0x00000000                             # load this : MoveTime
0x00000171   ldfld     0x00000002                             # load field settlingWindow : float
0x00000173   bge.f     0x000001a1                             # branch if greater or equal
0x00000175   ldloc     0x00000001                             # load 0th argument positionError : float
0x00000177   ldloc     0x00000000                             # load this : MoveTime
0x00000179   ldfld     0x00000002                             # load field settlingWindow : float
0x0000017b   neg.r4                                           # float negation
0x0000017c   ble.f     0x000001a1                             # branch if less than or equal
0x0000017e   ldloc     0x00000000                             # load this : MoveTime
0x00000180   ldloc     0x00000000                             # load this : MoveTime
0x00000182   ldfld     0x00000004                             # load field settlingTimer : int
0x00000184   ldc.1                                            # 1
0x00000185   add.i4                                           # integer addition
0x00000186   stfld     0x00000004                             # store field settlingTimer : int
0x00000188   ldloc     0x00000000                             # load this : MoveTime
0x0000018a   ldloc     0x00000000                             # load this : MoveTime
0x0000018c   ldfld     0x00000004                             # load field settlingTimer : int
0x0000018e   ldloc     0x00000000                             # load this : MoveTime
0x00000190   ldfld     0x00000000                             # load field minSettleDuration : int
0x00000192   ble.i     0x0000019a                             # branch if less than or equal
0x00000194   ldloc     0x00000002                             # load 1th argument isMoving : bool
0x00000196   ldc.0                                            # 0
0x00000197   ceq                                              # compare if equal
0x00000198   br        0x0000019b                             # branch unconditionally
0x0000019a   ldc.0                                            # 0
0x0000019b   call      0x00000000   0x00000002   0x000001ae   # call MoveTime.IsSettled.set(System.Boolean)
0x0000019f   ret       0x00000000                             # return from routine
0x000001a1   ldloc     0x00000000                             # load this : MoveTime
0x000001a3   ldc.0                                            # 0
0x000001a4   stfld     0x00000004                             # store field settlingTimer : int
0x000001a6   ret       0x00000000                             # return from routine

# Method MoveTime.IsSettled.get
0x000001a8   ldloc     0x00000000                             # load this : MoveTime
0x000001aa   ldfld     0x00000001                             # load field <IsSettled>k__BackingField : bool
0x000001ac   ret       0x00000001                             # return from routine

# Method MoveTime.IsSettled.set
0x000001ae   ldloc     0x00000000                             # load this : MoveTime
0x000001b0   ldloc     0x00000001                             # load 0th argument value : bool
0x000001b2   stfld     0x00000001                             # store field <IsSettled>k__BackingField : bool
0x000001b4   ret       0x00000000                             # return from routine

# Method MoveTime.GetMoveTime
0x000001b6   ldloc     0x00000000                             # load this : MoveTime
0x000001b8   ldfld     0x00000003                             # load field moveTimer : int
0x000001ba   conv.i4.r4                                       # convert int to float
0x000001bb   ldc       0x38d1b717                             # 0.0001
0x000001bd   mul.r4                                           # float multiplication
0x000001be   ret       0x00000001                             # return from routine

# Method AxisCompensation.Run2D
0x000001c0   ldloc     0x00000000                             # load this : AxisCompensation
0x000001c2   ldloc     0x00000001                             # load 0th argument enable : bool
0x000001c4   call      0x00000001   0x00000003   0x000001d9   # call AxisCompensation.StateMachine(System.Boolean)
0x000001c8   stloc     0x00000004                             # store local variable gain : float
0x000001ca   ldloc     0x00000000                             # load this : AxisCompensation
0x000001cc   ldloc     0x00000002                             # load 1th argument xEnc : float
0x000001ce   ldloc     0x00000003                             # load 2th argument yEnc : float
0x000001d0   call      0x00000013   0x00000016   0x00000253   # call AxisCompensation.GetCompensation2D(System.Single, System.Single)
0x000001d4   ldloc     0x00000004                             # load local variable gain : float
0x000001d6   mul.r4                                           # float multiplication
0x000001d7   ret       0x00000001                             # return from routine

# Method AxisCompensation.StateMachine
0x000001d9   ldloc     0x00000000                             # load this : AxisCompensation
0x000001db   ldfld     0x00000000                             # load field state : AxisCompensation.State
0x000001dd   stloc     0x00000002                             # store local variable local_0 : AxisCompensation.State
0x000001df   ldloc     0x00000002                             # load local variable local_0 : AxisCompensation.State
0x000001e1   switch.   0x00000003                             # switch table
      (   0x000001e8   0x00000212   0x0000023d   )
0x000001e6   br        0x00000248                             # branch unconditionally
0x000001e8   ldloc     0x00000001                             # load 0th argument enable : bool
0x000001ea   brfalse   0x000001f9                             # branch if zero
0x000001ec   ldloc     0x00000000                             # load this : AxisCompensation
0x000001ee   ldfld     0x00000002                             # load field compGain : float
0x000001f0   ldc       0x00000000                             # 0
0x000001f2   bne       0x000001f9                             # branch if not equal
0x000001f4   ldloc     0x00000000                             # load this : AxisCompensation
0x000001f6   ldc.1                                            # 1
0x000001f7   stfld     0x00000000                             # store field state : AxisCompensation.State
0x000001f9   ldloc     0x00000000                             # load this : AxisCompensation
0x000001fb   ldloc     0x00000000                             # load this : AxisCompensation
0x000001fd   ldfld     0x00000002                             # load field compGain : float
0x000001ff   ldc       0x3a03126e                             # 0.0005
0x00000201   blt.f     0x0000020c                             # branch if less
0x00000203   ldloc     0x00000000                             # load this : AxisCompensation
0x00000205   ldfld     0x00000002                             # load field compGain : float
0x00000207   ldc       0x3a03126e                             # 0.0005
0x00000209   sub.r4                                           # float subtraction
0x0000020a   br        0x0000020e                             # branch unconditionally
0x0000020c   ldc       0x00000000                             # 0
0x0000020e   stfld     0x00000002                             # store field compGain : float
0x00000210   br        0x0000024d                             # branch unconditionally
0x00000212   ldloc     0x00000001                             # load 0th argument enable : bool
0x00000214   brfalse   0x00000236                             # branch if zero
0x00000216   ldloc     0x00000000                             # load this : AxisCompensation
0x00000218   ldloc     0x00000000                             # load this : AxisCompensation
0x0000021a   ldfld     0x00000002                             # load field compGain : float
0x0000021c   ldc       0x3a03126e                             # 0.0005
0x0000021e   add.r4                                           # float addition
0x0000021f   stfld     0x00000002                             # store field compGain : float
0x00000221   ldloc     0x00000000                             # load this : AxisCompensation
0x00000223   ldfld     0x00000002                             # load field compGain : float
0x00000225   ldc       0x3f800000                             # 1
0x00000227   blt.f     0x0000024d                             # branch if less
0x00000229   ldloc     0x00000000                             # load this : AxisCompensation
0x0000022b   ldc       0x3f800000                             # 1
0x0000022d   stfld     0x00000002                             # store field compGain : float
0x0000022f   ldloc     0x00000000                             # load this : AxisCompensation
0x00000231   ldc.2                                            # 2
0x00000232   stfld     0x00000000                             # store field state : AxisCompensation.State
0x00000234   br        0x0000024d                             # branch unconditionally
0x00000236   ldloc     0x00000000                             # load this : AxisCompensation
0x00000238   ldc.0                                            # 0
0x00000239   stfld     0x00000000                             # store field state : AxisCompensation.State
0x0000023b   br        0x0000024d                             # branch unconditionally
0x0000023d   ldloc     0x00000001                             # load 0th argument enable : bool
0x0000023f   brtrue    0x0000024d                             # branch if not zero
0x00000241   ldloc     0x00000000                             # load this : AxisCompensation
0x00000243   ldc.0                                            # 0
0x00000244   stfld     0x00000000                             # store field state : AxisCompensation.State
0x00000246   br        0x0000024d                             # branch unconditionally
0x00000248   ldloc     0x00000000                             # load this : AxisCompensation
0x0000024a   ldc.0                                            # 0
0x0000024b   stfld     0x00000000                             # store field state : AxisCompensation.State
0x0000024d   ldloc     0x00000000                             # load this : AxisCompensation
0x0000024f   ldfld     0x00000002                             # load field compGain : float
0x00000251   ret       0x00000001                             # return from routine

# Method AxisCompensation.GetCompensation2D
0x00000253   ldloc     0x00000000                             # load this : AxisCompensation
0x00000255   ldfld     0x00000001                             # load field tblIdx : int
0x00000257   stloc     0x00000014                             # store local variable local_17 : int
0x00000259   ldloc     0x00000014                             # load local variable local_17 : int
0x0000025b   ldc.1                                            # 1
0x0000025c   beq       0x00000265                             # branch if equal
0x0000025e   ldloc     0x00000014                             # load local variable local_17 : int
0x00000260   ldc.2                                            # 2
0x00000261   beq       0x0000027f                             # branch if equal
0x00000263   br        0x00000299                             # branch unconditionally
0x00000265   rld       0x0040052b                             # get Register.Application.Tables.Small1.Header.Dim1.StartValue : float
0x00000267   stloc     0x00000003                             # store local variable startValueX : float
0x00000269   rld       0x0040052c                             # get Register.Application.Tables.Small1.Header.Dim1.Distance : float
0x0000026b   stloc     0x00000004                             # store local variable distanceX : float
0x0000026d   rld       0x00400529                             # get Register.Application.Tables.Small1.Header.Dim1.Size : int
0x0000026f   stloc     0x00000005                             # store local variable tblSizeX : int
0x00000271   rld       0x0040052f                             # get Register.Application.Tables.Small1.Header.Dim2.StartValue : float
0x00000273   stloc     0x00000006                             # store local variable startValueY : float
0x00000275   rld       0x00400530                             # get Register.Application.Tables.Small1.Header.Dim2.Distance : float
0x00000277   stloc     0x00000007                             # store local variable distanceY : float
0x00000279   rld       0x0040052d                             # get Register.Application.Tables.Small1.Header.Dim2.Size : int
0x0000027b   stloc     0x00000008                             # store local variable tblSizeY : int
0x0000027d   br        0x0000029d                             # branch unconditionally
0x0000027f   rld       0x00400d2b                             # get Register.Application.Tables.Small2.Header.Dim1.StartValue : float
0x00000281   stloc     0x00000003                             # store local variable startValueX : float
0x00000283   rld       0x00400d2c                             # get Register.Application.Tables.Small2.Header.Dim1.Distance : float
0x00000285   stloc     0x00000004                             # store local variable distanceX : float
0x00000287   rld       0x00400d29                             # get Register.Application.Tables.Small2.Header.Dim1.Size : int
0x00000289   stloc     0x00000005                             # store local variable tblSizeX : int
0x0000028b   rld       0x00400d2f                             # get Register.Application.Tables.Small2.Header.Dim2.StartValue : float
0x0000028d   stloc     0x00000006                             # store local variable startValueY : float
0x0000028f   rld       0x00400d30                             # get Register.Application.Tables.Small2.Header.Dim2.Distance : float
0x00000291   stloc     0x00000007                             # store local variable distanceY : float
0x00000293   rld       0x00400d2d                             # get Register.Application.Tables.Small2.Header.Dim2.Size : int
0x00000295   stloc     0x00000008                             # store local variable tblSizeY : int
0x00000297   br        0x0000029d                             # branch unconditionally
0x00000299   ldc       0x00000000                             # 0
0x0000029b   ret       0x00000001                             # return from routine
0x0000029d   ldloc     0x00000004                             # load local variable distanceX : float
0x0000029f   ldc       0x00000000                             # 0
0x000002a1   ble.f     0x000002a9                             # branch if less than or equal
0x000002a3   ldloc     0x00000007                             # load local variable distanceY : float
0x000002a5   ldc       0x00000000                             # 0
0x000002a7   bgt.f     0x000002ad                             # branch if greater
0x000002a9   ldc       0x00000000                             # 0
0x000002ab   ret       0x00000001                             # return from routine
0x000002ad   ldloc     0x00000001                             # load 0th argument xEnc : float
0x000002af   ldloc     0x00000003                             # load local variable startValueX : float
0x000002b1   ldloc     0x00000004                             # load local variable distanceX : float
0x000002b3   ldloc     0x00000005                             # load local variable tblSizeX : int
0x000002b5   ldloca    0x00000009                             # load home of local variable idxX : int
0x000002b7   ldloca    0x0000000a                             # load home of local variable offsetX : float
0x000002b9   call      0x00000002   0x00000008   0x00000364   # call AxisCompensation.GetIndexAndOffset(System.Single, System.Single, System.Single, System.Int32, System.Int32, System.Single)
0x000002bd   ldloc     0x00000002                             # load 1th argument yEnc : float
0x000002bf   ldloc     0x00000006                             # load local variable startValueY : float
0x000002c1   ldloc     0x00000007                             # load local variable distanceY : float
0x000002c3   ldloc     0x00000008                             # load local variable tblSizeY : int
0x000002c5   ldloca    0x0000000b                             # load home of local variable idxY : int
0x000002c7   ldloca    0x0000000c                             # load home of local variable offsetY : float
0x000002c9   call      0x00000002   0x00000008   0x00000364   # call AxisCompensation.GetIndexAndOffset(System.Single, System.Single, System.Single, System.Int32, System.Int32, System.Single)
0x000002cd   ldloc     0x00000009                             # load local variable idxX : int
0x000002cf   ldloc     0x00000008                             # load local variable tblSizeY : int
0x000002d1   mul.i4                                           # integer multiplication
0x000002d2   ldloc     0x0000000b                             # load local variable idxY : int
0x000002d4   add.i4                                           # integer addition
0x000002d5   stloc     0x0000000d                             # store local variable idx : int
0x000002d7   ldloc     0x00000000                             # load this : AxisCompensation
0x000002d9   ldfld     0x00000001                             # load field tblIdx : int
0x000002db   stloc     0x00000015                             # store local variable local_18 : int
0x000002dd   ldloc     0x00000015                             # load local variable local_18 : int
0x000002df   ldc.1                                            # 1
0x000002e0   beq       0x000002e9                             # branch if equal
0x000002e2   ldloc     0x00000015                             # load local variable local_18 : int
0x000002e4   ldc.2                                            # 2
0x000002e5   beq       0x00000311                             # branch if equal
0x000002e7   br        0x00000339                             # branch unconditionally
0x000002e9   ldloc     0x0000000d                             # load local variable idx : int
0x000002eb   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x000002ee   stloc     0x0000000e                             # store local variable c00 : float
0x000002f0   ldloc     0x0000000d                             # load local variable idx : int
0x000002f2   ldc.1                                            # 1
0x000002f3   add.i4                                           # integer addition
0x000002f4   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x000002f7   stloc     0x0000000f                             # store local variable c01 : float
0x000002f9   ldloc     0x0000000d                             # load local variable idx : int
0x000002fb   ldloc     0x00000008                             # load local variable tblSizeY : int
0x000002fd   add.i4                                           # integer addition
0x000002fe   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x00000301   stloc     0x00000010                             # store local variable c10 : float
0x00000303   ldloc     0x0000000d                             # load local variable idx : int
0x00000305   ldloc     0x00000008                             # load local variable tblSizeY : int
0x00000307   add.i4                                           # integer addition
0x00000308   ldc.1                                            # 1
0x00000309   add.i4                                           # integer addition
0x0000030a   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x0000030d   stloc     0x00000011                             # store local variable c11 : float
0x0000030f   br        0x0000033d                             # branch unconditionally
0x00000311   ldloc     0x0000000d                             # load local variable idx : int
0x00000313   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x00000316   stloc     0x0000000e                             # store local variable c00 : float
0x00000318   ldloc     0x0000000d                             # load local variable idx : int
0x0000031a   ldc.1                                            # 1
0x0000031b   add.i4                                           # integer addition
0x0000031c   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x0000031f   stloc     0x0000000f                             # store local variable c01 : float
0x00000321   ldloc     0x0000000d                             # load local variable idx : int
0x00000323   ldloc     0x00000008                             # load local variable tblSizeY : int
0x00000325   add.i4                                           # integer addition
0x00000326   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x00000329   stloc     0x00000010                             # store local variable c10 : float
0x0000032b   ldloc     0x0000000d                             # load local variable idx : int
0x0000032d   ldloc     0x00000008                             # load local variable tblSizeY : int
0x0000032f   add.i4                                           # integer addition
0x00000330   ldc.1                                            # 1
0x00000331   add.i4                                           # integer addition
0x00000332   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x00000335   stloc     0x00000011                             # store local variable c11 : float
0x00000337   br        0x0000033d                             # branch unconditionally
0x00000339   ldc       0x00000000                             # 0
0x0000033b   ret       0x00000001                             # return from routine
0x0000033d   ldloc     0x0000000e                             # load local variable c00 : float
0x0000033f   ldloc     0x0000000a                             # load local variable offsetX : float
0x00000341   ldloc     0x00000010                             # load local variable c10 : float
0x00000343   ldloc     0x0000000e                             # load local variable c00 : float
0x00000345   sub.r4                                           # float subtraction
0x00000346   mul.r4                                           # float multiplication
0x00000347   add.r4                                           # float addition
0x00000348   stloc     0x00000012                             # store local variable x0 : float
0x0000034a   ldloc     0x0000000f                             # load local variable c01 : float
0x0000034c   ldloc     0x0000000a                             # load local variable offsetX : float
0x0000034e   ldloc     0x00000011                             # load local variable c11 : float
0x00000350   ldloc     0x0000000f                             # load local variable c01 : float
0x00000352   sub.r4                                           # float subtraction
0x00000353   mul.r4                                           # float multiplication
0x00000354   add.r4                                           # float addition
0x00000355   stloc     0x00000013                             # store local variable x1 : float
0x00000357   ldloc     0x00000012                             # load local variable x0 : float
0x00000359   ldloc     0x0000000c                             # load local variable offsetY : float
0x0000035b   ldloc     0x00000013                             # load local variable x1 : float
0x0000035d   ldloc     0x00000012                             # load local variable x0 : float
0x0000035f   sub.r4                                           # float subtraction
0x00000360   mul.r4                                           # float multiplication
0x00000361   add.r4                                           # float addition
0x00000362   ret       0x00000001                             # return from routine

# Method AxisCompensation.GetIndexAndOffset
0x00000364   ldloc     0x00000000                             # load 0th argument posAbs : float
0x00000366   ldloc     0x00000001                             # load 1th argument startValue : float
0x00000368   sub.r4                                           # float subtraction
0x00000369   stloc     0x00000006                             # store local variable posRel : float
0x0000036b   ldloc     0x00000006                             # load local variable posRel : float
0x0000036d   ldloc     0x00000002                             # load 2th argument distance : float
0x0000036f   div.r4                                           # float division
0x00000370   stloc     0x00000007                             # store local variable idxFloat : float
0x00000372   ldloc     0x00000004                             # load 4th argument index : int*
0x00000374   ldloc     0x00000007                             # load local variable idxFloat : float
0x00000376   floor                                            # floor
0x00000377   conv.r4.i4                                       # convert float to int
0x00000378   stind                                            # store value at address : int
0x00000379   ldloc     0x00000004                             # load 4th argument index : int*
0x0000037b   ldind                                            # load value at address : int
0x0000037c   ldc.0                                            # 0
0x0000037d   bge.i     0x0000038a                             # branch if greater
0x0000037f   ldloc     0x00000004                             # load 4th argument index : int*
0x00000381   ldc.0                                            # 0
0x00000382   stind                                            # store value at address : int
0x00000383   ldloc     0x00000005                             # load 5th argument offset : float*
0x00000385   ldc       0x00000000                             # 0
0x00000387   stind                                            # store value at address : float
0x00000388   ret       0x00000000                             # return from routine
0x0000038a   ldloc     0x00000004                             # load 4th argument index : int*
0x0000038c   ldind                                            # load value at address : int
0x0000038d   ldloc     0x00000003                             # load 3th argument tblSize : int
0x0000038f   ldc.1                                            # 1
0x00000390   sub.i4                                           # integer subtraction
0x00000391   blt.i     0x000003a1                             # branch if less
0x00000393   ldloc     0x00000004                             # load 4th argument index : int*
0x00000395   ldloc     0x00000003                             # load 3th argument tblSize : int
0x00000397   ldc.2                                            # 2
0x00000398   sub.i4                                           # integer subtraction
0x00000399   stind                                            # store value at address : int
0x0000039a   ldloc     0x00000005                             # load 5th argument offset : float*
0x0000039c   ldc       0x3f800000                             # 1
0x0000039e   stind                                            # store value at address : float
0x0000039f   ret       0x00000000                             # return from routine
0x000003a1   ldloc     0x00000005                             # load 5th argument offset : float*
0x000003a3   ldloc     0x00000007                             # load local variable idxFloat : float
0x000003a5   ldloc     0x00000004                             # load 4th argument index : int*
0x000003a7   ldind                                            # load value at address : int
0x000003a8   conv.i4.r4                                       # convert int to float
0x000003a9   sub.r4                                           # float subtraction
0x000003aa   stind                                            # store value at address : float
0x000003ab   ret       0x00000000                             # return from routine

# Method GantryEncoderAlignment.Run
0x000003ad   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x000003af   ldc.3                                            # 3
0x000003b0   bge.i     0x000003b5                             # branch if greater
0x000003b2   ldc.1                                            # 1
0x000003b3   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x000003b5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003b7   ldfld     0x0000000c                             # load field mainState : GantryEncoderAlignment.MainState
0x000003b9   stloc     0x00000002                             # store local variable local_0 : GantryEncoderAlignment.MainState
0x000003bb   ldloc     0x00000002                             # load local variable local_0 : GantryEncoderAlignment.MainState
0x000003bd   switch.   0x00000004                             # switch table
      (   0x000003c5   0x0000044b   0x0000047c   0x000004b5   )
0x000003c3   br        0x000004d2                             # branch unconditionally
0x000003c5   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x000003c7   ldc.3                                            # 3
0x000003c8   blt.i     0x000003d3                             # branch if less
0x000003ca   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x000003cc   ldc       0x00000014                             # 20
0x000003ce   beq       0x000003d3                             # branch if equal
0x000003d0   ldc.0                                            # 0
0x000003d1   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x000003d3   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x000003d5   ldc.1                                            # 1
0x000003d6   sub.i4                                           # integer subtraction
0x000003d7   switch.   0x00000004                             # switch table
      (   0x000003df   0x000003df   0x000003ec   0x00000427   )
0x000003dd   br        0x000004d2                             # branch unconditionally
0x000003df   ldc.0                                            # 0
0x000003e0   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x000003e2   ldc.1                                            # 1
0x000003e3   rst       0x0023ec00                             # set Register.Axes_0.Commands.Homing.Command : HomingCommand
0x000003e5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003e7   ldc.1                                            # 1
0x000003e8   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x000003ea   br        0x000004d2                             # branch unconditionally
0x000003ec   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x000003ee   ldc       0x00000014                             # 20
0x000003f0   bne       0x00000422                             # branch if not equal
0x000003f2   ldc.0                                            # 0
0x000003f3   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x000003f5   ldc       0x3dcccccd                             # 0.1
0x000003f7   stloc     0x00000003                             # store local variable limitDistance : float
0x000003f9   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003fb   rld       0x00201800                             # get Register.Axes_0.Parameters.PathPlanner.PositionMinimum : float
0x000003fd   ldloc     0x00000003                             # load local variable limitDistance : float
0x000003ff   add.r4                                           # float addition
0x00000400   stfld     0x00000006                             # store field scanStartPosition : float
0x00000402   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000404   rld       0x00201700                             # get Register.Axes_0.Parameters.PathPlanner.PositionMaximum : float
0x00000406   ldloc     0x00000003                             # load local variable limitDistance : float
0x00000408   sub.r4                                           # float subtraction
0x00000409   stfld     0x0000000d                             # store field scanEndPosition : float
0x0000040b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000040d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000040f   ldfld     0x0000000d                             # load field scanEndPosition : float
0x00000411   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000413   ldfld     0x00000006                             # load field scanStartPosition : float
0x00000415   sub.r4                                           # float subtraction
0x00000416   ldc       0x41f00000                             # 30
0x00000418   div.r4                                           # float division
0x00000419   stfld     0x00000002                             # store field scanVelocity : float
0x0000041b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000041d   ldc.2                                            # 2
0x0000041e   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x00000420   br        0x000004d2                             # branch unconditionally
0x00000422   ldc.0                                            # 0
0x00000423   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x00000425   br        0x000004d2                             # branch unconditionally
0x00000427   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x00000429   ldc       0x00000014                             # 20
0x0000042b   bne       0x00000446                             # branch if not equal
0x0000042d   ldc.7                                            # 7
0x0000042e   rlde      0x00000008   0x00238401                # get Register.Application.Parameters.Booleans[TOS] : bool
0x00000431   brfalse   0x00000446                             # branch if zero
0x00000433   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000435   rld       0x00400d2b                             # get Register.Application.Tables.Small2.Header.Dim1.StartValue : float
0x00000437   stfld     0x00000006                             # store field scanStartPosition : float
0x00000439   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000043b   rld       0x00400d2c                             # get Register.Application.Tables.Small2.Header.Dim1.Distance : float
0x0000043d   stfld     0x00000008                             # store field nodeSpacing : float
0x0000043f   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000441   ldc.3                                            # 3
0x00000442   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x00000444   br        0x000004d2                             # branch unconditionally
0x00000446   ldc.0                                            # 0
0x00000447   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x00000449   br        0x000004d2                             # branch unconditionally
0x0000044b   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x0000044d   ldc       0x00000014                             # 20
0x0000044f   bne       0x00000471                             # branch if not equal
0x00000451   ldc.r8    0x00000000   0x00000000                # 0
0x00000454   rst.2     0x002a7b01                             # set Register.Axes_1.Commands.PathPlanner.Xnew : double
0x00000456   ldc       0x0000000a                             # 10
0x00000458   rst       0x002a7800                             # set Register.Axes_1.Commands.PathPlanner.Command : PathPlannerCommand
0x0000045a   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x0000045c   ldc.1                                            # 1
0x0000045d   bne       0x00000462                             # branch if not equal
0x0000045f   ldc.3                                            # 3
0x00000460   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x00000462   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x00000464   ldc.2                                            # 2
0x00000465   bne       0x0000046a                             # branch if not equal
0x00000467   ldc.4                                            # 4
0x00000468   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x0000046a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000046c   ldc.0                                            # 0
0x0000046d   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x0000046f   br        0x000004d2                             # branch unconditionally
0x00000471   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x00000473   brtrue    0x000004d2                             # branch if not zero
0x00000475   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000477   ldc.0                                            # 0
0x00000478   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x0000047a   br        0x000004d2                             # branch unconditionally
0x0000047c   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000047e   call      0x00000003   0x00000004   0x000004d6   # call GantryEncoderAlignment.Scan()
0x00000482   brfalse   0x000004d2                             # branch if zero
0x00000484   ldc.7                                            # 7
0x00000485   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000487   ldfld     0x00000001                             # load field scanSucceeded : bool
0x00000489   rste      0x00000008   0x00238401                # set Register.Application.Parameters.Booleans[TOS] : bool
0x0000048c   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000048e   ldfld     0x00000001                             # load field scanSucceeded : bool
0x00000490   brfalse   0x000004ab                             # branch if zero
0x00000492   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000494   ldfld     0x00000006                             # load field scanStartPosition : float
0x00000496   rst       0x00400d2b                             # set Register.Application.Tables.Small2.Header.Dim1.StartValue : float
0x00000498   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000049a   ldfld     0x00000008                             # load field nodeSpacing : float
0x0000049c   rst       0x00400d2c                             # set Register.Application.Tables.Small2.Header.Dim1.Distance : float
0x0000049e   ldc       0x00002710                             # 10000
0x000004a0   rst       0x00400d29                             # set Register.Application.Tables.Small2.Header.Dim1.Size : int
0x000004a2   ldc.1                                            # 1
0x000004a3   rst       0x00400d25                             # set Register.Application.Tables.Small2.Header.RowSize : int
0x000004a5   ldc.1                                            # 1
0x000004a6   rst       0x00400d01                             # set Register.Application.Tables.Small2.Header.Persistent : bool
0x000004a8   ldc.1                                            # 1
0x000004a9   rst       0x00400b00                             # set Register.Application.Tables.Small2.Command : TableCommand
0x000004ab   ldc.4                                            # 4
0x000004ac   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x000004ae   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004b0   ldc.0                                            # 0
0x000004b1   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x000004b3   br        0x000004d2                             # branch unconditionally
0x000004b5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004b7   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x000004b9   ldc.4                                            # 4
0x000004ba   bne       0x000004c3                             # branch if not equal
0x000004bc   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x000004be   ldc       0x00000014                             # 20
0x000004c0   ceq                                              # compare if equal
0x000004c1   br        0x000004c4                             # branch unconditionally
0x000004c3   ldc.0                                            # 0
0x000004c4   call      0x00000002   0x00000004   0x000006eb   # call GantryEncoderAlignment.Apply(System.Boolean)
0x000004c8   brfalse   0x000004d2                             # branch if zero
0x000004ca   ldc.0                                            # 0
0x000004cb   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x000004cd   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004cf   ldc.0                                            # 0
0x000004d0   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x000004d2   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x000004d4   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.Scan
0x000004d6   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x000004d8   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004da   ldfld     0x00000006                             # load field scanStartPosition : float
0x000004dc   sub.r4                                           # float subtraction
0x000004dd   stloc     0x00000001                             # store local variable scanPosition : float
0x000004df   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004e1   ldfld     0x00000005                             # load field scanState : GantryEncoderAlignment.ScanState
0x000004e3   stloc     0x00000002                             # store local variable local_1 : GantryEncoderAlignment.ScanState
0x000004e5   ldloc     0x00000002                             # load local variable local_1 : GantryEncoderAlignment.ScanState
0x000004e7   switch.   0x00000005                             # switch table
      (   0x000004f0   0x00000531   0x0000055e   0x00000608   0x000006a9   )
0x000004ee   br        0x000006b2                             # branch unconditionally
0x000004f0   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004f2   ldc.0                                            # 0
0x000004f3   stfld     0x00000001                             # store field scanSucceeded : bool
0x000004f5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004f7   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x000004f9   stfld     0x0000000e                             # store field initialPosition : float
0x000004fb   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004fd   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004ff   ldfld     0x0000000d                             # load field scanEndPosition : float
0x00000501   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000503   ldfld     0x00000006                             # load field scanStartPosition : float
0x00000505   sub.r4                                           # float subtraction
0x00000506   ldc       0x461c3c00                             # 9999
0x00000508   div.r4                                           # float division
0x00000509   stfld     0x00000008                             # store field nodeSpacing : float
0x0000050b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000050d   ldfld     0x00000006                             # load field scanStartPosition : float
0x0000050f   conv.r4.r8                                       # convert float to double
0x00000510   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x00000512   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000514   ldfld     0x00000002                             # load field scanVelocity : float
0x00000516   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x00000518   ldc       0x00000042                             # 66
0x0000051a   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x0000051c   ldc       0x00000000                             # 0
0x0000051e   rst       0x00228e00                             # set Register.Axes_0.Commands.CurrentController.InjectedIq : float
0x00000520   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000522   rld.2     0x002ab901                             # get Register.Axes_1.Signals.PositionController.Encoders_0.Position : double
0x00000524   rld.2     0x0022b901                             # get Register.Axes_0.Signals.PositionController.Encoders_0.Position : double
0x00000526   sub.r8                                           # double subtraction
0x00000527   conv.r8.r4                                       # convert double to float
0x00000528   stfld     0x0000000b                             # store field initialOffset : float
0x0000052a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000052c   ldc.1                                            # 1
0x0000052d   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x0000052f   br        0x000006b2                             # branch unconditionally
0x00000531   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x00000533   brfalse   0x000006b2                             # branch if zero
0x00000535   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000537   ldfld     0x0000000d                             # load field scanEndPosition : float
0x00000539   conv.r4.r8                                       # convert float to double
0x0000053a   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x0000053c   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000053e   ldfld     0x00000002                             # load field scanVelocity : float
0x00000540   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x00000542   ldc       0x00000042                             # 66
0x00000544   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x00000546   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000548   ldc.0                                            # 0
0x00000549   stfld     0x0000000f                             # store field scanIdx : int
0x0000054b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000054d   ldc       0x00000000                             # 0
0x0000054f   stfld     0x00000000                             # store field curSum : float
0x00000551   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000553   ldc       0x00000000                             # 0
0x00000555   stfld     0x0000000a                             # store field cntSum : float
0x00000557   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000559   ldc.2                                            # 2
0x0000055a   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x0000055c   br        0x000006b2                             # branch unconditionally
0x0000055e   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000560   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000562   ldfld     0x00000000                             # load field curSum : float
0x00000564   rld.2     0x002ab901                             # get Register.Axes_1.Signals.PositionController.Encoders_0.Position : double
0x00000566   rld.2     0x0022b901                             # get Register.Axes_0.Signals.PositionController.Encoders_0.Position : double
0x00000568   sub.r8                                           # double subtraction
0x00000569   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000056b   ldfld     0x0000000b                             # load field initialOffset : float
0x0000056d   conv.r4.r8                                       # convert float to double
0x0000056e   sub.r8                                           # double subtraction
0x0000056f   conv.r8.r4                                       # convert double to float
0x00000570   add.r4                                           # float addition
0x00000571   stfld     0x00000000                             # store field curSum : float
0x00000573   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000575   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000577   ldfld     0x0000000a                             # load field cntSum : float
0x00000579   ldc       0x3f800000                             # 1
0x0000057b   add.r4                                           # float addition
0x0000057c   stfld     0x0000000a                             # store field cntSum : float
0x0000057e   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000580   ldfld     0x0000000f                             # load field scanIdx : int
0x00000582   conv.i4.r4                                       # convert int to float
0x00000583   ldc       0x3f000000                             # 0.5
0x00000585   add.r4                                           # float addition
0x00000586   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000588   ldfld     0x00000008                             # load field nodeSpacing : float
0x0000058a   mul.r4                                           # float multiplication
0x0000058b   ldloc     0x00000001                             # load local variable scanPosition : float
0x0000058d   ble.f     0x00000593                             # branch if less than or equal
0x0000058f   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x00000591   brfalse   0x000006b2                             # branch if zero
0x00000593   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000595   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000597   ldfld     0x0000000f                             # load field scanIdx : int
0x00000599   ldc       0x3e800000                             # 0.25
0x0000059b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000059d   ldfld     0x00000000                             # load field curSum : float
0x0000059f   mul.r4                                           # float multiplication
0x000005a0   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005a2   ldfld     0x0000000a                             # load field cntSum : float
0x000005a4   div.r4                                           # float division
0x000005a5   ldc.0                                            # 0
0x000005a6   call      0x00000000   0x00000004   0x000006ba   # call GantryEncoderAlignment.SetCompAtNode(System.Int32, System.Single, System.Boolean)
0x000005aa   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005ac   ldc       0x00000000                             # 0
0x000005ae   stfld     0x00000000                             # store field curSum : float
0x000005b0   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005b2   ldc       0x00000000                             # 0
0x000005b4   stfld     0x0000000a                             # store field cntSum : float
0x000005b6   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005b8   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005ba   ldfld     0x0000000f                             # load field scanIdx : int
0x000005bc   ldc.1                                            # 1
0x000005bd   add.i4                                           # integer addition
0x000005be   stloc     0x00000003                             # store local variable local_2 : int
0x000005c0   ldloc     0x00000003                             # load local variable local_2 : int
0x000005c2   stfld     0x0000000f                             # store field scanIdx : int
0x000005c4   ldloc     0x00000003                             # load local variable local_2 : int
0x000005c6   ldc       0x00002710                             # 10000
0x000005c8   blt.i     0x000005f8                             # branch if less
0x000005ca   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000005cc   brfalse   0x000005f8                             # branch if zero
0x000005ce   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005d0   ldc       0x0000270f                             # 9999
0x000005d2   stfld     0x0000000f                             # store field scanIdx : int
0x000005d4   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005d6   ldfld     0x00000006                             # load field scanStartPosition : float
0x000005d8   conv.r4.r8                                       # convert float to double
0x000005d9   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x000005db   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005dd   ldfld     0x00000002                             # load field scanVelocity : float
0x000005df   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x000005e1   ldc       0x00000042                             # 66
0x000005e3   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x000005e5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005e7   ldc       0x00000000                             # 0
0x000005e9   stfld     0x00000000                             # store field curSum : float
0x000005eb   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005ed   ldc       0x00000000                             # 0
0x000005ef   stfld     0x0000000a                             # store field cntSum : float
0x000005f1   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005f3   ldc.3                                            # 3
0x000005f4   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x000005f6   br        0x000006b2                             # branch unconditionally
0x000005f8   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000005fa   brfalse   0x000006b2                             # branch if zero
0x000005fc   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005fe   ldc.0                                            # 0
0x000005ff   stfld     0x00000001                             # store field scanSucceeded : bool
0x00000601   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000603   ldc.0                                            # 0
0x00000604   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x00000606   br        0x000006b2                             # branch unconditionally
0x00000608   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000060a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000060c   ldfld     0x00000000                             # load field curSum : float
0x0000060e   rld.2     0x002ab901                             # get Register.Axes_1.Signals.PositionController.Encoders_0.Position : double
0x00000610   rld.2     0x0022b901                             # get Register.Axes_0.Signals.PositionController.Encoders_0.Position : double
0x00000612   sub.r8                                           # double subtraction
0x00000613   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000615   ldfld     0x0000000b                             # load field initialOffset : float
0x00000617   conv.r4.r8                                       # convert float to double
0x00000618   sub.r8                                           # double subtraction
0x00000619   conv.r8.r4                                       # convert double to float
0x0000061a   add.r4                                           # float addition
0x0000061b   stfld     0x00000000                             # store field curSum : float
0x0000061d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000061f   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000621   ldfld     0x0000000a                             # load field cntSum : float
0x00000623   ldc       0x3f800000                             # 1
0x00000625   add.r4                                           # float addition
0x00000626   stfld     0x0000000a                             # store field cntSum : float
0x00000628   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000062a   ldfld     0x0000000f                             # load field scanIdx : int
0x0000062c   conv.i4.r4                                       # convert int to float
0x0000062d   ldc       0x3f000000                             # 0.5
0x0000062f   sub.r4                                           # float subtraction
0x00000630   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000632   ldfld     0x00000008                             # load field nodeSpacing : float
0x00000634   mul.r4                                           # float multiplication
0x00000635   ldloc     0x00000001                             # load local variable scanPosition : float
0x00000637   bge.f     0x0000063d                             # branch if greater
0x00000639   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x0000063b   brfalse   0x000006b2                             # branch if zero
0x0000063d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000063f   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000641   ldfld     0x0000000f                             # load field scanIdx : int
0x00000643   ldc       0x3e800000                             # 0.25
0x00000645   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000647   ldfld     0x00000000                             # load field curSum : float
0x00000649   mul.r4                                           # float multiplication
0x0000064a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000064c   ldfld     0x0000000a                             # load field cntSum : float
0x0000064e   div.r4                                           # float division
0x0000064f   ldc.1                                            # 1
0x00000650   call      0x00000000   0x00000004   0x000006ba   # call GantryEncoderAlignment.SetCompAtNode(System.Int32, System.Single, System.Boolean)
0x00000654   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000656   ldc       0x00000000                             # 0
0x00000658   stfld     0x00000000                             # store field curSum : float
0x0000065a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000065c   ldc       0x00000000                             # 0
0x0000065e   stfld     0x0000000a                             # store field cntSum : float
0x00000660   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000662   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000664   ldfld     0x0000000f                             # load field scanIdx : int
0x00000666   ldc.1                                            # 1
0x00000667   sub.i4                                           # integer subtraction
0x00000668   stloc     0x00000003                             # store local variable local_2 : int
0x0000066a   ldloc     0x00000003                             # load local variable local_2 : int
0x0000066c   stfld     0x0000000f                             # store field scanIdx : int
0x0000066e   ldloc     0x00000003                             # load local variable local_2 : int
0x00000670   ldc.0                                            # 0
0x00000671   bge.i     0x00000699                             # branch if greater
0x00000673   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x00000675   brfalse   0x00000699                             # branch if zero
0x00000677   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000679   ldc.0                                            # 0
0x0000067a   stfld     0x0000000f                             # store field scanIdx : int
0x0000067c   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000067e   ldfld     0x0000000e                             # load field initialPosition : float
0x00000680   conv.r4.r8                                       # convert float to double
0x00000681   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x00000683   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000685   ldfld     0x00000002                             # load field scanVelocity : float
0x00000687   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x00000689   ldc       0x00000042                             # 66
0x0000068b   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x0000068d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000068f   ldc.1                                            # 1
0x00000690   stfld     0x00000001                             # store field scanSucceeded : bool
0x00000692   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000694   ldc.4                                            # 4
0x00000695   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x00000697   br        0x000006b2                             # branch unconditionally
0x00000699   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x0000069b   brfalse   0x000006b2                             # branch if zero
0x0000069d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000069f   ldc.0                                            # 0
0x000006a0   stfld     0x00000001                             # store field scanSucceeded : bool
0x000006a2   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000006a4   ldc.0                                            # 0
0x000006a5   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x000006a7   br        0x000006b2                             # branch unconditionally
0x000006a9   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000006ab   brfalse   0x000006b2                             # branch if zero
0x000006ad   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000006af   ldc.0                                            # 0
0x000006b0   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x000006b2   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000006b4   ldfld     0x00000005                             # load field scanState : GantryEncoderAlignment.ScanState
0x000006b6   ldc.0                                            # 0
0x000006b7   ceq                                              # compare if equal
0x000006b8   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.SetCompAtNode
0x000006ba   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000006bc   ldc.0                                            # 0
0x000006bd   blt.i     0x000006c3                             # branch if less
0x000006bf   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000006c1   br        0x000006c4                             # branch unconditionally
0x000006c3   ldc.0                                            # 0
0x000006c4   stloc     0x00000001                             # store 0th argument nodeIdx : int
0x000006c6   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000006c8   ldc       0x00002710                             # 10000
0x000006ca   bge.i     0x000006d0                             # branch if greater
0x000006cc   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000006ce   br        0x000006d2                             # branch unconditionally
0x000006d0   ldc       0x0000270f                             # 9999
0x000006d2   stloc     0x00000001                             # store 0th argument nodeIdx : int
0x000006d4   ldloc     0x00000003                             # load 2th argument cumulate : bool
0x000006d6   brfalse   0x000006e2                             # branch if zero
0x000006d8   ldloc     0x00000002                             # load 1th argument comp : float
0x000006da   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000006dc   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x000006df   add.r4                                           # float addition
0x000006e0   stloc     0x00000002                             # store 1th argument comp : float
0x000006e2   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000006e4   ldloc     0x00000002                             # load 1th argument comp : float
0x000006e6   rste      0x000003e8   0x00400801                # set Register.Application.Tables.Small2.Data.Float[TOS] : float
0x000006e9   ret       0x00000000                             # return from routine

# Method GantryEncoderAlignment.Apply
0x000006eb   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000006ed   ldfld     0x00000007                             # load field applyState : GantryEncoderAlignment.ApplyState
0x000006ef   stloc     0x00000003                             # store local variable local_1 : GantryEncoderAlignment.ApplyState
0x000006f1   ldloc     0x00000003                             # load local variable local_1 : GantryEncoderAlignment.ApplyState
0x000006f3   switch.   0x00000003                             # switch table
      (   0x000006fa   0x0000071c   0x0000074d   )
0x000006f8   br        0x00000758                             # branch unconditionally
0x000006fa   ldloc     0x00000001                             # load 0th argument run : bool
0x000006fc   brfalse   0x00000703                             # branch if zero
0x000006fe   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000700   ldc.1                                            # 1
0x00000701   stfld     0x00000007                             # store field applyState : GantryEncoderAlignment.ApplyState
0x00000703   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000705   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000707   ldfld     0x00000010                             # load field compGain : float
0x00000709   ldc       0x3a83126e                             # 0.0009999999
0x0000070b   blt.f     0x00000716                             # branch if less
0x0000070d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000070f   ldfld     0x00000010                             # load field compGain : float
0x00000711   ldc       0x3a83126e                             # 0.0009999999
0x00000713   sub.r4                                           # float subtraction
0x00000714   br        0x00000718                             # branch unconditionally
0x00000716   ldc       0x00000000                             # 0
0x00000718   stfld     0x00000010                             # store field compGain : float
0x0000071a   br        0x00000760                             # branch unconditionally
0x0000071c   ldloc     0x00000001                             # load 0th argument run : bool
0x0000071e   brfalse   0x00000743                             # branch if zero
0x00000720   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000722   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000724   ldfld     0x00000010                             # load field compGain : float
0x00000726   ldc       0x3a83126e                             # 0.0009999999
0x00000728   add.r4                                           # float addition
0x00000729   stfld     0x00000010                             # store field compGain : float
0x0000072b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000072d   ldfld     0x00000010                             # load field compGain : float
0x0000072f   ldc       0x3f800000                             # 1
0x00000731   blt.f     0x00000760                             # branch if less
0x00000733   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000735   ldc       0x3f800000                             # 1
0x00000737   stfld     0x00000010                             # store field compGain : float
0x00000739   ldc.1                                            # 1
0x0000073a   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x0000073c   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000073e   ldc.2                                            # 2
0x0000073f   stfld     0x00000007                             # store field applyState : GantryEncoderAlignment.ApplyState
0x00000741   br        0x00000760                             # branch unconditionally
0x00000743   ldc.0                                            # 0
0x00000744   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x00000746   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000748   ldc.0                                            # 0
0x00000749   stfld     0x00000007                             # store field applyState : GantryEncoderAlignment.ApplyState
0x0000074b   br        0x00000760                             # branch unconditionally
0x0000074d   ldloc     0x00000001                             # load 0th argument run : bool
0x0000074f   brtrue    0x00000760                             # branch if not zero
0x00000751   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000753   ldc.0                                            # 0
0x00000754   stfld     0x00000007                             # store field applyState : GantryEncoderAlignment.ApplyState
0x00000756   br        0x00000760                             # branch unconditionally
0x00000758   ldc.0                                            # 0
0x00000759   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x0000075b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000075d   ldc.0                                            # 0
0x0000075e   stfld     0x00000007                             # store field applyState : GantryEncoderAlignment.ApplyState
0x00000760   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x00000762   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000764   ldfld     0x00000006                             # load field scanStartPosition : float
0x00000766   sub.r4                                           # float subtraction
0x00000767   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000769   ldfld     0x00000008                             # load field nodeSpacing : float
0x0000076b   ldc       0x461c3c00                             # 9999
0x0000076d   mul.r4                                           # float multiplication
0x0000076e   div.r4                                           # float division
0x0000076f   stloc     0x00000002                             # store local variable xNorm : float
0x00000771   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000773   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000775   ldloc     0x00000002                             # load local variable xNorm : float
0x00000777   call      0x00000004   0x00000006   0x00000796   # call GantryEncoderAlignment.GetComp(System.Single)
0x0000077b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000077d   ldfld     0x00000010                             # load field compGain : float
0x0000077f   mul.r4                                           # float multiplication
0x00000780   stfld     0x00000009                             # store field alignmentCorrection : float
0x00000782   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000784   ldfld     0x00000007                             # load field applyState : GantryEncoderAlignment.ApplyState
0x00000786   brtrue    0x00000793                             # branch if not zero
0x00000788   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000078a   ldfld     0x00000010                             # load field compGain : float
0x0000078c   ldc       0x00000000                             # 0
0x0000078e   cgt.f                                            # compare if greater
0x0000078f   ldc.0                                            # 0
0x00000790   ceq                                              # compare if equal
0x00000791   ret       0x00000001                             # return from routine
0x00000793   ldc.0                                            # 0
0x00000794   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.GetComp
0x00000796   ldloc     0x00000001                             # load 0th argument xNorm : float
0x00000798   ldc       0x461c4000                             # 10000
0x0000079a   mul.r4                                           # float multiplication
0x0000079b   stloc     0x00000002                             # store local variable nx : float
0x0000079d   ldloc     0x00000002                             # load local variable nx : float
0x0000079f   floor                                            # floor
0x000007a0   conv.r4.i4                                       # convert float to int
0x000007a1   stloc     0x00000003                             # store local variable n : int
0x000007a3   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000007a5   ldloc     0x00000003                             # load local variable n : int
0x000007a7   call      0x00000000   0x00000002   0x000007ca   # call GantryEncoderAlignment.GetCompAtNode(System.Int32)
0x000007ab   stloc     0x00000004                             # store local variable cn : float
0x000007ad   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000007af   ldloc     0x00000003                             # load local variable n : int
0x000007b1   ldc.1                                            # 1
0x000007b2   add.i4                                           # integer addition
0x000007b3   call      0x00000000   0x00000002   0x000007ca   # call GantryEncoderAlignment.GetCompAtNode(System.Int32)
0x000007b7   ldloc     0x00000004                             # load local variable cn : float
0x000007b9   sub.r4                                           # float subtraction
0x000007ba   stloc     0x00000005                             # store local variable dcn : float
0x000007bc   ldloc     0x00000004                             # load local variable cn : float
0x000007be   ldloc     0x00000002                             # load local variable nx : float
0x000007c0   ldloc     0x00000003                             # load local variable n : int
0x000007c2   conv.i4.r4                                       # convert int to float
0x000007c3   sub.r4                                           # float subtraction
0x000007c4   ldloc     0x00000005                             # load local variable dcn : float
0x000007c6   mul.r4                                           # float multiplication
0x000007c7   add.r4                                           # float addition
0x000007c8   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.GetCompAtNode
0x000007ca   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000007cc   ldc.0                                            # 0
0x000007cd   blt.i     0x000007d3                             # branch if less
0x000007cf   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000007d1   br        0x000007d4                             # branch unconditionally
0x000007d3   ldc.0                                            # 0
0x000007d4   stloc     0x00000001                             # store 0th argument nodeIdx : int
0x000007d6   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000007d8   ldc       0x00002710                             # 10000
0x000007da   bge.i     0x000007e0                             # branch if greater
0x000007dc   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000007de   br        0x000007e2                             # branch unconditionally
0x000007e0   ldc       0x0000270f                             # 9999
0x000007e2   stloc     0x00000001                             # store 0th argument nodeIdx : int
0x000007e4   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000007e6   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x000007e9   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.GetCorrection
0x000007eb   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000007ed   ldfld     0x0000000c                             # load field mainState : GantryEncoderAlignment.MainState
0x000007ef   ldc.3                                            # 3
0x000007f0   beq       0x000007f8                             # branch if equal
0x000007f2   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000007f4   ldc       0x00000000                             # 0
0x000007f6   stfld     0x00000009                             # store field alignmentCorrection : float
0x000007f8   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000007fa   ldfld     0x00000009                             # load field alignmentCorrection : float
0x000007fc   ret       0x00000001                             # return from routine
