# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: GantryEncoderAlignmentDemo, C:\Skyverse_Dragon\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 30.11.2021 13:35:05
# Target register layout (RLID): 0x00000013
# Space for static fields: 0x00000001
# Maximal stack size: 0x0000002d
# Init entry point                 : 0x00000001 (local stack size = 0x00000000)
# Task entry point AsynchronousMain: 0x00000000 (local stack size = 0x00000000)
# Task entry point IsochronousMain : 0x00000020 (local stack size = 0x00000000)
# Task entry point Axis1Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Coupling   : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Coupling   : 0x00000000 (local stack size = 0x00000000)
0x00000000   halt                                             # precautious halt

# Method GantryEncoderAlignmentDemo..cctor
0x00000001   new       0x00000010   0x00000000                # allocate space on the heap for a new instance of class GantryEncoderAlignment
0x00000004   call      0x00000000   0x00000001   0x00000011   # call GantryEncoderAlignment..ctor()
0x00000008   stabs     0x00000000                             # store static field encoderAlignment : GantryEncoderAlignment
0x0000000a   ldc       0x0000001f                             # 31
0x0000000c   ldc.1                                            # 1
0x0000000d   rste      0x00000008   0x00238701                # set Register.Application.Variables.Integers[TOS] : int
0x00000010   halt                                             # return from Tama task routine

# Method GantryEncoderAlignment..ctor
0x00000011   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000013   call      0x00000000   0x00000001   0x0000001e   # call System.Object..ctor()
0x00000017   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000019   ldc.0                                            # 0
0x0000001a   stfld     0x00000002                             # store field mainState : GantryEncoderAlignment.MainState
0x0000001c   ret       0x00000000                             # return from routine

# Method System.Object..ctor
0x0000001e   ret       0x00000000                             # return from routine

# Method GantryEncoderAlignmentDemo.IsochronousTask
0x00000020   ldabs     0x00000000                             # load static field encoderAlignment : GantryEncoderAlignment
0x00000022   rld       0x00237d00                             # get Register.Application.TamaControl.IsochronousMainCommand : int
0x00000024   call      0x00000002   0x00000004   0x0000002b   # call GantryEncoderAlignment.Run(GantryEncoderAlignment.Command)
0x00000028   rst       0x00237d00                             # set Register.Application.TamaControl.IsochronousMainCommand : int
0x0000002a   halt                                             # return from Tama task routine

# Method GantryEncoderAlignment.Run
0x0000002b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000002d   ldfld     0x00000002                             # load field mainState : GantryEncoderAlignment.MainState
0x0000002f   stloc     0x00000002                             # store local variable local_0 : GantryEncoderAlignment.MainState
0x00000031   ldloc     0x00000002                             # load local variable local_0 : GantryEncoderAlignment.MainState
0x00000033   switch.   0x00000004                             # switch table
      (   0x0000003b   0x000000cd   0x000000f5   0x0000012e   )
0x00000039   br        0x00000152                             # branch unconditionally
0x0000003b   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x0000003d   ldc.3                                            # 3
0x0000003e   blt.i     0x00000049                             # branch if less
0x00000040   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x00000042   ldc       0x00000014                             # 20
0x00000044   beq       0x00000049                             # branch if equal
0x00000046   ldc.0                                            # 0
0x00000047   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x00000049   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x0000004b   ldc.1                                            # 1
0x0000004c   sub.i4                                           # integer subtraction
0x0000004d   switch.   0x00000004                             # switch table
      (   0x00000055   0x00000055   0x00000062   0x000000a9   )
