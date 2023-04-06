# Tama assembly file
# Target virtual machine (VMID): 0x00000005
# Source: AxisCompensationDemo, C:\Skyverse_Dragon\Tama\Tama Library\bin\Rlid16\Tama Library.dll
# Compile time: 25.10.2021 13:53:23
# Target register layout (RLID): 0x00000013
# Space for static fields: 0x00000002
# Maximal stack size: 0x0000003a
# Init entry point                 : 0x00000001 (local stack size = 0x00000000)
# Task entry point AsynchronousMain: 0x00000000 (local stack size = 0x00000000)
# Task entry point IsochronousMain : 0x00000037 (local stack size = 0x00000004)
# Task entry point Axis1Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis1Coupling   : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Init       : 0x00000000 (local stack size = 0x00000000)
# Task entry point Axis2Coupling   : 0x00000000 (local stack size = 0x00000000)
0x00000000   halt                                             # precautious halt

# Method AxisCompensationDemo..cctor
0x00000001   ldc.1                                            # 1
0x00000002   new       0x00000003   0x00000001                # allocate space on the heap for a new instance of class AxisCompensation
0x00000005   call      0x00000000   0x00000002   0x0000001c   # call AxisCompensation..ctor(System.Int32)
0x00000009   stabs     0x00000000                             # store static field axis0Compensation : AxisCompensation
0x0000000b   ldc.2                                            # 2
0x0000000c   new       0x00000003   0x00000001                # allocate space on the heap for a new instance of class AxisCompensation
0x0000000f   call      0x00000000   0x00000002   0x0000001c   # call AxisCompensation..ctor(System.Int32)
0x00000013   stabs     0x00000001                             # store static field axis1Compensation : AxisCompensation
0x00000015   ldc       0x0000001f                             # 31
0x00000017   ldc.1                                            # 1
0x00000018   rste      0x00000008   0x00238701                # set Register.Application.Variables.Integers[TOS] : int
0x0000001b   halt                                             # return from Tama task routine

# Method AxisCompensation..ctor
0x0000001c   ldloc     0x00000000                             # load this : AxisCompensation
0x0000001e   call      0x00000000   0x00000001   0x00000035   # call System.Object..ctor()
0x00000022   ldloc     0x00000000                             # load this : AxisCompensation
0x00000024   ldc       0x00000000                             # 0
0x00000026   stfld     0x00000001                             # store field compGain : float
0x00000028   ldloc     0x00000000                             # load this : AxisCompensation
0x0000002a   ldc.0                                            # 0
0x0000002b   stfld     0x00000002                             # store field state : AxisCompensation.State
0x0000002d   ldloc     0x00000000                             # load this : AxisCompensation
0x0000002f   ldloc     0x00000001                             # load 0th argument tableIndex : int
0x00000031   stfld     0x00000000                             # store field tblIdx : int
0x00000033   ret       0x00000000                             # return from routine

# Method System.Object..ctor
0x00000035   ret       0x00000000                             # return from routine

