# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: StandaloneHomingAndEndswitches, Z:\Projekte\Skyverse_Dragon\CHSI\SW-Release\Delivery_0001\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 13.10.2022 14:08:36
# Target register layout (RLID): 0x00000013
# Space for static fields: 0x00000004
# Maximal stack size: 0x00000030
# Init entry point                 : 0x00000001 (local stack size = 0x00000000)
# Task entry point AsynchronousMain: 0x000000a0 (local stack size = 0x00000007)
# Task entry point IsochronousMain : 0x000002e3 (local stack size = 0x00000004)
# Task entry point Axis1Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Coupling   : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Coupling   : 0x00000000 (local stack size = 0x00000000)
0x00000000   halt                                             # precautious halt

# Method StandaloneHomingAndEndswitches..cctor
0x00000001   ldc.1                                            # 1
0x00000002   stabs     0x00000000                             # store static field _commitError : bool
0x00000004   new       0x00000001   0x00000000                # allocate space on the heap for a new instance of class AsynchronousTimer
0x00000007   call      0x00000000   0x00000001   0x00000018   # call Triamec.Tam.Samples.AsynchronousTimer..ctor()
0x0000000b   stabs     0x00000002                             # store static field BlinkTimer : AsynchronousTimer
0x0000000d   ldabs     0x00000002                             # load static field BlinkTimer : AsynchronousTimer
0x0000000f   ldc       0x3f000000                             # 0.5
0x00000011   rld       0x00216400                             # get Register.General.Signals.TriaLinkTimestamp : uint
0x00000013   call      0x00000000   0x00000003   0x00000022   # call Triamec.Tam.Samples.AsynchronousTimer.Start(System.Single, System.UInt32)
0x00000017   halt                                             # return from Tama task routine

# Method Triamec.Tam.Samples.AsynchronousTimer..ctor
0x00000018   ldloc     0x00000000                             # load this : AsynchronousTimer
0x0000001a   call      0x00000000   0x00000001   0x00000020   # call System.Object..ctor()
0x0000001e   ret       0x00000000                             # return from routine

# Method System.Object..ctor
0x00000020   ret       0x00000000                             # return from routine

# Method Triamec.Tam.Samples.AsynchronousTimer.Start
0x00000022   ldloc     0x00000000                             # load this : AsynchronousTimer
0x00000024   ldloc     0x00000001                             # load 0th argument duration : float
0x00000026   ldc       0x47c35000                             # 100000
0x00000028   mul.r4                                           # float multiplication
0x00000029   conv.r4.i4                                       # convert float to int
0x0000002a   ldloc     0x00000002                             # load 1th argument currentTime : uint
0x0000002c   call      0x00000000   0x00000003   0x00000032   # call Triamec.Tam.Samples.AsynchronousTimer.Start(System.Int32, System.UInt32)
0x00000030   ret       0x00000000                             # return from routine

# Method Triamec.Tam.Samples.AsynchronousTimer.Start
0x00000032   ldloc     0x00000000                             # load this : AsynchronousTimer
0x00000034   ldloc     0x00000002                             # load 1th argument currentTime : uint
0x00000036   ldloc     0x00000001                             # load 0th argument ticks : int
0x00000038   call      0x00000003   0x00000005   0x00000040   # call Triamec.Tam.Samples.Timestamp.Add(System.UInt32, System.Int32)
0x0000003c   stfld     0x00000000                             # store field _dest : uint
0x0000003e   ret       0x00000000                             # return from routine

