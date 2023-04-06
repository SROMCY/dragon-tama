# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: YTheta, C:\Skyverse_Dragon\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 11.01.2023 15:01:00
# Target register layout (RLID): 0x00000013
# Space for static fields: 0x00000005
# Maximal stack size: 0x00000043
# Init entry point                 : 0x00000001 (local stack size = 0x00000001)
# Task entry point AsynchronousMain: 0x00000000 (local stack size = 0x00000000)
# Task entry point IsochronousMain : 0x00000125 (local stack size = 0x0000000b)
# Task entry point Axis1Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Coupling   : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Coupling   : 0x00000000 (local stack size = 0x00000000)
0x00000000   halt                                             # precautious halt

# Method YTheta..cctor
0x00000001   ldc.0                                            # 0
0x00000002   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000005   ldc.1                                            # 1
0x00000006   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000009   new       0x00000005   0x00000002                # allocate space on the heap for a new instance of class MoveTime
0x0000000c   call      0x00000000   0x00000003   0x00000078   # call MoveTime..ctor(System.Single, System.Single)
0x00000010   stabs     0x00000000                             # store static field settlingTimeA0 : MoveTime
0x00000012   ldc.2                                            # 2
0x00000013   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000016   ldc.3                                            # 3
0x00000017   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x0000001a   new       0x00000005   0x00000002                # allocate space on the heap for a new instance of class MoveTime
0x0000001d   call      0x00000000   0x00000003   0x00000078   # call MoveTime..ctor(System.Single, System.Single)
0x00000021   stabs     0x00000001                             # store static field settlingTimeA1 : MoveTime
0x00000023   ldc.1                                            # 1
0x00000024   new       0x00000003   0x00000001                # allocate space on the heap for a new instance of class AxisCompensation
0x00000027   call      0x00000000   0x00000002   0x000000a8   # call AxisCompensation..ctor(System.Int32)
0x0000002b   stabs     0x00000002                             # store static field axis0Compensation : AxisCompensation
0x0000002d   ldc.2                                            # 2
0x0000002e   new       0x00000003   0x00000001                # allocate space on the heap for a new instance of class AxisCompensation
0x00000031   call      0x00000000   0x00000002   0x000000a8   # call AxisCompensation..ctor(System.Int32)
0x00000035   stabs     0x00000003                             # store static field axis1Compensation : AxisCompensation
0x00000037   ldc.0                                            # 0
0x00000038   stloc     0x00000000                             # store local variable ii : int
0x0000003a   br        0x00000048                             # branch unconditionally
0x0000003c   ldloc     0x00000000                             # load local variable ii : int
0x0000003e   ldc.5                                            # 5
0x0000003f   rste      0x00000004   0x00281501                # set Register.Axes_1.Parameters.OptionModule.AO_Range[TOS] : OptionToa3Range
0x00000042   ldloc     0x00000000                             # load local variable ii : int
0x00000044   ldc.1                                            # 1
0x00000045   add.i4                                           # integer addition
0x00000046   stloc     0x00000000                             # store local variable ii : int
0x00000048   ldloc     0x00000000                             # load local variable ii : int
0x0000004a   rld       0x00281500                             # load length of Register.Axes_1.Parameters.OptionModule.AO_Range : int
0x0000004c   blt.i     0x0000003c                             # branch if less
0x0000004e   ldc.1                                            # 1
0x0000004f   rst       0x00213c00                             # set Register.General.Commands.CommitParameter : bool
0x00000051   ldc.1                                            # 1
0x00000052   new       0x00000004   0x00000001                # allocate space on the heap for a new instance of class AnalogOutputs
0x00000055   call      0x00000000   0x00000002   0x000000c1   # call AnalogOutputs..ctor(System.Int32)
0x00000059   stabs     0x00000004                             # store static field feedforward : AnalogOutputs
0x0000005b   ldabs     0x00000004                             # load static field feedforward : AnalogOutputs
0x0000005d   ldc       0x3a1d4952                             # 0.0006
0x0000005f   ldc       0x3a1d4952                             # 0.0006
0x00000061   ldc       0x3d35dcc6                             # 0.0444
0x00000063   ldc       0x3d4779a7                             # 0.0487
0x00000065   call      0x00000000   0x00000005   0x000000e1   # call AnalogOutputs.SetGain(System.Single, System.Single, System.Single, System.Single)
0x00000069   ldabs     0x00000004                             # load static field feedforward : AnalogOutputs
0x0000006b   ldc       0x00000000                             # 0
0x0000006d   ldc       0x00000000                             # 0
0x0000006f   ldc       0x40000000                             # 2
0x00000071   ldc       0xbf3b645a                             # -0.732
0x00000073   call      0x00000000   0x00000005   0x00000103   # call AnalogOutputs.SetOffset(System.Single, System.Single, System.Single, System.Single)
0x00000077   halt                                             # return from Tama task routine

# Method MoveTime..ctor
0x00000078   ldloc     0x00000000                             # load this : MoveTime
0x0000007a   call      0x00000000   0x00000001   0x00000094   # call System.Object..ctor()
0x0000007e   ldloc     0x00000000                             # load this : MoveTime
0x00000080   ldc.0                                            # 0
0x00000081   stfld     0x00000003                             # store field moveTimer : int
0x00000083   ldloc     0x00000000                             # load this : MoveTime
0x00000085   ldc.0                                            # 0
0x00000086   stfld     0x00000004                             # store field settlingTimer : int
0x00000088   ldloc     0x00000000                             # load this : MoveTime
0x0000008a   ldloc     0x00000001                             # load 0th argument settlingWindow : float
0x0000008c   ldloc     0x00000002                             # load 1th argument minSettleDuration : float
0x0000008e   call      0x00000000   0x00000003   0x00000096   # call MoveTime.Set(System.Single, System.Single)
0x00000092   ret       0x00000000                             # return from routine

# Method System.Object..ctor
0x00000094   ret       0x00000000                             # return from routine

# Method MoveTime.Set
0x00000096   ldloc     0x00000000                             # load this : MoveTime
0x00000098   ldloc     0x00000001                             # load 0th argument settlingWindow : float
0x0000009a   stfld     0x00000002                             # store field settlingWindow : float
0x0000009c   ldloc     0x00000000                             # load this : MoveTime
0x0000009e   ldloc     0x00000002                             # load 1th argument minSettleDuration : float
0x000000a0   ldc       0x461c4000                             # 10000
0x000000a2   mul.r4                                           # float multiplication
0x000000a3   conv.r4.i4                                       # convert float to int
0x000000a4   stfld     0x00000000                             # store field minSettleDuration : int
0x000000a6   ret       0x00000000                             # return from routine

