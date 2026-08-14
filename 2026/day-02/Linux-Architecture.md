**What is an OS?**
  OS = Operating System
  An operating system is software that acts as an interface between applications and computer hardware.os manages the          computer's hardware and provides a platform for applications to run. 
  It manages:
  CPU / Processor
  RAM / Memory
  Storage
  Network
  Devices
  Running programs/processes
  Examples: Windows, Linux, macOS, Android.

**Linux is a free, open-source operating system (OS) that directly manages a system's hardware, resources, and applications. Originally created by Linus Torvalds in 1991**
 	
Linux is an open-source operating system that manages computer hardware and software.

  Booting process 
  
  Power ON
     ↓
  Motherboard starts
     ↓
  BIOS / UEFI starts
     ↓
  Checks hardware
     ↓
  Finds boot device
     ↓
  Loads bootloader (GRUB)
     ↓
  GRUB loads Linux Kernel
     ↓
  Kernel starts
     ↓
  Kernel starts systemd (PID 1)
     ↓
  systemd starts services
     ↓
  Linux is ready
  
**Linux Core Components & Processes**
  1. **Kernel**
  The kernel is the core of Linux. It manages hardware and system resources such as CPU, memory, disk, networking, and         devices.
  Kernel = Communicates between software and hardware.
  
  3. **User Space**
  User space is where applications and commands run.
  Examples:
  Bash
  Python
  
  4. **Init / systemd**
  systemd is usually the first process (PID 1) started by the kernel.
  It starts and manages system services.
  systemd = Starts and manages services.

**A process is a running program.**

When you start a program, Linux creates a process and assigns it a unique PID (Process ID).

**Process states**

  Running	- Process is running/ready to run
  Sleeping	- Process is waiting
  Stopped	- Process is paused
  Zombie	- Process finished
  Example:
  python app.py
  
  **How it manages**
  Program
     ↓
  Kernel creates a process
     ↓
  Assigns a PID
     ↓
  Schedules CPU time
     ↓
  Manages memory & resources
     ↓
  Process runs / stops / exits
  
**What systemd does and why it matters** - 

  systemd is the init system and service manager used by most modern Linux distributions. first process to run.
  When Linux starts, the kernel starts systemd as PID 1. systemd then starts and manages important system services.

  For example  - 
  Linux boots
     ↓
  Kernel
     ↓
  systemd (PID 1)
     ↓
  Starts services
     ↓
  Nginx / SSH / Docker / etc.

**What does systemd do?**

  Starts services when the system boots
  Stops services
  Restarts services
  Checks service status
  Manages services while the system is running
  Example - 
  systemctl status nginx
  systemctl start nginx
  systemctl stop nginx
  systemctl restart nginx

****Architecture of linux**

  User - The user gives commands or uses applications.
  
  Application - 
  An application is the software the user uses to perform a task.
  Examples: Firefox, VS Code, Terminal
  
  Shell  - Shell is an interface between the user and the kernel operating system. It is a command interpreter that takes      commands    from the user, interprets them, and starts programs or requests services from the kernel.
  
  Kernel - The core part of Linux. Manages hardware, memory, processes, security, and device drivers.
  Acts as a bridge between hardware and software.
  
  Hardware - The physical components of the computer (CPU, RAM, Disk, Network Cards, etc.)

**What is Virtualization?**

  Virtualization allows one physical computer to run multiple virtual computers (VMs).
  Virtual Machine (VM)
  A VM is a virtual computer that runs its own operating system.
  Hypervisor
  A hypervisor is software that creates and manages Virtual Machines (VMs).
  Architecture of how virtualization works
  Physical Computer
         ↓
     Hypervisor
         ↓
    ┌────┼────┐
   VM 1 VM 2 VM 3

five linux commands 

ls , cd , pwd, mkdir, cat

