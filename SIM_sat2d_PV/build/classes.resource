  <class name="Satellite">
    <member
      name="pos"
      type="double"
      io_attributes="15"
      units="m"
      description="xyz-position">
      <dimension>2</dimension>
    </member>
    <member
      name="vel"
      type="double"
      io_attributes="15"
      units="m/s"
      description="xyz-velocity">
      <dimension>2</dimension>
    </member>
    <member
      name="acc"
      type="double"
      io_attributes="15"
      units="m/s2"
      description="xyz-acceleration">
      <dimension>2</dimension>
    </member>
    <member
      name="pos_tgt"
      type="double"
      io_attributes="15"
      units="m"
      description="xyz-position">
      <dimension>2</dimension>
    </member>
    <member
      name="vel_tgt"
      type="double"
      io_attributes="15"
      units="m/s"
      description="xyz-velocity">
      <dimension>2</dimension>
    </member>
    <member
      name="acc_tgt"
      type="double"
      io_attributes="15"
      units="m/s2"
      description="xyz-acceleration">
      <dimension>2</dimension>
    </member>
    <member
      name="veh1_radius"
      type="double"
      io_attributes="15"
      units="m"
      description="xyz-velocity">
    </member>
    <member
      name="veh2_radius"
      type="double"
      io_attributes="15"
      units="m"
      description="xyz-velocity">
    </member>
    <member
      name="thrust1_fired"
      type="int"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="thrust2_fired"
      type="int"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="burn1_time"
      type="double"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="burn2_time"
      type="double"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="SimEnvironment">
  </class>

  <class name="SysSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="sched"
      type="Trick__Executive"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="MemoryManagerSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="mm"
      type="Trick__MemoryManager"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="CheckPointRestartSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="cpr"
      type="Trick__CheckPointRestart"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="SieSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="sie"
      type="Trick__Sie"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="CommandLineArgumentsSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="cmd_args"
      type="Trick__CommandLineArguments"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="MessageSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="mpublisher"
      type="Trick__MessagePublisher"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="mcout"
      type="Trick__MessageCout"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="mtcout"
      type="Trick__MessageThreadedCout"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="mfile"
      type="Trick__MessageHSFile"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="mdevice"
      type="Trick__MessageTCDevice"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="pfile"
      type="Trick__PlaybackFile"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="message_file_manager"
      type="Trick__MessageCustomManager"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="JITSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="jit"
      type="Trick__JITInputFile"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="InputProcessorSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="ip"
      type="Trick__IPPython"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="mtv"
      type="Trick__MTV"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="ThreadProcessEventSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="ep"
      type="Trick__EventProcessor"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="EventManagerSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="em"
      type="Trick__EventManager"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="ep"
      type="Trick__EventProcessor"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="VariableServerSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="vs"
      type="Trick__VariableServer"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="sim_control_panel"
      type="Trick__SimControlPanel"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="trick_view"
      type="Trick__TrickView"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="malfunctions_trick_view"
      type="Trick__MalfunctionsTrickView"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="stripchart"
      type="Trick__StripChart"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="DataRecordDispatcherSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="drd"
      type="Trick__DataRecordDispatcher"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="RTSyncSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="gtod_clock"
      type="Trick__GetTimeOfDayClock"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="itimer"
      type="Trick__ITimer"
      io_attributes="15"
      units="1">
    </member>
    <member
      name="rt_sync"
      type="Trick__RealtimeSync"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="FrameLogSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="frame_log"
      type="Trick__FrameLog"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="UnitTestSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="unit_tests"
      type="Trick__UnitTest"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="UdUnitsSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="udunits"
      type="Trick__UdUnits"
      io_attributes="15"
      units="1">
    </member>
  </class>

  <class name="SatelliteSimObject">
    <member
      name="name"
      type="std__string"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="id"
      type="int"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="object_disabled"
      type="bool"
      io_attributes="15"
      units="--">
    </member>
    <member
      name="satellite"
      type="Satellite"
      io_attributes="15"
      units="1">
    </member>
  </class>

