# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Postcards < Formula
  desc "Tool for creating digital versions of physical postcards"
  homepage "https://dotpostcards.org/cli/postcards"
  version "0.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jphastings/dotpostcard/releases/download/0.9.2/dotpostcard_Darwin_x86_64.tar.gz"
      sha256 "2ade32d67fb0a2f6046f9d08598e03497745137c3a8e67fe828e1180fc6f36fb"

      def install
        bin.install "postcards"
        bin.install "postoffice"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jphastings/dotpostcard/releases/download/0.9.2/dotpostcard_Darwin_arm64.tar.gz"
      sha256 "fd7f1343acc0672df42bf70fbe55aa3a25f2a0112f67e6698dd16997e241cf69"

      def install
        bin.install "postcards"
        bin.install "postoffice"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jphastings/dotpostcard/releases/download/0.9.2/dotpostcard_Linux_x86_64.tar.gz"
        sha256 "161bcb361e15555edafa5287566f9ff2d60084971c505b0f87ababe25dd8dffc"

        def install
          bin.install "postcards"
          bin.install "postoffice"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jphastings/dotpostcard/releases/download/0.9.2/dotpostcard_Linux_arm64.tar.gz"
        sha256 "dcf70ab8ea94d752021cb3f59e81db6ee1ff2b47e2d6b98ef43093e1bb51ae12"

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