0x00000053   br        0x00000152                             # branch unconditionally
0x00000055   ldc.0                                            # 0
0x00000056   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x00000058   ldc.1                                            # 1
0x00000059   rst       0x0023ec00                             # set Register.Axes_0.Commands.Homing.Command : HomingCommand
0x0000005b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000005d   ldc.1                                            # 1
0x0000005e   stfld     0x00000002                             # store field mainState : GantryEncoderAlignment.MainState
0x00000060   br        0x00000152                             # branch unconditionally
0x00000062   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x00000064   ldc       0x00000014                             # 20
0x00000066   bne       0x000000a4                             # branch if not equal
0x00000068   ldc.0                                            # 0
0x00000069   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x0000006b   rld       0x00201700                             # get Register.Axes_0.Parameters.PathPlanner.PositionMaximum : float
0x0000006d   rld       0x00201800                             # get Register.Axes_0.Parameters.PathPlanner.PositionMinimum : float
0x0000006f   sub.r4                                           # float subtraction
0x00000070   stloc     0x00000003                             # store local variable delta : float
0x00000072   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000074   rld       0x00201700                             # get Register.Axes_0.Parameters.PathPlanner.PositionMaximum : float
0x00000076   ldc       0x3f666666                             # 0.9
0x00000078   ldloc     0x00000003                             # load local variable delta : float
0x0000007a   mul.r4                                           # float multiplication
0x0000007b   sub.r4                                           # float subtraction
0x0000007c   stfld     0x00000006                             # store field scanStartPosition : float
0x0000007e   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000080   rld       0x00201800                             # get Register.Axes_0.Parameters.PathPlanner.PositionMinimum : float
0x00000082   ldc       0x3f666666                             # 0.9
0x00000084   ldloc     0x00000003                             # load local variable delta : float
0x00000086   mul.r4                                           # float multiplication
0x00000087   add.r4                                           # float addition
0x00000088   stfld     0x0000000d                             # store field scanEndPosition : float
0x0000008a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000008c   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000008e   ldfld     0x0000000d                             # load field scanEndPosition : float
0x00000090   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000092   ldfld     0x00000006                             # load field scanStartPosition : float
0x00000094   sub.r4                                           # float subtraction
0x00000095   ldc       0x41f00000                             # 30
0x00000097   div.r4                                           # float division
0x00000098   stfld     0x0000000c                             # store field scanVelocity : float
0x0000009a   ldc.0                                            # 0
0x0000009b   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x0000009d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000009f   ldc.2                                            # 2
0x000000a0   stfld     0x00000002                             # store field mainState : GantryEncoderAlignment.MainState
0x000000a2   br        0x00000152                             # branch unconditionally
0x000000a4   ldc.0                                            # 0
0x000000a5   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x000000a7   br        0x00000152                             # branch unconditionally
0x000000a9   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x000000ab   ldc       0x00000014                             # 20
0x000000ad   bne       0x000000c8                             # branch if not equal
0x000000af   ldc.7                                            # 7
0x000000b0   rlde      0x00000008   0x00238401                # get Register.Application.Parameters.Booleans[TOS] : bool
0x000000b3   brfalse   0x000000c8                             # branch if zero
0x000000b5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000000b7   rld       0x0040052b                             # get Register.Application.Tables.Small1.Header.Dim1.StartValue : float
0x000000b9   stfld     0x00000006                             # store field scanStartPosition : float
0x000000bb   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000000bd   rld       0x0040052c                             # get Register.Application.Tables.Small1.Header.Dim1.Distance : float
0x000000bf   stfld     0x00000001                             # store field nodeSpacing : float
0x000000c1   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000000c3   ldc.3                                            # 3
0x000000c4   stfld     0x00000002                             # store field mainState : GantryEncoderAlignment.MainState
0x000000c6   br        0x00000152                             # branch unconditionally
0x000000c8   ldc.0                                            # 0
0x000000c9   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x000000cb   br        0x00000152                             # branch unconditionally
0x000000cd   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x000000cf   ldc       0x00000014                             # 20
0x000000d1   bne       0x000000ea                             # branch if not equal
0x000000d3   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x000000d5   ldc.1                                            # 1
0x000000d6   bne       0x000000db                             # branch if not equal
0x000000d8   ldc.3                                            # 3
0x000000d9   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x000000db   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x000000dd   ldc.2                                            # 2
0x000000de   bne       0x000000e3                             # branch if not equal
0x000000e0   ldc.4                                            # 4
0x000000e1   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x000000e3   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000000e5   ldc.0                                            # 0
0x000000e6   stfld     0x00000002                             # store field mainState : GantryEncoderAlignment.MainState
0x000000e8   br        0x00000152                             # branch unconditionally
0x000000ea   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x000000ec   brtrue    0x00000152                             # branch if not zero
0x000000ee   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000000f0   ldc.0                                            # 0
0x000000f1   stfld     0x00000002                             # store field mainState : GantryEncoderAlignment.MainState
0x000000f3   br        0x00000152                             # branch unconditionally
0x000000f5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000000f7   call      0x00000003   0x00000004   0x00000156   # call GantryEncoderAlignment.Scan()
0x000000fb   brfalse   0x00000152                             # branch if zero
0x000000fd   ldc.7                                            # 7
0x000000fe   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000100   ldfld     0x00000009                             # load field scanSucceeded : bool
0x00000102   rste      0x00000008   0x00238401                # set Register.Application.Parameters.Booleans[TOS] : bool
0x00000105   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000107   ldfld     0x00000009                             # load field scanSucceeded : bool
0x00000109   brfalse   0x00000124                             # branch if zero
0x0000010b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000010d   ldfld     0x00000006                             # load field scanStartPosition : float
0x0000010f   rst       0x0040052b                             # set Register.Application.Tables.Small1.Header.Dim1.StartValue : float
0x00000111   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000113   ldfld     0x00000001                             # load field nodeSpacing : float
0x00000115   rst       0x0040052c                             # set Register.Application.Tables.Small1.Header.Dim1.Distance : float
0x00000117   ldc       0x00002710                             # 10000
0x00000119   rst       0x00400529                             # set Register.Application.Tables.Small1.Header.Dim1.Size : int
0x0000011b   ldc.1                                            # 1
0x0000011c   rst       0x00400525                             # set Register.Application.Tables.Small1.Header.RowSize : int
0x0000011e   ldc.1                                            # 1
0x0000011f   rst       0x00400501                             # set Register.Application.Tables.Small1.Header.Persistent : bool
0x00000121   ldc.1                                            # 1
0x00000122   rst       0x00400300                             # set Register.Application.Tables.Small1.Command : TableCommand
0x00000124   ldc.4                                            # 4
0x00000125   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x00000127   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000129   ldc.0                                            # 0
0x0000012a   stfld     0x00000002                             # store field mainState : GantryEncoderAlignment.MainState
0x0000012c   br        0x00000152                             # branch unconditionally
0x0000012e   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000130   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x00000132   ldc.4                                            # 4
0x00000133   bne       0x00000143                             # branch if not equal
0x00000135   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x00000137   ldc       0x00000014                             # 20
0x00000139   bne       0x00000143                             # branch if not equal
0x0000013b   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x0000013d   ldc.3                                            # 3
0x0000013e   clt.i                                            # compare if less
0x0000013f   ldc.0                                            # 0
0x00000140   ceq                                              # compare if equal
0x00000141   br        0x00000144                             # branch unconditionally
0x00000143   ldc.0                                            # 0
0x00000144   call      0x00000003   0x00000005   0x0000036b   # call GantryEncoderAlignment.Apply(System.Boolean)
0x00000148   brfalse   0x00000152                             # branch if zero
0x0000014a   ldc.0                                            # 0
0x0000014b   stloc     0x00000001                             # store 0th argument command : GantryEncoderAlignment.Command
0x0000014d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000014f   ldc.0                                            # 0
0x00000150   stfld     0x00000002                             # store field mainState : GantryEncoderAlignment.MainState
0x00000152   ldloc     0x00000001                             # load 0th argument command : GantryEncoderAlignment.Command
0x00000154   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.Scan
0x00000156   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x00000158   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000015a   ldfld     0x00000006                             # load field scanStartPosition : float
0x0000015c   sub.r4                                           # float subtraction
0x0000015d   stloc     0x00000001                             # store local variable scanPosition : float
0x0000015f   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000161   ldfld     0x00000004                             # load field scanState : GantryEncoderAlignment.ScanState
0x00000163   stloc     0x00000002                             # store local variable local_1 : GantryEncoderAlignment.ScanState
0x00000165   ldloc     0x00000002                             # load local variable local_1 : GantryEncoderAlignment.ScanState
0x00000167   switch.   0x00000005                             # switch table
      (   0x00000170   0x000001b1   0x000001de   0x00000288   0x00000329   )
