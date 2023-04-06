# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: XGantry, C:\Skyverse_Dragon\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 11.01.2023 15:01:00
# Target register layout (RLID): 0x00000013
# Space for static fields: 0x00000004
# Maximal stack size: 0x0000003b
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
0x0000009b   ldc       0x0000000a                             # 10
0x0000009d   rlde      0x00000008   0x00238801                # get Register.Application.Variables.Booleans[TOS] : bool
0x000000a0   brtrue    0x000000b0                             # branch if not zero
0x000000a2   ldc       0x0000000b                             # 11
0x000000a4   rlde      0x00000008   0x00238801                # get Register.Application.Variables.Booleans[TOS] : bool
0x000000a7   brtrue    0x000000b0                             # branch if not zero
0x000000a9   ldc       0x0000000c                             # 12
0x000000ab   rlde      0x00000008   0x00238801                # get Register.Application.Variables.Booleans[TOS] : bool
0x000000ae   br        0x000000b1                             # branch unconditionally
0x000000b0   ldc.1                                            # 1
0x000000b1   rst       0x00214000                             # set Register.General.Commands.ExternalError : bool
0x000000b3   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x000000b5   ldc.0                                            # 0
0x000000b6   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x000000b9   ldc.1                                            # 1
0x000000ba   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x000000bd   call      0x00000000   0x00000003   0x00000065   # call MoveTime.Set(System.Single, System.Single)
0x000000c1   ldabs     0x00000001                             # load static field settlingTimeA1 : MoveTime
0x000000c3   ldc.2                                            # 2
0x000000c4   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x000000c7   ldc.3                                            # 3
0x000000c8   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x000000cb   call      0x00000000   0x00000003   0x00000065   # call MoveTime.Set(System.Single, System.Single)
0x000000cf   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x000000d1   rld       0x0022df00                             # get Register.Axes_0.Signals.PositionController.Controllers_0.PositionError : float
0x000000d3   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000000d5   ldc.0                                            # 0
0x000000d6   ceq                                              # compare if equal
0x000000d7   call      0x00000000   0x00000003   0x0000015c   # call MoveTime.Run(System.Single, System.Boolean)
0x000000db   ldabs     0x00000001                             # load static field settlingTimeA1 : MoveTime
0x000000dd   rld       0x002adf00                             # get Register.Axes_1.Signals.PositionController.Controllers_0.PositionError : float
0x000000df   rld       0x002ab300                             # get Register.Axes_1.Signals.PathPlanner.Done : bool
0x000000e1   ldc.0                                            # 0
0x000000e2   ceq                                              # compare if equal
0x000000e3   call      0x00000000   0x00000003   0x0000015c   # call MoveTime.Run(System.Single, System.Boolean)
0x000000e7   ldc.0                                            # 0
0x000000e8   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x000000ea   call      0x00000000   0x00000001   0x000001ce   # call MoveTime.GetMoveTime()
0x000000ee   rste      0x00000020   0x00238601                # set Register.Application.Variables.Floats[TOS] : float
0x000000f1   ldc.0                                            # 0
0x000000f2   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x000000f4   call      0x00000000   0x00000001   0x000001c0   # call MoveTime.IsSettled.get()
0x000000f8   rste      0x00000008   0x00238801                # set Register.Application.Variables.Booleans[TOS] : bool
0x000000fb   ldc.1                                            # 1
0x000000fc   ldabs     0x00000001                             # load static field settlingTimeA1 : MoveTime
0x000000fe   call      0x00000000   0x00000001   0x000001ce   # call MoveTime.GetMoveTime()
0x00000102   rste      0x00000020   0x00238601                # set Register.Application.Variables.Floats[TOS] : float
0x00000105   ldc.1                                            # 1
0x00000106   ldabs     0x00000001                             # load static field settlingTimeA1 : MoveTime
0x00000108   call      0x00000000   0x00000001   0x000001c0   # call MoveTime.IsSettled.get()
0x0000010c   rste      0x00000008   0x00238801                # set Register.Application.Variables.Booleans[TOS] : bool
0x0000010f   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x00000111   stloc     0x00000000                             # store local variable xEnc : float
0x00000113   rld.2     0x002a7e01                             # get Register.Axes_1.Commands.PathPlanner.StreamX : double
0x00000115   conv.r8.r4                                       # convert double to float
0x00000116   stloc     0x00000001                             # store local variable yEnc : float
0x00000118   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x0000011a   ldc       0x00000014                             # 20
0x0000011c   bne       0x00000126                             # branch if not equal
0x0000011e   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x00000120   ldc.3                                            # 3
0x00000121   clt.i                                            # compare if less
0x00000122   ldc.0                                            # 0
0x00000123   ceq                                              # compare if equal
0x00000124   br        0x00000127                             # branch unconditionally
0x00000126   ldc.0                                            # 0
0x00000127   stloc     0x00000002                             # store local variable enable : bool
0x00000129   ldabs     0x00000002                             # load static field axis0Compensation : AxisCompensation
0x0000012b   ldloc     0x00000002                             # load local variable enable : bool
0x0000012d   ldloc     0x00000000                             # load local variable xEnc : float
0x0000012f   ldloc     0x00000001                             # load local variable yEnc : float
0x00000131   call      0x00000001   0x00000005   0x000001d8   # call AxisCompensation.Run2D(System.Boolean, System.Single, System.Single)
0x00000135   stloc     0x00000003                             # store local variable axisCompensationValue : float
0x00000137   rld       0x00237d00                             # get Register.Application.TamaControl.IsochronousMainCommand : int
0x00000139   stloc     0x00000004                             # store local variable command : GantryEncoderAlignment.Command
0x0000013b   ldabs     0x00000003                             # load static field encoderAlignment : GantryEncoderAlignment
0x0000013d   ldloc     0x00000004                             # load local variable command : GantryEncoderAlignment.Command
0x0000013f   call      0x00000002   0x00000004   0x000003c5   # call GantryEncoderAlignment.Run(GantryEncoderAlignment.Command)
0x00000143   rst       0x00237d00                             # set Register.Application.TamaControl.IsochronousMainCommand : int
0x00000145   ldabs     0x00000003                             # load static field encoderAlignment : GantryEncoderAlignment
0x00000147   call      0x00000000   0x00000001   0x00000803   # call GantryEncoderAlignment.GetCorrection()
0x0000014b   stloc     0x00000005                             # store local variable alignmentCorrectionValue : float
0x0000014d   ldloc     0x00000003                             # load local variable axisCompensationValue : float
0x0000014f   ldloc     0x00000005                             # load local variable alignmentCorrectionValue : float
0x00000151   add.r4                                           # float addition
0x00000152   rst       0x00208200                             # set Register.Axes_0.Commands.PositionController.Encoders_0.InjectedPosition : float
0x00000154   ldloc     0x00000003                             # load local variable axisCompensationValue : float
0x00000156   ldloc     0x00000005                             # load local variable alignmentCorrectionValue : float
0x00000158   sub.r4                                           # float subtraction
0x00000159   rst       0x00288200                             # set Register.Axes_1.Commands.PositionController.Encoders_0.InjectedPosition : float
0x0000015b   halt                                             # return from Tama task routine

