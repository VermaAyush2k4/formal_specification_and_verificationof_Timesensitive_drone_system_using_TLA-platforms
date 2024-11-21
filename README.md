# formal_specification_and_verificationof_Timesensitive_drone_system_using_TLA-platforms

IT303 denotes formal_specification_and_verificationof_Timesensitive_drone_system_using_TLA+ platforms.

This project investigates the integration of time using TLA+ in drone systems to enhance reliability and safety. The research aims to rigorously model complex drone behaviours, identify safety hazards, and eliminate system flaws. By establishing a foundation for formal verification, it advances drone technology and promotes trustworthy autonomous systems. The study introduces a dynamic perspective on system reliability through temporal analysis, addressing the need for time-sensitive assessments in mission-critical applications like drone delivery and surveillance. The methodology includes preliminary analysis, fault tree creation, TLA+ formal specification, and model checking with the TLC model checker.

# Setting up the environment :

  1. Install the toolbox application .
  2. Install miktex for pdf conversion of TLA file .

# Running the code : 
  1. Download the TLA+ file for the code.
  2. Open the TLA+ file in the toolbox.
  3. Using the TLC model checker option in the toolbar , create a new model to run the code.
  4. In the new model window , declare Init and Next in the behaviour section and remove the deadlock.
  5. Click the green icon to run the code.

# Analysis of results :
    1. After running the code in the model wait for the results .
    2. The user will be able to see the States Found and the Distinct States in the statistics section of the TLC model checker.
    3. There is also a log of the time passed during the runtime of the code
    4. The user can try running the code with different values for the MissionEndTime , MaxTimeInterval , MinTimeInterval and compare the values for the States Found and the Distinct States .
