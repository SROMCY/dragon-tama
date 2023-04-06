# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: PulseGeneratorTsd, C:\Skyverse_Dragon\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 16.12.2021 14:58:21
# Target register layout (RLID): 0x00000013
# Space for static fields: 0x0000000a
# Maximal stack size: 0x0000001a
# Init entry point                 : 0x000001df (local stack size = 0x00000000)
# Task entry point AsynchronousMain: 0x00000000 (local stack size = 0x00000000)
# Task entry point IsochronousMain : 0x00000001 (local stack size = 0x0000000b)
# Task entry point Axis1Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Coupling   : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Coupling   : 0x00000000 (local stack size = 0x00000000)
0x00000000   halt                                             # precautious halt

# Method PulseGeneratorTsd.IsoMain
0x00000001   ldabs     0x00000003                             # load static field _outputCount : int
0x00000003   ldc.0                                            # 0
0x00000004   ble.i     0x0000003b                             # branch if less than or equal
0x00000006   ldabs     0x00000000                             # load static field Timer : IsochronousTimer
0x00000008   call      0x00000001   0x00000002   0x00000139   # call Triamec.Tam.Samples.IsochronousTimer.Tick()
0x0000000c   brfalse   0x0000003b                             # branch if zero
0x0000000e   ldabs     0x00000007                             # load static field _nextTimerIsOff : bool
0x00000010   brfalse   0x00000037                             # branch if zero
0x00000012   ldabs     0x00000003                             # load static field _outputCount : int
0x00000014   ldabs     0x00000008                             # load static field _outputIndex : int
0x00000016   add.i4                                           # integer addition
0x00000017   ldabs     0x00000006                             # load static field _offLag : int
0x00000019   sub.i4                                           # integer subtraction
0x0000001a   ldabs     0x00000003                             # load static field _outputCount : int
0x0000001c   rem.i4                                           # integer remainder
0x0000001d   stloc     0x00000001                             # store local variable offBit : int
0x0000001f   ldloc     0x00000001                             # load local variable offBit : int
0x00000021   ldabs     0x00000009                             # load static field _off : int
0x00000023   call      0x00000003   0x00000005   0x00000152   # call PulseGeneratorTsd.SetDigitalOutput(System.Int32, System.Int32)
0x00000027   ldabs     0x00000000                             # load static field Timer : IsochronousTimer
0x00000029   ldabs     0x00000004                             # load static field _pulseStep : float
0x0000002b   ldabs     0x00000005                             # load static field _offDelay : float
0x0000002d   sub.r4                                           # float subtraction
0x0000002e   call      0x00000000   0x00000002   0x000001a8   # call Triamec.Tam.Samples.IsochronousTimer.Start(System.Single)
0x00000032   ldc.0                                            # 0
0x00000033   stabs     0x00000007                             # store static field _nextTimerIsOff : bool
0x00000035   br        0x0000003b                             # branch unconditionally
0x00000037   call      0x00000000   0x00000000   0x000001bc   # call PulseGeneratorTsd.Pulse()
0x0000003b   rld       0x00237d00                             # get Register.Application.TamaControl.IsochronousMainCommand : int
0x0000003d   stloc     0x00000000                             # store local variable command : int
0x0000003f   rld       0x00237e00                             # get Register.Application.TamaControl.IsochronousMainState : int
0x00000041   ldloc     0x00000000                             # load local variable command : int
0x00000043   beq       0x00000138                             # branch if equal
0x00000045   ldloc     0x00000000                             # load local variable command : int
0x00000047   rst       0x00237e00                             # set Register.Application.TamaControl.IsochronousMainState : int
0x00000049   ldc.0                                            # 0
0x0000004a   stabs     0x00000007                             # store static field _nextTimerIsOff : bool
0x0000004c   ldc.m1                                           # -1
0x0000004d   stabs     0x00000008                             # store static field _outputIndex : int
0x0000004f   ldloc     0x00000000                             # load local variable command : int
0x00000051   brtrue    0x00000070                             # branch if not zero
0x00000053   ldc.0                                            # 0
0x00000054   stloc     0x00000002                             # store local variable i : int
0x00000056   br        0x00000066                             # branch unconditionally
0x00000058   ldloc     0x00000002                             # load local variable i : int
0x0000005a   ldabs     0x00000009                             # load static field _off : int
0x0000005c   call      0x00000003   0x00000005   0x00000152   # call PulseGeneratorTsd.SetDigitalOutput(System.Int32, System.Int32)
0x00000060   ldloc     0x00000002                             # load local variable i : int
0x00000062   ldc.1                                            # 1
0x00000063   add.i4                                           # integer addition
0x00000064   stloc     0x00000002                             # store local variable i : int
0x00000066   ldloc     0x00000002                             # load local variable i : int
0x00000068   ldabs     0x00000003                             # load static field _outputCount : int
0x0000006a   blt.i     0x00000058                             # branch if less
0x0000006c   ldc.0                                            # 0
0x0000006d   stabs     0x00000003                             # store static field _outputCount : int
0x0000006f   halt                                             # return from Tama task routine
0x00000070   ldc.0                                            # 0
0x00000071   rlde      0x00000008   0x00238701                # get Register.Application.Variables.Integers[TOS] : int
0x00000074   stloc     0x00000003                             # store local variable outputs : int
0x00000076   ldc.0                                            # 0
0x00000077   stloc     0x00000004                             # store local variable j : int
0x00000079   ldc.0                                            # 0
0x0000007a   stloc     0x00000005                             # store local variable ax : int
0x0000007c   br        0x000000cb                             # branch unconditionally
0x0000007e   ldc.0                                            # 0
0x0000007f   stloc     0x00000006                             # store local variable pin : int
0x00000081   br        0x000000c0                             # branch unconditionally
0x00000083   ldc.1                                            # 1
0x00000084   ldloc     0x00000005                             # load local variable ax : int
0x00000086   ldc.8                                            # 8
0x00000087   mul.i4                                           # integer multiplication
0x00000088   ldloc     0x00000006                             # load local variable pin : int
0x0000008a   add.i4                                           # integer addition
0x0000008b   ldc       0x0000001f                             # 31
0x0000008d   and                                              # integer bitwise AND
0x0000008e   shl                                              # integer shift left
0x0000008f   stloc     0x00000007                             # store local variable mask : int
0x00000091   ldloc     0x00000007                             # load local variable mask : int
0x00000093   ldloc     0x00000003                             # load local variable outputs : int
0x00000095   and                                              # integer bitwise AND
0x00000096   brfalse   0x000000ae                             # branch if zero
0x00000098   ldabs     0x00000001                             # load static field OutputAxis : int[]
0x0000009a   ldloc     0x00000004                             # load local variable j : int
0x0000009c   ldloc     0x00000005                             # load local variable ax : int
0x0000009e   stelem                                           # store element of int[]
0x0000009f   ldabs     0x00000002                             # load static field OutputPin : int[]
0x000000a1   ldloc     0x00000004                             # load local variable j : int
0x000000a3   ldloc     0x00000006                             # load local variable pin : int
0x000000a5   stelem                                           # store element of int[]
0x000000a6   ldloc     0x00000004                             # load local variable j : int
0x000000a8   ldc.1                                            # 1
0x000000a9   add.i4                                           # integer addition
0x000000aa   stloc     0x00000004                             # store local variable j : int
0x000000ac   br        0x000000ba                             # branch unconditionally
0x000000ae   ldabs     0x00000001                             # load static field OutputAxis : int[]
0x000000b0   ldloc     0x00000004                             # load local variable j : int
0x000000b2   ldc.m1                                           # -1
0x000000b3   stelem                                           # store element of int[]
0x000000b4   ldabs     0x00000002                             # load static field OutputPin : int[]
0x000000b6   ldloc     0x00000004                             # load local variable j : int
0x000000b8   ldc.m1                                           # -1
0x000000b9   stelem                                           # store element of int[]
0x000000ba   ldloc     0x00000006                             # load local variable pin : int
0x000000bc   ldc.1                                            # 1
0x000000bd   add.i4                                           # integer addition
0x000000be   stloc     0x00000006                             # store local variable pin : int
0x000000c0   ldloc     0x00000006                             # load local variable pin : int
0x000000c2   ldc.8                                            # 8
0x000000c3   blt.i     0x00000083                             # branch if less
0x000000c5   ldloc     0x00000005                             # load local variable ax : int
0x000000c7   ldc.1                                            # 1
0x000000c8   add.i4                                           # integer addition
0x000000c9   stloc     0x00000005                             # store local variable ax : int
0x000000cb   ldloc     0x00000005                             # load local variable ax : int
0x000000cd   ldc.2                                            # 2
0x000000ce   blt.i     0x0000007e                             # branch if less
0x000000d0   ldloc     0x00000004                             # load local variable j : int
0x000000d2   stabs     0x00000003                             # store static field _outputCount : int
0x000000d4   ldabs     0x00000003                             # load static field _outputCount : int
0x000000d6   ldc.0                                            # 0
0x000000d7   ble.i     0x00000138                             # branch if less than or equal
0x000000d9   ldc.1                                            # 1
0x000000da   rlde      0x00000008   0x00238701                # get Register.Application.Variables.Integers[TOS] : int
0x000000dd   stabs     0x00000009                             # store static field _off : int
0x000000df   ldc.0                                            # 0
0x000000e0   stloc     0x0000000a                             # store local variable i : int
0x000000e2   br        0x000000f2                             # branch unconditionally
0x000000e4   ldloc     0x0000000a                             # load local variable i : int
0x000000e6   ldabs     0x00000009                             # load static field _off : int
0x000000e8   call      0x00000003   0x00000005   0x00000152   # call PulseGeneratorTsd.SetDigitalOutput(System.Int32, System.Int32)
0x000000ec   ldloc     0x0000000a                             # load local variable i : int
0x000000ee   ldc.1                                            # 1
0x000000ef   add.i4                                           # integer addition
0x000000f0   stloc     0x0000000a                             # store local variable i : int
0x000000f2   ldloc     0x0000000a                             # load local variable i : int
0x000000f4   ldabs     0x00000003                             # load static field _outputCount : int
0x000000f6   blt.i     0x000000e4                             # branch if less
0x000000f8   ldc.0                                            # 0
0x000000f9   rlde      0x00000020   0x00238601                # get Register.Application.Variables.Floats[TOS] : float
0x000000fc   stloc     0x00000008                             # store local variable pulsePeriod : float
0x000000fe   ldc.1                                            # 1
0x000000ff   rlde      0x00000020   0x00238601                # get Register.Application.Variables.Floats[TOS] : float
0x00000102   stloc     0x00000009                             # store local variable pulseWidth : float
0x00000104   ldloc     0x00000009                             # load local variable pulseWidth : float
0x00000106   ldloc     0x00000008                             # load local variable pulsePeriod : float
0x00000108   blt.f     0x00000116                             # branch if less
0x0000010a   ldabs     0x00000001                             # load static field OutputAxis : int[]
0x0000010c   ldc       0x7fffffff                             # 2147483647
0x0000010e   ldc.0                                            # 0
0x0000010f   stelem                                           # store element of int[]
0x00000110   ldabs     0x00000002                             # load static field OutputPin : int[]
0x00000112   ldc       0x7fffffff                             # 2147483647
0x00000114   ldc.0                                            # 0
0x00000115   stelem                                           # store element of int[]
0x00000116   ldloc     0x00000008                             # load local variable pulsePeriod : float
0x00000118   ldabs     0x00000003                             # load static field _outputCount : int
0x0000011a   conv.i4.r4                                       # convert int to float
0x0000011b   div.r4                                           # float division
0x0000011c   stabs     0x00000004                             # store static field _pulseStep : float
0x0000011e   ldloc     0x00000009                             # load local variable pulseWidth : float
0x00000120   ldabs     0x00000004                             # load static field _pulseStep : float
0x00000122   rem.r4                                           # float remainder
0x00000123   stabs     0x00000005                             # store static field _offDelay : float
0x00000125   ldloc     0x00000009                             # load local variable pulseWidth : float
0x00000127   ldabs     0x00000004                             # load static field _pulseStep : float
0x00000129   div.r4                                           # float division
0x0000012a   conv.r4.i4                                       # convert float to int
0x0000012b   stabs     0x00000006                             # store static field _offLag : int
0x0000012d   ldabs     0x00000000                             # load static field Timer : IsochronousTimer
0x0000012f   ldabs     0x00000005                             # load static field _offDelay : float
0x00000131   call      0x00000000   0x00000002   0x000001a8   # call Triamec.Tam.Samples.IsochronousTimer.Start(System.Single)
0x00000135   ldc.1                                            # 1
0x00000136   stabs     0x00000007                             # store static field _nextTimerIsOff : bool
0x00000138   halt                                             # return from Tama task routine