# Method AxisCompensation..ctor
0x000000a8   ldloc     0x00000000                             # load this : AxisCompensation
0x000000aa   call      0x00000000   0x00000001   0x00000094   # call System.Object..ctor()
0x000000ae   ldloc     0x00000000                             # load this : AxisCompensation
0x000000b0   ldc       0x00000000                             # 0
0x000000b2   stfld     0x00000002                             # store field compGain : float
0x000000b4   ldloc     0x00000000                             # load this : AxisCompensation
0x000000b6   ldc.0                                            # 0
0x000000b7   stfld     0x00000000                             # store field state : AxisCompensation.State
0x000000b9   ldloc     0x00000000                             # load this : AxisCompensation
0x000000bb   ldloc     0x00000001                             # load 0th argument tableIndex : int
0x000000bd   stfld     0x00000001                             # store field tblIdx : int
0x000000bf   ret       0x00000000                             # return from routine

# Method AnalogOutputs..ctor
0x000000c1   ldloc     0x00000000                             # load this : AnalogOutputs
0x000000c3   call      0x00000000   0x00000001   0x00000094   # call System.Object..ctor()
0x000000c7   ldloc     0x00000000                             # load this : AnalogOutputs
0x000000c9   ldloc     0x00000001                             # load 0th argument axisIndex : int
0x000000cb   stfld     0x00000001                             # store field axisIdx : int
0x000000cd   ldloc     0x00000000                             # load this : AnalogOutputs
0x000000cf   ldc.4                                            # 4
0x000000d0   newarr                                           # allocate float[]
0x000000d1   stfld     0x00000000                             # store field gain : float[]
0x000000d3   ldloc     0x00000000                             # load this : AnalogOutputs
0x000000d5   ldc.4                                            # 4
0x000000d6   newarr                                           # allocate float[]
0x000000d7   stfld     0x00000003                             # store field offset : float[]
0x000000d9   ldloc     0x00000000                             # load this : AnalogOutputs
0x000000db   ldc.4                                            # 4
0x000000dc   newarr                                           # allocate float[]
0x000000dd   stfld     0x00000002                             # store field input : float[]
0x000000df   ret       0x00000000                             # return from routine

# Method AnalogOutputs.SetGain
0x000000e1   ldloc     0x00000000                             # load this : AnalogOutputs
0x000000e3   ldfld     0x00000000                             # load field gain : float[]
0x000000e5   ldc.0                                            # 0
0x000000e6   ldloc     0x00000001                             # load 0th argument gainA : float
0x000000e8   stelem                                           # store element of float[]
0x000000e9   ldloc     0x00000000                             # load this : AnalogOutputs
0x000000eb   ldfld     0x00000000                             # load field gain : float[]
0x000000ed   ldc.1                                            # 1
0x000000ee   ldloc     0x00000002                             # load 1th argument gainB : float
0x000000f0   stelem                                           # store element of float[]
0x000000f1   ldloc     0x00000000                             # load this : AnalogOutputs
0x000000f3   ldfld     0x00000000                             # load field gain : float[]
0x000000f5   ldc.2                                            # 2
0x000000f6   ldloc     0x00000003                             # load 2th argument gainC : float
0x000000f8   stelem                                           # store element of float[]
0x000000f9   ldloc     0x00000000                             # load this : AnalogOutputs
0x000000fb   ldfld     0x00000000                             # load field gain : float[]
0x000000fd   ldc.3                                            # 3
0x000000fe   ldloc     0x00000004                             # load 3th argument gainD : float
0x00000100   stelem                                           # store element of float[]
0x00000101   ret       0x00000000                             # return from routine

# Method AnalogOutputs.SetOffset
0x00000103   ldloc     0x00000000                             # load this : AnalogOutputs
0x00000105   ldfld     0x00000003                             # load field offset : float[]
0x00000107   ldc.0                                            # 0
0x00000108   ldloc     0x00000001                             # load 0th argument offsetA : float
0x0000010a   stelem                                           # store element of float[]
0x0000010b   ldloc     0x00000000                             # load this : AnalogOutputs
0x0000010d   ldfld     0x00000003                             # load field offset : float[]
0x0000010f   ldc.1                                            # 1
0x00000110   ldloc     0x00000002                             # load 1th argument offsetB : float
0x00000112   stelem                                           # store element of float[]
0x00000113   ldloc     0x00000000                             # load this : AnalogOutputs
0x00000115   ldfld     0x00000003                             # load field offset : float[]
0x00000117   ldc.2                                            # 2
0x00000118   ldloc     0x00000003                             # load 2th argument offsetC : float
0x0000011a   stelem                                           # store element of float[]
0x0000011b   ldloc     0x00000000                             # load this : AnalogOutputs
0x0000011d   ldfld     0x00000003                             # load field offset : float[]
0x0000011f   ldc.3                                            # 3
0x00000120   ldloc     0x00000004                             # load 3th argument offsetD : float
0x00000122   stelem                                           # store element of float[]
0x00000123   ret       0x00000000                             # return from routine

