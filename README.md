# Multi-User File Storing and Sharing System

A lightweight file storage and sharing system written entirely in **C**, designed to enable centralized storage, secure multi-user access, and collaboration with robust access control mechanisms.

> Developed for the CS744 - Design and Engineering of Computing Systems (Autumn 2025)  

---

## Features

- **User Authentication** (Sign-up / Sign-in)
- **File Operations**: Create, Upload, Read, Edit, Delete, Rename
- **Permission Management**: Grant/Revoke read/write access
- **Multi-user Access**: Thread-safe access with mutex-based synchronization
- **File Listing**: View files with user-specific permissions
- **Caching**: FIFO-based LRU cache with auto-cleanup
- **Concurrency**: Thread pool (default size: 50) to handle multiple client requests

---

## System Architecture

### Server

- Accepts connections over user-specified IP and port
- Maintains a thread pool to handle client requests concurrently
- Uses mutex and condition variables to ensure thread-safe queue handling
- Stores user credentials and files with metadata

### Client

- CLI-based interface for user interaction
- Prompts user for login and request type
- Handles local file operations and communication with the server
- Automatically creates and manages a `_cache_` directory for recently accessed files

---

## Login System

### Sign-Up
- User provides username and password
- Server checks for duplicates before registration

### Sign-In
- Server validates credentials before granting access

---

## Functionalities

| Feature                         | Description |
| ------------------------------ | ----------- |
| **File Create**                | Create a new file using nano and upload |
| **File Upload**               | Upload existing local file to server |
| **File Access (R/RW)**        | View or edit a file based on permission |
| **File Delete**               | Delete owned files |
| **File Rename**               | Rename owned files |
| **Change Permission**         | Grant/Revoke access for other users |
| **List Files**                | View files you have access to along with permissions |

---

## Synchronization & Concurrency

- Uses per-file mutex-based locking
- Allows concurrent **read** operations
- Ensures **write** operations are exclusive

---

## Caching

- Stores 4 most recently accessed files in a `_cache_` directory
- Auto-created at client startup and deleted on exit
- Uses FIFO policy for replacement

---

## Performance Evaluation

### Response Time
- Measured with 5 to 75 clients
- Used "List Files" functionality for stress testing

### Throughput
- Benchmarked with 5 to 50 clients
- Login and UI functionalities removed for pure throughput testing

---

## Build & Run

```bash
make            # builds server, Client1-3 and the test client
```

Start the server (from the `Server` directory, so it finds `_data_` and `_metadata_`):

```bash
cd Server && ./server <ip> <port>
```

Then run any client in its own directory:

```bash
cd Client1 && ./client <server-ip> <port>
```

`make clean` removes the compiled binaries.

---

## Tools & Tech

- **Language**: C (POSIX compliant)
- **Networking**: TCP sockets
- **Threads**: Pthreads
- **I/O**: File descriptors, Shell commands
- **Build System**: Makefile (recommended)

---

## Acknowledgements

This project was completed as part of CS744 under the guidance of the course instructors and TAs. It helped us deeply understand the practical aspects of file systems, concurrency, and networked applications.

> _"OS for world peace!"_

---

## Authors

- PavanKumar (25M0803)

