# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: TimerSamples, C:\Skyverse_Dragon\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 16.12.2021 14:58:21
# Target register layout (RLID): 0x00000004
# Space for static fields: 0x00000002
# Maximal stack size: 0x00000020
# Init entry point                 : 0x00000172 (local stack size = 0x00000000)
# Task entry point AsynchronousMain: 0x00000076 (local stack size = 0x00000001)
# Task entry point IsochronousMain : 0x00000001 (local stack size = 0x00000001)
# Task entry point Axis1Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Coupling   : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Coupling   : 0x00000000 (local stack size = 0x00000000)
0x00000000   halt                                             # precautious halt

# Method TimerSamples.Iso
0x00000001   rld       0x000009da                             # get Register.Tama.IsochronousMainCommand : int
0x00000003   stloc     0x00000000                             # store local variable local_0 : int
0x00000005   ldloc     0x00000000                             # load local variable local_0 : int
0x00000007   ldc.1                                            # 1
0x00000008   sub.i4                                           # integer subtraction
0x00000009   switch.   0x00000003                             # switch table
      (   0x0000000f   0x0000001e   0x0000002d   )
0x0000000e   halt                                             # return from Tama task routine
0x0000000f   ldabs     0x00000000                             # load static field Isotimer : IsochronousTimer
0x00000011   rld       0x000009f6                             # get Register.Tama.Variables.GenPurposeIntVar0 : int
0x00000013   call      0x00000000   0x00000002   0x0000003c   # call Triamec.Tam.Samples.IsochronousTimer.Start(System.Int32)
0x00000017   ldc.0                                            # 0
0x00000018   rst       0x000009db                             # set Register.Tama.IsochronousMainState : int
0x0000001a   ldc.3                                            # 3
0x0000001b   rst       0x000009da                             # set Register.Tama.IsochronousMainCommand : int
0x0000001d   halt                                             # return from Tama task routine
0x0000001e   ldabs     0x00000000                             # load static field Isotimer : IsochronousTimer
0x00000020   rld       0x000009dd                             # get Register.Tama.Variables.GenPurposeVar0 : float
0x00000022   call      0x00000000   0x00000002   0x00000049   # call Triamec.Tam.Samples.IsochronousTimer.Start(System.Single)
0x00000026   ldc.0                                            # 0
0x00000027   rst       0x000009db                             # set Register.Tama.IsochronousMainState : int
0x00000029   ldc.3                                            # 3
0x0000002a   rst       0x000009da                             # set Register.Tama.IsochronousMainCommand : int
0x0000002c   halt                                             # return from Tama task routine
0x0000002d   ldabs     0x00000000                             # load static field Isotimer : IsochronousTimer
0x0000002f   call      0x00000001   0x00000002   0x0000005d   # call Triamec.Tam.Samples.IsochronousTimer.Tick()
0x00000033   brfalse   0x0000003b                             # branch if zero
0x00000035   ldc.1                                            # 1
0x00000036   rst       0x000009db                             # set Register.Tama.IsochronousMainState : int
0x00000038   ldc.0                                            # 0
0x00000039   rst       0x000009da                             # set Register.Tama.IsochronousMainCommand : int
0x0000003b   halt                                             # return from Tama task routine

# Method Triamec.Tam.Samples.IsochronousTimer.Start
0x0000003c   ldloc     0x00000000                             # load this : IsochronousTimer
0x0000003e   ldc.0                                            # 0
0x0000003f   stfld     0x00000001                             # store field _tick : uint
0x00000041   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000043   ldloc     0x00000001                             # load 0th argument ticks : int
0x00000045   stfld     0x00000002                             # store field _dest : uint
0x00000047   ret       0x00000000                             # return from routine

# Method Triamec.Tam.Samples.IsochronousTimer.Start
0x00000049   ldloc     0x00000000                             # load this : IsochronousTimer
0x0000004b   ldc.0                                            # 0
0x0000004c   stfld     0x00000001                             # store field _tick : uint
0x0000004e   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000050   ldloc     0x00000001                             # load 0th argument duration : float
0x00000052   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000054   ldfld     0x00000000                             # load field _ticksPerSecond : uint
0x00000056   conv.u4.r4                                       # convert uint to float
0x00000057   mul.r4                                           # float multiplication
0x00000058   conv.r4.u4                                       # convert float to int
0x00000059   stfld     0x00000002                             # store field _dest : uint
0x0000005b   ret       0x00000000                             # return from routine

