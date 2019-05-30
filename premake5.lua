project "GLFW"
	
	kind "StaticLib"
	
	language "C"
    
	files {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c"
    }
    
	filter "system:windows"
		
		buildoptions {
			"-std=c11",
			"-lgdi32"
		}
		
		systemversion "latest"
		
		staticruntime "On"
		
		targetdir ("../../../Binaries/Win64/%{prj.name}")

		objdir ("../../../Intermediate/Win64/%{prj.name}")

        files {
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

		defines { 
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
		}

    filter { "system:windows", "configurations:Release" }
		
		buildoptions "/MT"

	filter "system:macosx"
		
		buildoptions {
			"-std=c11",
			"-F /Library/Frameworks"
		}
	
		linkoptions {
			"-F /Library/Frameworks"
		}
	
		systemversion "latest"
		
		staticruntime "On"
		
		targetdir ("../../../Binaries/Mac/%{prj.name}")

		objdir ("../../../Intermediate/Mac/%{prj.name}")

		links {
			"CoreFoundation.framework",
			"IOKit.framework",
			"CoreVideo.framework",
			"Cocoa.framework",
			"GLUT.framework",
			"OpenGL.framework"
		}

        files {
            "src/cocoa_init.m",
            "src/cocoa_joystick.m",
            "src/cocoa_monitor.m",
            "src/cocoa_time.c",
            "src/posix_thread.c",
            "src/cocoa_window.m",
            "src/egl_context.c",
			"src/nsgl_context.m",
			"src/osmesa_context.c"
        }

		defines { 
            "_GLFW_COCOA",
            "_CRT_SECURE_NO_WARNINGS"
		}

