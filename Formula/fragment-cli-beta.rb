require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.0.0-darwin-x64.tar.gz"
    sha256 "f060759710e5279a082da527ef594eb38f27c334aba2435f4818a5a154a69f3d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.0.0-darwin-arm64.tar.gz"
      sha256 "83f428b039b7c5e881c27b1607cb743d2a6effb1a70cdeda60d4a9fcfc1a3e9c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.0.0-linux-x64.tar.gz"
    sha256 "c5f527f91a28468596fb413cb8f5814d9a966f125bbffda862b9ac1308496c01"
  end
  version "3955.0.0"
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