# Method YTheta.IsochronousTask
0x00000125   ldc       0x0000000b                             # 11
0x00000127   rld       0x002a9c00                             # get Register.Axes_1.Signals.General.DigitalInputBits : int
0x00000129   ldc.1                                            # 1
0x0000012a   and                                              # integer bitwise AND
0x0000012b   ldc.0                                            # 0
0x0000012c   ceq                                              # compare if equal
0x0000012d   rste      0x00000008   0x00238801                # set Register.Application.Variables.Booleans[TOS] : bool
0x00000130   ldc       0x0000000c                             # 12
0x00000132   rld       0x002a9c00                             # get Register.Axes_1.Signals.General.DigitalInputBits : int
0x00000134   ldc.2                                            # 2
0x00000135   and                                              # integer bitwise AND
0x00000136   ldc.1                                            # 1
0x00000137   ceq                                              # compare if equal
0x00000138   rste      0x00000008   0x00238801                # set Register.Application.Variables.Booleans[TOS] : bool
0x0000013b   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x0000013d   ldc.0                                            # 0
0x0000013e   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000141   ldc.1                                            # 1
0x00000142   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000145   call      0x00000000   0x00000003   0x00000096   # call MoveTime.Set(System.Single, System.Single)
0x00000149   ldabs     0x00000001                             # load static field settlingTimeA1 : MoveTime
0x0000014b   ldc.2                                            # 2
0x0000014c   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x0000014f   ldc.3                                            # 3
0x00000150   rlde      0x00000100   0x00238101                # get Register.Application.Parameters.Floats[TOS] : float
0x00000153   call      0x00000000   0x00000003   0x00000096   # call MoveTime.Set(System.Single, System.Single)
0x00000157   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x00000159   rld       0x0022df00                             # get Register.Axes_0.Signals.PositionController.Controllers_0.PositionError : float
0x0000015b   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x0000015d   ldc.0                                            # 0
0x0000015e   ceq                                              # compare if equal
0x0000015f   call      0x00000000   0x00000003   0x0000022b   # call MoveTime.Run(System.Single, System.Boolean)
0x00000163   ldabs     0x00000001                             # load static field settlingTimeA1 : MoveTime
0x00000165   rld       0x002adf00                             # get Register.Axes_1.Signals.PositionController.Controllers_0.PositionError : float
0x00000167   rld       0x002ab300                             # get Register.Axes_1.Signals.PathPlanner.Done : bool
0x00000169   ldc.0                                            # 0
0x0000016a   ceq                                              # compare if equal
0x0000016b   call      0x00000000   0x00000003   0x0000022b   # call MoveTime.Run(System.Single, System.Boolean)
0x0000016f   ldc.0                                            # 0
0x00000170   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x00000172   call      0x00000000   0x00000001   0x0000029d   # call MoveTime.GetMoveTime()
0x00000176   rste      0x00000020   0x00238601                # set Register.Application.Variables.Floats[TOS] : float
0x00000179   ldc.0                                            # 0
0x0000017a   ldabs     0x00000000                             # load static field settlingTimeA0 : MoveTime
0x0000017c   call      0x00000000   0x00000001   0x0000028f   # call MoveTime.IsSettled.get()
0x00000180   rste      0x00000008   0x00238801                # set Register.Application.Variables.Booleans[TOS] : bool
0x00000183   ldc.1                                            # 1
0x00000184   ldabs     0x00000001                             # load static field settlingTimeA1 : MoveTime
0x00000186   call      0x00000000   0x00000001   0x0000029d   # call MoveTime.GetMoveTime()
0x0000018a   rste      0x00000020   0x00238601                # set Register.Application.Variables.Floats[TOS] : float
0x0000018d   ldc.1                                            # 1
0x0000018e   ldabs     0x00000001                             # load static field settlingTimeA1 : MoveTime
0x00000190   call      0x00000000   0x00000001   0x0000028f   # call MoveTime.IsSettled.get()
0x00000194   rste      0x00000008   0x00238801                # set Register.Application.Variables.Booleans[TOS] : bool
0x00000197   rld       0x002aad00                             # get Register.Axes_1.Signals.PathPlanner.PositionFloat : float
0x00000199   stloc     0x00000000                             # store local variable tEnc : float
0x0000019b   rld       0x002bf000                             # get Register.Axes_1.Signals.Homing.State : HomingState
0x0000019d   ldc       0x00000014                             # 20
0x0000019f   bne       0x000001a9                             # branch if not equal
0x000001a1   rld       0x002a9a00                             # get Register.Axes_1.Signals.General.AxisState : AxisState
0x000001a3   ldc.3                                            # 3
0x000001a4   clt.i                                            # compare if less
0x000001a5   ldc.0                                            # 0
0x000001a6   ceq                                              # compare if equal
0x000001a7   br        0x000001aa                             # branch unconditionally
0x000001a9   ldc.0                                            # 0
0x000001aa   stloc     0x00000001                             # store local variable enableTMap : bool
0x000001ac   ldabs     0x00000003                             # load static field axis1Compensation : AxisCompensation
0x000001ae   ldloc     0x00000001                             # load local variable enableTMap : bool
0x000001b0   ldloc     0x00000000                             # load local variable tEnc : float
0x000001b2   call      0x00000001   0x00000004   0x000002a7   # call AxisCompensation.Run1D(System.Boolean, System.Single)
0x000001b6   stloc     0x00000002                             # store local variable compTheta : float
0x000001b8   ldloc     0x00000002                             # load local variable compTheta : float
0x000001ba   rst       0x00288200                             # set Register.Axes_1.Commands.PositionController.Encoders_0.InjectedPosition : float
0x000001bc   ldc.5                                            # 5
0x000001bd   rlde.2    0x00000008   0x00238501                # get Register.Application.Variables.Doubles[TOS] : double
0x000001c0   conv.r8.r4                                       # convert double to float
0x000001c1   stloc     0x00000003                             # store local variable xEnc : float
0x000001c3   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x000001c5   stloc     0x00000004                             # store local variable yEnc : float
0x000001c7   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x000001c9   ldc       0x00000014                             # 20
0x000001cb   bne       0x000001db                             # branch if not equal
0x000001cd   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x000001cf   ldc.3                                            # 3
0x000001d0   blt.i     0x000001db                             # branch if less
0x000001d2   ldc.5                                            # 5
0x000001d3   rlde      0x00000008   0x00238701                # get Register.Application.Variables.Integers[TOS] : int
0x000001d6   ldc       0x00000014                             # 20
0x000001d8   ceq                                              # compare if equal
0x000001d9   br        0x000001dc                             # branch unconditionally
0x000001db   ldc.0                                            # 0
0x000001dc   stloc     0x00000005                             # store local variable enableYMap : bool
0x000001de   ldabs     0x00000002                             # load static field axis0Compensation : AxisCompensation
0x000001e0   ldloc     0x00000005                             # load local variable enableYMap : bool
0x000001e2   ldloc     0x00000003                             # load local variable xEnc : float
0x000001e4   ldloc     0x00000004                             # load local variable yEnc : float
0x000001e6   call      0x00000001   0x00000005   0x00000414   # call AxisCompensation.Run2D(System.Boolean, System.Single, System.Single)
0x000001ea   stloc     0x00000006                             # store local variable compY : float
0x000001ec   ldloc     0x00000006                             # load local variable compY : float
0x000001ee   rst       0x00208200                             # set Register.Axes_0.Commands.PositionController.Encoders_0.InjectedPosition : float
0x000001f0   ldc.5                                            # 5
0x000001f1   rlde      0x00000020   0x00238601                # get Register.Application.Variables.Floats[TOS] : float
0x000001f4   stloc     0x00000007                             # store local variable xAcc : float
0x000001f6   rld       0x0022af00                             # get Register.Axes_0.Signals.PathPlanner.Acceleration : float
0x000001f8   stloc     0x00000008                             # store local variable yAcc : float
0x000001fa   ldc.5                                            # 5
0x000001fb   rlde      0x00000008   0x00238701                # get Register.Application.Variables.Integers[TOS] : int
0x000001fe   ldc       0x00000014                             # 20
0x00000200   beq       0x00000206                             # branch if equal
0x00000202   ldc       0x00000000                             # 0
0x00000204   br        0x0000020b                             # branch unconditionally
0x00000206   ldc.5                                            # 5
0x00000207   rlde.2    0x00000008   0x00238501                # get Register.Application.Variables.Doubles[TOS] : double
0x0000020a   conv.r8.r4                                       # convert double to float
0x0000020b   stloc     0x00000009                             # store local variable xPos : float
0x0000020d   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x0000020f   ldc       0x00000014                             # 20
0x00000211   beq       0x00000217                             # branch if equal
0x00000213   ldc       0x00000000                             # 0
0x00000215   br        0x0000021a                             # branch unconditionally
0x00000217   rld.2     0x0022ac01                             # get Register.Axes_0.Signals.PathPlanner.Position : double
0x00000219   conv.r8.r4                                       # convert double to float
0x0000021a   stloc     0x0000000a                             # store local variable yPos : float
0x0000021c   ldabs     0x00000004                             # load static field feedforward : AnalogOutputs
0x0000021e   ldloc     0x00000007                             # load local variable xAcc : float
0x00000220   ldloc     0x00000008                             # load local variable yAcc : float
0x00000222   ldloc     0x00000009                             # load local variable xPos : float
0x00000224   ldloc     0x0000000a                             # load local variable yPos : float
0x00000226   call      0x00000003   0x00000008   0x0000053e   # call AnalogOutputs.SetAnalogOutputs(System.Single, System.Single, System.Single, System.Single)
0x0000022a   halt                                             # return from Tama task routine