# Method Triamec.Tam.Samples.IsochronousTimer.Tick
0x0000005d   ldloc     0x00000000                             # load this : IsochronousTimer
0x0000005f   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000061   ldfld     0x00000001                             # load field _tick : uint
0x00000063   ldc.1                                            # 1
0x00000064   add.i4                                           # integer addition
0x00000065   stloc     0x00000001                             # store local variable local_0 : uint
0x00000067   ldloc     0x00000001                             # load local variable local_0 : uint
0x00000069   stfld     0x00000001                             # store field _tick : uint
0x0000006b   ldloc     0x00000001                             # load local variable local_0 : uint
0x0000006d   ldloc     0x00000000                             # load this : IsochronousTimer
0x0000006f   ldfld     0x00000002                             # load field _dest : uint
0x00000071   clt.u                                            # compare if less
0x00000072   ldc.0                                            # 0
0x00000073   ceq                                              # compare if equal
0x00000074   ret       0x00000001                             # return from routine

# Method TimerSamples.Asy
0x00000076   rld       0x000009d6                             # get Register.Tama.AsynchronousMainCommand : int
0x00000078   stloc     0x00000000                             # store local variable local_0 : int
0x0000007a   ldloc     0x00000000                             # load local variable local_0 : int
0x0000007c   switch.   0x00000004                             # switch table
      (   0x000000b5   0x00000083   0x00000094   0x000000a5   )
0x00000082   halt                                             # return from Tama task routine
0x00000083   ldabs     0x00000001                             # load static field Asytimer : AsynchronousTimer
0x00000085   rld       0x000009f7                             # get Register.Tama.Variables.GenPurposeIntVar1 : int
0x00000087   rld       0x000000f0                             # get Register.General.Signals.TriaLinkTimestamp : uint
0x00000089   call      0x00000000   0x00000003   0x000000b6   # call Triamec.Tam.Samples.AsynchronousTimer.Start(System.Int32, System.UInt32)
0x0000008d   ldc.0                                            # 0
0x0000008e   rst       0x000009d7                             # set Register.Tama.AsynchronousMainState : int
0x00000090   ldc.3                                            # 3
0x00000091   rst       0x000009d6                             # set Register.Tama.AsynchronousMainCommand : int
0x00000093   halt                                             # return from Tama task routine
0x00000094   ldabs     0x00000001                             # load static field Asytimer : AsynchronousTimer
0x00000096   rld       0x000009de                             # get Register.Tama.Variables.GenPurposeVar1 : float
0x00000098   rld       0x000000f0                             # get Register.General.Signals.TriaLinkTimestamp : uint
0x0000009a   call      0x00000000   0x00000003   0x00000124   # call Triamec.Tam.Samples.AsynchronousTimer.Start(System.Single, System.UInt32)
0x0000009e   ldc.0                                            # 0
0x0000009f   rst       0x000009d7                             # set Register.Tama.AsynchronousMainState : int
0x000000a1   ldc.3                                            # 3
0x000000a2   rst       0x000009d6                             # set Register.Tama.AsynchronousMainCommand : int
0x000000a4   halt                                             # return from Tama task routine
0x000000a5   ldabs     0x00000001                             # load static field Asytimer : AsynchronousTimer
0x000000a7   rld       0x000000f0                             # get Register.General.Signals.TriaLinkTimestamp : uint
0x000000a9   call      0x00000000   0x00000002   0x00000134   # call Triamec.Tam.Samples.AsynchronousTimer.Elapsed(System.UInt32)
0x000000ad   brfalse   0x000000b5                             # branch if zero
0x000000af   ldc.1                                            # 1
0x000000b0   rst       0x000009d7                             # set Register.Tama.AsynchronousMainState : int
0x000000b2   ldc.0                                            # 0
0x000000b3   rst       0x000009d6                             # set Register.Tama.AsynchronousMainCommand : int
0x000000b5   halt                                             # return from Tama task routine

# Method Triamec.Tam.Samples.AsynchronousTimer.Start
0x000000b6   ldloc     0x00000000                             # load this : AsynchronousTimer
0x000000b8   ldloc     0x00000002                             # load 1th argument currentTime : uint
0x000000ba   ldloc     0x00000001                             # load 0th argument ticks : int
0x000000bc   call      0x00000003   0x00000005   0x000000c4   # call Triamec.Tam.Samples.Timestamp.Add(System.UInt32, System.Int32)
0x000000c0   stfld     0x00000000                             # store field _dest : uint
0x000000c2   ret       0x00000000                             # return from routine