# Method AxisCompensationDemo.IsochronousTask
0x00000037   rld       0x0022ad00                             # get Register.Axes_0.Signals.PathPlanner.PositionFloat : float
0x00000039   stloc     0x00000001                             # store local variable xEnc : float
0x0000003b   rld       0x002aad00                             # get Register.Axes_1.Signals.PathPlanner.PositionFloat : float
0x0000003d   stloc     0x00000002                             # store local variable yEnc : float
0x0000003f   rld       0x0023f000                             # get Register.Axes_0.Signals.Homing.State : HomingState
0x00000041   ldc       0x00000014                             # 20
0x00000043   bne       0x0000004d                             # branch if not equal
0x00000045   rld       0x00229a00                             # get Register.Axes_0.Signals.General.AxisState : AxisState
0x00000047   ldc.3                                            # 3
0x00000048   clt.i                                            # compare if less
0x00000049   ldc.0                                            # 0
0x0000004a   ceq                                              # compare if equal
0x0000004b   br        0x0000004e                             # branch unconditionally
0x0000004d   ldc.0                                            # 0
0x0000004e   stloc     0x00000000                             # store local variable enable : bool
0x00000050   ldabs     0x00000000                             # load static field axis0Compensation : AxisCompensation
0x00000052   ldloc     0x00000000                             # load local variable enable : bool
0x00000054   ldloc     0x00000001                             # load local variable xEnc : float
0x00000056   ldloc     0x00000002                             # load local variable yEnc : float
0x00000058   call      0x00000001   0x00000005   0x00000086   # call AxisCompensation.Run2D(System.Boolean, System.Single, System.Single)
0x0000005c   stloc     0x00000003                             # store local variable compensation : float
0x0000005e   ldloc     0x00000003                             # load local variable compensation : float
0x00000060   rst       0x00208200                             # set Register.Axes_0.Commands.PositionController.Encoders_0.InjectedPosition : float
0x00000062   rld       0x002bf000                             # get Register.Axes_1.Signals.Homing.State : HomingState
0x00000064   ldc       0x00000014                             # 20
0x00000066   bne       0x00000070                             # branch if not equal
0x00000068   rld       0x002a9a00                             # get Register.Axes_1.Signals.General.AxisState : AxisState
0x0000006a   ldc.3                                            # 3
0x0000006b   clt.i                                            # compare if less
0x0000006c   ldc.0                                            # 0
0x0000006d   ceq                                              # compare if equal
0x0000006e   br        0x00000071                             # branch unconditionally
0x00000070   ldc.0                                            # 0
0x00000071   stloc     0x00000000                             # store local variable enable : bool
0x00000073   ldabs     0x00000001                             # load static field axis1Compensation : AxisCompensation
0x00000075   ldloc     0x00000000                             # load local variable enable : bool
0x00000077   ldloc     0x00000001                             # load local variable xEnc : float
0x00000079   ldloc     0x00000002                             # load local variable yEnc : float
0x0000007b   call      0x00000001   0x00000005   0x00000086   # call AxisCompensation.Run2D(System.Boolean, System.Single, System.Single)
0x0000007f   stloc     0x00000003                             # store local variable compensation : float
0x00000081   ldloc     0x00000003                             # load local variable compensation : float
0x00000083   rst       0x00288200                             # set Register.Axes_1.Commands.PositionController.Encoders_0.InjectedPosition : float
0x00000085   halt                                             # return from Tama task routine

# Method AxisCompensation.Run2D
0x00000086   ldloc     0x00000000                             # load this : AxisCompensation
0x00000088   ldloc     0x00000001                             # load 0th argument enable : bool
0x0000008a   call      0x00000001   0x00000003   0x0000009f   # call AxisCompensation.StateMachine(System.Boolean)
0x0000008e   stloc     0x00000004                             # store local variable gain : float
0x00000090   ldloc     0x00000000                             # load this : AxisCompensation
0x00000092   ldloc     0x00000002                             # load 1th argument xEnc : float
0x00000094   ldloc     0x00000003                             # load 2th argument yEnc : float
0x00000096   call      0x00000013   0x00000016   0x00000119   # call AxisCompensation.GetCompensation2D(System.Single, System.Single)
0x0000009a   ldloc     0x00000004                             # load local variable gain : float
0x0000009c   mul.r4                                           # float multiplication
0x0000009d   ret       0x00000001                             # return from routine

# Method AxisCompensation.StateMachine
0x0000009f   ldloc     0x00000000                             # load this : AxisCompensation
0x000000a1   ldfld     0x00000002                             # load field state : AxisCompensation.State
0x000000a3   stloc     0x00000002                             # store local variable local_0 : AxisCompensation.State
0x000000a5   ldloc     0x00000002                             # load local variable local_0 : AxisCompensation.State
0x000000a7   switch.   0x00000003                             # switch table
      (   0x000000ae   0x000000d8   0x00000103   )