# Method MoveTime.Run
0x0000022b   ldloc     0x00000000                             # load this : MoveTime
0x0000022d   call      0x00000000   0x00000001   0x0000028f   # call MoveTime.IsSettled.get()
0x00000231   ldloc     0x00000002                             # load 1th argument isMoving : bool
0x00000233   and                                              # integer bitwise AND
0x00000234   brfalse   0x00000242                             # branch if zero
0x00000236   ldloc     0x00000000                             # load this : MoveTime
0x00000238   ldc.0                                            # 0
0x00000239   call      0x00000000   0x00000002   0x00000295   # call MoveTime.IsSettled.set(System.Boolean)
0x0000023d   ldloc     0x00000000                             # load this : MoveTime
0x0000023f   ldc.0                                            # 0
0x00000240   stfld     0x00000003                             # store field moveTimer : int
0x00000242   ldloc     0x00000000                             # load this : MoveTime
0x00000244   call      0x00000000   0x00000001   0x0000028f   # call MoveTime.IsSettled.get()
0x00000248   brtrue    0x0000028d                             # branch if not zero
0x0000024a   ldloc     0x00000000                             # load this : MoveTime
0x0000024c   ldloc     0x00000000                             # load this : MoveTime
0x0000024e   ldfld     0x00000003                             # load field moveTimer : int
0x00000250   ldc.1                                            # 1
0x00000251   add.i4                                           # integer addition
0x00000252   stfld     0x00000003                             # store field moveTimer : int
0x00000254   ldloc     0x00000001                             # load 0th argument positionError : float
0x00000256   ldloc     0x00000000                             # load this : MoveTime
0x00000258   ldfld     0x00000002                             # load field settlingWindow : float
0x0000025a   bge.f     0x00000288                             # branch if greater or equal
0x0000025c   ldloc     0x00000001                             # load 0th argument positionError : float
0x0000025e   ldloc     0x00000000                             # load this : MoveTime
0x00000260   ldfld     0x00000002                             # load field settlingWindow : float
0x00000262   neg.r4                                           # float negation
0x00000263   ble.f     0x00000288                             # branch if less than or equal
0x00000265   ldloc     0x00000000                             # load this : MoveTime
0x00000267   ldloc     0x00000000                             # load this : MoveTime
0x00000269   ldfld     0x00000004                             # load field settlingTimer : int
0x0000026b   ldc.1                                            # 1
0x0000026c   add.i4                                           # integer addition
0x0000026d   stfld     0x00000004                             # store field settlingTimer : int
0x0000026f   ldloc     0x00000000                             # load this : MoveTime
0x00000271   ldloc     0x00000000                             # load this : MoveTime
0x00000273   ldfld     0x00000004                             # load field settlingTimer : int
0x00000275   ldloc     0x00000000                             # load this : MoveTime
0x00000277   ldfld     0x00000000                             # load field minSettleDuration : int
0x00000279   ble.i     0x00000281                             # branch if less than or equal
0x0000027b   ldloc     0x00000002                             # load 1th argument isMoving : bool
0x0000027d   ldc.0                                            # 0
0x0000027e   ceq                                              # compare if equal
0x0000027f   br        0x00000282                             # branch unconditionally
0x00000281   ldc.0                                            # 0
0x00000282   call      0x00000000   0x00000002   0x00000295   # call MoveTime.IsSettled.set(System.Boolean)
0x00000286   ret       0x00000000                             # return from routine
0x00000288   ldloc     0x00000000                             # load this : MoveTime
0x0000028a   ldc.0                                            # 0
0x0000028b   stfld     0x00000004                             # store field settlingTimer : int
0x0000028d   ret       0x00000000                             # return from routine

# Method MoveTime.IsSettled.get
0x0000028f   ldloc     0x00000000                             # load this : MoveTime
0x00000291   ldfld     0x00000001                             # load field <IsSettled>k__BackingField : bool
0x00000293   ret       0x00000001                             # return from routine

# Method MoveTime.IsSettled.set
0x00000295   ldloc     0x00000000                             # load this : MoveTime
0x00000297   ldloc     0x00000001                             # load 0th argument value : bool
0x00000299   stfld     0x00000001                             # store field <IsSettled>k__BackingField : bool
0x0000029b   ret       0x00000000                             # return from routine

# Method MoveTime.GetMoveTime
0x0000029d   ldloc     0x00000000                             # load this : MoveTime
0x0000029f   ldfld     0x00000003                             # load field moveTimer : int
0x000002a1   conv.i4.r4                                       # convert int to float
0x000002a2   ldc       0x38d1b717                             # 0.0001
0x000002a4   mul.r4                                           # float multiplication
0x000002a5   ret       0x00000001                             # return from routine

# Method AxisCompensation.Run1D
0x000002a7   ldloc     0x00000000                             # load this : AxisCompensation
0x000002a9   ldloc     0x00000001                             # load 0th argument enable : bool
0x000002ab   call      0x00000001   0x00000003   0x000002be   # call AxisCompensation.StateMachine(System.Boolean)
0x000002af   stloc     0x00000003                             # store local variable gain : float
0x000002b1   ldloc     0x00000000                             # load this : AxisCompensation
0x000002b3   ldloc     0x00000002                             # load 1th argument xEnc : float
0x000002b5   call      0x00000009   0x0000000b   0x00000338   # call AxisCompensation.GetCompensation1D(System.Single)
0x000002b9   ldloc     0x00000003                             # load local variable gain : float
0x000002bb   mul.r4                                           # float multiplication
0x000002bc   ret       0x00000001                             # return from routine

# Method AxisCompensation.StateMachine
0x000002be   ldloc     0x00000000                             # load this : AxisCompensation
0x000002c0   ldfld     0x00000000                             # load field state : AxisCompensation.State
0x000002c2   stloc     0x00000002                             # store local variable local_0 : AxisCompensation.State
0x000002c4   ldloc     0x00000002                             # load local variable local_0 : AxisCompensation.State
0x000002c6   switch.   0x00000003                             # switch table
      (   0x000002cd   0x000002f7   0x00000322   )