# Method Triamec.Tam.Samples.Timestamp.Add
0x00000040   ldloc     0x00000001                             # load 1th argument duration : int
0x00000042   ldc.0                                            # 0
0x00000043   bge.i     0x00000056                             # branch if greater
0x00000045   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x00000047   ldloc     0x00000001                             # load 1th argument duration : int
0x00000049   ldc.1                                            # 1
0x0000004a   add.i4                                           # integer addition
0x0000004b   neg.i4                                           # integer negation
0x0000004c   call      0x00000003   0x00000005   0x0000007b   # call Triamec.Tam.Samples.Timestamp.Subtract(System.UInt32, System.Int32)
0x00000050   ldc.1                                            # 1
0x00000051   sub.i4                                           # integer subtraction
0x00000052   stloc     0x00000002                             # store local variable result : uint
0x00000054   br        0x00000077                             # branch unconditionally
0x00000056   ldloc     0x00000001                             # load 1th argument duration : int
0x00000058   stloc     0x00000003                             # store local variable positiveDuration : uint
0x0000005a   ldc       0xffffff00                             # -256
0x0000005c   ldloc     0x00000003                             # load local variable positiveDuration : uint
0x0000005e   sub.i4                                           # integer subtraction
0x0000005f   stloc     0x00000004                             # store local variable temp : uint
0x00000061   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x00000063   ldloc     0x00000004                             # load local variable temp : uint
0x00000065   bge.u     0x00000070                             # branch if greater or equal
0x00000067   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x00000069   ldloc     0x00000003                             # load local variable positiveDuration : uint
0x0000006b   add.i4                                           # integer addition
0x0000006c   stloc     0x00000002                             # store local variable result : uint
0x0000006e   br        0x00000077                             # branch unconditionally
0x00000070   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x00000072   ldloc     0x00000004                             # load local variable temp : uint
0x00000074   sub.i4                                           # integer subtraction
0x00000075   stloc     0x00000002                             # store local variable result : uint
0x00000077   ldloc     0x00000002                             # load local variable result : uint
0x00000079   ret       0x00000001                             # return from routine

# Method Triamec.Tam.Samples.Timestamp.Subtract
0x0000007b   ldloc     0x00000001                             # load 1th argument duration : int
0x0000007d   stloc     0x00000003                             # store local variable positiveDuration : uint
0x0000007f   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x00000081   ldloc     0x00000003                             # load local variable positiveDuration : uint
0x00000083   blt.u     0x0000008e                             # branch if less
0x00000085   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x00000087   ldloc     0x00000003                             # load local variable positiveDuration : uint
0x00000089   sub.i4                                           # integer subtraction
0x0000008a   stloc     0x00000002                             # store local variable result : uint
0x0000008c   br        0x0000009c                             # branch unconditionally
0x0000008e   ldc       0xffffff00                             # -256
0x00000090   ldloc     0x00000003                             # load local variable positiveDuration : uint
0x00000092   sub.i4                                           # integer subtraction
0x00000093   stloc     0x00000004                             # store local variable temp : uint
0x00000095   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x00000097   ldloc     0x00000004                             # load local variable temp : uint
0x00000099   add.i4                                           # integer addition
0x0000009a   stloc     0x00000002                             # store local variable result : uint
0x0000009c   ldloc     0x00000002                             # load local variable result : uint
0x0000009e   ret       0x00000001                             # return from routine