# Method MoveTime.Run
0x0000015c   ldloc     0x00000000                             # load this : MoveTime
0x0000015e   call      0x00000000   0x00000001   0x000001c0   # call MoveTime.IsSettled.get()
0x00000162   ldloc     0x00000002                             # load 1th argument isMoving : bool
0x00000164   and                                              # integer bitwise AND
0x00000165   brfalse   0x00000173                             # branch if zero
0x00000167   ldloc     0x00000000                             # load this : MoveTime
0x00000169   ldc.0                                            # 0
0x0000016a   call      0x00000000   0x00000002   0x000001c6   # call MoveTime.IsSettled.set(System.Boolean)
0x0000016e   ldloc     0x00000000                             # load this : MoveTime
0x00000170   ldc.0                                            # 0
0x00000171   stfld     0x00000003                             # store field moveTimer : int
0x00000173   ldloc     0x00000000                             # load this : MoveTime
0x00000175   call      0x00000000   0x00000001   0x000001c0   # call MoveTime.IsSettled.get()
0x00000179   brtrue    0x000001be                             # branch if not zero
0x0000017b   ldloc     0x00000000                             # load this : MoveTime
0x0000017d   ldloc     0x00000000                             # load this : MoveTime
0x0000017f   ldfld     0x00000003                             # load field moveTimer : int
0x00000181   ldc.1                                            # 1
0x00000182   add.i4                                           # integer addition
0x00000183   stfld     0x00000003                             # store field moveTimer : int
0x00000185   ldloc     0x00000001                             # load 0th argument positionError : float
0x00000187   ldloc     0x00000000                             # load this : MoveTime
0x00000189   ldfld     0x00000002                             # load field settlingWindow : float
0x0000018b   bge.f     0x000001b9                             # branch if greater or equal
0x0000018d   ldloc     0x00000001                             # load 0th argument positionError : float
0x0000018f   ldloc     0x00000000                             # load this : MoveTime
0x00000191   ldfld     0x00000002                             # load field settlingWindow : float
0x00000193   neg.r4                                           # float negation
0x00000194   ble.f     0x000001b9                             # branch if less than or equal
0x00000196   ldloc     0x00000000                             # load this : MoveTime
0x00000198   ldloc     0x00000000                             # load this : MoveTime
0x0000019a   ldfld     0x00000004                             # load field settlingTimer : int
0x0000019c   ldc.1                                            # 1
0x0000019d   add.i4                                           # integer addition
0x0000019e   stfld     0x00000004                             # store field settlingTimer : int
0x000001a0   ldloc     0x00000000                             # load this : MoveTime
0x000001a2   ldloc     0x00000000                             # load this : MoveTime
0x000001a4   ldfld     0x00000004                             # load field settlingTimer : int
0x000001a6   ldloc     0x00000000                             # load this : MoveTime
0x000001a8   ldfld     0x00000000                             # load field minSettleDuration : int
0x000001aa   ble.i     0x000001b2                             # branch if less than or equal
0x000001ac   ldloc     0x00000002                             # load 1th argument isMoving : bool
0x000001ae   ldc.0                                            # 0
0x000001af   ceq                                              # compare if equal
0x000001b0   br        0x000001b3                             # branch unconditionally
0x000001b2   ldc.0                                            # 0
0x000001b3   call      0x00000000   0x00000002   0x000001c6   # call MoveTime.IsSettled.set(System.Boolean)
0x000001b7   ret       0x00000000                             # return from routine
0x000001b9   ldloc     0x00000000                             # load this : MoveTime
0x000001bb   ldc.0                                            # 0
0x000001bc   stfld     0x00000004                             # store field settlingTimer : int
0x000001be   ret       0x00000000                             # return from routine

# Method MoveTime.IsSettled.get
0x000001c0   ldloc     0x00000000                             # load this : MoveTime
0x000001c2   ldfld     0x00000001                             # load field <IsSettled>k__BackingField : bool
0x000001c4   ret       0x00000001                             # return from routine

# Method MoveTime.IsSettled.set
0x000001c6   ldloc     0x00000000                             # load this : MoveTime
0x000001c8   ldloc     0x00000001                             # load 0th argument value : bool
0x000001ca   stfld     0x00000001                             # store field <IsSettled>k__BackingField : bool
0x000001cc   ret       0x00000000                             # return from routine

# Method MoveTime.GetMoveTime
0x000001ce   ldloc     0x00000000                             # load this : MoveTime
0x000001d0   ldfld     0x00000003                             # load field moveTimer : int
0x000001d2   conv.i4.r4                                       # convert int to float
0x000001d3   ldc       0x38d1b717                             # 0.0001
0x000001d5   mul.r4                                           # float multiplication
0x000001d6   ret       0x00000001                             # return from routine

# Method AxisCompensation.Run2D
0x000001d8   ldloc     0x00000000                             # load this : AxisCompensation
0x000001da   ldloc     0x00000001                             # load 0th argument enable : bool
0x000001dc   call      0x00000001   0x00000003   0x000001f1   # call AxisCompensation.StateMachine(System.Boolean)
0x000001e0   stloc     0x00000004                             # store local variable gain : float
0x000001e2   ldloc     0x00000000                             # load this : AxisCompensation
0x000001e4   ldloc     0x00000002                             # load 1th argument xEnc : float
0x000001e6   ldloc     0x00000003                             # load 2th argument yEnc : float
0x000001e8   call      0x00000013   0x00000016   0x0000026b   # call AxisCompensation.GetCompensation2D(System.Single, System.Single)
0x000001ec   ldloc     0x00000004                             # load local variable gain : float
0x000001ee   mul.r4                                           # float multiplication
0x000001ef   ret       0x00000001                             # return from routine

# Method AxisCompensation.StateMachine
0x000001f1   ldloc     0x00000000                             # load this : AxisCompensation
0x000001f3   ldfld     0x00000000                             # load field state : AxisCompensation.State
0x000001f5   stloc     0x00000002                             # store local variable local_0 : AxisCompensation.State
0x000001f7   ldloc     0x00000002                             # load local variable local_0 : AxisCompensation.State
0x000001f9   switch.   0x00000003                             # switch table
      (   0x00000200   0x0000022a   0x00000255   )
0x000001fe   br        0x00000260                             # branch unconditionally
0x00000200   ldloc     0x00000001                             # load 0th argument enable : bool
0x00000202   brfalse   0x00000211                             # branch if zero
0x00000204   ldloc     0x00000000                             # load this : AxisCompensation
0x00000206   ldfld     0x00000002                             # load field compGain : float
0x00000208   ldc       0x00000000                             # 0
0x0000020a   bne       0x00000211                             # branch if not equal
0x0000020c   ldloc     0x00000000                             # load this : AxisCompensation
0x0000020e   ldc.1                                            # 1
0x0000020f   stfld     0x00000000                             # store field state : AxisCompensation.State
0x00000211   ldloc     0x00000000                             # load this : AxisCompensation
0x00000213   ldloc     0x00000000                             # load this : AxisCompensation
0x00000215   ldfld     0x00000002                             # load field compGain : float
0x00000217   ldc       0x3a03126e                             # 0.0005
0x00000219   blt.f     0x00000224                             # branch if less
0x0000021b   ldloc     0x00000000                             # load this : AxisCompensation
0x0000021d   ldfld     0x00000002                             # load field compGain : float
0x0000021f   ldc       0x3a03126e                             # 0.0005
0x00000221   sub.r4                                           # float subtraction
0x00000222   br        0x00000226                             # branch unconditionally
0x00000224   ldc       0x00000000                             # 0
0x00000226   stfld     0x00000002                             # store field compGain : float
0x00000228   br        0x00000265                             # branch unconditionally
0x0000022a   ldloc     0x00000001                             # load 0th argument enable : bool
0x0000022c   brfalse   0x0000024e                             # branch if zero
0x0000022e   ldloc     0x00000000                             # load this : AxisCompensation
0x00000230   ldloc     0x00000000                             # load this : AxisCompensation
0x00000232   ldfld     0x00000002                             # load field compGain : float
0x00000234   ldc       0x3a03126e                             # 0.0005
0x00000236   add.r4                                           # float addition
0x00000237   stfld     0x00000002                             # store field compGain : float
0x00000239   ldloc     0x00000000                             # load this : AxisCompensation
0x0000023b   ldfld     0x00000002                             # load field compGain : float
0x0000023d   ldc       0x3f800000                             # 1
0x0000023f   blt.f     0x00000265                             # branch if less
0x00000241   ldloc     0x00000000                             # load this : AxisCompensation
0x00000243   ldc       0x3f800000                             # 1
0x00000245   stfld     0x00000002                             # store field compGain : float
0x00000247   ldloc     0x00000000                             # load this : AxisCompensation
0x00000249   ldc.2                                            # 2
0x0000024a   stfld     0x00000000                             # store field state : AxisCompensation.State
0x0000024c   br        0x00000265                             # branch unconditionally
0x0000024e   ldloc     0x00000000                             # load this : AxisCompensation
0x00000250   ldc.0                                            # 0
0x00000251   stfld     0x00000000                             # store field state : AxisCompensation.State
0x00000253   br        0x00000265                             # branch unconditionally
0x00000255   ldloc     0x00000001                             # load 0th argument enable : bool
0x00000257   brtrue    0x00000265                             # branch if not zero
0x00000259   ldloc     0x00000000                             # load this : AxisCompensation
0x0000025b   ldc.0                                            # 0
0x0000025c   stfld     0x00000000                             # store field state : AxisCompensation.State
0x0000025e   br        0x00000265                             # branch unconditionally
0x00000260   ldloc     0x00000000                             # load this : AxisCompensation
0x00000262   ldc.0                                            # 0
0x00000263   stfld     0x00000000                             # store field state : AxisCompensation.State
0x00000265   ldloc     0x00000000                             # load this : AxisCompensation
0x00000267   ldfld     0x00000002                             # load field compGain : float
0x00000269   ret       0x00000001                             # return from routine