0x0000016e   br        0x00000332                             # branch unconditionally
0x00000170   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000172   ldc.0                                            # 0
0x00000173   stfld     0x00000009                             # store field scanSucceeded : bool
0x00000175   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000177   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x00000179   stfld     0x00000008                             # store field initialPosition : float
0x0000017b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000017d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000017f   ldfld     0x0000000d                             # load field scanEndPosition : float
0x00000181   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000183   ldfld     0x00000006                             # load field scanStartPosition : float
0x00000185   sub.r4                                           # float subtraction
0x00000186   ldc       0x461c3c00                             # 9999
0x00000188   div.r4                                           # float division
0x00000189   stfld     0x00000001                             # store field nodeSpacing : float
0x0000018b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000018d   ldfld     0x00000006                             # load field scanStartPosition : float
0x0000018f   conv.r4.r8                                       # convert float to double
0x00000190   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x00000192   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000194   ldfld     0x0000000c                             # load field scanVelocity : float
0x00000196   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x00000198   ldc       0x00000042                             # 66
0x0000019a   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x0000019c   ldc       0x00000000                             # 0
0x0000019e   rst       0x00228e00                             # set Register.Axes_0.Commands.CurrentController.InjectedIq : float
0x000001a0   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000001a2   rld.2     0x002ab901                             # get Register.Axes_1.Signals.PositionController.Encoders_0.Position : double
0x000001a4   rld.2     0x0022b901                             # get Register.Axes_0.Signals.PositionController.Encoders_0.Position : double
0x000001a6   sub.r8                                           # double subtraction
0x000001a7   conv.r8.r4                                       # convert double to float
0x000001a8   stfld     0x0000000a                             # store field initialOffset : float
0x000001aa   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000001ac   ldc.1                                            # 1
0x000001ad   stfld     0x00000004                             # store field scanState : GantryEncoderAlignment.ScanState
0x000001af   br        0x00000332                             # branch unconditionally
0x000001b1   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000001b3   brfalse   0x00000332                             # branch if zero
0x000001b5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000001b7   ldfld     0x0000000d                             # load field scanEndPosition : float
0x000001b9   conv.r4.r8                                       # convert float to double
0x000001ba   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x000001bc   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000001be   ldfld     0x0000000c                             # load field scanVelocity : float
0x000001c0   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x000001c2   ldc       0x00000042                             # 66
0x000001c4   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x000001c6   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000001c8   ldc.0                                            # 0
0x000001c9   stfld     0x00000005                             # store field scanIdx : int
0x000001cb   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000001cd   ldc       0x00000000                             # 0
0x000001cf   stfld     0x0000000e                             # store field curSum : float
0x000001d1   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000001d3   ldc       0x00000000                             # 0
0x000001d5   stfld     0x00000000                             # store field cntSum : float
0x000001d7   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000001d9   ldc.2                                            # 2
0x000001da   stfld     0x00000004                             # store field scanState : GantryEncoderAlignment.ScanState
0x000001dc   br        0x00000332                             # branch unconditionally
0x000001de   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000001e0   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000001e2   ldfld     0x0000000e                             # load field curSum : float
0x000001e4   rld.2     0x002ab901                             # get Register.Axes_1.Signals.PositionController.Encoders_0.Position : double
0x000001e6   rld.2     0x0022b901                             # get Register.Axes_0.Signals.PositionController.Encoders_0.Position : double
0x000001e8   sub.r8                                           # double subtraction
0x000001e9   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000001eb   ldfld     0x0000000a                             # load field initialOffset : float
0x000001ed   conv.r4.r8                                       # convert float to double
0x000001ee   sub.r8                                           # double subtraction
0x000001ef   conv.r8.r4                                       # convert double to float
0x000001f0   add.r4                                           # float addition
0x000001f1   stfld     0x0000000e                             # store field curSum : float
0x000001f3   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000001f5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000001f7   ldfld     0x00000000                             # load field cntSum : float
0x000001f9   ldc       0x3f800000                             # 1
0x000001fb   add.r4                                           # float addition
0x000001fc   stfld     0x00000000                             # store field cntSum : float
0x000001fe   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000200   ldfld     0x00000005                             # load field scanIdx : int
0x00000202   conv.i4.r4                                       # convert int to float
0x00000203   ldc       0x3f000000                             # 0.5
0x00000205   add.r4                                           # float addition
0x00000206   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000208   ldfld     0x00000001                             # load field nodeSpacing : float
0x0000020a   mul.r4                                           # float multiplication
0x0000020b   ldloc     0x00000001                             # load local variable scanPosition : float
0x0000020d   ble.f     0x00000213                             # branch if less than or equal
0x0000020f   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x00000211   brfalse   0x00000332                             # branch if zero
0x00000213   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000215   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000217   ldfld     0x00000005                             # load field scanIdx : int
0x00000219   ldc       0x3e800000                             # 0.25
0x0000021b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000021d   ldfld     0x0000000e                             # load field curSum : float
0x0000021f   mul.r4                                           # float multiplication
0x00000220   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000222   ldfld     0x00000000                             # load field cntSum : float
0x00000224   div.r4                                           # float division
0x00000225   ldc.0                                            # 0
0x00000226   call      0x00000000   0x00000004   0x0000033a   # call GantryEncoderAlignment.SetCompAtNode(System.Int32, System.Single, System.Boolean)
0x0000022a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000022c   ldc       0x00000000                             # 0
0x0000022e   stfld     0x0000000e                             # store field curSum : float
0x00000230   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000232   ldc       0x00000000                             # 0
0x00000234   stfld     0x00000000                             # store field cntSum : float
0x00000236   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000238   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000023a   ldfld     0x00000005                             # load field scanIdx : int
0x0000023c   ldc.1                                            # 1
0x0000023d   add.i4                                           # integer addition
0x0000023e   stloc     0x00000003                             # store local variable local_2 : int
0x00000240   ldloc     0x00000003                             # load local variable local_2 : int
0x00000242   stfld     0x00000005                             # store field scanIdx : int
0x00000244   ldloc     0x00000003                             # load local variable local_2 : int
0x00000246   ldc       0x00002710                             # 10000
0x00000248   blt.i     0x00000278                             # branch if less
0x0000024a   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x0000024c   brfalse   0x00000278                             # branch if zero
0x0000024e   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000250   ldc       0x0000270f                             # 9999
0x00000252   stfld     0x00000005                             # store field scanIdx : int
0x00000254   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000256   ldfld     0x00000006                             # load field scanStartPosition : float
0x00000258   conv.r4.r8                                       # convert float to double
0x00000259   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x0000025b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000025d   ldfld     0x0000000c                             # load field scanVelocity : float
0x0000025f   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x00000261   ldc       0x00000042                             # 66
0x00000263   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x00000265   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000267   ldc       0x00000000                             # 0
0x00000269   stfld     0x0000000e                             # store field curSum : float
0x0000026b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000026d   ldc       0x00000000                             # 0
0x0000026f   stfld     0x00000000                             # store field cntSum : float
0x00000271   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000273   ldc.3                                            # 3
0x00000274   stfld     0x00000004                             # store field scanState : GantryEncoderAlignment.ScanState
0x00000276   br        0x00000332                             # branch unconditionally
0x00000278   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x0000027a   brfalse   0x00000332                             # branch if zero
0x0000027c   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000027e   ldc.0                                            # 0
0x0000027f   stfld     0x00000009                             # store field scanSucceeded : bool
0x00000281   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000283   ldc.0                                            # 0
0x00000284   stfld     0x00000004                             # store field scanState : GantryEncoderAlignment.ScanState
0x00000286   br        0x00000332                             # branch unconditionally
0x00000288   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000028a   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000028c   ldfld     0x0000000e                             # load field curSum : float
0x0000028e   rld.2     0x002ab901                             # get Register.Axes_1.Signals.PositionController.Encoders_0.Position : double
0x00000290   rld.2     0x0022b901                             # get Register.Axes_0.Signals.PositionController.Encoders_0.Position : double
0x00000292   sub.r8                                           # double subtraction
0x00000293   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000295   ldfld     0x0000000a                             # load field initialOffset : float
0x00000297   conv.r4.r8                                       # convert float to double
0x00000298   sub.r8                                           # double subtraction
0x00000299   conv.r8.r4                                       # convert double to float
0x0000029a   add.r4                                           # float addition
0x0000029b   stfld     0x0000000e                             # store field curSum : float
0x0000029d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000029f   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000002a1   ldfld     0x00000000                             # load field cntSum : float
0x000002a3   ldc       0x3f800000                             # 1
0x000002a5   add.r4                                           # float addition
0x000002a6   stfld     0x00000000                             # store field cntSum : float
0x000002a8   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000002aa   ldfld     0x00000005                             # load field scanIdx : int
0x000002ac   conv.i4.r4                                       # convert int to float
0x000002ad   ldc       0x3f000000                             # 0.5
0x000002af   sub.r4                                           # float subtraction
0x000002b0   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000002b2   ldfld     0x00000001                             # load field nodeSpacing : float
0x000002b4   mul.r4                                           # float multiplication
0x000002b5   ldloc     0x00000001                             # load local variable scanPosition : float
0x000002b7   bge.f     0x000002bd                             # branch if greater
0x000002b9   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000002bb   brfalse   0x00000332                             # branch if zero
0x000002bd   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000002bf   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000002c1   ldfld     0x00000005                             # load field scanIdx : int
0x000002c3   ldc       0x3e800000                             # 0.25
0x000002c5   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000002c7   ldfld     0x0000000e                             # load field curSum : float
0x000002c9   mul.r4                                           # float multiplication
0x000002ca   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000002cc   ldfld     0x00000000                             # load field cntSum : float
0x000002ce   div.r4                                           # float division
0x000002cf   ldc.1                                            # 1
0x000002d0   call      0x00000000   0x00000004   0x0000033a   # call GantryEncoderAlignment.SetCompAtNode(System.Int32, System.Single, System.Boolean)
0x000002d4   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000002d6   ldc       0x00000000                             # 0
0x000002d8   stfld     0x0000000e                             # store field curSum : float
0x000002da   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000002dc   ldc       0x00000000                             # 0
0x000002de   stfld     0x00000000                             # store field cntSum : float
0x000002e0   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000002e2   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000002e4   ldfld     0x00000005                             # load field scanIdx : int
0x000002e6   ldc.1                                            # 1
0x000002e7   sub.i4                                           # integer subtraction
0x000002e8   stloc     0x00000003                             # store local variable local_2 : int
0x000002ea   ldloc     0x00000003                             # load local variable local_2 : int
0x000002ec   stfld     0x00000005                             # store field scanIdx : int
0x000002ee   ldloc     0x00000003                             # load local variable local_2 : int
0x000002f0   ldc.0                                            # 0
0x000002f1   bge.i     0x00000319                             # branch if greater
0x000002f3   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000002f5   brfalse   0x00000319                             # branch if zero
0x000002f7   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000002f9   ldc.0                                            # 0
0x000002fa   stfld     0x00000005                             # store field scanIdx : int
0x000002fc   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000002fe   ldfld     0x00000008                             # load field initialPosition : float
0x00000300   conv.r4.r8                                       # convert float to double
0x00000301   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x00000303   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000305   ldfld     0x0000000c                             # load field scanVelocity : float
0x00000307   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x00000309   ldc       0x00000042                             # 66
0x0000030b   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x0000030d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000030f   ldc.1                                            # 1
0x00000310   stfld     0x00000009                             # store field scanSucceeded : bool
0x00000312   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000314   ldc.4                                            # 4
0x00000315   stfld     0x00000004                             # store field scanState : GantryEncoderAlignment.ScanState
0x00000317   br        0x00000332                             # branch unconditionally
0x00000319   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x0000031b   brfalse   0x00000332                             # branch if zero
0x0000031d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000031f   ldc.0                                            # 0
0x00000320   stfld     0x00000009                             # store field scanSucceeded : bool
0x00000322   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000324   ldc.0                                            # 0
0x00000325   stfld     0x00000004                             # store field scanState : GantryEncoderAlignment.ScanState
0x00000327   br        0x00000332                             # branch unconditionally
0x00000329   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x0000032b   brfalse   0x00000332                             # branch if zero
0x0000032d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000032f   ldc.0                                            # 0
0x00000330   stfld     0x00000004                             # store field scanState : GantryEncoderAlignment.ScanState
0x00000332   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000334   ldfld     0x00000004                             # load field scanState : GantryEncoderAlignment.ScanState
0x00000336   ldc.0                                            # 0
0x00000337   ceq                                              # compare if equal
0x00000338   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.SetCompAtNode
0x0000033a   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x0000033c   ldc.0                                            # 0
0x0000033d   blt.i     0x00000343                             # branch if less
0x0000033f   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x00000341   br        0x00000344                             # branch unconditionally
0x00000343   ldc.0                                            # 0
0x00000344   stloc     0x00000001                             # store 0th argument nodeIdx : int
0x00000346   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x00000348   ldc       0x00002710                             # 10000
0x0000034a   bge.i     0x00000350                             # branch if greater
0x0000034c   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x0000034e   br        0x00000352                             # branch unconditionally
0x00000350   ldc       0x0000270f                             # 9999
0x00000352   stloc     0x00000001                             # store 0th argument nodeIdx : int
0x00000354   ldloc     0x00000003                             # load 2th argument cumulate : bool
0x00000356   brfalse   0x00000362                             # branch if zero
0x00000358   ldloc     0x00000002                             # load 1th argument comp : float
0x0000035a   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x0000035c   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x0000035f   add.r4                                           # float addition
0x00000360   stloc     0x00000002                             # store 1th argument comp : float
0x00000362   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x00000364   ldloc     0x00000002                             # load 1th argument comp : float
0x00000366   rste      0x000003e8   0x00400001                # set Register.Application.Tables.Small1.Data.Float[TOS] : float
0x00000369   ret       0x00000000                             # return from routine