# Method StandaloneHomingAndEndswitches.StandAloneApplication
0x000000a0   ldc.0                                            # 0
0x000000a1   call      0x00000000   0x00000001   0x000001fa   # call StandaloneHomingAndEndswitches.GetDigitalIn(System.Int32)
0x000000a5   stloc     0x00000000                             # store local variable enable : bool
0x000000a7   ldc.1                                            # 1
0x000000a8   call      0x00000000   0x00000001   0x000001fa   # call StandaloneHomingAndEndswitches.GetDigitalIn(System.Int32)
0x000000ac   stloc     0x00000001                             # store local variable home : bool
0x000000ae   ldc.2                                            # 2
0x000000af   call      0x00000000   0x00000001   0x000001fa   # call StandaloneHomingAndEndswitches.GetDigitalIn(System.Int32)
0x000000b3   stloc     0x00000002                             # store local variable move : bool
0x000000b5   ldc.5                                            # 5
0x000000b6   call      0x00000000   0x00000001   0x000001fa   # call StandaloneHomingAndEndswitches.GetDigitalIn(System.Int32)
0x000000ba   stloc     0x00000003                             # store local variable side : bool
0x000000bc   rld       0x00229b00                             # get Register.Axes_0.Signals.General.AxisError : AxisErrorIdentification
0x000000be   ldc.0                                            # 0
0x000000bf   cgt.u                                            # compare if greater
0x000000c0   stloc     0x00000004                             # store local variable axisError : bool
0x000000c2   rld       0x00216200                             # get Register.General.Signals.DriveError : DeviceErrorIdentification
0x000000c4   ldc.0                                            # 0
0x000000c5   cgt.u                                            # compare if greater
0x000000c6   stloc     0x00000005                             # store local variable driveError : bool
0x000000c8   ldloc     0x00000004                             # load local variable axisError : bool
0x000000ca   brfalse   0x000000d2                             # branch if zero
0x000000cc   ldabs     0x00000000                             # load static field _commitError : bool
0x000000ce   ldc.0                                            # 0
0x000000cf   ceq                                              # compare if equal
0x000000d0   br        0x000000d3                             # branch unconditionally
0x000000d2   ldc.0                                            # 0
0x000000d3   ldloc     0x00000005                             # load local variable driveError : bool
0x000000d5   or                                               # integer bitwise OR
0x000000d6   rst       0x00227400                             # set Register.Axes_0.Commands.General.DigitalOut1 : bool
0x000000d8   ldabs     0x00000001                             # load static field _state : int
0x000000da   ldc.2                                            # 2
0x000000db   beq       0x000000eb                             # branch if equal
0x000000dd   ldabs     0x00000001                             # load static field _state : int
0x000000df   ldc.2                                            # 2
0x000000e0   ble.i     0x000000e8                             # branch if less than or equal
0x000000e2   call      0x00000000   0x00000000   0x00000208   # call StandaloneHomingAndEndswitches.Blink()
0x000000e6   br        0x000000ec                             # branch unconditionally
0x000000e8   ldc.0                                            # 0
0x000000e9   br        0x000000ec                             # branch unconditionally
0x000000eb   ldc.1                                            # 1
0x000000ec   rst       0x00227500                             # set Register.Axes_0.Commands.General.DigitalOut2 : bool
0x000000ee   ldloc     0x00000000                             # load local variable enable : bool
0x000000f0   call      0x00000004   0x00000005   0x00000264   # call StandaloneHomingAndEndswitches.EnableDrive(System.Boolean)
0x000000f4   brfalse   0x000001f2                             # branch if zero
0x000000f6   ldabs     0x00000001                             # load static field _state : int
0x000000f8   stloc     0x00000006                             # store local variable local_6 : int
0x000000fa   ldloc     0x00000006                             # load local variable local_6 : int
0x000000fc   switch.   0x0000000a                             # switch table
      (   0x0000010a   0x0000010f   0x0000019c   0x00000147   0x00000132   0x0000015c   0x00000172   0x0000018a   0x000001ad   0x000001d0   )