# Method Triamec.Tam.Samples.IsochronousTimer.Tick
0x00000139   ldloc     0x00000000                             # load this : IsochronousTimer
0x0000013b   ldloc     0x00000000                             # load this : IsochronousTimer
0x0000013d   ldfld     0x00000001                             # load field _tick : uint
0x0000013f   ldc.1                                            # 1
0x00000140   add.i4                                           # integer addition
0x00000141   stloc     0x00000001                             # store local variable local_0 : uint
0x00000143   ldloc     0x00000001                             # load local variable local_0 : uint
0x00000145   stfld     0x00000001                             # store field _tick : uint
0x00000147   ldloc     0x00000001                             # load local variable local_0 : uint
0x00000149   ldloc     0x00000000                             # load this : IsochronousTimer
0x0000014b   ldfld     0x00000002                             # load field _dest : uint
0x0000014d   clt.u                                            # compare if less
0x0000014e   ldc.0                                            # 0
0x0000014f   ceq                                              # compare if equal
0x00000150   ret       0x00000001                             # return from routine

# Method PulseGeneratorTsd.SetDigitalOutput
0x00000152   ldabs     0x00000001                             # load static field OutputAxis : int[]
0x00000154   ldloc     0x00000000                             # load 0th argument index : int
0x00000156   ldelem                                           # load element of int[]
0x00000157   stloc     0x00000002                             # store local variable local_0 : int
0x00000159   ldloc     0x00000002                             # load local variable local_0 : int
0x0000015b   brfalse   0x00000164                             # branch if zero
0x0000015d   ldloc     0x00000002                             # load local variable local_0 : int
0x0000015f   ldc.1                                            # 1
0x00000160   beq       0x00000186                             # branch if equal
0x00000162   ret       0x00000000                             # return from routine
0x00000164   ldabs     0x00000002                             # load static field OutputPin : int[]
0x00000166   ldloc     0x00000000                             # load 0th argument index : int
0x00000168   ldelem                                           # load element of int[]
0x00000169   stloc     0x00000003                             # store local variable local_1 : int
0x0000016b   ldloc     0x00000003                             # load local variable local_1 : int
0x0000016d   brfalse   0x00000176                             # branch if zero
0x0000016f   ldloc     0x00000003                             # load local variable local_1 : int
0x00000171   ldc.1                                            # 1
0x00000172   beq       0x0000017e                             # branch if equal
0x00000174   ret       0x00000000                             # return from routine
0x00000176   ldloc     0x00000001                             # load 1th argument value : int
0x00000178   ldc.0                                            # 0
0x00000179   cgt.i                                            # compare if greater
0x0000017a   rst       0x00227400                             # set Register.Axes_0.Commands.General.DigitalOut1 : bool
0x0000017c   ret       0x00000000                             # return from routine
0x0000017e   ldloc     0x00000001                             # load 1th argument value : int
0x00000180   ldc.0                                            # 0
0x00000181   cgt.i                                            # compare if greater
0x00000182   rst       0x00227500                             # set Register.Axes_0.Commands.General.DigitalOut2 : bool
0x00000184   ret       0x00000000                             # return from routine
0x00000186   ldabs     0x00000002                             # load static field OutputPin : int[]
0x00000188   ldloc     0x00000000                             # load 0th argument index : int
0x0000018a   ldelem                                           # load element of int[]
0x0000018b   stloc     0x00000004                             # store local variable local_2 : int
0x0000018d   ldloc     0x00000004                             # load local variable local_2 : int
0x0000018f   brfalse   0x00000198                             # branch if zero
0x00000191   ldloc     0x00000004                             # load local variable local_2 : int
0x00000193   ldc.1                                            # 1
0x00000194   beq       0x000001a0                             # branch if equal
0x00000196   ret       0x00000000                             # return from routine
0x00000198   ldloc     0x00000001                             # load 1th argument value : int
0x0000019a   ldc.0                                            # 0
0x0000019b   cgt.i                                            # compare if greater
0x0000019c   rst       0x002a7400                             # set Register.Axes_1.Commands.General.DigitalOut1 : bool
0x0000019e   ret       0x00000000                             # return from routine
0x000001a0   ldloc     0x00000001                             # load 1th argument value : int
0x000001a2   ldc.0                                            # 0
0x000001a3   cgt.i                                            # compare if greater
0x000001a4   rst       0x002a7500                             # set Register.Axes_1.Commands.General.DigitalOut2 : bool
0x000001a6   ret       0x00000000                             # return from routine

