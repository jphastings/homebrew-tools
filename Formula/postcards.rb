# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Postcards < Formula
  desc "Tool for creating digital versions of physical postcards"
  homepage "https://dotpostcards.org/cli/postcards"
  version "0.14.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jphastings/dotpostcard/releases/download/v0.14.3/dotpostcard_Darwin_x86_64.tar.gz"
      sha256 "266ec8334eaed711b74461f6e698b6dcb6b34be18f3be7f43d14997b5cb1fc02"

      def install
        bin.install "postcards"
        bin.install "postoffice"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jphastings/dotpostcard/releases/download/v0.14.3/dotpostcard_Darwin_arm64.tar.gz"
      sha256 "8da1aa648b42afbb2b1b86c365c34c334af24f5447f3b85707637043a561ca64"

      def install
        bin.install "postcards"
        bin.install "postoffice"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jphastings/dotpostcard/releases/download/v0.14.3/dotpostcard_Linux_x86_64.tar.gz"
        sha256 "aafd5b8a4acf81c84484dfff2fc298aa37273a36c2c18893957403df16326768"

        def install
          bin.install "postcards"
          bin.install "postoffice"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jphastings/dotpostcard/releases/download/v0.14.3/dotpostcard_Linux_arm64.tar.gz"
        sha256 "ea6dda7fa765f9401e2672ea09d17845671cdbf47378fcfd0a58855097d94f60"

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