# Method Triamec.Tam.Samples.Timestamp.Add
0x000000c4   ldloc     0x00000001                             # load 1th argument duration : int
0x000000c6   ldc.0                                            # 0
0x000000c7   bge.i     0x000000da                             # branch if greater
0x000000c9   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x000000cb   ldloc     0x00000001                             # load 1th argument duration : int
0x000000cd   ldc.1                                            # 1
0x000000ce   add.i4                                           # integer addition
0x000000cf   neg.i4                                           # integer negation
0x000000d0   call      0x00000003   0x00000005   0x000000ff   # call Triamec.Tam.Samples.Timestamp.Subtract(System.UInt32, System.Int32)
0x000000d4   ldc.1                                            # 1
0x000000d5   sub.i4                                           # integer subtraction
0x000000d6   stloc     0x00000002                             # store local variable result : uint
0x000000d8   br        0x000000fb                             # branch unconditionally
0x000000da   ldloc     0x00000001                             # load 1th argument duration : int
0x000000dc   stloc     0x00000003                             # store local variable positiveDuration : uint
0x000000de   ldc       0xffffff00                             # -256
0x000000e0   ldloc     0x00000003                             # load local variable positiveDuration : uint
0x000000e2   sub.i4                                           # integer subtraction
0x000000e3   stloc     0x00000004                             # store local variable temp : uint
0x000000e5   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x000000e7   ldloc     0x00000004                             # load local variable temp : uint
0x000000e9   bge.u     0x000000f4                             # branch if greater or equal
0x000000eb   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x000000ed   ldloc     0x00000003                             # load local variable positiveDuration : uint
0x000000ef   add.i4                                           # integer addition
0x000000f0   stloc     0x00000002                             # store local variable result : uint
0x000000f2   br        0x000000fb                             # branch unconditionally
0x000000f4   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x000000f6   ldloc     0x00000004                             # load local variable temp : uint
0x000000f8   sub.i4                                           # integer subtraction
0x000000f9   stloc     0x00000002                             # store local variable result : uint
0x000000fb   ldloc     0x00000002                             # load local variable result : uint
0x000000fd   ret       0x00000001                             # return from routine

# Method Triamec.Tam.Samples.Timestamp.Subtract
0x000000ff   ldloc     0x00000001                             # load 1th argument duration : int
0x00000101   stloc     0x00000003                             # store local variable positiveDuration : uint
0x00000103   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x00000105   ldloc     0x00000003                             # load local variable positiveDuration : uint
0x00000107   blt.u     0x00000112                             # branch if less
0x00000109   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x0000010b   ldloc     0x00000003                             # load local variable positiveDuration : uint
0x0000010d   sub.i4                                           # integer subtraction
0x0000010e   stloc     0x00000002                             # store local variable result : uint
0x00000110   br        0x00000120                             # branch unconditionally
0x00000112   ldc       0xffffff00                             # -256
0x00000114   ldloc     0x00000003                             # load local variable positiveDuration : uint
0x00000116   sub.i4                                           # integer subtraction
0x00000117   stloc     0x00000004                             # store local variable temp : uint
0x00000119   ldloc     0x00000000                             # load 0th argument timestamp : uint
0x0000011b   ldloc     0x00000004                             # load local variable temp : uint
0x0000011d   add.i4                                           # integer addition
0x0000011e   stloc     0x00000002                             # store local variable result : uint
0x00000120   ldloc     0x00000002                             # load local variable result : uint
0x00000122   ret       0x00000001                             # return from routine

# Method Triamec.Tam.Samples.AsynchronousTimer.Start
0x00000124   ldloc     0x00000000                             # load this : AsynchronousTimer
0x00000126   ldloc     0x00000001                             # load 0th argument duration : float
0x00000128   ldc       0x47c35000                             # 100000
0x0000012a   mul.r4                                           # float multiplication
0x0000012b   conv.r4.i4                                       # convert float to int
0x0000012c   ldloc     0x00000002                             # load 1th argument currentTime : uint
0x0000012e   call      0x00000000   0x00000003   0x000000b6   # call Triamec.Tam.Samples.AsynchronousTimer.Start(System.Int32, System.UInt32)
0x00000132   ret       0x00000000                             # return from routine