0x00000108   br        0x000001f5                             # branch unconditionally
0x0000010a   ldc.1                                            # 1
0x0000010b   stabs     0x00000001                             # store static field _state : int
0x0000010d   br        0x000001f5                             # branch unconditionally
0x0000010f   ldloc     0x00000001                             # load local variable home : bool
0x00000111   brfalse   0x000001f5                             # branch if zero
0x00000113   ldc.0                                            # 0
0x00000114   rst       0x00227900                             # set Register.Axes_0.Commands.PathPlanner.Direction : PathPlannerDirection
0x00000116   ldc.0                                            # 0
0x00000117   rst       0x00228500                             # set Register.Axes_0.Commands.PositionController.PositionLatchStandard.Enable : bool
0x00000119   ldloc     0x00000003                             # load local variable side : bool
0x0000011b   brfalse   0x00000126                             # branch if zero
0x0000011d   ldc       0x41200000                             # 10
0x0000011f   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x00000121   ldc.3                                            # 3
0x00000122   stabs     0x00000001                             # store static field _state : int
0x00000124   br        0x0000012d                             # branch unconditionally
0x00000126   ldc       0xc1200000                             # -10
0x00000128   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x0000012a   ldc.4                                            # 4
0x0000012b   stabs     0x00000001                             # store static field _state : int
0x0000012d   ldc.5                                            # 5
0x0000012e   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x00000130   br        0x000001f5                             # branch unconditionally
0x00000132   ldloc     0x00000003                             # load local variable side : bool
0x00000134   brfalse   0x000001f5                             # branch if zero
0x00000136   rld.2     0x0022ac01                             # get Register.Axes_0.Signals.PathPlanner.Position : double
0x00000138   ldc.r8    0xe0000000   0x3f50624d                # 0.00100000004749745
0x0000013b   add.r8                                           # double addition
0x0000013c   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x0000013e   ldc       0x00000042                             # 66
0x00000140   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x00000142   ldc.5                                            # 5
0x00000143   stabs     0x00000001                             # store static field _state : int
0x00000145   br        0x000001f5                             # branch unconditionally
0x00000147   ldloc     0x00000003                             # load local variable side : bool
0x00000149   brtrue    0x000001f5                             # branch if not zero
0x0000014b   rld.2     0x0022ac01                             # get Register.Axes_0.Signals.PathPlanner.Position : double
0x0000014d   ldc.r8    0xe0000000   0x3f50624d                # 0.00100000004749745
0x00000150   add.r8                                           # double addition
0x00000151   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x00000153   ldc       0x00000042                             # 66
0x00000155   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x00000157   ldc.5                                            # 5
0x00000158   stabs     0x00000001                             # store static field _state : int
0x0000015a   br        0x000001f5                             # branch unconditionally
0x0000015c   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x0000015e   brfalse   0x000001f5                             # branch if zero
0x00000160   ldc       0x3f800000                             # 1
0x00000162   rst       0x00227c00                             # set Register.Axes_0.Commands.PathPlanner.Vnew : float
0x00000164   ldc.1                                            # 1
0x00000165   rst       0x00228500                             # set Register.Axes_0.Commands.PositionController.PositionLatchStandard.Enable : bool
0x00000167   ldc.3                                            # 3
0x00000168   rst       0x00227900                             # set Register.Axes_0.Commands.PathPlanner.Direction : PathPlannerDirection
0x0000016a   ldc.5                                            # 5
0x0000016b   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x0000016d   ldc.6                                            # 6
0x0000016e   stabs     0x00000001                             # store static field _state : int
0x00000170   br        0x000001f5                             # branch unconditionally
0x00000172   rld       0x00228500                             # get Register.Axes_0.Commands.PositionController.PositionLatchStandard.Enable : bool
0x00000174   brfalse   0x000001f5                             # branch if zero
0x00000176   ldc.r8    0x00000000   0x00000000                # 0
0x00000179   rld.2     0x0022bd01                             # get Register.Axes_0.Signals.PositionController.PositionLatchStandard.Position : double
0x0000017b   add.r8                                           # double addition
0x0000017c   ldc.r8    0x00000000   0x00000000                # 0
0x0000017f   sub.r8                                           # double subtraction
0x00000180   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x00000182   ldc.2                                            # 2
0x00000183   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x00000185   ldc.7                                            # 7
0x00000186   stabs     0x00000001                             # store static field _state : int
0x00000188   br        0x000001f5                             # branch unconditionally
0x0000018a   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x0000018c   brfalse   0x000001f5                             # branch if zero
0x0000018e   ldc.r8    0x00000000   0x00000000                # 0
0x00000191   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x00000193   ldc       0x0000000a                             # 10
0x00000195   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x00000197   ldc.2                                            # 2
0x00000198   stabs     0x00000001                             # store static field _state : int
0x0000019a   br        0x000001f5                             # branch unconditionally
0x0000019c   ldloc     0x00000002                             # load local variable move : bool
0x0000019e   brfalse   0x000001f5                             # branch if zero
0x000001a0   ldc.8                                            # 8
0x000001a1   stabs     0x00000001                             # store static field _state : int
0x000001a3   ldc.r8    0x00000000   0xc0080000                # -3
0x000001a6   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x000001a8   ldc.2                                            # 2
0x000001a9   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x000001ab   br        0x000001f5                             # branch unconditionally
0x000001ad   ldloc     0x00000002                             # load local variable move : bool
0x000001af   brtrue    0x000001be                             # branch if not zero
0x000001b1   ldc.2                                            # 2
0x000001b2   stabs     0x00000001                             # store static field _state : int
0x000001b4   ldc.r8    0x00000000   0x00000000                # 0
0x000001b7   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x000001b9   ldc.2                                            # 2
0x000001ba   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x000001bc   br        0x000001f5                             # branch unconditionally
0x000001be   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000001c0   brfalse   0x000001f5                             # branch if zero
0x000001c2   ldc       0x00000009                             # 9
0x000001c4   stabs     0x00000001                             # store static field _state : int
0x000001c6   ldc.r8    0x00000000   0x40080000                # 3
0x000001c9   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x000001cb   ldc.2                                            # 2
0x000001cc   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x000001ce   br        0x000001f5                             # branch unconditionally
0x000001d0   ldloc     0x00000002                             # load local variable move : bool
0x000001d2   brtrue    0x000001e1                             # branch if not zero
0x000001d4   ldc.2                                            # 2
0x000001d5   stabs     0x00000001                             # store static field _state : int
0x000001d7   ldc.r8    0x00000000   0x00000000                # 0
0x000001da   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x000001dc   ldc.2                                            # 2
0x000001dd   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x000001df   br        0x000001f5                             # branch unconditionally
0x000001e1   rld       0x0022b300                             # get Register.Axes_0.Signals.PathPlanner.Done : bool
0x000001e3   brfalse   0x000001f5                             # branch if zero
0x000001e5   ldc.8                                            # 8
0x000001e6   stabs     0x00000001                             # store static field _state : int
0x000001e8   ldc.r8    0x00000000   0xc0080000                # -3
0x000001eb   rst.2     0x00227b01                             # set Register.Axes_0.Commands.PathPlanner.Xnew : double
0x000001ed   ldc.2                                            # 2
0x000001ee   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x000001f0   br        0x000001f5                             # branch unconditionally
0x000001f2   ldc.0                                            # 0
0x000001f3   stabs     0x00000001                             # store static field _state : int
0x000001f5   ldabs     0x00000001                             # load static field _state : int
0x000001f7   rst       0x00237a00                             # set Register.Application.TamaControl.AsynchronousMainState : int
0x000001f9   halt                                             # return from Tama task routine