# Method AxisCompensation.GetCompensation2D
0x0000026b   ldloc     0x00000000                             # load this : AxisCompensation
0x0000026d   ldfld     0x00000001                             # load field tblIdx : int
0x0000026f   stloc     0x00000014                             # store local variable local_17 : int
0x00000271   ldloc     0x00000014                             # load local variable local_17 : int
0x00000273   ldc.1                                            # 1
0x00000274   beq       0x0000027d                             # branch if equal
0x00000276   ldloc     0x00000014                             # load local variable local_17 : int
0x00000278   ldc.2                                            # 2
0x00000279   beq       0x00000297                             # branch if equal
0x0000027b   br        0x000002b1                             # branch unconditionally
0x0000027d   rld       0x0040052b                             # get Register.Application.Tables.Small1.Header.Dim1.StartValue : float
0x0000027f   stloc     0x00000003                             # store local variable startValueX : float
0x00000281   rld       0x0040052c                             # get Register.Application.Tables.Small1.Header.Dim1.Distance : float
0x00000283   stloc     0x00000004                             # store local variable distanceX : float
0x00000285   rld       0x00400529                             # get Register.Application.Tables.Small1.Header.Dim1.Size : int
0x00000287   stloc     0x00000005                             # store local variable tblSizeX : int
0x00000289   rld       0x0040052f                             # get Register.Application.Tables.Small1.Header.Dim2.StartValue : float
0x0000028b   stloc     0x00000006                             # store local variable startValueY : float
0x0000028d   rld       0x00400530                             # get Register.Application.Tables.Small1.Header.Dim2.Distance : float
0x0000028f   stloc     0x00000007                             # store local variable distanceY : float
0x00000291   rld       0x0040052d                             # get Register.Application.Tables.Small1.Header.Dim2.Size : int
0x00000293   stloc     0x00000008                             # store local variable tblSizeY : int
0x00000295   br        0x000002b5                             # branch unconditionally
0x00000297   rld       0x00400d2b                             # get Register.Application.Tables.Small2.Header.Dim1.StartValue : float
0x00000299   stloc     0x00000003                             # store local variable startValueX : float
0x0000029b   rld       0x00400d2c                             # get Register.Application.Tables.Small2.Header.Dim1.Distance : float
0x0000029d   stloc     0x00000004                             # store local variable distanceX : float
0x0000029f   rld       0x00400d29                             # get Register.Application.Tables.Small2.Header.Dim1.Size : int
0x000002a1   stloc     0x00000005                             # store local variable tblSizeX : int
0x000002a3   rld       0x00400d2f                             # get Register.Application.Tables.Small2.Header.Dim2.StartValue : float
0x000002a5   stloc     0x00000006                             # store local variable startValueY : float
0x000002a7   rld       0x00400d30                             # get Register.Application.Tables.Small2.Header.Dim2.Distance : float
0x000002a9   stloc     0x00000007                             # store local variable distanceY : float
0x000002ab   rld       0x00400d2d                             # get Register.Application.Tables.Small2.Header.Dim2.Size : int
0x000002ad   stloc     0x00000008                             # store local variable tblSizeY : int
0x000002af   br        0x000002b5                             # branch unconditionally
0x000002b1   ldc       0x00000000                             # 0
0x000002b3   ret       0x00000001                             # return from routine
0x000002b5   ldloc     0x00000004                             # load local variable distanceX : float
0x000002b7   ldc       0x00000000                             # 0
0x000002b9   ble.f     0x000002c1                             # branch if less than or equal
0x000002bb   ldloc     0x00000007                             # load local variable distanceY : float
0x000002bd   ldc       0x00000000                             # 0
0x000002bf   bgt.f     0x000002c5                             # branch if greater
0x000002c1   ldc       0x00000000                             # 0
0x000002c3   ret       0x00000001                             # return from routine
0x000002c5   ldloc     0x00000001                             # load 0th argument xEnc : float
0x000002c7   ldloc     0x00000003                             # load local variable startValueX : float
0x000002c9   ldloc     0x00000004                             # load local variable distanceX : float
0x000002cb   ldloc     0x00000005                             # load local variable tblSizeX : int
0x000002cd   ldloca    0x00000009                             # load home of local variable idxX : int
0x000002cf   ldloca    0x0000000a                             # load home of local variable offsetX : float
0x000002d1   call      0x00000002   0x00000008   0x0000037c   # call AxisCompensation.GetIndexAndOffset(System.Single, System.Single, System.Single, System.Int32, System.Int32, System.Single)
0x000002d5   ldloc     0x00000002                             # load 1th argument yEnc : float
0x000002d7   ldloc     0x00000006                             # load local variable startValueY : float
0x000002d9   ldloc     0x00000007                             # load local variable distanceY : float
0x000002db   ldloc     0x00000008                             # load local variable tblSizeY : int
0x000002dd   ldloca    0x0000000b                             # load home of local variable idxY : int
0x000002df   ldloca    0x0000000c                             # load home of local variable offsetY : float
0x000002e1   call      0x00000002   0x00000008   0x0000037c   # call AxisCompensation.GetIndexAndOffset(System.Single, System.Single, System.Single, System.Int32, System.Int32, System.Single)
0x000002e5   ldloc     0x00000009                             # load local variable idxX : int
0x000002e7   ldloc     0x00000008                             # load local variable tblSizeY : int
0x000002e9   mul.i4                                           # integer multiplication
0x000002ea   ldloc     0x0000000b                             # load local variable idxY : int
0x000002ec   add.i4                                           # integer addition
0x000002ed   stloc     0x0000000d                             # store local variable idx : int
0x000002ef   ldloc     0x00000000                             # load this : AxisCompensation
0x000002f1   ldfld     0x00000001                             # load field tblIdx : int
0x000002f3   stloc     0x00000015                             # store local variable local_18 : int
0x000002f5   ldloc     0x00000015                             # load local variable local_18 : int
0x000002f7   ldc.1                                            # 1
0x000002f8   beq       0x00000301                             # branch if equal
0x000002fa   ldloc     0x00000015                             # load local variable local_18 : int
0x000002fc   ldc.2                                            # 2
0x000002fd   beq       0x00000329                             # branch if equal
0x000002ff   br        0x00000351                             # branch unconditionally
0x00000301   ldloc     0x0000000d                             # load local variable idx : int
0x00000303   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x00000306   stloc     0x0000000e                             # store local variable c00 : float
0x00000308   ldloc     0x0000000d                             # load local variable idx : int
0x0000030a   ldc.1                                            # 1
0x0000030b   add.i4                                           # integer addition
0x0000030c   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x0000030f   stloc     0x0000000f                             # store local variable c01 : float
0x00000311   ldloc     0x0000000d                             # load local variable idx : int
0x00000313   ldloc     0x00000008                             # load local variable tblSizeY : int
0x00000315   add.i4                                           # integer addition
0x00000316   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x00000319   stloc     0x00000010                             # store local variable c10 : float
0x0000031b   ldloc     0x0000000d                             # load local variable idx : int
0x0000031d   ldloc     0x00000008                             # load local variable tblSizeY : int
0x0000031f   add.i4                                           # integer addition
0x00000320   ldc.1                                            # 1
0x00000321   add.i4                                           # integer addition
0x00000322   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x00000325   stloc     0x00000011                             # store local variable c11 : float
0x00000327   br        0x00000355                             # branch unconditionally
0x00000329   ldloc     0x0000000d                             # load local variable idx : int
0x0000032b   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x0000032e   stloc     0x0000000e                             # store local variable c00 : float
0x00000330   ldloc     0x0000000d                             # load local variable idx : int
0x00000332   ldc.1                                            # 1
0x00000333   add.i4                                           # integer addition
0x00000334   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x00000337   stloc     0x0000000f                             # store local variable c01 : float
0x00000339   ldloc     0x0000000d                             # load local variable idx : int
0x0000033b   ldloc     0x00000008                             # load local variable tblSizeY : int
0x0000033d   add.i4                                           # integer addition
0x0000033e   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x00000341   stloc     0x00000010                             # store local variable c10 : float
0x00000343   ldloc     0x0000000d                             # load local variable idx : int
0x00000345   ldloc     0x00000008                             # load local variable tblSizeY : int
0x00000347   add.i4                                           # integer addition
0x00000348   ldc.1                                            # 1
0x00000349   add.i4                                           # integer addition
0x0000034a   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x0000034d   stloc     0x00000011                             # store local variable c11 : float
0x0000034f   br        0x00000355                             # branch unconditionally
0x00000351   ldc       0x00000000                             # 0
0x00000353   ret       0x00000001                             # return from routine
0x00000355   ldloc     0x0000000e                             # load local variable c00 : float
0x00000357   ldloc     0x0000000a                             # load local variable offsetX : float
0x00000359   ldloc     0x00000010                             # load local variable c10 : float
0x0000035b   ldloc     0x0000000e                             # load local variable c00 : float
0x0000035d   sub.r4                                           # float subtraction
0x0000035e   mul.r4                                           # float multiplication
0x0000035f   add.r4                                           # float addition
0x00000360   stloc     0x00000012                             # store local variable x0 : float
0x00000362   ldloc     0x0000000f                             # load local variable c01 : float
0x00000364   ldloc     0x0000000a                             # load local variable offsetX : float
0x00000366   ldloc     0x00000011                             # load local variable c11 : float
0x00000368   ldloc     0x0000000f                             # load local variable c01 : float
0x0000036a   sub.r4                                           # float subtraction
0x0000036b   mul.r4                                           # float multiplication
0x0000036c   add.r4                                           # float addition
0x0000036d   stloc     0x00000013                             # store local variable x1 : float
0x0000036f   ldloc     0x00000012                             # load local variable x0 : float
0x00000371   ldloc     0x0000000c                             # load local variable offsetY : float
0x00000373   ldloc     0x00000013                             # load local variable x1 : float
0x00000375   ldloc     0x00000012                             # load local variable x0 : float
0x00000377   sub.r4                                           # float subtraction
0x00000378   mul.r4                                           # float multiplication
0x00000379   add.r4                                           # float addition
0x0000037a   ret       0x00000001                             # return from routine