0x000000ac   br        0x0000010e                             # branch unconditionally
0x000000ae   ldloc     0x00000001                             # load 0th argument enable : bool
0x000000b0   brfalse   0x000000bf                             # branch if zero
0x000000b2   ldloc     0x00000000                             # load this : AxisCompensation
0x000000b4   ldfld     0x00000001                             # load field compGain : float
0x000000b6   ldc       0x00000000                             # 0
0x000000b8   bne       0x000000bf                             # branch if not equal
0x000000ba   ldloc     0x00000000                             # load this : AxisCompensation
0x000000bc   ldc.1                                            # 1
0x000000bd   stfld     0x00000002                             # store field state : AxisCompensation.State
0x000000bf   ldloc     0x00000000                             # load this : AxisCompensation
0x000000c1   ldloc     0x00000000                             # load this : AxisCompensation
0x000000c3   ldfld     0x00000001                             # load field compGain : float
0x000000c5   ldc       0x3a03126e                             # 0.0005
0x000000c7   blt.f     0x000000d2                             # branch if less
0x000000c9   ldloc     0x00000000                             # load this : AxisCompensation
0x000000cb   ldfld     0x00000001                             # load field compGain : float
0x000000cd   ldc       0x3a03126e                             # 0.0005
0x000000cf   sub.r4                                           # float subtraction
0x000000d0   br        0x000000d4                             # branch unconditionally
0x000000d2   ldc       0x00000000                             # 0
0x000000d4   stfld     0x00000001                             # store field compGain : float
0x000000d6   br        0x00000113                             # branch unconditionally
0x000000d8   ldloc     0x00000001                             # load 0th argument enable : bool
0x000000da   brfalse   0x000000fc                             # branch if zero
0x000000dc   ldloc     0x00000000                             # load this : AxisCompensation
0x000000de   ldloc     0x00000000                             # load this : AxisCompensation
0x000000e0   ldfld     0x00000001                             # load field compGain : float
0x000000e2   ldc       0x3a03126e                             # 0.0005
0x000000e4   add.r4                                           # float addition
0x000000e5   stfld     0x00000001                             # store field compGain : float
0x000000e7   ldloc     0x00000000                             # load this : AxisCompensation
0x000000e9   ldfld     0x00000001                             # load field compGain : float
0x000000eb   ldc       0x3f800000                             # 1
0x000000ed   blt.f     0x00000113                             # branch if less
0x000000ef   ldloc     0x00000000                             # load this : AxisCompensation
0x000000f1   ldc       0x3f800000                             # 1
0x000000f3   stfld     0x00000001                             # store field compGain : float
0x000000f5   ldloc     0x00000000                             # load this : AxisCompensation
0x000000f7   ldc.2                                            # 2
0x000000f8   stfld     0x00000002                             # store field state : AxisCompensation.State
0x000000fa   br        0x00000113                             # branch unconditionally
0x000000fc   ldloc     0x00000000                             # load this : AxisCompensation
0x000000fe   ldc.0                                            # 0
0x000000ff   stfld     0x00000002                             # store field state : AxisCompensation.State
0x00000101   br        0x00000113                             # branch unconditionally
0x00000103   ldloc     0x00000001                             # load 0th argument enable : bool
0x00000105   brtrue    0x00000113                             # branch if not zero
0x00000107   ldloc     0x00000000                             # load this : AxisCompensation
0x00000109   ldc.0                                            # 0
0x0000010a   stfld     0x00000002                             # store field state : AxisCompensation.State
0x0000010c   br        0x00000113                             # branch unconditionally
0x0000010e   ldloc     0x00000000                             # load this : AxisCompensation
0x00000110   ldc.0                                            # 0
0x00000111   stfld     0x00000002                             # store field state : AxisCompensation.State
0x00000113   ldloc     0x00000000                             # load this : AxisCompensation
0x00000115   ldfld     0x00000001                             # load field compGain : float
0x00000117   ret       0x00000001                             # return from routine