# Method GantryEncoderAlignment.Apply
0x0000036b   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000036d   ldfld     0x0000000f                             # load field applyState : GantryEncoderAlignment.ApplyState
0x0000036f   stloc     0x00000004                             # store local variable local_2 : GantryEncoderAlignment.ApplyState
0x00000371   ldloc     0x00000004                             # load local variable local_2 : GantryEncoderAlignment.ApplyState
0x00000373   switch.   0x00000003                             # switch table
      (   0x0000037a   0x0000039c   0x000003cd   )
0x00000378   br        0x000003d8                             # branch unconditionally
0x0000037a   ldloc     0x00000001                             # load 0th argument run : bool
0x0000037c   brfalse   0x00000383                             # branch if zero
0x0000037e   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000380   ldc.1                                            # 1
0x00000381   stfld     0x0000000f                             # store field applyState : GantryEncoderAlignment.ApplyState
0x00000383   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000385   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000387   ldfld     0x00000003                             # load field compGain : float
0x00000389   ldc       0x3a83126e                             # 0.0009999999
0x0000038b   blt.f     0x00000396                             # branch if less
0x0000038d   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000038f   ldfld     0x00000003                             # load field compGain : float
0x00000391   ldc       0x3a83126e                             # 0.0009999999
0x00000393   sub.r4                                           # float subtraction
0x00000394   br        0x00000398                             # branch unconditionally
0x00000396   ldc       0x00000000                             # 0
0x00000398   stfld     0x00000003                             # store field compGain : float
0x0000039a   br        0x000003e0                             # branch unconditionally
0x0000039c   ldloc     0x00000001                             # load 0th argument run : bool
0x0000039e   brfalse   0x000003c3                             # branch if zero
0x000003a0   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003a2   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003a4   ldfld     0x00000003                             # load field compGain : float
0x000003a6   ldc       0x3a83126e                             # 0.0009999999
0x000003a8   add.r4                                           # float addition
0x000003a9   stfld     0x00000003                             # store field compGain : float
0x000003ab   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003ad   ldfld     0x00000003                             # load field compGain : float
0x000003af   ldc       0x3f800000                             # 1
0x000003b1   blt.f     0x000003e0                             # branch if less
0x000003b3   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003b5   ldc       0x3f800000                             # 1
0x000003b7   stfld     0x00000003                             # store field compGain : float
0x000003b9   ldc.1                                            # 1
0x000003ba   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x000003bc   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003be   ldc.2                                            # 2
0x000003bf   stfld     0x0000000f                             # store field applyState : GantryEncoderAlignment.ApplyState
0x000003c1   br        0x000003e0                             # branch unconditionally
0x000003c3   ldc.0                                            # 0
0x000003c4   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x000003c6   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003c8   ldc.0                                            # 0
0x000003c9   stfld     0x0000000f                             # store field applyState : GantryEncoderAlignment.ApplyState
0x000003cb   br        0x000003e0                             # branch unconditionally
0x000003cd   ldloc     0x00000001                             # load 0th argument run : bool
0x000003cf   brtrue    0x000003e0                             # branch if not zero
0x000003d1   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003d3   ldc.0                                            # 0
0x000003d4   stfld     0x0000000f                             # store field applyState : GantryEncoderAlignment.ApplyState
0x000003d6   br        0x000003e0                             # branch unconditionally
0x000003d8   ldc.0                                            # 0
0x000003d9   rst       0x002bf700                             # set Register.Axes_1.Commands.PositionController.Active : bool
0x000003db   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003dd   ldc.0                                            # 0
0x000003de   stfld     0x0000000f                             # store field applyState : GantryEncoderAlignment.ApplyState
0x000003e0   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x000003e2   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003e4   ldfld     0x00000006                             # load field scanStartPosition : float
0x000003e6   sub.r4                                           # float subtraction
0x000003e7   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003e9   ldfld     0x00000001                             # load field nodeSpacing : float
0x000003eb   ldc       0x461c3c00                             # 9999
0x000003ed   mul.r4                                           # float multiplication
0x000003ee   div.r4                                           # float division
0x000003ef   stloc     0x00000002                             # store local variable xNorm : float
0x000003f1   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003f3   ldloc     0x00000002                             # load local variable xNorm : float
0x000003f5   call      0x00000004   0x00000006   0x00000422   # call GantryEncoderAlignment.GetComp(System.Single)
0x000003f9   stloc     0x00000003                             # store local variable compensation : float
0x000003fb   ldloc     0x00000003                             # load local variable compensation : float
0x000003fd   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x000003ff   ldfld     0x00000003                             # load field compGain : float
0x00000401   mul.r4                                           # float multiplication
0x00000402   rst       0x00208200                             # set Register.Axes_0.Commands.PositionController.Encoders_0.InjectedPosition : float
0x00000404   ldloc     0x00000003                             # load local variable compensation : float
0x00000406   neg.r4                                           # float negation
0x00000407   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000409   ldfld     0x00000003                             # load field compGain : float
0x0000040b   mul.r4                                           # float multiplication
0x0000040c   rst       0x00288200                             # set Register.Axes_1.Commands.PositionController.Encoders_0.InjectedPosition : float
0x0000040e   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000410   ldfld     0x0000000f                             # load field applyState : GantryEncoderAlignment.ApplyState
0x00000412   brtrue    0x0000041f                             # branch if not zero
0x00000414   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000416   ldfld     0x00000003                             # load field compGain : float
0x00000418   ldc       0x00000000                             # 0
0x0000041a   cgt.f                                            # compare if greater
0x0000041b   ldc.0                                            # 0
0x0000041c   ceq                                              # compare if equal
0x0000041d   ret       0x00000001                             # return from routine
0x0000041f   ldc.0                                            # 0
0x00000420   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.GetComp
0x00000422   ldloc     0x00000001                             # load 0th argument xNorm : float
0x00000424   ldc       0x461c4000                             # 10000
0x00000426   mul.r4                                           # float multiplication
0x00000427   stloc     0x00000002                             # store local variable nx : float
0x00000429   ldloc     0x00000002                             # load local variable nx : float
0x0000042b   floor                                            # floor
0x0000042c   conv.r4.i4                                       # convert float to int
0x0000042d   stloc     0x00000003                             # store local variable n : int
0x0000042f   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x00000431   ldloc     0x00000003                             # load local variable n : int
0x00000433   call      0x00000000   0x00000002   0x00000456   # call GantryEncoderAlignment.GetCompAtNode(System.Int32)
0x00000437   stloc     0x00000004                             # store local variable cn : float
0x00000439   ldloc     0x00000000                             # load this : GantryEncoderAlignment
0x0000043b   ldloc     0x00000003                             # load local variable n : int
0x0000043d   ldc.1                                            # 1
0x0000043e   add.i4                                           # integer addition
0x0000043f   call      0x00000000   0x00000002   0x00000456   # call GantryEncoderAlignment.GetCompAtNode(System.Int32)
0x00000443   ldloc     0x00000004                             # load local variable cn : float
0x00000445   sub.r4                                           # float subtraction
0x00000446   stloc     0x00000005                             # store local variable dcn : float
0x00000448   ldloc     0x00000004                             # load local variable cn : float
0x0000044a   ldloc     0x00000002                             # load local variable nx : float
0x0000044c   ldloc     0x00000003                             # load local variable n : int
0x0000044e   conv.i4.r4                                       # convert int to float
0x0000044f   sub.r4                                           # float subtraction
0x00000450   ldloc     0x00000005                             # load local variable dcn : float
0x00000452   mul.r4                                           # float multiplication
0x00000453   add.r4                                           # float addition
0x00000454   ret       0x00000001                             # return from routine

# Method GantryEncoderAlignment.GetCompAtNode
0x00000456   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x00000458   ldc.0                                            # 0
0x00000459   blt.i     0x0000045f                             # branch if less
0x0000045b   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x0000045d   br        0x00000460                             # branch unconditionally
0x0000045f   ldc.0                                            # 0
0x00000460   stloc     0x00000001                             # store 0th argument nodeIdx : int
0x00000462   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x00000464   ldc       0x00002710                             # 10000
0x00000466   bge.i     0x0000046c                             # branch if greater
0x00000468   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x0000046a   br        0x0000046e                             # branch unconditionally
0x0000046c   ldc       0x0000270f                             # 9999
0x0000046e   stloc     0x00000001                             # store 0th argument nodeIdx : int
0x00000470   ldloc     0x00000001                             # load 0th argument nodeIdx : int
0x00000472   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x00000475   ret       0x00000001                             # return from routine