# Method AxisCompensation.GetIndexAndOffset
0x0000037c   ldloc     0x00000000                             # load 0th argument posAbs : float
0x0000037e   ldloc     0x00000001                             # load 1th argument startValue : float
0x00000380   sub.r4                                           # float subtraction
0x00000381   stloc     0x00000006                             # store local variable posRel : float
0x00000383   ldloc     0x00000006                             # load local variable posRel : float
0x00000385   ldloc     0x00000002                             # load 2th argument distance : float
0x00000387   div.r4                                           # float division
0x00000388   stloc     0x00000007                             # store local variable idxFloat : float
0x0000038a   ldloc     0x00000004                             # load 4th argument index : int*
0x0000038c   ldloc     0x00000007                             # load local variable idxFloat : float
0x0000038e   floor                                            # floor
0x0000038f   conv.r4.i4                                       # convert float to int
0x00000390   stind                                            # store value at address : int
0x00000391   ldloc     0x00000004                             # load 4th argument index : int*
0x00000393   ldind                                            # load value at address : int
0x00000394   ldc.0                                            # 0
0x00000395   bge.i     0x000003a2                             # branch if greater
0x00000397   ldloc     0x00000004                             # load 4th argument index : int*
0x00000399   ldc.0                                            # 0
0x0000039a   stind                                            # store value at address : int
0x0000039b   ldloc     0x00000005                             # load 5th argument offset : float*
0x0000039d   ldc       0x00000000                             # 0
0x0000039f   stind                                            # store value at address : float
0x000003a0   ret       0x00000000                             # return from routine
0x000003a2   ldloc     0x00000004                             # load 4th argument index : int*
0x000003a4   ldind                                            # load value at address : int
0x000003a5   ldloc     0x00000003                             # load 3th argument tblSize : int
0x000003a7   ldc.1                                            # 1
0x000003a8   sub.i4                                           # integer subtraction
0x000003a9   blt.i     0x000003b9                             # branch if less
0x000003ab   ldloc     0x00000004                             # load 4th argument index : int*
0x000003ad   ldloc     0x00000003                             # load 3th argument tblSize : int
0x000003af   ldc.2                                            # 2
0x000003b0   sub.i4                                           # integer subtraction
0x000003b1   stind                                            # store value at address : int
0x000003b2   ldloc     0x00000005                             # load 5th argument offset : float*
0x000003b4   ldc       0x3f800000                             # 1
0x000003b6   stind                                            # store value at address : float
0x000003b7   ret       0x00000000                             # return from routine
0x000003b9   ldloc     0x00000005                             # load 5th argument offset : float*
0x000003bb   ldloc     0x00000007                             # load local variable idxFloat : float
0x000003bd   ldloc     0x00000004                             # load 4th argument index : int*
0x000003bf   ldind                                            # load value at address : int
0x000003c0   conv.i4.r4                                       # convert int to float
0x000003c1   sub.r4                                           # float subtraction
0x000003c2   stind                                            # store value at address : float
0x000003c3   ret       0x00000000                             # return from routine