0x000002cb   br        0x0000032d                             # branch unconditionally
0x000002cd   ldloc     0x00000001                             # load 0th argument enable : bool
0x000002cf   brfalse   0x000002de                             # branch if zero
0x000002d1   ldloc     0x00000000                             # load this : AxisCompensation
0x000002d3   ldfld     0x00000002                             # load field compGain : float
0x000002d5   ldc       0x00000000                             # 0
0x000002d7   bne       0x000002de                             # branch if not equal
0x000002d9   ldloc     0x00000000                             # load this : AxisCompensation
0x000002db   ldc.1                                            # 1
0x000002dc   stfld     0x00000000                             # store field state : AxisCompensation.State
0x000002de   ldloc     0x00000000                             # load this : AxisCompensation
0x000002e0   ldloc     0x00000000                             # load this : AxisCompensation
0x000002e2   ldfld     0x00000002                             # load field compGain : float
0x000002e4   ldc       0x3a03126e                             # 0.0005
0x000002e6   blt.f     0x000002f1                             # branch if less
0x000002e8   ldloc     0x00000000                             # load this : AxisCompensation
0x000002ea   ldfld     0x00000002                             # load field compGain : float
0x000002ec   ldc       0x3a03126e                             # 0.0005
0x000002ee   sub.r4                                           # float subtraction
0x000002ef   br        0x000002f3                             # branch unconditionally
0x000002f1   ldc       0x00000000                             # 0
0x000002f3   stfld     0x00000002                             # store field compGain : float
0x000002f5   br        0x00000332                             # branch unconditionally
0x000002f7   ldloc     0x00000001                             # load 0th argument enable : bool
0x000002f9   brfalse   0x0000031b                             # branch if zero
0x000002fb   ldloc     0x00000000                             # load this : AxisCompensation
0x000002fd   ldloc     0x00000000                             # load this : AxisCompensation
0x000002ff   ldfld     0x00000002                             # load field compGain : float
0x00000301   ldc       0x3a03126e                             # 0.0005
0x00000303   add.r4                                           # float addition
0x00000304   stfld     0x00000002                             # store field compGain : float
0x00000306   ldloc     0x00000000                             # load this : AxisCompensation
0x00000308   ldfld     0x00000002                             # load field compGain : float
0x0000030a   ldc       0x3f800000                             # 1
0x0000030c   blt.f     0x00000332                             # branch if less
0x0000030e   ldloc     0x00000000                             # load this : AxisCompensation
0x00000310   ldc       0x3f800000                             # 1
0x00000312   stfld     0x00000002                             # store field compGain : float
0x00000314   ldloc     0x00000000                             # load this : AxisCompensation
0x00000316   ldc.2                                            # 2
0x00000317   stfld     0x00000000                             # store field state : AxisCompensation.State
0x00000319   br        0x00000332                             # branch unconditionally
0x0000031b   ldloc     0x00000000                             # load this : AxisCompensation
0x0000031d   ldc.0                                            # 0
0x0000031e   stfld     0x00000000                             # store field state : AxisCompensation.State
0x00000320   br        0x00000332                             # branch unconditionally
0x00000322   ldloc     0x00000001                             # load 0th argument enable : bool
0x00000324   brtrue    0x00000332                             # branch if not zero
0x00000326   ldloc     0x00000000                             # load this : AxisCompensation
0x00000328   ldc.0                                            # 0
0x00000329   stfld     0x00000000                             # store field state : AxisCompensation.State
0x0000032b   br        0x00000332                             # branch unconditionally
0x0000032d   ldloc     0x00000000                             # load this : AxisCompensation
0x0000032f   ldc.0                                            # 0
0x00000330   stfld     0x00000000                             # store field state : AxisCompensation.State
0x00000332   ldloc     0x00000000                             # load this : AxisCompensation
0x00000334   ldfld     0x00000002                             # load field compGain : float
0x00000336   ret       0x00000001                             # return from routine

# Method AxisCompensation.GetCompensation1D
0x00000338   ldloc     0x00000000                             # load this : AxisCompensation
0x0000033a   ldfld     0x00000001                             # load field tblIdx : int
0x0000033c   stloc     0x00000009                             # store local variable local_7 : int
0x0000033e   ldloc     0x00000009                             # load local variable local_7 : int
0x00000340   ldc.1                                            # 1
0x00000341   beq       0x0000034a                             # branch if equal
0x00000343   ldloc     0x00000009                             # load local variable local_7 : int
0x00000345   ldc.2                                            # 2
0x00000346   beq       0x00000358                             # branch if equal
0x00000348   br        0x00000366                             # branch unconditionally
0x0000034a   rld       0x0040052b                             # get Register.Application.Tables.Small1.Header.Dim1.StartValue : float
0x0000034c   stloc     0x00000002                             # store local variable startValueX : float
0x0000034e   rld       0x0040052c                             # get Register.Application.Tables.Small1.Header.Dim1.Distance : float
0x00000350   stloc     0x00000003                             # store local variable distanceX : float
0x00000352   rld       0x00400529                             # get Register.Application.Tables.Small1.Header.Dim1.Size : int
0x00000354   stloc     0x00000004                             # store local variable tblSizeX : int
0x00000356   br        0x0000036a                             # branch unconditionally
0x00000358   rld       0x00400d2b                             # get Register.Application.Tables.Small2.Header.Dim1.StartValue : float
0x0000035a   stloc     0x00000002                             # store local variable startValueX : float
0x0000035c   rld       0x00400d2c                             # get Register.Application.Tables.Small2.Header.Dim1.Distance : float
0x0000035e   stloc     0x00000003                             # store local variable distanceX : float
0x00000360   rld       0x00400d29                             # get Register.Application.Tables.Small2.Header.Dim1.Size : int
0x00000362   stloc     0x00000004                             # store local variable tblSizeX : int
0x00000364   br        0x0000036a                             # branch unconditionally
0x00000366   ldc       0x00000000                             # 0
0x00000368   ret       0x00000001                             # return from routine
0x0000036a   ldloc     0x00000003                             # load local variable distanceX : float
0x0000036c   ldc       0x00000000                             # 0
0x0000036e   bgt.f     0x00000374                             # branch if greater
0x00000370   ldc       0x00000000                             # 0
0x00000372   ret       0x00000001                             # return from routine
0x00000374   ldloc     0x00000001                             # load 0th argument xEnc : float
0x00000376   ldloc     0x00000002                             # load local variable startValueX : float
0x00000378   ldloc     0x00000003                             # load local variable distanceX : float
0x0000037a   ldloc     0x00000004                             # load local variable tblSizeX : int
0x0000037c   ldloca    0x00000005                             # load home of local variable idx : int
0x0000037e   ldloca    0x00000006                             # load home of local variable offset : float
0x00000380   call      0x00000002   0x00000008   0x000003cb   # call AxisCompensation.GetIndexAndOffset(System.Single, System.Single, System.Single, System.Int32, System.Int32, System.Single)
0x00000384   ldloc     0x00000000                             # load this : AxisCompensation
0x00000386   ldfld     0x00000001                             # load field tblIdx : int
0x00000388   stloc     0x0000000a                             # store local variable local_8 : int
0x0000038a   ldloc     0x0000000a                             # load local variable local_8 : int
0x0000038c   ldc.1                                            # 1
0x0000038d   beq       0x00000396                             # branch if equal
0x0000038f   ldloc     0x0000000a                             # load local variable local_8 : int
0x00000391   ldc.2                                            # 2
0x00000392   beq       0x000003a8                             # branch if equal
0x00000394   br        0x000003ba                             # branch unconditionally
0x00000396   ldloc     0x00000005                             # load local variable idx : int
0x00000398   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x0000039b   stloc     0x00000007                             # store local variable c0 : float
0x0000039d   ldloc     0x00000005                             # load local variable idx : int
0x0000039f   ldc.1                                            # 1
0x000003a0   add.i4                                           # integer addition
0x000003a1   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x000003a4   stloc     0x00000008                             # store local variable c1 : float
0x000003a6   br        0x000003be                             # branch unconditionally
0x000003a8   ldloc     0x00000005                             # load local variable idx : int
0x000003aa   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x000003ad   stloc     0x00000007                             # store local variable c0 : float
0x000003af   ldloc     0x00000005                             # load local variable idx : int
0x000003b1   ldc.1                                            # 1
0x000003b2   add.i4                                           # integer addition
0x000003b3   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x000003b6   stloc     0x00000008                             # store local variable c1 : float
0x000003b8   br        0x000003be                             # branch unconditionally
0x000003ba   ldc       0x00000000                             # 0
0x000003bc   ret       0x00000001                             # return from routine
0x000003be   ldloc     0x00000007                             # load local variable c0 : float
0x000003c0   ldloc     0x00000006                             # load local variable offset : float
0x000003c2   ldloc     0x00000008                             # load local variable c1 : float
0x000003c4   ldloc     0x00000007                             # load local variable c0 : float
0x000003c6   sub.r4                                           # float subtraction
0x000003c7   mul.r4                                           # float multiplication
0x000003c8   add.r4                                           # float addition
0x000003c9   ret       0x00000001                             # return from routine

