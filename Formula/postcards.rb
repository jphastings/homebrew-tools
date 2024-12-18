# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Postcards < Formula
  desc "Tool for creating digital versions of physical postcards"
  homepage "https://dotpostcards.org/cli/postcards"
  version "0.10.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jphastings/dotpostcard/releases/download/0.10.4/dotpostcard_Darwin_x86_64.tar.gz"
      sha256 "378cc8f3b61e4bbff30394b2c4ff3d3376cefd1b5e12a615c6644bb2e2b996c0"

      def install
        bin.install "postcards"
        bin.install "postoffice"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jphastings/dotpostcard/releases/download/0.10.4/dotpostcard_Darwin_arm64.tar.gz"
      sha256 "7cd1ffaaf958276fd944e7170057be7b8c47b7b0d9698e525279a29034dcc290"

      def install
        bin.install "postcards"
        bin.install "postoffice"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jphastings/dotpostcard/releases/download/0.10.4/dotpostcard_Linux_x86_64.tar.gz"
        sha256 "074ac92ec1f7e2a60a823c8e9185f20439e90dcd9035cab4f977263b9293ea8c"

        def install
          bin.install "postcards"
          bin.install "postoffice"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jphastings/dotpostcard/releases/download/0.10.4/dotpostcard_Linux_arm64.tar.gz"
        sha256 "867338871c1ab095eb41964513328e7550bccc884549fc1a2078ca7818ae1095"

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