# Method StandaloneHomingAndEndswitches.GetDigitalIn
0x000001fa   rld       0x00229c00                             # get Register.Axes_0.Signals.General.DigitalInputBits : int
0x000001fc   ldc.1                                            # 1
0x000001fd   ldloc     0x00000000                             # load 0th argument channel : int
0x000001ff   ldc       0x0000001f                             # 31
0x00000201   and                                              # integer bitwise AND
0x00000202   shl                                              # integer shift left
0x00000203   and                                              # integer bitwise AND
0x00000204   ldc.0                                            # 0
0x00000205   cgt.u                                            # compare if greater
0x00000206   ret       0x00000001                             # return from routine

# Method StandaloneHomingAndEndswitches.Blink
0x00000208   ldabs     0x00000002                             # load static field BlinkTimer : AsynchronousTimer
0x0000020a   rld       0x00216400                             # get Register.General.Signals.TriaLinkTimestamp : uint
0x0000020c   call      0x00000000   0x00000002   0x00000226   # call Triamec.Tam.Samples.AsynchronousTimer.Elapsed(System.UInt32)
0x00000210   brfalse   0x00000222                             # branch if zero
0x00000212   ldabs     0x00000003                             # load static field _blinkFlag : bool
0x00000214   ldc.0                                            # 0
0x00000215   ceq                                              # compare if equal
0x00000216   stabs     0x00000003                             # store static field _blinkFlag : bool
0x00000218   ldabs     0x00000002                             # load static field BlinkTimer : AsynchronousTimer
0x0000021a   ldc       0x3f000000                             # 0.5
0x0000021c   rld       0x00216400                             # get Register.General.Signals.TriaLinkTimestamp : uint
0x0000021e   call      0x00000000   0x00000003   0x00000022   # call Triamec.Tam.Samples.AsynchronousTimer.Start(System.Single, System.UInt32)
0x00000222   ldabs     0x00000003                             # load static field _blinkFlag : bool
0x00000224   ret       0x00000001                             # return from routine

# Method Triamec.Tam.Samples.AsynchronousTimer.Elapsed
0x00000226   ldloc     0x00000001                             # load 0th argument currentTime : uint
0x00000228   ldloc     0x00000000                             # load this : AsynchronousTimer
0x0000022a   ldfld     0x00000000                             # load field _dest : uint
0x0000022c   call      0x00000001   0x00000003   0x00000232   # call Triamec.Tam.Samples.Timestamp.Greater(System.UInt32, System.UInt32)
0x00000230   ret       0x00000001                             # return from routine

