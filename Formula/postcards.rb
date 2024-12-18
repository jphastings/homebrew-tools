# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Postcards < Formula
  desc "Tool for creating digital versions of physical postcards"
  homepage "https://dotpostcards.org/cli/postcards"
  version "0.9.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jphastings/dotpostcard/releases/download/0.9.3/dotpostcard_Darwin_x86_64.tar.gz"
      sha256 "61bb110247ca4215c485dfa9ba47aa9d3bbd8ca0ef61ebd8ae102debadb10b67"

      def install
        bin.install "postcards"
        bin.install "postoffice"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jphastings/dotpostcard/releases/download/0.9.3/dotpostcard_Darwin_arm64.tar.gz"
      sha256 "63b639bd438215407153a1043ba333e422087c373ef8f3b36e518a7fb4a66e2f"

      def install
        bin.install "postcards"
        bin.install "postoffice"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jphastings/dotpostcard/releases/download/0.9.3/dotpostcard_Linux_x86_64.tar.gz"
        sha256 "f054849565bacea2bea4f26a6bf42d9ad0431253d01a98190288d44df6d26cb7"

        def install
          bin.install "postcards"
          bin.install "postoffice"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jphastings/dotpostcard/releases/download/0.9.3/dotpostcard_Linux_arm64.tar.gz"
        sha256 "a2231bd8d3d462654fe859918541bac1d1730849661f12c09816e52718a7cacb"

        def install
          bin.install "postcards"
          bin.install "postoffice"
        end
      end
    end
  end

  test do
    resource("hello.postcard").stage do
      expected_start = "Convert digital representations of postcards between various formats.\n"
      actual_output = shell_output("#{bin}/postcards help")
      assert actual_output.start_with?(expected_start)
    end
  end
end