# Method AxisCompensation.GetIndexAndOffset
0x000003cb   ldloc     0x00000000                             # load 0th argument posAbs : float
0x000003cd   ldloc     0x00000001                             # load 1th argument startValue : float
0x000003cf   sub.r4                                           # float subtraction
0x000003d0   stloc     0x00000006                             # store local variable posRel : float
0x000003d2   ldloc     0x00000006                             # load local variable posRel : float
0x000003d4   ldloc     0x00000002                             # load 2th argument distance : float
0x000003d6   div.r4                                           # float division
0x000003d7   stloc     0x00000007                             # store local variable idxFloat : float
0x000003d9   ldloc     0x00000004                             # load 4th argument index : int*
0x000003db   ldloc     0x00000007                             # load local variable idxFloat : float
0x000003dd   floor                                            # floor
0x000003de   conv.r4.i4                                       # convert float to int
0x000003df   stind                                            # store value at address : int
0x000003e0   ldloc     0x00000004                             # load 4th argument index : int*
0x000003e2   ldind                                            # load value at address : int
0x000003e3   ldc.0                                            # 0
0x000003e4   bge.i     0x000003f1                             # branch if greater
0x000003e6   ldloc     0x00000004                             # load 4th argument index : int*
0x000003e8   ldc.0                                            # 0
0x000003e9   stind                                            # store value at address : int
0x000003ea   ldloc     0x00000005                             # load 5th argument offset : float*
0x000003ec   ldc       0x00000000                             # 0
0x000003ee   stind                                            # store value at address : float
0x000003ef   ret       0x00000000                             # return from routine
0x000003f1   ldloc     0x00000004                             # load 4th argument index : int*
0x000003f3   ldind                                            # load value at address : int
0x000003f4   ldloc     0x00000003                             # load 3th argument tblSize : int
0x000003f6   ldc.1                                            # 1
0x000003f7   sub.i4                                           # integer subtraction
0x000003f8   blt.i     0x00000408                             # branch if less
0x000003fa   ldloc     0x00000004                             # load 4th argument index : int*
0x000003fc   ldloc     0x00000003                             # load 3th argument tblSize : int
0x000003fe   ldc.2                                            # 2
0x000003ff   sub.i4                                           # integer subtraction
0x00000400   stind                                            # store value at address : int
0x00000401   ldloc     0x00000005                             # load 5th argument offset : float*
0x00000403   ldc       0x3f800000                             # 1
0x00000405   stind                                            # store value at address : float
0x00000406   ret       0x00000000                             # return from routine
0x00000408   ldloc     0x00000005                             # load 5th argument offset : float*
0x0000040a   ldloc     0x00000007                             # load local variable idxFloat : float
0x0000040c   ldloc     0x00000004                             # load 4th argument index : int*
0x0000040e   ldind                                            # load value at address : int
0x0000040f   conv.i4.r4                                       # convert int to float
0x00000410   sub.r4                                           # float subtraction
0x00000411   stind                                            # store value at address : float
0x00000412   ret       0x00000000                             # return from routine

# Method AxisCompensation.Run2D
0x00000414   ldloc     0x00000000                             # load this : AxisCompensation
0x00000416   ldloc     0x00000001                             # load 0th argument enable : bool
0x00000418   call      0x00000001   0x00000003   0x000002be   # call AxisCompensation.StateMachine(System.Boolean)
0x0000041c   stloc     0x00000004                             # store local variable gain : float
0x0000041e   ldloc     0x00000000                             # load this : AxisCompensation
0x00000420   ldloc     0x00000002                             # load 1th argument xEnc : float
0x00000422   ldloc     0x00000003                             # load 2th argument yEnc : float
0x00000424   call      0x00000013   0x00000016   0x0000042d   # call AxisCompensation.GetCompensation2D(System.Single, System.Single)
0x00000428   ldloc     0x00000004                             # load local variable gain : float
0x0000042a   mul.r4                                           # float multiplication
0x0000042b   ret       0x00000001                             # return from routine