# Method GantryEncoderAlignment.Run
0x000003c5   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x000003c7   ldc.3                                            # 3
0x000003c8   bge.i     0x000003cd                             # branch if greater
0x000003ca   ldc.1                                            # 1
0x000003cb   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x000003cd   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003cf   ldfld     0x0000000c                             # load field mainState : GantryEncoderAlignment.MainState
0x000003d1   stloc     0x00000002                             # store local variable local_0 : GantryEncoderAlignment.MainState
0x000003d3   ldloc     0x00000002                             # load local variable local_0 : GantryEncoderAlignment.MainState
0x000003d5   switch.   0x00000004                             # switch table
      (   0x000003dd   0x00000463   0x00000494   0x000004cd   )
0x000003db   br        0x000004ea                             # branch unconditionally
0x000003dd   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x000003df   ldc.3                                            # 3
0x000003e0   blt.i     0x000003eb                             # branch if less
0x000003e2   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x000003e4   ldc       0x00000014                             # 20
0x000003e6   beq       0x000003eb                             # branch if equal
0x000003e8   ldc.0                                            # 0
0x000003e9   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x000003eb   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x000003ed   ldc.1                                            # 1
0x000003ee   sub.i4                                           # integer subtraction
0x000003ef   switch.   0x00000004                             # switch table
      (   0x000003f7   0x000003f7   0x00000404   0x0000043f   )
0x000003f5   br        0x000004ea                             # branch unconditionally
0x000003f7   ldc.0                                            # 0
0x000003f8   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x000003fa   ldc.1                                            # 1
0x000003fb   rst       0x0023ec00                             # set Register.Axes_0.Commands.Homing.Command : HomingCommand
0x000003fd   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003ff   ldc.1                                            # 1
0x00000400   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x00000402   br        0x000004ea                             # branch unconditionally
0x00000404   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x00000406   ldc       0x00000014                             # 20
0x00000408   bne       0x0000043a                             # branch if not equal
0x0000040a   ldc.0                                            # 0
0x0000040b   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x0000040d   ldc       0x3dcccccd                             # 0.1
0x0000040f   stloc     0x00000003                             # store local variable limitDistance : float
0x00000411   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000413   rld       0x00201800                             # get Register.Axes_0.Parameters.PathPlanner.PositionMinimum : float
0x00000415   ldloc     0x00000003                             # load local variable limitDistance : float
0x00000417   add.r4                                           # float addition
0x00000418   stfld     0x00000006                             # store field scanStartPosition : float
0x0000041a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000041c   rld       0x00201700                             # get Register.Axes_0.Parameters.PathPlanner.PositionMaximum : float
0x0000041e   ldloc     0x00000003                             # load local variable limitDistance : float
0x00000420   sub.r4                                           # float subtraction
0x00000421   stfld     0x0000000d                             # store field scanEndPosition : float
0x00000423   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000425   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000427   ldfld     0x0000000d                             # load field scanEndPosition : float
0x00000429   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000042b   ldfld     0x00000006                             # load field scanStartPosition : float
0x0000042d   sub.r4                                           # float subtraction
0x0000042e   ldc       0x41f00000                             # 30
0x00000430   div.r4                                           # float division
0x00000431   stfld     0x00000002                             # store field scanVelocity : float
0x00000433   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000435   ldc.2                                            # 2
0x00000436   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x00000438   br        0x000004ea                             # branch unconditionally
0x0000043a   ldc.0                                            # 0
0x0000043b   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x0000043d   br        0x000004ea                             # branch unconditionally
0x0000043f   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x00000441   ldc       0x00000014                             # 20
0x00000443   bne       0x0000045e                             # branch if not equal
0x00000445   ldc.7                                            # 7
0x00000446   rlde      0x00000008   0x00238401                # get Register.Application.Parameters.Booleans[TOS] : bool
0x00000449   brfalse   0x0000045e                             # branch if zero
0x0000044b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000044d   rld       0x00400d2b                             # get Register.Application.Tables.Small2.Header.Dim1.StartValue : float
0x0000044f   stfld     0x00000006                             # store field scanStartPosition : float
0x00000451   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000453   rld       0x00400d2c                             # get Register.Application.Tables.Small2.Header.Dim1.Distance : float
0x00000455   stfld     0x00000008                             # store field nodeSpacing : float
0x00000457   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000459   ldc.3                                            # 3
0x0000045a   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x0000045c   br        0x000004ea                             # branch unconditionally
0x0000045e   ldc.0                                            # 0
0x0000045f   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x00000461   br        0x000004ea                             # branch unconditionally
0x00000463   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x00000465   ldc       0x00000014                             # 20
0x00000467   bne       0x00000489                             # branch if not equal
0x00000469   ldc.r8    0x00000000   0x00000000                # 0
0x0000046c   rst.2     0x002a7b01                             # set Register.Axes_1.Commands.PathPlanner.Xnew : double
0x0000046e   ldc       0x0000000a                             # 10
0x00000470   rst       0x002a7800                             # set Register.Axes_1.Commands.PathPlanner.Command : PathPlannerCommand
0x00000472   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x00000474   ldc.1                                            # 1
0x00000475   bne       0x0000047a                             # branch if not equal
0x00000477   ldc.3                                            # 3
0x00000478   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x0000047a   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x0000047c   ldc.2                                            # 2
0x0000047d   bne       0x00000482                             # branch if not equal
0x0000047f   ldc.4                                            # 4
0x00000480   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x00000482   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000484   ldc.0                                            # 0
0x00000485   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x00000487   br        0x000004ea                             # branch unconditionally
0x00000489   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x0000048b   brtrue    0x000004ea                             # branch if not zero
0x0000048d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000048f   ldc.0                                            # 0
0x00000490   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x00000492   br        0x000004ea                             # branch unconditionally
0x00000494   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000496   call      0x00000003   0x00000004   0x000004ee   # call GantryEncoderAlignment.Scan()
0x0000049a   brfalse   0x000004ea                             # branch if zero
0x0000049c   ldc.7                                            # 7
0x0000049d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000049f   ldfld     0x00000001                             # load field scanSucceeded : bool
0x000004a1   rste      0x00000008   0x00238401                # set Register.Application.Parameters.Booleans[TOS] : bool
0x000004a4   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004a6   ldfld     0x00000001                             # load field scanSucceeded : bool
0x000004a8   brfalse   0x000004c3                             # branch if zero
0x000004aa   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004ac   ldfld     0x00000006                             # load field scanStartPosition : float
0x000004ae   rst       0x00400d2b                             # set Register.Application.Tables.Small2.Header.Dim1.StartValue : float
0x000004b0   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004b2   ldfld     0x00000008                             # load field nodeSpacing : float
0x000004b4   rst       0x00400d2c                             # set Register.Application.Tables.Small2.Header.Dim1.Distance : float
0x000004b6   ldc       0x00002710                             # 10000
0x000004b8   rst       0x00400d29                             # set Register.Application.Tables.Small2.Header.Dim1.Size : int
0x000004ba   ldc.1                                            # 1
0x000004bb   rst       0x00400d25                             # set Register.Application.Tables.Small2.Header.RowSize : int
0x000004bd   ldc.1                                            # 1
0x000004be   rst       0x00400d01                             # set Register.Application.Tables.Small2.Header.Persistent : bool
0x000004c0   ldc.1                                            # 1
0x000004c1   rst       0x00400b00                             # set Register.Application.Tables.Small2.Command : TableCommand
0x000004c3   ldc.4                                            # 4
0x000004c4   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x000004c6   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004c8   ldc.0                                            # 0
0x000004c9   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x000004cb   br        0x000004ea                             # branch unconditionally
0x000004cd   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004cf   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x000004d1   ldc.4                                            # 4
0x000004d2   bne       0x000004db                             # branch if not equal
0x000004d4   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x000004d6   ldc       0x00000014                             # 20
0x000004d8   ceq                                              # compare if equal
0x000004d9   br        0x000004dc                             # branch unconditionally
0x000004db   ldc.0                                            # 0
0x000004dc   call      0x00000002   0x00000004   0x00000703   # call GantryEncoderAlignment.Apply(System.Boolean)
0x000004e0   brfalse   0x000004ea                             # branch if zero
0x000004e2   ldc.0                                            # 0
0x000004e3   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x000004e5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004e7   ldc.0                                            # 0
0x000004e8   stfld     0x0000000c                             # store field mainState : GantryEncoderAlignment.MainState
0x000004ea   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x000004ec   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.Scan
0x000004ee   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x000004f0   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004f2   ldfld     0x00000006                             # load field scanStartPosition : float
0x000004f4   sub.r4                                           # float subtraction
0x000004f5   stloc     0x00000001                             # store local variable scanPosition : float
0x000004f7   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000004f9   ldfld     0x00000005                             # load field scanState : GantryEncoderAlignment.ScanState
0x000004fb   stloc     0x00000002                             # store local variable local_1 : GantryEncoderAlignment.ScanState
0x000004fd   ldloc     0x00000002                             # load local variable local_1 : GantryEncoderAlignment.ScanState
0x000004ff   switch.   0x00000005                             # switch table
      (   0x00000508   0x00000549   0x00000576   0x00000620   0x000006c1   )
