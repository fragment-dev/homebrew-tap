require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3913.0.0-darwin-x64.tar.gz"
    sha256 "e675317c4611655ee8fd2acbd1bc13542a566183de01d54ec0381df4b9b56346"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3913.0.0-darwin-arm64.tar.gz"
      sha256 "eb61df19e595ed71ad22765db27ff52fcb67c4566d07e9a23aac18626272ced2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3913.0.0-linux-x64.tar.gz"
    sha256 "8cccc2f687476fc8d9a668f1da8672e0615ea08e48532d17e2e75fb3ed5e00b8"
  end
  version "3913.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
