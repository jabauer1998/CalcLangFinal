# CalcLang Web Interface

## Overview
CalcLang is a Haskell-based interpreted mathematical language designed to teach the value and importance of functions in mathematics. The project includes:
- A Scotty web server providing a browser-based interface
- Parser and interpreter for the CalcLang language  
- Mixed Haskell/C implementation with LLVM backend for compilation
- Modern CSS-styled web UI using Blaze HTML5

**Current State**: Fully functional web application running on port 5000 with secure static file serving for CSS.

## Recent Changes

### October 6, 2025
- **Added CSS Styling**: Created modern stylesheet (src/css/StyleSheet.css) with purple gradient theme, styled cards, and buttons
- **Configured Static File Middleware**: Added wai-middleware-static dependency for serving CSS files
- **Security Fix**: Restricted static file policy to only serve CSS files from src/css/, preventing exposure of source code and configuration files
- **Deployment Configuration**: Set up autoscale deployment target for production
- **Build System**: Using pre-built binaries (bin/WCalcLang) to avoid lengthy rebuilds; makefile copies executables instead of creating symlinks

## Project Architecture

### Build System
- **Cabal**: Main build tool for Haskell components
- **Makefile**: Provides convenient targets for building and installing
- **LLVM Integration**: Dynamically links LLVM libraries for compilation features
- **Pre-built Binaries**: 35MB WCalcLang executable stored in ./bin/ for faster deployments

### Web Server Configuration
- **Framework**: Scotty (Haskell web framework)
- **Host Binding**: 0.0.0.0:5000 (required for Replit's proxy environment)
- **Static Files**: Restricted to CSS directory only (src/css/) via wai-middleware-static
- **Template Engine**: Blaze HTML5 for server-side HTML generation

### Routes
- `/` - Introduction page with welcome message
- `/help` - Help documentation for CalcLang commands
- `/eval` - Expression evaluation form
- `/result` - Processes CalcLang expressions and displays results
- `/css/StyleSheet.css` - Stylesheet (only static file exposed)

### Security
- Static file middleware restricted to css/ prefix only
- Source code and configuration files protected (return 404)
- noDots policy prevents directory traversal attacks

## Key Files
- **CalcLangFinal.cabal**: Project dependencies and build configuration
- **src/haskell/CalcLangWebMain.hs**: Main web server implementation
- **src/css/StyleSheet.css**: Modern UI stylesheet
- **bin/WCalcLang**: Pre-built production binary
- **makefile**: Build automation
- **cabal.project.local**: Build optimization settings (unix-time constraint)

## Build Instructions

### Development Build
```bash
make install-haskell
```
This builds the project and copies the executable to ./bin/WCalcLang

### Manual Build
```bash
AbsIncDirC="$(pwd)/include/c"
AbsIncDirH="$(pwd)/include/haskell"
LLVMLib=$(llvm-config --libdir)
LLVMInclude=$(llvm-config --includedir)
ZLibPath=$(nix-build --no-out-link '<nixpkgs>' -A zlib)
ZLibDevPath=$(nix-build --no-out-link '<nixpkgs>' -A zlib.dev)

cabal build WCalcLang \
  --extra-include-dirs=$AbsIncDirC \
  --extra-include-dirs=$AbsIncDirH \
  --extra-include-dirs=$LLVMInclude \
  --extra-lib-dirs=$LLVMLib \
  --extra-lib-dirs=$ZLibPath/lib \
  --extra-include-dirs=$ZLibDevPath/include
```

## Deployment
- **Target**: Autoscale (stateless web server)
- **Command**: `./bin/WCalcLang`
- **Port**: Automatically uses PORT environment variable, defaults to 5000

### Pre-built Binary for Deployment
The project uses a pre-built binary (`bin/WCalcLang`) for deployment to avoid lengthy compilation times (10-20 minutes) in production. This binary is tracked in version control and must be updated whenever code changes are deployed.

**To update the production binary:**
1. Build the project using `make install-haskell`
2. The new binary will be automatically copied to `./bin/WCalcLang`
3. Commit the updated binary to version control
4. The autoscale deployment will use this pre-built binary

**Important**: The deployment environment does not rebuild the project. You must commit an up-to-date `bin/WCalcLang` executable for production deployments to work.

## Important Notes
- The project uses pre-built binaries to avoid 10-20 minute rebuild times in production
- Cabal symlinks in bin/ break when cache changes; makefile copies actual executables instead
- unix-time dependency constrained to <0.4.17 to avoid configure script bugs
- Full static linking not practical due to LLVM dependencies; current config bundles Haskell libs but dynamically links system libraries