0x00000506   br        0x000006ca                             # branch unconditionally
0x00000508   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000050a   ldc.0                                            # 0
0x0000050b   stfld     0x00000001                             # store field scanSucceeded : bool
0x0000050d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000050f   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x00000511   stfld     0x0000000e                             # store field initialPosition : float
0x00000513   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000515   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000517   ldfld     0x0000000d                             # load field scanEndPosition : float
0x00000519   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000051b   ldfld     0x00000006                             # load field scanStartPosition : float
0x0000051d   sub.r4                                           # float subtraction
0x0000051e   ldc       0x461c3c00                             # 9999
0x00000520   div.r4                                           # float division
0x00000521   stfld     0x00000008                             # store field nodeSpacing : float
0x00000523   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000525   ldfld     0x00000006                             # load field scanStartPosition : float
0x00000527   conv.r4.r8                                       # convert float to double
0x00000528   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x0000052a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000052c   ldfld     0x00000002                             # load field scanVelocity : float
0x0000052e   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x00000530   ldc       0x00000042                             # 66
0x00000532   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x00000534   ldc       0x00000000                             # 0
0x00000536   rst       0x00228e00                             # set Register.Axes_0.Commands.CurrentController.InjectedIq : float
0x00000538   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000053a   rld.2     0x002ab901                             # get Register.Axes_1.Signals.PositionController.Encoders_0.Position : double
0x0000053c   rld.2     0x0022b901                             # get Register.Axes_0.Signals.PositionController.Encoders_0.Position : double
0x0000053e   sub.r8                                           # double subtraction
0x0000053f   conv.r8.r4                                       # convert double to float
0x00000540   stfld     0x0000000b                             # store field initialOffset : float
0x00000542   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000544   ldc.1                                            # 1
0x00000545   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x00000547   br        0x000006ca                             # branch unconditionally
0x00000549   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x0000054b   brfalse   0x000006ca                             # branch if zero
0x0000054d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000054f   ldfld     0x0000000d                             # load field scanEndPosition : float
0x00000551   conv.r4.r8                                       # convert float to double
0x00000552   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x00000554   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000556   ldfld     0x00000002                             # load field scanVelocity : float
0x00000558   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x0000055a   ldc       0x00000042                             # 66
0x0000055c   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x0000055e   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000560   ldc.0                                            # 0
0x00000561   stfld     0x0000000f                             # store field scanIdx : int
0x00000563   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000565   ldc       0x00000000                             # 0
0x00000567   stfld     0x00000000                             # store field curSum : float
0x00000569   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000056b   ldc       0x00000000                             # 0
0x0000056d   stfld     0x0000000a                             # store field cntSum : float
0x0000056f   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000571   ldc.2                                            # 2
0x00000572   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x00000574   br        0x000006ca                             # branch unconditionally
0x00000576   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000578   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000057a   ldfld     0x00000000                             # load field curSum : float
0x0000057c   rld.2     0x002ab901                             # get Register.Axes_1.Signals.PositionController.Encoders_0.Position : double
0x0000057e   rld.2     0x0022b901                             # get Register.Axes_0.Signals.PositionController.Encoders_0.Position : double
0x00000580   sub.r8                                           # double subtraction
0x00000581   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000583   ldfld     0x0000000b                             # load field initialOffset : float
0x00000585   conv.r4.r8                                       # convert float to double
0x00000586   sub.r8                                           # double subtraction
0x00000587   conv.r8.r4                                       # convert double to float
0x00000588   add.r4                                           # float addition
0x00000589   stfld     0x00000000                             # store field curSum : float
0x0000058b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000058d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000058f   ldfld     0x0000000a                             # load field cntSum : float
0x00000591   ldc       0x3f800000                             # 1
0x00000593   add.r4                                           # float addition
0x00000594   stfld     0x0000000a                             # store field cntSum : float
0x00000596   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000598   ldfld     0x0000000f                             # load field scanIdx : int
0x0000059a   conv.i4.r4                                       # convert int to float
0x0000059b   ldc       0x3f000000                             # 0.5
0x0000059d   add.r4                                           # float addition
0x0000059e   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005a0   ldfld     0x00000008                             # load field nodeSpacing : float
0x000005a2   mul.r4                                           # float multiplication
0x000005a3   ldloc     0x00000001                             # load local variable scanPosition : float
0x000005a5   ble.f     0x000005ab                             # branch if less than or equal
0x000005a7   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000005a9   brfalse   0x000006ca                             # branch if zero
0x000005ab   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005ad   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005af   ldfld     0x0000000f                             # load field scanIdx : int
0x000005b1   ldc       0x3e800000                             # 0.25
0x000005b3   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005b5   ldfld     0x00000000                             # load field curSum : float
0x000005b7   mul.r4                                           # float multiplication
0x000005b8   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005ba   ldfld     0x0000000a                             # load field cntSum : float
0x000005bc   div.r4                                           # float division
0x000005bd   ldc.0                                            # 0
0x000005be   call      0x00000000   0x00000004   0x000006d2   # call GantryEncoderAlignment.SetCompAtNode(System.Int32, System.Single, System.Boolean)
0x000005c2   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005c4   ldc       0x00000000                             # 0
0x000005c6   stfld     0x00000000                             # store field curSum : float
0x000005c8   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005ca   ldc       0x00000000                             # 0
0x000005cc   stfld     0x0000000a                             # store field cntSum : float
0x000005ce   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005d0   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005d2   ldfld     0x0000000f                             # load field scanIdx : int
0x000005d4   ldc.1                                            # 1
0x000005d5   add.i4                                           # integer addition
0x000005d6   stloc     0x00000003                             # store local variable local_2 : int
0x000005d8   ldloc     0x00000003                             # load local variable local_2 : int
0x000005da   stfld     0x0000000f                             # store field scanIdx : int
0x000005dc   ldloc     0x00000003                             # load local variable local_2 : int
0x000005de   ldc       0x00002710                             # 10000
0x000005e0   blt.i     0x00000610                             # branch if less
0x000005e2   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000005e4   brfalse   0x00000610                             # branch if zero
0x000005e6   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005e8   ldc       0x0000270f                             # 9999
0x000005ea   stfld     0x0000000f                             # store field scanIdx : int
0x000005ec   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005ee   ldfld     0x00000006                             # load field scanStartPosition : float
0x000005f0   conv.r4.r8                                       # convert float to double
0x000005f1   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x000005f3   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005f5   ldfld     0x00000002                             # load field scanVelocity : float
0x000005f7   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x000005f9   ldc       0x00000042                             # 66
0x000005fb   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x000005fd   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000005ff   ldc       0x00000000                             # 0
0x00000601   stfld     0x00000000                             # store field curSum : float
0x00000603   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000605   ldc       0x00000000                             # 0
0x00000607   stfld     0x0000000a                             # store field cntSum : float
0x00000609   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000060b   ldc.3                                            # 3
0x0000060c   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x0000060e   br        0x000006ca                             # branch unconditionally
0x00000610   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x00000612   brfalse   0x000006ca                             # branch if zero
0x00000614   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000616   ldc.0                                            # 0
0x00000617   stfld     0x00000001                             # store field scanSucceeded : bool
0x00000619   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000061b   ldc.0                                            # 0
0x0000061c   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x0000061e   br        0x000006ca                             # branch unconditionally
0x00000620   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000622   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000624   ldfld     0x00000000                             # load field curSum : float
0x00000626   rld.2     0x002ab901                             # get Register.Axes_1.Signals.PositionController.Encoders_0.Position : double
0x00000628   rld.2     0x0022b901                             # get Register.Axes_0.Signals.PositionController.Encoders_0.Position : double
0x0000062a   sub.r8                                           # double subtraction
0x0000062b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000062d   ldfld     0x0000000b                             # load field initialOffset : float
0x0000062f   conv.r4.r8                                       # convert float to double
0x00000630   sub.r8                                           # double subtraction
0x00000631   conv.r8.r4                                       # convert double to float
0x00000632   add.r4                                           # float addition
0x00000633   stfld     0x00000000                             # store field curSum : float
0x00000635   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000637   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000639   ldfld     0x0000000a                             # load field cntSum : float
0x0000063b   ldc       0x3f800000                             # 1
0x0000063d   add.r4                                           # float addition
0x0000063e   stfld     0x0000000a                             # store field cntSum : float
0x00000640   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000642   ldfld     0x0000000f                             # load field scanIdx : int
0x00000644   conv.i4.r4                                       # convert int to float
0x00000645   ldc       0x3f000000                             # 0.5
0x00000647   sub.r4                                           # float subtraction
0x00000648   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000064a   ldfld     0x00000008                             # load field nodeSpacing : float
0x0000064c   mul.r4                                           # float multiplication
0x0000064d   ldloc     0x00000001                             # load local variable scanPosition : float
0x0000064f   bge.f     0x00000655                             # branch if greater
0x00000651   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x00000653   brfalse   0x000006ca                             # branch if zero
0x00000655   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000657   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000659   ldfld     0x0000000f                             # load field scanIdx : int
0x0000065b   ldc       0x3e800000                             # 0.25
0x0000065d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000065f   ldfld     0x00000000                             # load field curSum : float
0x00000661   mul.r4                                           # float multiplication
0x00000662   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000664   ldfld     0x0000000a                             # load field cntSum : float
0x00000666   div.r4                                           # float division
0x00000667   ldc.1                                            # 1
0x00000668   call      0x00000000   0x00000004   0x000006d2   # call GantryEncoderAlignment.SetCompAtNode(System.Int32, System.Single, System.Boolean)
0x0000066c   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000066e   ldc       0x00000000                             # 0
0x00000670   stfld     0x00000000                             # store field curSum : float
0x00000672   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000674   ldc       0x00000000                             # 0
0x00000676   stfld     0x0000000a                             # store field cntSum : float
0x00000678   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000067a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000067c   ldfld     0x0000000f                             # load field scanIdx : int
0x0000067e   ldc.1                                            # 1
0x0000067f   sub.i4                                           # integer subtraction
0x00000680   stloc     0x00000003                             # store local variable local_2 : int
0x00000682   ldloc     0x00000003                             # load local variable local_2 : int
0x00000684   stfld     0x0000000f                             # store field scanIdx : int
0x00000686   ldloc     0x00000003                             # load local variable local_2 : int
0x00000688   ldc.0                                            # 0
0x00000689   bge.i     0x000006b1                             # branch if greater
0x0000068b   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x0000068d   brfalse   0x000006b1                             # branch if zero
0x0000068f   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000691   ldc.0                                            # 0
0x00000692   stfld     0x0000000f                             # store field scanIdx : int
0x00000694   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000696   ldfld     0x0000000e                             # load field initialPosition : float
0x00000698   conv.r4.r8                                       # convert float to double
0x00000699   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x0000069b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000069d   ldfld     0x00000002                             # load field scanVelocity : float
0x0000069f   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x000006a1   ldc       0x00000042                             # 66
0x000006a3   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x000006a5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000006a7   ldc.1                                            # 1
0x000006a8   stfld     0x00000001                             # store field scanSucceeded : bool
0x000006aa   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000006ac   ldc.4                                            # 4
0x000006ad   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x000006af   br        0x000006ca                             # branch unconditionally
0x000006b1   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000006b3   brfalse   0x000006ca                             # branch if zero
0x000006b5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000006b7   ldc.0                                            # 0
0x000006b8   stfld     0x00000001                             # store field scanSucceeded : bool
0x000006ba   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000006bc   ldc.0                                            # 0
0x000006bd   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x000006bf   br        0x000006ca                             # branch unconditionally
0x000006c1   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000006c3   brfalse   0x000006ca                             # branch if zero
0x000006c5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000006c7   ldc.0                                            # 0
0x000006c8   stfld     0x00000005                             # store field scanState : GantryEncoderAlignment.ScanState
0x000006ca   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000006cc   ldfld     0x00000005                             # load field scanState : GantryEncoderAlignment.ScanState
0x000006ce   ldc.0                                            # 0
0x000006cf   ceq                                              # compare if equal
0x000006d0   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.SetCompAtNode
0x000006d2   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000006d4   ldc.0                                            # 0
0x000006d5   blt.i     0x000006db                             # branch if less
0x000006d7   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000006d9   br        0x000006dc                             # branch unconditionally
0x000006db   ldc.0                                            # 0
0x000006dc   stloc     0x00000001                             # store 0th argument nodeIdx : int
0x000006de   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000006e0   ldc       0x00002710                             # 10000
0x000006e2   bge.i     0x000006e8                             # branch if greater
0x000006e4   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000006e6   br        0x000006ea                             # branch unconditionally
0x000006e8   ldc       0x0000270f                             # 9999
0x000006ea   stloc     0x00000001                             # store 0th argument nodeIdx : int
0x000006ec   ldloc     0x00000003                             # load 2th argument cumulate : bool
0x000006ee   brfalse   0x000006fa                             # branch if zero
0x000006f0   ldloc     0x00000002                             # load 1th argument comp : float
0x000006f2   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000006f4   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x000006f7   add.r4                                           # float addition
0x000006f8   stloc     0x00000002                             # store 1th argument comp : float
0x000006fa   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000006fc   ldloc     0x00000002                             # load 1th argument comp : float
0x000006fe   rste      0x000003e8   0x00400801                # set Register.Application.Tables.Small2.Data.Float[TOS] : float
0x00000701   ret       0x00000000                             # return from routine

