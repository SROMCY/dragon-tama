# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: PulseGenerator, C:\Skyverse_Dragon\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 16.12.2021 14:58:21
# Target register layout (RLID): 0x00000010
# Space for static fields: 0x00000009
# Maximal stack size: 0x00000018
# Init entry point                 : 0x0000016e (local stack size = 0x00000000)
# Task entry point AsynchronousMain: 0x00000000 (local stack size = 0x00000000)
# Task entry point IsochronousMain : 0x00000001 (local stack size = 0x0000000a)
# Task entry point Axis1Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Coupling   : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Coupling   : 0x00000000 (local stack size = 0x00000000)
0x00000000   halt                                             # precautious halt

# Method PulseGenerator.IsoMain
0x00000001   ldabs     0x00000002                             # load static field _outputCount : int
0x00000003   ldc.0                                            # 0
0x00000004   ble.i     0x0000003b                             # branch if less than or equal
0x00000006   ldabs     0x00000000                             # load static field Timer : IsochronousTimer
0x00000008   call      0x00000001   0x00000002   0x00000100   # call Triamec.Tam.Samples.IsochronousTimer.Tick()
0x0000000c   brfalse   0x0000003b                             # branch if zero
0x0000000e   ldabs     0x00000006                             # load static field _nextTimerIsOff : bool
0x00000010   brfalse   0x00000037                             # branch if zero
0x00000012   ldabs     0x00000002                             # load static field _outputCount : int
0x00000014   ldabs     0x00000007                             # load static field _outputIndex : int
0x00000016   add.i4                                           # integer addition
0x00000017   ldabs     0x00000005                             # load static field _offLag : int
0x00000019   sub.i4                                           # integer subtraction
0x0000001a   ldabs     0x00000002                             # load static field _outputCount : int
0x0000001c   rem.i4                                           # integer remainder
0x0000001d   stloc     0x00000001                             # store local variable offBit : int
0x0000001f   ldloc     0x00000001                             # load local variable offBit : int
0x00000021   ldabs     0x00000008                             # load static field _off : int
0x00000023   call      0x00000000   0x00000002   0x00000119   # call PulseGenerator.SetDigitalOutput(System.Int32, System.Int32)
0x00000027   ldabs     0x00000000                             # load static field Timer : IsochronousTimer
0x00000029   ldabs     0x00000003                             # load static field _pulseStep : float
0x0000002b   ldabs     0x00000004                             # load static field _offDelay : float
0x0000002d   sub.r4                                           # float subtraction
0x0000002e   call      0x00000000   0x00000002   0x00000137   # call Triamec.Tam.Samples.IsochronousTimer.Start(System.Single)
0x00000032   ldc.0                                            # 0
0x00000033   stabs     0x00000006                             # store static field _nextTimerIsOff : bool
0x00000035   br        0x0000003b                             # branch unconditionally
0x00000037   call      0x00000000   0x00000000   0x0000014b   # call PulseGenerator.Pulse()
0x0000003b   rld       0x00000a19                             # get Register.Tama.IsochronousMainCommand : int
0x0000003d   stloc     0x00000000                             # store local variable command : int
0x0000003f   rld       0x00000a1a                             # get Register.Tama.IsochronousMainState : int
0x00000041   ldloc     0x00000000                             # load local variable command : int
0x00000043   beq       0x000000ff                             # branch if equal
0x00000045   ldloc     0x00000000                             # load local variable command : int
0x00000047   rst       0x00000a1a                             # set Register.Tama.IsochronousMainState : int
0x00000049   ldc.0                                            # 0
0x0000004a   stabs     0x00000006                             # store static field _nextTimerIsOff : bool
0x0000004c   ldc.m1                                           # -1
0x0000004d   stabs     0x00000007                             # store static field _outputIndex : int
0x0000004f   ldloc     0x00000000                             # load local variable command : int
0x00000051   brtrue    0x00000070                             # branch if not zero
0x00000053   ldc.0                                            # 0
0x00000054   stloc     0x00000002                             # store local variable i : int
0x00000056   br        0x00000066                             # branch unconditionally
0x00000058   ldloc     0x00000002                             # load local variable i : int
0x0000005a   ldabs     0x00000008                             # load static field _off : int
0x0000005c   call      0x00000000   0x00000002   0x00000119   # call PulseGenerator.SetDigitalOutput(System.Int32, System.Int32)
0x00000060   ldloc     0x00000002                             # load local variable i : int
0x00000062   ldc.1                                            # 1
0x00000063   add.i4                                           # integer addition
0x00000064   stloc     0x00000002                             # store local variable i : int
0x00000066   ldloc     0x00000002                             # load local variable i : int
0x00000068   ldabs     0x00000002                             # load static field _outputCount : int
0x0000006a   blt.i     0x00000058                             # branch if less
0x0000006c   ldc.0                                            # 0
0x0000006d   stabs     0x00000002                             # store static field _outputCount : int
0x0000006f   halt                                             # return from Tama task routine
0x00000070   rld       0x00000a35                             # get Register.Tama.Variables.GenPurposeIntVar0 : int
0x00000072   stloc     0x00000003                             # store local variable outputs : int
0x00000074   ldc.0                                            # 0
0x00000075   stloc     0x00000004                             # store local variable j : int
0x00000077   ldc.0                                            # 0
0x00000078   stloc     0x00000005                             # store local variable i : int
0x0000007a   br        0x0000009e                             # branch unconditionally
0x0000007c   ldc.1                                            # 1
0x0000007d   ldloc     0x00000005                             # load local variable i : int
0x0000007f   ldc       0x0000001f                             # 31
0x00000081   and                                              # integer bitwise AND
0x00000082   shl                                              # integer shift left
0x00000083   stloc     0x00000006                             # store local variable mask : int
0x00000085   ldloc     0x00000006                             # load local variable mask : int
0x00000087   ldloc     0x00000003                             # load local variable outputs : int
0x00000089   and                                              # integer bitwise AND
0x0000008a   brfalse   0x00000098                             # branch if zero
0x0000008c   ldabs     0x00000001                             # load static field OutputMasks : int[]
0x0000008e   ldloc     0x00000004                             # load local variable j : int
0x00000090   dup                                              # duplicate top of stack : int
0x00000091   ldc.1                                            # 1
0x00000092   add.i4                                           # integer addition
0x00000093   stloc     0x00000004                             # store local variable j : int
0x00000095   ldloc     0x00000006                             # load local variable mask : int
0x00000097   stelem                                           # store element of int[]
0x00000098   ldloc     0x00000005                             # load local variable i : int
0x0000009a   ldc.1                                            # 1
0x0000009b   add.i4                                           # integer addition
0x0000009c   stloc     0x00000005                             # store local variable i : int
0x0000009e   ldloc     0x00000005                             # load local variable i : int
0x000000a0   ldc.8                                            # 8
0x000000a1   blt.i     0x0000007c                             # branch if less
0x000000a3   ldloc     0x00000004                             # load local variable j : int
0x000000a5   stabs     0x00000002                             # store static field _outputCount : int
0x000000a7   ldabs     0x00000002                             # load static field _outputCount : int
0x000000a9   ldc.0                                            # 0
0x000000aa   ble.i     0x000000ff                             # branch if less than or equal
0x000000ac   rld       0x00000a36                             # get Register.Tama.Variables.GenPurposeIntVar1 : int
0x000000ae   stabs     0x00000008                             # store static field _off : int
0x000000b0   ldc.0                                            # 0
0x000000b1   stloc     0x00000009                             # store local variable i : int
0x000000b3   br        0x000000c3                             # branch unconditionally
0x000000b5   ldloc     0x00000009                             # load local variable i : int
0x000000b7   ldabs     0x00000008                             # load static field _off : int
0x000000b9   call      0x00000000   0x00000002   0x00000119   # call PulseGenerator.SetDigitalOutput(System.Int32, System.Int32)
0x000000bd   ldloc     0x00000009                             # load local variable i : int
0x000000bf   ldc.1                                            # 1
0x000000c0   add.i4                                           # integer addition
0x000000c1   stloc     0x00000009                             # store local variable i : int
0x000000c3   ldloc     0x00000009                             # load local variable i : int
0x000000c5   ldabs     0x00000002                             # load static field _outputCount : int
0x000000c7   blt.i     0x000000b5                             # branch if less
0x000000c9   rld       0x00000a1c                             # get Register.Tama.Variables.GenPurposeVar0 : float
0x000000cb   stloc     0x00000007                             # store local variable pulsePeriod : float
0x000000cd   rld       0x00000a1d                             # get Register.Tama.Variables.GenPurposeVar1 : float
0x000000cf   stloc     0x00000008                             # store local variable pulseWidth : float
0x000000d1   ldloc     0x00000008                             # load local variable pulseWidth : float
0x000000d3   ldloc     0x00000007                             # load local variable pulsePeriod : float
0x000000d5   blt.f     0x000000dd                             # branch if less
0x000000d7   ldabs     0x00000001                             # load static field OutputMasks : int[]
0x000000d9   ldc       0x7fffffff                             # 2147483647
0x000000db   ldc.0                                            # 0
0x000000dc   stelem                                           # store element of int[]
0x000000dd   ldloc     0x00000007                             # load local variable pulsePeriod : float
0x000000df   ldabs     0x00000002                             # load static field _outputCount : int
0x000000e1   conv.i4.r4                                       # convert int to float
0x000000e2   div.r4                                           # float division
0x000000e3   stabs     0x00000003                             # store static field _pulseStep : float
0x000000e5   ldloc     0x00000008                             # load local variable pulseWidth : float
0x000000e7   ldabs     0x00000003                             # load static field _pulseStep : float
0x000000e9   rem.r4                                           # float remainder
0x000000ea   stabs     0x00000004                             # store static field _offDelay : float
0x000000ec   ldloc     0x00000008                             # load local variable pulseWidth : float
0x000000ee   ldabs     0x00000003                             # load static field _pulseStep : float
0x000000f0   div.r4                                           # float division
0x000000f1   conv.r4.i4                                       # convert float to int
0x000000f2   stabs     0x00000005                             # store static field _offLag : int
0x000000f4   ldabs     0x00000000                             # load static field Timer : IsochronousTimer
0x000000f6   ldabs     0x00000004                             # load static field _offDelay : float
0x000000f8   call      0x00000000   0x00000002   0x00000137   # call Triamec.Tam.Samples.IsochronousTimer.Start(System.Single)
0x000000fc   ldc.1                                            # 1
0x000000fd   stabs     0x00000006                             # store static field _nextTimerIsOff : bool
0x000000ff   halt                                             # return from Tama task routine