# Method Triamec.Tam.Samples.AsynchronousTimer.Elapsed
0x00000134   ldloc     0x00000001                             # load 0th argument currentTime : uint
0x00000136   ldloc     0x00000000                             # load this : AsynchronousTimer
0x00000138   ldfld     0x00000000                             # load field _dest : uint
0x0000013a   call      0x00000001   0x00000003   0x00000140   # call Triamec.Tam.Samples.Timestamp.Greater(System.UInt32, System.UInt32)
0x0000013e   ret       0x00000001                             # return from routine

# Method Triamec.Tam.Samples.Timestamp.Greater
0x00000140   ldloc     0x00000000                             # load 0th argument value1 : uint
0x00000142   ldc       0x7fffff7f                             # 2147483519
0x00000144   clt.u                                            # compare if less
0x00000145   stloc     0x00000002                             # store local variable wrapProtector : bool
0x00000147   ldloc     0x00000001                             # load 1th argument value2 : uint
0x00000149   ldloc     0x00000000                             # load 0th argument value1 : uint
0x0000014b   bge.u     0x0000015a                             # branch if greater or equal
0x0000014d   ldloc     0x00000002                             # load local variable wrapProtector : bool
0x0000014f   brtrue    0x0000016f                             # branch if not zero
0x00000151   ldloc     0x00000001                             # load 1th argument value2 : uint
0x00000153   ldloc     0x00000000                             # load 0th argument value1 : uint
0x00000155   ldc       0x7fffff7f                             # 2147483519
0x00000157   sub.i4                                           # integer subtraction
0x00000158   bge.u     0x0000016f                             # branch if greater or equal
0x0000015a   ldloc     0x00000002                             # load local variable wrapProtector : bool
0x0000015c   brfalse   0x0000016c                             # branch if zero
0x0000015e   ldloc     0x00000001                             # load 1th argument value2 : uint
0x00000160   ldloc     0x00000000                             # load 0th argument value1 : uint
0x00000162   ldc       0x7fffff7f                             # 2147483519
0x00000164   add.i4                                           # integer addition
0x00000165   ldc.2                                            # 2
0x00000166   add.i4                                           # integer addition
0x00000167   clt.u                                            # compare if less
0x00000168   ldc.0                                            # 0
0x00000169   ceq                                              # compare if equal
0x0000016a   ret       0x00000001                             # return from routine
0x0000016c   ldc.0                                            # 0
0x0000016d   ret       0x00000001                             # return from routine
0x0000016f   ldc.1                                            # 1
0x00000170   ret       0x00000001                             # return from routine

# Method TimerSamples..cctor
0x00000172   rld       0x000000cb                             # get Register.General.Parameters.CycleTimePathPlanner : float
0x00000174   new       0x00000003   0x00000001                # allocate space on the heap for a new instance of class IsochronousTimer
0x00000177   call      0x00000000   0x00000002   0x00000187   # call Triamec.Tam.Samples.IsochronousTimer..ctor(System.Single)
0x0000017b   stabs     0x00000000                             # store static field Isotimer : IsochronousTimer
0x0000017d   new       0x00000001   0x00000000                # allocate space on the heap for a new instance of class AsynchronousTimer
0x00000180   call      0x00000000   0x00000001   0x000001a0   # call Triamec.Tam.Samples.AsynchronousTimer..ctor()
0x00000184   stabs     0x00000001                             # store static field Asytimer : AsynchronousTimer
0x00000186   halt                                             # return from Tama task routine

# Method Triamec.Tam.Samples.IsochronousTimer..ctor
0x00000187   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000189   ldc.m1                                           # -1
0x0000018a   stfld     0x00000002                             # store field _dest : uint
0x0000018c   ldloc     0x00000000                             # load this : IsochronousTimer
0x0000018e   call      0x00000000   0x00000001   0x0000019e   # call System.Object..ctor()
0x00000192   ldloc     0x00000000                             # load this : IsochronousTimer
0x00000194   ldc       0x3f800000                             # 1
0x00000196   ldloc     0x00000001                             # load 0th argument sampling : float
0x00000198   div.r4                                           # float division
0x00000199   conv.r4.u4                                       # convert float to int
0x0000019a   stfld     0x00000000                             # store field _ticksPerSecond : uint
0x0000019c   ret       0x00000000                             # return from routine

# Method System.Object..ctor
0x0000019e   ret       0x00000000                             # return from routine

# Method Triamec.Tam.Samples.AsynchronousTimer..ctor
0x000001a0   ldloc     0x00000000                             # load this : AsynchronousTimer
0x000001a2   call      0x00000000   0x00000001   0x0000019e   # call System.Object..ctor()
0x000001a6   ret       0x00000000                             # return from routine
