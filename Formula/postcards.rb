# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Postcards < Formula
  desc "Tool for creating digital versions of physical postcards"
  homepage "https://dotpostcards.org/cli/postcards"
  version "0.14.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jphastings/dotpostcard/releases/download/v0.14.15/dotpostcard_Darwin_x86_64.tar.gz"
      sha256 "7c82231eac9e3ac039f173e754bcb068b6be2d0cbdb1c5649ba75bafdb4de604"

      def install
        bin.install "postcards"
        bin.install "postoffice"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jphastings/dotpostcard/releases/download/v0.14.15/dotpostcard_Darwin_arm64.tar.gz"
      sha256 "f3d475d2ce1938b7c145ffb1dcb726312883d82385afd36d4b9155a795ccffc2"

      def install
        bin.install "postcards"
        bin.install "postoffice"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/jphastings/dotpostcard/releases/download/v0.14.15/dotpostcard_Linux_x86_64.tar.gz"
      sha256 "0b71e1ccb641ce5e38b84a6b7bd9b7bd57f643729df4f58a0110373055f268fa"
      def install
        bin.install "postcards"
        bin.install "postoffice"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/jphastings/dotpostcard/releases/download/v0.14.15/dotpostcard_Linux_arm64.tar.gz"
      sha256 "efc919c6493cce91248ee7ed585339a6e1826dc485c3ef666d7c66e5ed3d3bd6"
      def install
        bin.install "postcards"
        bin.install "postoffice"
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