# Method Triamec.Tam.Samples.IsochronousTimer.Tick
0x00000100   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000102   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000104   ldfld     0x00000001                             # load field _tick : uint
0x00000106   ldc.1                                            # 1
0x00000107   add.i4                                           # integer addition
0x00000108   stloc     0x00000001                             # store local variable local_0 : uint
0x0000010a   ldloc     0x00000001                             # load local variable local_0 : uint
0x0000010c   stfld     0x00000001                             # store field _tick : uint
0x0000010e   ldloc     0x00000001                             # load local variable local_0 : uint
0x00000110   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000112   ldfld     0x00000002                             # load field _dest : uint
0x00000114   clt.u                                            # compare if less
0x00000115   ldc.0                                            # 0
0x00000116   ceq                                              # compare if equal
0x00000117   ret       0x00000001                             # return from routine

# Method PulseGenerator.SetDigitalOutput
0x00000119   ldloc     0x00000001                             # load 1th argument value : int
0x0000011b   ldc.0                                            # 0
0x0000011c   ble.i     0x0000012a                             # branch if less than or equal
0x0000011e   rld       0x000000ce                             # get Register.General.Commands.OutputBits : int
0x00000120   ldabs     0x00000001                             # load static field OutputMasks : int[]
0x00000122   ldloc     0x00000000                             # load 0th argument index : int
0x00000124   ldelem                                           # load element of int[]
0x00000125   or                                               # integer bitwise OR
0x00000126   rst       0x000000ce                             # set Register.General.Commands.OutputBits : int
0x00000128   ret       0x00000000                             # return from routine
0x0000012a   rld       0x000000ce                             # get Register.General.Commands.OutputBits : int
0x0000012c   ldabs     0x00000001                             # load static field OutputMasks : int[]
0x0000012e   ldloc     0x00000000                             # load 0th argument index : int
0x00000130   ldelem                                           # load element of int[]
0x00000131   not                                              # integer bitwise inversion
0x00000132   and                                              # integer bitwise AND
0x00000133   rst       0x000000ce                             # set Register.General.Commands.OutputBits : int
0x00000135   ret       0x00000000                             # return from routine