# Method Triamec.Tam.Samples.IsochronousTimer.Start
0x000001a8   ldloc     0x00000000                             # load this : IsochronousTimer
0x000001aa   ldc.0                                            # 0
0x000001ab   stfld     0x00000001                             # store field _tick : uint
0x000001ad   ldloc     0x00000000                             # load this : IsochronousTimer
0x000001af   ldloc     0x00000001                             # load 0th argument duration : float
0x000001b1   ldloc     0x00000000                             # load this : IsochronousTimer
0x000001b3   ldfld     0x00000000                             # load field _ticksPerSecond : uint
0x000001b5   conv.u4.r4                                       # convert uint to float
0x000001b6   mul.r4                                           # float multiplication
0x000001b7   conv.r4.u4                                       # convert float to int
0x000001b8   stfld     0x00000002                             # store field _dest : uint
0x000001ba   ret       0x00000000                             # return from routine

# Method PulseGeneratorTsd.Pulse
0x000001bc   ldabs     0x00000008                             # load static field _outputIndex : int
0x000001be   ldc.1                                            # 1
0x000001bf   add.i4                                           # integer addition
0x000001c0   dup                                              # duplicate top of stack : int
0x000001c1   stabs     0x00000008                             # store static field _outputIndex : int
0x000001c3   ldabs     0x00000003                             # load static field _outputCount : int
0x000001c5   rem.i4                                           # integer remainder
0x000001c6   stabs     0x00000008                             # store static field _outputIndex : int
0x000001c8   ldabs     0x00000008                             # load static field _outputIndex : int
0x000001ca   ldc.1                                            # 1
0x000001cb   ldabs     0x00000009                             # load static field _off : int
0x000001cd   sub.i4                                           # integer subtraction
0x000001ce   call      0x00000003   0x00000005   0x00000152   # call PulseGeneratorTsd.SetDigitalOutput(System.Int32, System.Int32)
0x000001d2   ldabs     0x00000000                             # load static field Timer : IsochronousTimer
0x000001d4   ldabs     0x00000005                             # load static field _offDelay : float
0x000001d6   call      0x00000000   0x00000002   0x000001a8   # call Triamec.Tam.Samples.IsochronousTimer.Start(System.Single)
0x000001da   ldc.1                                            # 1
0x000001db   stabs     0x00000007                             # store static field _nextTimerIsOff : bool
0x000001dd   ret       0x00000000                             # return from routine

