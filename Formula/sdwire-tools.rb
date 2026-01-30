class SdwireTools < Formula
  desc "Control software for sd-mux/sd-wire devices"
  homepage "https://github.com/Badger-Embedded/badgerd-sdwirec"
  url "https://github.com/Badger-Embedded/badgerd-sdwirec/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "222b2eb35550170014b2388f6904e180b0055bf387bdd267ea8f471bc649157a"
  license "Apache-2.0"
  head "https://github.com/Badger-Embedded/badgerd-sdwirec.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libftdi"
  depends_on "popt"

  # Fix CMake minimum version for modern CMake
  patch :DATA

  def install
    cd "sdwirec-sw" do
      system "cmake", "-S", ".", "-B", "build", *std_cmake_args
      system "cmake", "--build", "build"
      system "cmake", "--install", "build"
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/sd-mux-ctrl --help", 0)
  end
end

__END__
diff --git a/sdwirec-sw/CMakeLists.txt b/sdwirec-sw/CMakeLists.txt
index 1234567..abcdefg 100644
--- a/sdwirec-sw/CMakeLists.txt
+++ b/sdwirec-sw/CMakeLists.txt
@@ -18,7 +18,7 @@ PROJECT("sd-mux-ctrl")

 ############################# Check minimum CMake version #####################

-CMAKE_MINIMUM_REQUIRED(VERSION 2.8.3)
+CMAKE_MINIMUM_REQUIRED(VERSION 3.5...3.28)
 PROJECT("sd-mux-ctrl")
 set(SDMUXCTRL_VERSION 0.0.1)

diff --git a/sdwirec-sw/src/CMakeLists.txt b/sdwirec-sw/src/CMakeLists.txt
index 1234567..abcdefg 100644
--- a/sdwirec-sw/src/CMakeLists.txt
+++ b/sdwirec-sw/src/CMakeLists.txt
@@ -33,9 +33,13 @@ SET(SDMUXCTRL_SOURCES
 INCLUDE_DIRECTORIES(
     ${SDMUXCTRL_PATH}
     ${FTD2XX_PATH}
+    ${SDMUX_DEP_INCLUDE_DIRS}
+    @@HOMEBREW_PREFIX@@/include
     )

-ADD_EXECUTABLE(${TARGET_SDMUXCTRL} ${SDMUXCTRL_SOURCES})
+LINK_DIRECTORIES(${SDMUX_DEP_LIBRARY_DIRS})
+
+ADD_EXECUTABLE(${TARGET_SDMUXCTRL} ${SDMUXCTRL_SOURCES})

 TARGET_LINK_LIBRARIES(${TARGET_SDMUXCTRL}
     ${SDMUX_DEP_LIBRARIES}