# Method Triamec.Tam.Samples.IsochronousTimer.Start
0x00000137   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000139   ldc.0                                            # 0
0x0000013a   stfld     0x00000001                             # store field _tick : uint
0x0000013c   ldloc     0x00000000                             # load this : IsochronousTimer
0x0000013e   ldloc     0x00000001                             # load 0th argument duration : float
0x00000140   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000142   ldfld     0x00000000                             # load field _ticksPerSecond : uint
0x00000144   conv.u4.r4                                       # convert uint to float
0x00000145   mul.r4                                           # float multiplication
0x00000146   conv.r4.u4                                       # convert float to int
0x00000147   stfld     0x00000002                             # store field _dest : uint
0x00000149   ret       0x00000000                             # return from routine

# Method PulseGenerator.Pulse
0x0000014b   ldabs     0x00000007                             # load static field _outputIndex : int
0x0000014d   ldc.1                                            # 1
0x0000014e   add.i4                                           # integer addition
0x0000014f   dup                                              # duplicate top of stack : int
0x00000150   stabs     0x00000007                             # store static field _outputIndex : int
0x00000152   ldabs     0x00000002                             # load static field _outputCount : int
0x00000154   rem.i4                                           # integer remainder
0x00000155   stabs     0x00000007                             # store static field _outputIndex : int
0x00000157   ldabs     0x00000007                             # load static field _outputIndex : int
0x00000159   ldc.1                                            # 1
0x0000015a   ldabs     0x00000008                             # load static field _off : int
0x0000015c   sub.i4                                           # integer subtraction
0x0000015d   call      0x00000000   0x00000002   0x00000119   # call PulseGenerator.SetDigitalOutput(System.Int32, System.Int32)
0x00000161   ldabs     0x00000000                             # load static field Timer : IsochronousTimer
0x00000163   ldabs     0x00000004                             # load static field _offDelay : float
0x00000165   call      0x00000000   0x00000002   0x00000137   # call Triamec.Tam.Samples.IsochronousTimer.Start(System.Single)
0x00000169   ldc.1                                            # 1
0x0000016a   stabs     0x00000006                             # store static field _nextTimerIsOff : bool
0x0000016c   ret       0x00000000                             # return from routine