# Method PulseGeneratorTsd..cctor
0x000001df   rld       0x00213800                             # get Register.General.Signals.Internals.CycleTimePathPlanner : float
0x000001e1   new       0x00000003   0x00000001                # allocate space on the heap for a new instance of class IsochronousTimer
0x000001e4   call      0x00000000   0x00000002   0x000001f6   # call Triamec.Tam.Samples.IsochronousTimer..ctor(System.Single)
0x000001e8   stabs     0x00000000                             # store static field Timer : IsochronousTimer
0x000001ea   ldc.8                                            # 8
0x000001eb   newarr                                           # allocate int[]
0x000001ec   stabs     0x00000001                             # store static field OutputAxis : int[]
0x000001ee   ldc.8                                            # 8
0x000001ef   newarr                                           # allocate int[]
0x000001f0   stabs     0x00000002                             # store static field OutputPin : int[]
0x000001f2   ldc.m1                                           # -1
0x000001f3   stabs     0x00000008                             # store static field _outputIndex : int
0x000001f5   halt                                             # return from Tama task routine

# Method Triamec.Tam.Samples.IsochronousTimer..ctor
0x000001f6   ldloc     0x00000000                             # load this : IsochronousTimer
0x000001f8   ldc.m1                                           # -1
0x000001f9   stfld     0x00000002                             # store field _dest : uint
0x000001fb   ldloc     0x00000000                             # load this : IsochronousTimer
0x000001fd   call      0x00000000   0x00000001   0x0000020d   # call System.Object..ctor()
0x00000201   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000203   ldc       0x3f800000                             # 1
0x00000205   ldloc     0x00000001                             # load 0th argument sampling : float
0x00000207   div.r4                                           # float division
0x00000208   conv.r4.u4                                       # convert float to int
0x00000209   stfld     0x00000000                             # store field _ticksPerSecond : uint
0x0000020b   ret       0x00000000                             # return from routine

# Method System.Object..ctor
0x0000020d   ret       0x00000000                             # return from routine