# Method Triamec.Tam.Samples.Timestamp.Greater
0x00000232   ldloc     0x00000000                             # load 0th argument value1 : uint
0x00000234   ldc       0x7fffff7f                             # 2147483519
0x00000236   clt.u                                            # compare if less
0x00000237   stloc     0x00000002                             # store local variable wrapProtector : bool
0x00000239   ldloc     0x00000001                             # load 1th argument value2 : uint
0x0000023b   ldloc     0x00000000                             # load 0th argument value1 : uint
0x0000023d   bge.u     0x0000024c                             # branch if greater or equal
0x0000023f   ldloc     0x00000002                             # load local variable wrapProtector : bool
0x00000241   brtrue    0x00000261                             # branch if not zero
0x00000243   ldloc     0x00000001                             # load 1th argument value2 : uint
0x00000245   ldloc     0x00000000                             # load 0th argument value1 : uint
0x00000247   ldc       0x7fffff7f                             # 2147483519
0x00000249   sub.i4                                           # integer subtraction
0x0000024a   bge.u     0x00000261                             # branch if greater or equal
0x0000024c   ldloc     0x00000002                             # load local variable wrapProtector : bool
0x0000024e   brfalse   0x0000025e                             # branch if zero
0x00000250   ldloc     0x00000001                             # load 1th argument value2 : uint
0x00000252   ldloc     0x00000000                             # load 0th argument value1 : uint
0x00000254   ldc       0x7fffff7f                             # 2147483519
0x00000256   add.i4                                           # integer addition
0x00000257   ldc.2                                            # 2
0x00000258   add.i4                                           # integer addition
0x00000259   clt.u                                            # compare if less
0x0000025a   ldc.0                                            # 0
0x0000025b   ceq                                              # compare if equal
0x0000025c   ret       0x00000001                             # return from routine
0x0000025e   ldc.0                                            # 0
0x0000025f   ret       0x00000001                             # return from routine
0x00000261   ldc.1                                            # 1
0x00000262   ret       0x00000001                             # return from routine

# Method StandaloneHomingAndEndswitches.EnableDrive
0x00000264   ldc.0                                            # 0
0x00000265   stloc     0x00000001                             # store local variable done : bool
0x00000267   ldloc     0x00000000                             # load 0th argument enable : bool
0x00000269   brfalse   0x0000029f                             # branch if zero
0x0000026b   rld       0x00216100                             # get Register.General.Signals.DriveState : DeviceState
0x0000026d   ldc.2                                            # 2
0x0000026e   beq       0x00000275                             # branch if equal
0x00000270   ldc.3                                            # 3
0x00000271   rst       0x00214a00                             # set Register.General.Commands.Internals.Event : DeviceEvent
0x00000273   br        0x000002df                             # branch unconditionally
0x00000275   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x00000277   stloc     0x00000002                             # store local variable local_1 : AxisState
0x00000279   ldloc     0x00000002                             # load local variable local_1 : AxisState
0x0000027b   switch.   0x00000003                             # switch table
      (   0x000002df   0x00000288   0x000002df   )
0x00000280   ldloc     0x00000002                             # load local variable local_1 : AxisState
0x00000282   ldc       0x00000009                             # 9
0x00000284   beq       0x000002df                             # branch if equal
0x00000286   br        0x0000029a                             # branch unconditionally
0x00000288   ldabs     0x00000000                             # load static field _commitError : bool
0x0000028a   brfalse   0x00000295                             # branch if zero
0x0000028c   ldc       0x00000009                             # 9
0x0000028e   rst       0x00226e00                             # set Register.Axes_0.Commands.General.Event : AxisEvent
0x00000290   ldc.0                                            # 0
0x00000291   stabs     0x00000000                             # store static field _commitError : bool
0x00000293   br        0x000002df                             # branch unconditionally
0x00000295   ldc.3                                            # 3
0x00000296   rst       0x00226e00                             # set Register.Axes_0.Commands.General.Event : AxisEvent
0x00000298   br        0x000002df                             # branch unconditionally
0x0000029a   ldc.1                                            # 1
0x0000029b   stloc     0x00000001                             # store local variable done : bool
0x0000029d   br        0x000002df                             # branch unconditionally
0x0000029f   ldc.1                                            # 1
0x000002a0   stabs     0x00000000                             # store static field _commitError : bool
0x000002a2   rld       0x00216100                             # get Register.General.Signals.DriveState : DeviceState
0x000002a4   ldc.4                                            # 4
0x000002a5   bne       0x000002ac                             # branch if not equal
0x000002a7   ldc.7                                            # 7
0x000002a8   rst       0x00214a00                             # set Register.General.Commands.Internals.Event : DeviceEvent
0x000002aa   br        0x000002df                             # branch unconditionally
0x000002ac   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x000002ae   stloc     0x00000003                             # store local variable local_2 : AxisState
0x000002b0   ldloc     0x00000003                             # load local variable local_2 : AxisState
0x000002b2   switch.   0x00000009                             # switch table
      (   0x000002ce   0x000002c9   0x000002dc   0x000002c4   0x000002dc   0x000002bf   0x000002dc   0x000002dc   0x000002df   )
