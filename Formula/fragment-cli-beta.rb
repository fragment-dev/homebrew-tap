require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3261.0.0-darwin-x64.tar.gz"
    sha256 "0e84ccebcb0c311ae577f27c877a62b1b9af3fe442c87761e09bfcb48109fa65"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3261.0.0-darwin-arm64.tar.gz"
      sha256 "c239b72f52f316343d3e19049e0836291d20dae4bafe42cfba343daf656e0a5f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3261.0.0-linux-x64.tar.gz"
    sha256 "8dfb2513ee7e57a66b890effc612f5f36ac06c5bac27678d745e9beb1a799764"
  end
  version "3261.0.0"
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
