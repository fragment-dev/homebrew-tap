require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4625.0.0-darwin-x64.tar.gz"
    sha256 "35fcda0d8ed5cac22826f72e9e3d54fac9244a392bb0873978a8a52d731d4252"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4625.0.0-darwin-arm64.tar.gz"
      sha256 "a75b6e99b6c1fedd65b4b3a6cfd865ebb2c64162518603d660bbb160746c8593"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4625.0.0-linux-x64.tar.gz"
    sha256 "e28123a9466f8c2f455d173df18028d01cd58d04da933d5a1dbbfaf3259fe8aa"
  end
  version "4625.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