# Method AxisCompensation.GetCompensation2D
0x00000119   ldloc     0x00000000                             # load this : AxisCompensation
0x0000011b   ldfld     0x00000000                             # load field tblIdx : int
0x0000011d   stloc     0x00000014                             # store local variable local_17 : int
0x0000011f   ldloc     0x00000014                             # load local variable local_17 : int
0x00000121   ldc.1                                            # 1
0x00000122   beq       0x0000012b                             # branch if equal
0x00000124   ldloc     0x00000014                             # load local variable local_17 : int
0x00000126   ldc.2                                            # 2
0x00000127   beq       0x00000145                             # branch if equal
0x00000129   br        0x0000015f                             # branch unconditionally
0x0000012b   rld       0x0040052b                             # get Register.Application.Tables.Small1.Header.Dim1.StartValue : float
0x0000012d   stloc     0x00000003                             # store local variable startValueX : float
0x0000012f   rld       0x0040052c                             # get Register.Application.Tables.Small1.Header.Dim1.Distance : float
0x00000131   stloc     0x00000004                             # store local variable distanceX : float
0x00000133   rld       0x00400529                             # get Register.Application.Tables.Small1.Header.Dim1.Size : int
0x00000135   stloc     0x00000005                             # store local variable tblSizeX : int
0x00000137   rld       0x0040052f                             # get Register.Application.Tables.Small1.Header.Dim2.StartValue : float
0x00000139   stloc     0x00000006                             # store local variable startValueY : float
0x0000013b   rld       0x00400530                             # get Register.Application.Tables.Small1.Header.Dim2.Distance : float
0x0000013d   stloc     0x00000007                             # store local variable distanceY : float
0x0000013f   rld       0x0040052d                             # get Register.Application.Tables.Small1.Header.Dim2.Size : int
0x00000141   stloc     0x00000008                             # store local variable tblSizeY : int
0x00000143   br        0x00000163                             # branch unconditionally
0x00000145   rld       0x00400d2b                             # get Register.Application.Tables.Small2.Header.Dim1.StartValue : float
0x00000147   stloc     0x00000003                             # store local variable startValueX : float
0x00000149   rld       0x00400d2c                             # get Register.Application.Tables.Small2.Header.Dim1.Distance : float
0x0000014b   stloc     0x00000004                             # store local variable distanceX : float
0x0000014d   rld       0x00400d29                             # get Register.Application.Tables.Small2.Header.Dim1.Size : int
0x0000014f   stloc     0x00000005                             # store local variable tblSizeX : int
0x00000151   rld       0x00400d2f                             # get Register.Application.Tables.Small2.Header.Dim2.StartValue : float
0x00000153   stloc     0x00000006                             # store local variable startValueY : float
0x00000155   rld       0x00400d30                             # get Register.Application.Tables.Small2.Header.Dim2.Distance : float
0x00000157   stloc     0x00000007                             # store local variable distanceY : float
0x00000159   rld       0x00400d2d                             # get Register.Application.Tables.Small2.Header.Dim2.Size : int
0x0000015b   stloc     0x00000008                             # store local variable tblSizeY : int
0x0000015d   br        0x00000163                             # branch unconditionally
0x0000015f   ldc       0x00000000                             # 0
0x00000161   ret       0x00000001                             # return from routine
0x00000163   ldloc     0x00000004                             # load local variable distanceX : float
0x00000165   ldc       0x00000000                             # 0
0x00000167   ble.f     0x0000016f                             # branch if less than or equal
0x00000169   ldloc     0x00000007                             # load local variable distanceY : float
0x0000016b   ldc       0x00000000                             # 0
0x0000016d   bgt.f     0x00000173                             # branch if greater
0x0000016f   ldc       0x00000000                             # 0
0x00000171   ret       0x00000001                             # return from routine
0x00000173   ldloc     0x00000000                             # load this : AxisCompensation
0x00000175   ldloc     0x00000001                             # load 0th argument xEnc : float
0x00000177   ldloc     0x00000003                             # load local variable startValueX : float
0x00000179   ldloc     0x00000004                             # load local variable distanceX : float
0x0000017b   ldloc     0x00000005                             # load local variable tblSizeX : int
0x0000017d   ldloca    0x00000009                             # load home of local variable idxX : int
0x0000017f   ldloca    0x0000000a                             # load home of local variable offsetX : float
0x00000181   call      0x00000002   0x00000009   0x0000022e   # call AxisCompensation.GetIndexAndOffset(System.Single, System.Single, System.Single, System.Int32, System.Int32, System.Single)
0x00000185   ldloc     0x00000000                             # load this : AxisCompensation
0x00000187   ldloc     0x00000002                             # load 1th argument yEnc : float
0x00000189   ldloc     0x00000006                             # load local variable startValueY : float
0x0000018b   ldloc     0x00000007                             # load local variable distanceY : float
0x0000018d   ldloc     0x00000008                             # load local variable tblSizeY : int
0x0000018f   ldloca    0x0000000b                             # load home of local variable idxY : int
0x00000191   ldloca    0x0000000c                             # load home of local variable offsetY : float
0x00000193   call      0x00000002   0x00000009   0x0000022e   # call AxisCompensation.GetIndexAndOffset(System.Single, System.Single, System.Single, System.Int32, System.Int32, System.Single)
0x00000197   ldloc     0x00000009                             # load local variable idxX : int
0x00000199   ldloc     0x00000008                             # load local variable tblSizeY : int
0x0000019b   mul.i4                                           # integer multiplication
0x0000019c   ldloc     0x0000000b                             # load local variable idxY : int
0x0000019e   add.i4                                           # integer addition
0x0000019f   stloc     0x0000000d                             # store local variable idx : int
0x000001a1   ldloc     0x00000000                             # load this : AxisCompensation
0x000001a3   ldfld     0x00000000                             # load field tblIdx : int
0x000001a5   stloc     0x00000015                             # store local variable local_18 : int
0x000001a7   ldloc     0x00000015                             # load local variable local_18 : int
0x000001a9   ldc.1                                            # 1
0x000001aa   beq       0x000001b3                             # branch if equal
0x000001ac   ldloc     0x00000015                             # load local variable local_18 : int
0x000001ae   ldc.2                                            # 2
0x000001af   beq       0x000001db                             # branch if equal
0x000001b1   br        0x00000203                             # branch unconditionally
0x000001b3   ldloc     0x0000000d                             # load local variable idx : int
0x000001b5   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x000001b8   stloc     0x0000000e                             # store local variable c00 : float
0x000001ba   ldloc     0x0000000d                             # load local variable idx : int
0x000001bc   ldc.1                                            # 1
0x000001bd   add.i4                                           # integer addition
0x000001be   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x000001c1   stloc     0x0000000f                             # store local variable c01 : float
0x000001c3   ldloc     0x0000000d                             # load local variable idx : int
0x000001c5   ldloc     0x00000008                             # load local variable tblSizeY : int
0x000001c7   add.i4                                           # integer addition
0x000001c8   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x000001cb   stloc     0x00000010                             # store local variable c10 : float
0x000001cd   ldloc     0x0000000d                             # load local variable idx : int
0x000001cf   ldloc     0x00000008                             # load local variable tblSizeY : int
0x000001d1   add.i4                                           # integer addition
0x000001d2   ldc.1                                            # 1
0x000001d3   add.i4                                           # integer addition
0x000001d4   rlde      0x000003e8   0x00400001                # get Register.Application.Tables.Small1.Data.Float[TOS] : float
0x000001d7   stloc     0x00000011                             # store local variable c11 : float
0x000001d9   br        0x00000207                             # branch unconditionally
0x000001db   ldloc     0x0000000d                             # load local variable idx : int
0x000001dd   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x000001e0   stloc     0x0000000e                             # store local variable c00 : float
0x000001e2   ldloc     0x0000000d                             # load local variable idx : int
0x000001e4   ldc.1                                            # 1
0x000001e5   add.i4                                           # integer addition
0x000001e6   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x000001e9   stloc     0x0000000f                             # store local variable c01 : float
0x000001eb   ldloc     0x0000000d                             # load local variable idx : int
0x000001ed   ldloc     0x00000008                             # load local variable tblSizeY : int
0x000001ef   add.i4                                           # integer addition
0x000001f0   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x000001f3   stloc     0x00000010                             # store local variable c10 : float
0x000001f5   ldloc     0x0000000d                             # load local variable idx : int
0x000001f7   ldloc     0x00000008                             # load local variable tblSizeY : int
0x000001f9   add.i4                                           # integer addition
0x000001fa   ldc.1                                            # 1
0x000001fb   add.i4                                           # integer addition
0x000001fc   rlde      0x000003e8   0x00400801                # get Register.Application.Tables.Small2.Data.Float[TOS] : float
0x000001ff   stloc     0x00000011                             # store local variable c11 : float
0x00000201   br        0x00000207                             # branch unconditionally
0x00000203   ldc       0x00000000                             # 0
0x00000205   ret       0x00000001                             # return from routine
0x00000207   ldloc     0x0000000e                             # load local variable c00 : float
0x00000209   ldloc     0x0000000a                             # load local variable offsetX : float
0x0000020b   ldloc     0x00000010                             # load local variable c10 : float
0x0000020d   ldloc     0x0000000e                             # load local variable c00 : float
0x0000020f   sub.r4                                           # float subtraction
0x00000210   mul.r4                                           # float multiplication
0x00000211   add.r4                                           # float addition
0x00000212   stloc     0x00000012                             # store local variable x0 : float
0x00000214   ldloc     0x0000000f                             # load local variable c01 : float
0x00000216   ldloc     0x0000000a                             # load local variable offsetX : float
0x00000218   ldloc     0x00000011                             # load local variable c11 : float
0x0000021a   ldloc     0x0000000f                             # load local variable c01 : float
0x0000021c   sub.r4                                           # float subtraction
0x0000021d   mul.r4                                           # float multiplication
0x0000021e   add.r4                                           # float addition
0x0000021f   stloc     0x00000013                             # store local variable x1 : float
0x00000221   ldloc     0x00000012                             # load local variable x0 : float
0x00000223   ldloc     0x0000000c                             # load local variable offsetY : float
0x00000225   ldloc     0x00000013                             # load local variable x1 : float
0x00000227   ldloc     0x00000012                             # load local variable x0 : float
0x00000229   sub.r4                                           # float subtraction
0x0000022a   mul.r4                                           # float multiplication
0x0000022b   add.r4                                           # float addition
0x0000022c   ret       0x00000001                             # return from routine