# Method AxisCompensation.GetCompensation2D
0x0000042d   ldloc     0x00000000                             # load this : AxisCompensation
0x0000042f   ldfld     0x00000001                             # load field tblIdx : int
0x00000431   stloc     0x00000014                             # store local variable local_17 : int
0x00000433   ldloc     0x00000014                             # load local variable local_17 : int
0x00000435   ldc.1                                            # 1
0x00000436   beq       0x0000043f                             # branch if equal
0x00000438   ldloc     0x00000014                             # load local variable local_17 : int
0x0000043a   ldc.2                                            # 2
0x0000043b   beq       0x00000459                             # branch if equal
0x0000043d   br        0x00000473                             # branch unconditionally
0x0000043f   rld       0x0040052b                             # get Register.Application.Tables.Small1.Header.Dim1.StartValue : float
0x00000441   stloc     0x00000003                             # store local variable startValueX : float
0x00000443   rld       0x0040052c                             # get Register.Application.Tables.Small1.Header.Dim1.Distance : float
0x00000445   stloc     0x00000004                             # store local variable distanceX : float
0x00000447   rld       0x00400529                             # get Register.Application.Tables.Small1.Header.Dim1.Size : int
0x00000449   stloc     0x00000005                             # store local variable tblSizeX : int
0x0000044b   rld       0x0040052f                             # get Register.Application.Tables.Small1.Header.Dim2.StartValue : float
0x0000044d   stloc     0x00000006                             # store local variable startValueY : float
0x0000044f   rld       0x00400530                             # get Register.Application.Tables.Small1.Header.Dim2.Distance : float
0x00000451   stloc     0x00000007                             # store local variable distanceY : float
0x00000453   rld       0x0040052d                             # get Register.Application.Tables.Small1.Header.Dim2.Size : int
0x00000455   stloc     0x00000008                             # store local variable tblSizeY : int
0x00000457   br        0x00000477                             # branch unconditionally
0x00000459   rld       0x00400d2b                             # get Register.Application.Tables.Small2.Header.Dim1.StartValue : float
0x0000045b   stloc     0x00000003                             # store local variable startValueX : float
0x0000045d   rld       0x00400d2c                             # get Register.Application.Tables.Small2.Header.Dim1.Distance : float
0x0000045f   stloc     0x00000004                             # store local variable distanceX : float
0x00000461   rld       0x00400d29                             # get Register.Application.Tables.Small2.Header.Dim1.Size : int
0x00000463   stloc     0x00000005                             # store local variable tblSizeX : int
0x00000465   rld       0x00400d2f                             # get Register.Application.Tables.Small2.Header.Dim2.StartValue : float
0x00000467   stloc     0x00000006                             # store local variable startValueY : float
0x00000469   rld       0x00400d30                             # get Register.Application.Tables.Small2.Header.Dim2.Distance : float
0x0000046b   stloc     0x00000007                             # store local variable distanceY : float
0x0000046d   rld       0x00400d2d                             # get Register.Application.Tables.Small2.Header.Dim2.Size : int
0x0000046f   stloc     0x00000008                             # store local variable tblSizeY : int
0x00000471   br        0x00000477                             # branch unconditionally
0x00000473   ldc       0x00000000                             # 0
0x00000475   ret       0x00000001                             # return from routine
0x00000477   ldloc     0x00000004                             # load local variable distanceX : float
0x00000479   ldc       0x00000000                             # 0
0x0000047b   ble.f     0x00000483                             # branch if less than or equal
0x0000047d   ldloc     0x00000007                             # load local variable distanceY : float
0x0000047f   ldc       0x00000000                             # 0
0x00000481   bgt.f     0x00000487                             # branch if greater
0x00000483   ldc       0x00000000                             # 0
0x00000485   ret       0x00000001                             # return from routine
0x00000487   ldloc     0x00000001                             # load 0th argument xEnc : float
0x00000489   ldloc     0x00000003                             # load local variable startValueX : float
0x0000048b   ldloc     0x00000004                             # load local variable distanceX : float
0x0000048d   ldloc     0x00000005                             # load local variable tblSizeX : int
0x0000048f   ldloca    0x00000009                             # load home of local variable idxX : int
0x00000491   ldloca    0x0000000a                             # load home of local variable offsetX : float
0x00000493   call      0x00000002   0x00000008   0x000003cb   # call AxisCompensation.GetIndexAndOffset(System.Single, System.Single, System.Single, System.Int32, System.Int32, System.Single)
0x00000497   ldloc     0x00000002                             # load 1th argument yEnc : float
0x00000499   ldloc     0x00000006                             # load local variable startValueY : float
0x0000049b   ldloc     0x00000007                             # load local variable distanceY : float
0x0000049d   ldloc     0x00000008                             # load local variable tblSizeY : int
0x0000049f   ldloca    0x0000000b                             # load home of local variable idxY : int
0x000004a1   ldloca    0x0000000c                             # load home of local variable offsetY : float
0x000004a3   call      0x00000002   0x00000008   0x000003cb   # call AxisCompensation.GetIndexAndOffset(System.Single, System.Single, System.Single, System.Int32, System.Int32, System.Single)
0x000004a7   ldloc     0x00000009                             # load local variable idxX : int
0x000004a9   ldloc     0x00000008                             # load local variable tblSizeY : int
0x000004ab   mul.i4                                           # integer multiplication
0x000004ac   ldloc     0x0000000b                             # load local variable idxY : int
0x000004ae   add.i4                                           # integer addition
0x000004af   stloc     0x0000000d                             # store local variable idx : int
0x000004b1   ldloc     0x00000000                             # load this : AxisCompensation
0x000004b3   ldfld     0x00000001                             # load field tblIdx : int
0x000004b5   stloc     0x00000015                             # store local variable local_18 : int
0x000004b7   ldloc     0x00000015                             # load local variable local_18 : int
0x000004b9   ldc.1                                            # 1
0x000004ba   beq       0x000004c3                             # branch if equal
0x000004bc   ldloc     0x00000015                             # load local variable local_18 : int
0x000004be   ldc.2                                            # 2
0x000004bf   beq       0x000004eb                             # branch if equal
0x000004c1   br        0x00000513                             # branch unconditionally
0x000004c3   ldloc     0x0000000d                             # load local variable idx : int
0x000004c5   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x000004c8   stloc     0x0000000e                             # store local variable c00 : float
0x000004ca   ldloc     0x0000000d                             # load local variable idx : int
0x000004cc   ldc.1                                            # 1
0x000004cd   add.i4                                           # integer addition
0x000004ce   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x000004d1   stloc     0x0000000f                             # store local variable c01 : float
0x000004d3   ldloc     0x0000000d                             # load local variable idx : int
0x000004d5   ldloc     0x00000008                             # load local variable tblSizeY : int
0x000004d7   add.i4                                           # integer addition
0x000004d8   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x000004db   stloc     0x00000010                             # store local variable c10 : float
0x000004dd   ldloc     0x0000000d                             # load local variable idx : int
0x000004df   ldloc     0x00000008                             # load local variable tblSizeY : int
0x000004e1   add.i4                                           # integer addition
0x000004e2   ldc.1                                            # 1
0x000004e3   add.i4                                           # integer addition
0x000004e4   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x000004e7   stloc     0x00000011                             # store local variable c11 : float
0x000004e9   br        0x00000517                             # branch unconditionally
0x000004eb   ldloc     0x0000000d                             # load local variable idx : int
0x000004ed   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x000004f0   stloc     0x0000000e                             # store local variable c00 : float
0x000004f2   ldloc     0x0000000d                             # load local variable idx : int
0x000004f4   ldc.1                                            # 1
0x000004f5   add.i4                                           # integer addition
0x000004f6   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x000004f9   stloc     0x0000000f                             # store local variable c01 : float
0x000004fb   ldloc     0x0000000d                             # load local variable idx : int
0x000004fd   ldloc     0x00000008                             # load local variable tblSizeY : int
0x000004ff   add.i4                                           # integer addition
0x00000500   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x00000503   stloc     0x00000010                             # store local variable c10 : float
0x00000505   ldloc     0x0000000d                             # load local variable idx : int
0x00000507   ldloc     0x00000008                             # load local variable tblSizeY : int
0x00000509   add.i4                                           # integer addition
0x0000050a   ldc.1                                            # 1
0x0000050b   add.i4                                           # integer addition
0x0000050c   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x0000050f   stloc     0x00000011                             # store local variable c11 : float
0x00000511   br        0x00000517                             # branch unconditionally
0x00000513   ldc       0x00000000                             # 0
0x00000515   ret       0x00000001                             # return from routine
0x00000517   ldloc     0x0000000e                             # load local variable c00 : float
0x00000519   ldloc     0x0000000a                             # load local variable offsetX : float
0x0000051b   ldloc     0x00000010                             # load local variable c10 : float
0x0000051d   ldloc     0x0000000e                             # load local variable c00 : float
0x0000051f   sub.r4                                           # float subtraction
0x00000520   mul.r4                                           # float multiplication
0x00000521   add.r4                                           # float addition
0x00000522   stloc     0x00000012                             # store local variable x0 : float
0x00000524   ldloc     0x0000000f                             # load local variable c01 : float
0x00000526   ldloc     0x0000000a                             # load local variable offsetX : float
0x00000528   ldloc     0x00000011                             # load local variable c11 : float
0x0000052a   ldloc     0x0000000f                             # load local variable c01 : float
0x0000052c   sub.r4                                           # float subtraction
0x0000052d   mul.r4                                           # float multiplication
0x0000052e   add.r4                                           # float addition
0x0000052f   stloc     0x00000013                             # store local variable x1 : float
0x00000531   ldloc     0x00000012                             # load local variable x0 : float
0x00000533   ldloc     0x0000000c                             # load local variable offsetY : float
0x00000535   ldloc     0x00000013                             # load local variable x1 : float
0x00000537   ldloc     0x00000012                             # load local variable x0 : float
0x00000539   sub.r4                                           # float subtraction
0x0000053a   mul.r4                                           # float multiplication
0x0000053b   add.r4                                           # float addition
0x0000053c   ret       0x00000001                             # return from routine

