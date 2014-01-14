solution "opengl"
  language "C++"
  location ("build/")
 
  defines { "_CRT_SECURE_NO_WARNINGS", "_WINDOWS", "WIN32" }

  configurations
  { 
    "Release",
    "Debug"
  }

configuration "Release"
  defines { "NDEBUG" }
  flags 
  {
    "WinMain",
    "Symbols",
    "NoMinimalRebuild",
    "NoEditAndContinue",
    "No64BitChecks",
    --"StaticRuntime",
    "FloatFast",
    "EnableSSE2",
    "OptimizeSpeed",
    -- "ExtraWarnings"
  }

configuration "Debug"
  defines { "_DEBUG"}
  flags 
  {
    "WinMain",
    "Symbols", 
    "NoMinimalRebuild", 
    "NoEditAndContinue", 
    "No64BitChecks",
    --"StaticRuntime",    
    "FloatFast", 
    "EnableSSE2",
    -- "ExtraWarnings"
  }

  configuration { "vs2013" }
    debugdir "assets/"  
    buildoptions { "-wd4201 -wd4505" } -- nonstandard struct union


project "main"
  kind("WindowedApp")
  files { "source/main/**.*" }

  targetdir("bin/")
  
  includedirs { 
    "source/", 
    "source/main/", 
    "source/app/" }

  --libdirs{"$(DXSDK_DIR)/Lib/x86/", "3rdParty/wxWidgets/lib/vc_lib/"}
  linkoptions{"/ENTRY:WinMainCRTStartup"}

  links{"app", "core", "engine", "gl", "math", 
        "winmm", "comctl32", "rpcrt4"}

  vpaths({ ["source"] = {"**.cpp", "**.c", "**.h"} })

  configuration "Release"
    targetname( "main_r" )
    links{}

  configuration "Debug"
    targetname( "main_d" )
    links{}

project "app"
  kind ("StaticLib")
  files{"source/app/**.*"}

  vpaths({ ["source"] = {"**.cpp", "**.c", "**.h"} })

  targetdir("bin/projects/")

  includedirs{"source/", "source/app/"}

  configuration "Release"
    targetname( "app_r" )

  configuration "Debug"
    targetname( "app_d" )

project "core"
  kind ("StaticLib")
  files{"source/core/**.*"}

  vpaths({ ["source"] = {"**.cpp", "**.c", "**.h"} })
  
  targetdir("bin/projects/")

  includedirs{"source/", "source/core/"}

  configuration "Release"
    targetname( "core_r" )

  configuration "Debug"
    targetname( "core_d" )

project "engine"
  kind ("StaticLib")
  files{"source/engine/**.*"}

  vpaths({ ["source"] = {"**.cpp", "**.c", "**.h"} })
  
  targetdir("bin/projects/")

  includedirs{"source/", "source/engine/"}

  configuration "Release"
    targetname( "engine_r" )

  configuration "Debug"
    targetname( "engine_d" )

project "gl"
  kind ("StaticLib")
  files{"source/gl/**.*"}

  vpaths({ ["source"] = {"**.cpp", "**.c", "**.h"} })
  
  targetdir("bin/projects/")

  includedirs{"source/", "source/gl/"}

  configuration "Release"
    targetname( "gl_r" )

  configuration "Debug"
    targetname( "gl_d" )

project "math"
  kind ("StaticLib")
  files{"source/math/**.*"}

  vpaths({ ["source"] = {"**.cpp", "**.c", "**.h"} })
  
  targetdir("bin/projects/")

  includedirs{"source/", "source/math/"}

  configuration "Release"
    targetname( "math_r" )

  configuration "Debug"
    targetname( "math_d" )

project "extern"
  kind ("StaticLib")
  files{"extern/freetype/**.*", 
        "extern/glew/**.*", 
        "extern/glfw/**.*", 
        "extern/gwen/**.*"}

  vpaths({ ["source"] = {"**.cpp", "**.c", "**.h"} })
  
  targetdir("bin/projects/")

  includedirs{"extern/", 
              "extern/freetype/", 
              "extern/glew/",
              "extern/glfw/",
              "extern/gwen/"}

  configuration "Release"
    targetname( "extern_r" )

  configuration "Debug"
    targetname( "extern_d" )