# Method AxisCompensation.GetIndexAndOffset
0x0000022e   ldloc     0x00000001                             # load 0th argument posAbs : float
0x00000230   ldloc     0x00000002                             # load 1th argument startValue : float
0x00000232   sub.r4                                           # float subtraction
0x00000233   stloc     0x00000007                             # store local variable posRel : float
0x00000235   ldloc     0x00000007                             # load local variable posRel : float
0x00000237   ldloc     0x00000003                             # load 2th argument distance : float
0x00000239   div.r4                                           # float division
0x0000023a   stloc     0x00000008                             # store local variable idxFloat : float
0x0000023c   ldloc     0x00000005                             # load 4th argument index : int*
0x0000023e   ldloc     0x00000008                             # load local variable idxFloat : float
0x00000240   floor                                            # floor
0x00000241   conv.r4.i4                                       # convert float to int
0x00000242   stind                                            # store value at address : int
0x00000243   ldloc     0x00000005                             # load 4th argument index : int*
0x00000245   ldind                                            # load value at address : int
0x00000246   ldc.0                                            # 0
0x00000247   bge.i     0x00000254                             # branch if greater
0x00000249   ldloc     0x00000005                             # load 4th argument index : int*
0x0000024b   ldc.0                                            # 0
0x0000024c   stind                                            # store value at address : int
0x0000024d   ldloc     0x00000006                             # load 5th argument offset : float*
0x0000024f   ldc       0x00000000                             # 0
0x00000251   stind                                            # store value at address : float
0x00000252   ret       0x00000000                             # return from routine
0x00000254   ldloc     0x00000005                             # load 4th argument index : int*
0x00000256   ldind                                            # load value at address : int
0x00000257   ldloc     0x00000004                             # load 3th argument tblSize : int
0x00000259   ldc.1                                            # 1
0x0000025a   sub.i4                                           # integer subtraction
0x0000025b   blt.i     0x0000026b                             # branch if less
0x0000025d   ldloc     0x00000005                             # load 4th argument index : int*
0x0000025f   ldloc     0x00000004                             # load 3th argument tblSize : int
0x00000261   ldc.2                                            # 2
0x00000262   sub.i4                                           # integer subtraction
0x00000263   stind                                            # store value at address : int
0x00000264   ldloc     0x00000006                             # load 5th argument offset : float*
0x00000266   ldc       0x3f800000                             # 1
0x00000268   stind                                            # store value at address : float
0x00000269   ret       0x00000000                             # return from routine
0x0000026b   ldloc     0x00000006                             # load 5th argument offset : float*
0x0000026d   ldloc     0x00000008                             # load local variable idxFloat : float
0x0000026f   ldloc     0x00000005                             # load 4th argument index : int*
0x00000271   ldind                                            # load value at address : int
0x00000272   conv.i4.r4                                       # convert int to float
0x00000273   sub.r4                                           # float subtraction
0x00000274   stind                                            # store value at address : float
0x00000275   ret       0x00000000                             # return from routine
