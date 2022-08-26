local g = vim.g

g.cmake_command = "cmake"
g.cmake_console_size = 14
g.cmake_test_command = "ctest"
g.cmake_console_position = "botright"
g.cmake_console_echo_cmd = 1
g.cmake_jump = 0 -- Whether to jump to Cmake console when invoking :CMake cmd
g.cmake_jump_on_completion = 0 -- Whether to jump to CMake console on completition of CMD
g.cmake_jump_on_error = 0 -- Jump to CMake console on error
-- This makes CMAKE_EXPORT_COMPILE_COMMANDS = ON by default
g.cmake_link_compile_commands = 1
g.cmake_log_file = ''
--[[ g.cmake_log_file = 'build-log.log' ]]
g.cmake_default_config = "Debug"
g.cmake_root_markers = {
    ".git",
}

-- All build configs will be created inside build dir of the project
-- @Mikhail: this creates all CMake build systems inside build folder
-- highly recomment this setting, just add build/ dir to gitignore
-- this prevents total mess that is usually created by default CMake
g.cmake_build_dir_location = "build/"

g.cmake_generate_options = { "-G Ninja" } -- :CMakeGenerate
g.cmake_build_options = { '--parallel 4' } -- :CMakeBuild
-- g.cmake_native_build_options = { '' } -- :CMakeBuild (to the native tool)
