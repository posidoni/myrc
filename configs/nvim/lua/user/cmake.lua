-- @Warning: cmake interacts with env $PWD, not with vim's cwd
-- thus, $PWD must be set to project root. The easiest way to do this
-- is to launch vim with cmd `vim project_root_dir/src/<CMakeLists.txt_is_here>`
local g = vim.g

g.cmake_command = "cmake"
g.cmake_console_size = 15
g.cmake_console_position = "botright"
g.cmake_console_echo_cmd = 1
g.cmake_jump = 0 -- Whether to jump to Cmake console when invoking :CMake cmd
g.cmake_jump_on_completion = 0 -- Whether to jump to CMake console on completition of CMD
g.cmake_jump_on_error = 1 -- Jump to CMake console on error
-- This makes CMAKE_EXPORT_COMPILE_COMMANDS = ON by default
g.cmake_link_compile_commands = 1
-- g.cmake_log_file = ''

-- Defauilt build configuration on startup (CMAKE_BUILD_TYPE)
-- Typical values: Debug, Release, RelWithDebInfo, MinSizeRel
-- For single-type generators (Makefile, Ninja) only one build config
-- may exist at the same time
-- see: https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html#build-configurations
g.cmake_default_config = "Debug"

-- .git determines the root of the project
-- this is searched relative to the cwd
g.cmake_root_markers = {
    ".git",
}

-- All build configs will be created inside build dir of the project
-- @Mikhail: this creates all CMake build systems inside build folder
-- highly recomment this setting, just add build/ dir to gitignore
-- this prevents total mess that is usually created by default CMake
g.cmake_build_dir_location = "build/"

-- g.cmake_generate_options = { '' } -- :CMakeGenerate
-- g.cmake_build_options = { '' } -- :CMakeBuild
-- g.cmake_native_build_options = { '' } -- :CMakeBuild (to the native tool)