0x000002bd   br        0x000002dc                             # branch unconditionally
0x000002bf   ldc.8                                            # 8
0x000002c0   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x000002c2   br        0x000002df                             # branch unconditionally
0x000002c4   ldc.4                                            # 4
0x000002c5   rst       0x00226e00                             # set Register.Axes_0.Commands.General.Event : AxisEvent
0x000002c7   br        0x000002df                             # branch unconditionally
0x000002c9   ldc.4                                            # 4
0x000002ca   rst       0x00214a00                             # set Register.General.Commands.Internals.Event : DeviceEvent
0x000002cc   br        0x000002df                             # branch unconditionally
0x000002ce   rld       0x00216100                             # get Register.General.Signals.DriveState : DeviceState
0x000002d0   stloc     0x00000004                             # store local variable local_3 : DeviceState
0x000002d2   ldloc     0x00000004                             # load local variable local_3 : DeviceState
0x000002d4   ldc.2                                            # 2
0x000002d5   bne       0x000002df                             # branch if not equal
0x000002d7   ldc.4                                            # 4
0x000002d8   rst       0x00214a00                             # set Register.General.Commands.Internals.Event : DeviceEvent
0x000002da   br        0x000002df                             # branch unconditionally
0x000002dc   ldc.4                                            # 4
0x000002dd   rst       0x00226e00                             # set Register.Axes_0.Commands.General.Event : AxisEvent
0x000002df   ldloc     0x00000001                             # load local variable done : bool
0x000002e1   ret       0x00000001                             # return from routine

# Method StandaloneHomingAndEndswitches.DetectEndpoints
0x000002e3   ldc.3                                            # 3
0x000002e4   call      0x00000000   0x00000001   0x000001fa   # call StandaloneHomingAndEndswitches.GetDigitalIn(System.Int32)
0x000002e8   stloc     0x00000000                             # store local variable lowLimit : bool
0x000002ea   ldc.4                                            # 4
0x000002eb   call      0x00000000   0x00000001   0x000001fa   # call StandaloneHomingAndEndswitches.GetDigitalIn(System.Int32)
0x000002ef   stloc     0x00000001                             # store local variable highLimit : bool
0x000002f1   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x000002f3   stloc     0x00000002                             # store local variable axisState : AxisState
0x000002f5   ldloc     0x00000002                             # load local variable axisState : AxisState
0x000002f7   ldc       0x00000009                             # 9
0x000002f9   bne       0x000002fc                             # branch if not equal
0x000002fb   halt                                             # return from Tama task routine
0x000002fc   ldloc     0x00000002                             # load local variable axisState : AxisState
0x000002fe   ldc.3                                            # 3
0x000002ff   ble.i     0x0000031a                             # branch if less than or equal
0x00000301   ldloc     0x00000000                             # load local variable lowLimit : bool
0x00000303   brfalse   0x0000030b                             # branch if zero
0x00000305   rld       0x0022ae00                             # get Register.Axes_0.Signals.PathPlanner.Velocity : float
0x00000307   ldc       0x00000000                             # 0
0x00000309   blt.f     0x00000315                             # branch if less
0x0000030b   ldloc     0x00000001                             # load local variable highLimit : bool
0x0000030d   brfalse   0x0000037d                             # branch if zero
0x0000030f   rld       0x0022ae00                             # get Register.Axes_0.Signals.PathPlanner.Velocity : float
0x00000311   ldc       0x00000000                             # 0
0x00000313   ble.f     0x0000037d                             # branch if less than or equal
0x00000315   ldc       0x00000009                             # 9
0x00000317   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x00000319   halt                                             # return from Tama task routine
0x0000031a   rld       0x00227800                             # get Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x0000031c   stloc     0x00000003                             # store local variable local_3 : PathPlannerCommand
0x0000031e   ldloc     0x00000003                             # load local variable local_3 : PathPlannerCommand
0x00000320   ldc       0x00000042                             # 66
0x00000322   bgt.i     0x00000337                             # branch if greater
0x00000324   ldloc     0x00000003                             # load local variable local_3 : PathPlannerCommand
0x00000326   ldc.2                                            # 2
0x00000327   sub.i4                                           # integer subtraction
0x00000328   switch.   0x00000006                             # switch table
      (   0x00000343   0x0000037d   0x0000037d   0x00000366   0x0000035b   0x0000035b   )