# Method PulseGenerator..cctor
0x0000016e   rld       0x000000c3                             # get Register.General.Parameters.CycleTimePathPlanner : float
0x00000170   new       0x00000003   0x00000001                # allocate space on the heap for a new instance of class IsochronousTimer
0x00000173   call      0x00000000   0x00000002   0x00000181   # call Triamec.Tam.Samples.IsochronousTimer..ctor(System.Single)
0x00000177   stabs     0x00000000                             # store static field Timer : IsochronousTimer
0x00000179   ldc.8                                            # 8
0x0000017a   newarr                                           # allocate int[]
0x0000017b   stabs     0x00000001                             # store static field OutputMasks : int[]
0x0000017d   ldc.m1                                           # -1
0x0000017e   stabs     0x00000007                             # store static field _outputIndex : int
0x00000180   halt                                             # return from Tama task routine

# Method Triamec.Tam.Samples.IsochronousTimer..ctor
0x00000181   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000183   ldc.m1                                           # -1
0x00000184   stfld     0x00000002                             # store field _dest : uint
0x00000186   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000188   call      0x00000000   0x00000001   0x00000198   # call System.Object..ctor()
0x0000018c   ldloc     0x00000000                             # load this : IsochronousTimer
0x0000018e   ldc       0x3f800000                             # 1
0x00000190   ldloc     0x00000001                             # load 0th argument sampling : float
0x00000192   div.r4                                           # float division
0x00000193   conv.r4.u4                                       # convert float to int
0x00000194   stfld     0x00000000                             # store field _ticksPerSecond : uint
0x00000196   ret       0x00000000                             # return from routine

# Method System.Object..ctor
0x00000198   ret       0x00000000                             # return from routine
