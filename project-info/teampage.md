# Arches - Massively Parallel Hardware Simulator

![alt text](images/team_picture_placeholder.png "Placeholder")

### Team Members
1. Andrew Dron
2. Jacob Haydel
3. Andrew Golightly
4. Cody Winters

### Project Summary
Arches is a project sponsored by the Hardware Ray Tracing Group at the University of Utah. It is designed as a replacement for the existing hardware simulator, [SimTRaX](https://hwrt.cs.utah.edu/papers/SimTRaX_techreport.pdf). Arches aims to achieve the same level of cycle-accuracy as SimTRaX while taking a fraction of the time to do so. The increase in performance comes from the use of message-passing to allow lazy simulation of hardware units which in turn reduces thread contention. Additionally, Arches uses the RISCV ISA as opposed to the MIPS64 ISA used by SimTRaX. The change in ISA will make Arches much more powerful and modular, as RISCV natively supports extension of the ISA, leading to better support for novel hardware designs.

### [Project Abstract](abstract.md)


### Team Meetings
- Virtual meeting with Professor Joshi and Deep held weekly on Wednesdays at 11:15AM
  - [Zoom](https://utah.zoom.us/j/97757656255)
- Virtual meetings held via Discord when necessary

### Summary of Technologies
- Project Management: Gitlab
- VCS: Gitlab
- Languages: C++, RISCV (for implementing ISA)
- Platforms: Windows
- Other tools: 
    - Clang/LLVM: Used to cross compile test programs from C++ to RISCV, which is then run on the simulator

