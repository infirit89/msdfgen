include "Freetype"

project "msdfgen"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    staticruntime "off"

    architecture "x86_64"

    targetdir ("%{prj.location}/bin/" .. outputdir)
    objdir ("%{prj.location}/bin-int/" .. outputdir)

    files 
    {
        -- msdf core
        "core/**.cpp",
        "core/**.hpp",
        "core/**.h",

        -- msdf extensions
        "ext/**.cpp",
        "ext/**.h",

        "lib/**.cpp",
    }

    includedirs 
    {
        "include",
        "core",
        "ext",
        "freetype/include/"        
    }

    links 
    {
        "Freetype"
    }

    defines  
    {
        "MSDFGEN_USE_CPP11"
    }

    disablewarnings 
    {
        4005,
        4267
    }

    filter "system:windows"
    systemversion "latest"

    filter "configurations:Debug"        
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