0x00000330   ldloc     0x00000003                             # load local variable local_3 : PathPlannerCommand
0x00000332   ldc       0x00000042                             # 66
0x00000334   beq       0x00000343                             # branch if equal
0x00000336   halt                                             # return from Tama task routine
0x00000337   ldloc     0x00000003                             # load local variable local_3 : PathPlannerCommand
0x00000339   ldc       0x00000085                             # 133
0x0000033b   beq       0x00000366                             # branch if equal
0x0000033d   ldloc     0x00000003                             # load local variable local_3 : PathPlannerCommand
0x0000033f   ldc       0x000000c2                             # 194
0x00000341   bne       0x0000037d                             # branch if not equal
0x00000343   ldloc     0x00000000                             # load local variable lowLimit : bool
0x00000345   brfalse   0x0000034d                             # branch if zero
0x00000347   rld.2     0x00227b01                             # get Register.Axes_0.Commands.PathPlanner.Xnew : double
0x00000349   rld.2     0x0022b901                             # get Register.Axes_0.Signals.PositionController.Encoders_0.Position : double
0x0000034b   blt.r8    0x00000357                             # branch if less
0x0000034d   ldloc     0x00000001                             # load local variable highLimit : bool
0x0000034f   brfalse   0x0000037d                             # branch if zero
0x00000351   rld.2     0x00227b01                             # get Register.Axes_0.Commands.PathPlanner.Xnew : double
0x00000353   rld.2     0x0022b901                             # get Register.Axes_0.Signals.PositionController.Encoders_0.Position : double
0x00000355   ble.r8    0x0000037d                             # branch if less than or equal
0x00000357   ldc.0                                            # 0
0x00000358   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x0000035a   halt                                             # return from Tama task routine
0x0000035b   ldloc     0x00000000                             # load local variable lowLimit : bool
0x0000035d   ldloc     0x00000001                             # load local variable highLimit : bool
0x0000035f   or                                               # integer bitwise OR
0x00000360   brfalse   0x0000037d                             # branch if zero
0x00000362   ldc.0                                            # 0
0x00000363   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x00000365   halt                                             # return from Tama task routine
0x00000366   ldloc     0x00000000                             # load local variable lowLimit : bool
0x00000368   brfalse   0x00000370                             # branch if zero
0x0000036a   rld       0x00227c00                             # get Register.Axes_0.Commands.PathPlanner.Vnew : float
0x0000036c   ldc       0x00000000                             # 0
0x0000036e   blt.f     0x0000037a                             # branch if less
0x00000370   ldloc     0x00000001                             # load local variable highLimit : bool
0x00000372   brfalse   0x0000037d                             # branch if zero
0x00000374   rld       0x00227c00                             # get Register.Axes_0.Commands.PathPlanner.Vnew : float
0x00000376   ldc       0x00000000                             # 0
0x00000378   ble.f     0x0000037d                             # branch if less than or equal
0x0000037a   ldc.0                                            # 0
0x0000037b   rst       0x00227800                             # set Register.Axes_0.Commands.PathPlanner.Command : PathPlannerCommand
0x0000037d   halt                                             # return from Tama task routine