# Method GantryEncoderAlignment.Apply
0x00000703   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000705   ldfld     0x00000007                             # load field applyState : GantryEncoderAlignment.ApplyState
0x00000707   stloc     0x00000003                             # store local variable local_1 : GantryEncoderAlignment.ApplyState
0x00000709   ldloc     0x00000003                             # load local variable local_1 : GantryEncoderAlignment.ApplyState
0x0000070b   switch.   0x00000003                             # switch table
      (   0x00000712   0x00000734   0x00000765   )
0x00000710   br        0x00000770                             # branch unconditionally
0x00000712   ldloc     0x00000001                             # load 0th argument run : bool
0x00000714   brfalse   0x0000071b                             # branch if zero
0x00000716   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000718   ldc.1                                            # 1
0x00000719   stfld     0x00000007                             # store field applyState : GantryEncoderAlignment.ApplyState
0x0000071b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000071d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000071f   ldfld     0x00000010                             # load field compGain : float
0x00000721   ldc       0x3a83126e                             # 0.0009999999
0x00000723   blt.f     0x0000072e                             # branch if less
0x00000725   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000727   ldfld     0x00000010                             # load field compGain : float
0x00000729   ldc       0x3a83126e                             # 0.0009999999
0x0000072b   sub.r4                                           # float subtraction
0x0000072c   br        0x00000730                             # branch unconditionally
0x0000072e   ldc       0x00000000                             # 0
0x00000730   stfld     0x00000010                             # store field compGain : float
0x00000732   br        0x00000778                             # branch unconditionally
0x00000734   ldloc     0x00000001                             # load 0th argument run : bool
0x00000736   brfalse   0x0000075b                             # branch if zero
0x00000738   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000073a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000073c   ldfld     0x00000010                             # load field compGain : float
0x0000073e   ldc       0x3a83126e                             # 0.0009999999
0x00000740   add.r4                                           # float addition
0x00000741   stfld     0x00000010                             # store field compGain : float
0x00000743   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000745   ldfld     0x00000010                             # load field compGain : float
0x00000747   ldc       0x3f800000                             # 1
0x00000749   blt.f     0x00000778                             # branch if less
0x0000074b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000074d   ldc       0x3f800000                             # 1
0x0000074f   stfld     0x00000010                             # store field compGain : float
0x00000751   ldc.1                                            # 1
0x00000752   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x00000754   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000756   ldc.2                                            # 2
0x00000757   stfld     0x00000007                             # store field applyState : GantryEncoderAlignment.ApplyState
0x00000759   br        0x00000778                             # branch unconditionally
0x0000075b   ldc.0                                            # 0
0x0000075c   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x0000075e   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000760   ldc.0                                            # 0
0x00000761   stfld     0x00000007                             # store field applyState : GantryEncoderAlignment.ApplyState
0x00000763   br        0x00000778                             # branch unconditionally
0x00000765   ldloc     0x00000001                             # load 0th argument run : bool
0x00000767   brtrue    0x00000778                             # branch if not zero
0x00000769   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000076b   ldc.0                                            # 0
0x0000076c   stfld     0x00000007                             # store field applyState : GantryEncoderAlignment.ApplyState
0x0000076e   br        0x00000778                             # branch unconditionally
0x00000770   ldc.0                                            # 0
0x00000771   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x00000773   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000775   ldc.0                                            # 0
0x00000776   stfld     0x00000007                             # store field applyState : GantryEncoderAlignment.ApplyState
0x00000778   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x0000077a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000077c   ldfld     0x00000006                             # load field scanStartPosition : float
0x0000077e   sub.r4                                           # float subtraction
0x0000077f   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000781   ldfld     0x00000008                             # load field nodeSpacing : float
0x00000783   ldc       0x461c3c00                             # 9999
0x00000785   mul.r4                                           # float multiplication
0x00000786   div.r4                                           # float division
0x00000787   stloc     0x00000002                             # store local variable xNorm : float
0x00000789   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000078b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000078d   ldloc     0x00000002                             # load local variable xNorm : float
0x0000078f   call      0x00000004   0x00000006   0x000007ae   # call GantryEncoderAlignment.GetComp(System.Single)
0x00000793   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000795   ldfld     0x00000010                             # load field compGain : float
0x00000797   mul.r4                                           # float multiplication
0x00000798   stfld     0x00000009                             # store field alignmentCorrection : float
0x0000079a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000079c   ldfld     0x00000007                             # load field applyState : GantryEncoderAlignment.ApplyState
0x0000079e   brtrue    0x000007ab                             # branch if not zero
0x000007a0   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000007a2   ldfld     0x00000010                             # load field compGain : float
0x000007a4   ldc       0x00000000                             # 0
0x000007a6   cgt.f                                            # compare if greater
0x000007a7   ldc.0                                            # 0
0x000007a8   ceq                                              # compare if equal
0x000007a9   ret       0x00000001                             # return from routine
0x000007ab   ldc.0                                            # 0
0x000007ac   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.GetComp
0x000007ae   ldloc     0x00000001                             # load 0th argument xNorm : float
0x000007b0   ldc       0x461c4000                             # 10000
0x000007b2   mul.r4                                           # float multiplication
0x000007b3   stloc     0x00000002                             # store local variable nx : float
0x000007b5   ldloc     0x00000002                             # load local variable nx : float
0x000007b7   floor                                            # floor
0x000007b8   conv.r4.i4                                       # convert float to int
0x000007b9   stloc     0x00000003                             # store local variable n : int
0x000007bb   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000007bd   ldloc     0x00000003                             # load local variable n : int
0x000007bf   call      0x00000000   0x00000002   0x000007e2   # call GantryEncoderAlignment.GetCompAtNode(System.Int32)
0x000007c3   stloc     0x00000004                             # store local variable cn : float
0x000007c5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000007c7   ldloc     0x00000003                             # load local variable n : int
0x000007c9   ldc.1                                            # 1
0x000007ca   add.i4                                           # integer addition
0x000007cb   call      0x00000000   0x00000002   0x000007e2   # call GantryEncoderAlignment.GetCompAtNode(System.Int32)
0x000007cf   ldloc     0x00000004                             # load local variable cn : float
0x000007d1   sub.r4                                           # float subtraction
0x000007d2   stloc     0x00000005                             # store local variable dcn : float
0x000007d4   ldloc     0x00000004                             # load local variable cn : float
0x000007d6   ldloc     0x00000002                             # load local variable nx : float
0x000007d8   ldloc     0x00000003                             # load local variable n : int
0x000007da   conv.i4.r4                                       # convert int to float
0x000007db   sub.r4                                           # float subtraction
0x000007dc   ldloc     0x00000005                             # load local variable dcn : float
0x000007de   mul.r4                                           # float multiplication
0x000007df   add.r4                                           # float addition
0x000007e0   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.GetCompAtNode
0x000007e2   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000007e4   ldc.0                                            # 0
0x000007e5   blt.i     0x000007eb                             # branch if less
0x000007e7   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000007e9   br        0x000007ec                             # branch unconditionally
0x000007eb   ldc.0                                            # 0
0x000007ec   stloc     0x00000001                             # store 0th argument nodeIdx : int
0x000007ee   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000007f0   ldc       0x00002710                             # 10000
0x000007f2   bge.i     0x000007f8                             # branch if greater
0x000007f4   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000007f6   br        0x000007fa                             # branch unconditionally
0x000007f8   ldc       0x0000270f                             # 9999
0x000007fa   stloc     0x00000001                             # store 0th argument nodeIdx : int
0x000007fc   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x000007fe   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x00000801   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.GetCorrection
0x00000803   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000805   ldfld     0x0000000c                             # load field mainState : GantryEncoderAlignment.MainState
0x00000807   ldc.3                                            # 3
0x00000808   beq       0x00000810                             # branch if equal
0x0000080a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000080c   ldc       0x00000000                             # 0
0x0000080e   stfld     0x00000009                             # store field alignmentCorrection : float
0x00000810   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000812   ldfld     0x00000009                             # load field alignmentCorrection : float
0x00000814   ret       0x00000001                             # return from routine