# Method AnalogOutputs.SetAnalogOutputs
0x0000053e   ldloc     0x00000000                             # load this : AnalogOutputs
0x00000540   ldfld     0x00000002                             # load field input : float[]
0x00000542   ldc.0                                            # 0
0x00000543   ldloc     0x00000001                             # load 0th argument A : float
0x00000545   stelem                                           # store element of float[]
0x00000546   ldloc     0x00000000                             # load this : AnalogOutputs
0x00000548   ldfld     0x00000002                             # load field input : float[]
0x0000054a   ldc.1                                            # 1
0x0000054b   ldloc     0x00000002                             # load 1th argument B : float
0x0000054d   stelem                                           # store element of float[]
0x0000054e   ldloc     0x00000000                             # load this : AnalogOutputs
0x00000550   ldfld     0x00000002                             # load field input : float[]
0x00000552   ldc.2                                            # 2
0x00000553   ldloc     0x00000003                             # load 2th argument C : float
0x00000555   stelem                                           # store element of float[]
0x00000556   ldloc     0x00000000                             # load this : AnalogOutputs
0x00000558   ldfld     0x00000002                             # load field input : float[]
0x0000055a   ldc.3                                            # 3
0x0000055b   ldloc     0x00000004                             # load 3th argument D : float
0x0000055d   stelem                                           # store element of float[]
0x0000055e   ldc.0                                            # 0
0x0000055f   stloc     0x00000005                             # store local variable ii : int
0x00000561   br        0x000005a3                             # branch unconditionally
0x00000563   ldloc     0x00000000                             # load this : AnalogOutputs
0x00000565   ldfld     0x00000002                             # load field input : float[]
0x00000567   ldloc     0x00000005                             # load local variable ii : int
0x00000569   ldelem                                           # load element of float[]
0x0000056a   ldloc     0x00000000                             # load this : AnalogOutputs
0x0000056c   ldfld     0x00000000                             # load field gain : float[]
0x0000056e   ldloc     0x00000005                             # load local variable ii : int
0x00000570   ldelem                                           # load element of float[]
0x00000571   mul.r4                                           # float multiplication
0x00000572   ldloc     0x00000000                             # load this : AnalogOutputs
0x00000574   ldfld     0x00000003                             # load field offset : float[]
0x00000576   ldloc     0x00000005                             # load local variable ii : int
0x00000578   ldelem                                           # load element of float[]
0x00000579   add.r4                                           # float addition
0x0000057a   stloc     0x00000006                             # store local variable output : float
0x0000057c   ldloc     0x00000000                             # load this : AnalogOutputs
0x0000057e   ldfld     0x00000001                             # load field axisIdx : int
0x00000580   stloc     0x00000007                             # store local variable local_2 : int
0x00000582   ldloc     0x00000007                             # load local variable local_2 : int
0x00000584   brfalse   0x0000058d                             # branch if zero
0x00000586   ldloc     0x00000007                             # load local variable local_2 : int
0x00000588   ldc.1                                            # 1
0x00000589   beq       0x00000596                             # branch if equal
0x0000058b   br        0x0000059d                             # branch unconditionally
0x0000058d   ldloc     0x00000005                             # load local variable ii : int
0x0000058f   ldloc     0x00000006                             # load local variable output : float
0x00000591   rste      0x00000004   0x0023d901                # set Register.Axes_0.Commands.OptionModule.AnalogOut[TOS] : float
0x00000594   br        0x0000059d                             # branch unconditionally
0x00000596   ldloc     0x00000005                             # load local variable ii : int
0x00000598   ldloc     0x00000006                             # load local variable output : float
0x0000059a   rste      0x00000004   0x002bd901                # set Register.Axes_1.Commands.OptionModule.AnalogOut[TOS] : float
0x0000059d   ldloc     0x00000005                             # load local variable ii : int
0x0000059f   ldc.1                                            # 1
0x000005a0   add.i4                                           # integer addition
0x000005a1   stloc     0x00000005                             # store local variable ii : int
0x000005a3   ldloc     0x00000005                             # load local variable ii : int
0x000005a5   ldloc     0x00000000                             # load this : AnalogOutputs
0x000005a7   ldfld     0x00000002                             # load field input : float[]
0x000005a9   ldind                                            # load vector length
0x000005aa   blt.i     0x00000563                             # branch if less
0x000005ac   ret       0x00000000                             # return from routine
