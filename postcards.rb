# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Postcards < Formula
  desc "Tool for creating digital versions of physical postcards"
  homepage "https://dotpostcards.org/cli/postcards"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jphastings/dotpostcard/releases/download/0.2.3/dotpostcard_Darwin_x86_64.tar.gz"
      sha256 "d8d6f35a8517f24653a03a242963193e44a0a84416bfe5fcd9051a7735427e28"

      def install
        bin.install "postcards"
      end
    end
    on_arm do
      url "https://github.com/jphastings/dotpostcard/releases/download/0.2.3/dotpostcard_Darwin_arm64.tar.gz"
      sha256 "feb682a9ec4f07490e3625311f1e3ea4693bbbfa6c69d1094ec0f1219d71c7c8"

      def install
        bin.install "postcards"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jphastings/dotpostcard/releases/download/0.2.3/dotpostcard_Linux_x86_64.tar.gz"
        sha256 "f829b0a2c2829ed83ebc4ef1aba7bf2c32497d83d95c5a122c583a76e2053c06"

        def install
          bin.install "postcards"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jphastings/dotpostcard/releases/download/0.2.3/dotpostcard_Linux_arm64.tar.gz"
        sha256 "f85f0500928554715dda5561fcffa41866199a8d7557d8ee89dfe8de9cd81c56"

        def install
          bin.install "postcards"
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