require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3731.0.0-darwin-x64.tar.gz"
    sha256 "04d671a4ccc312f775b84e9bc9462009b3833ffaca52ba4056c296f0b420bf7a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3731.0.0-darwin-arm64.tar.gz"
      sha256 "541e2c5d09daeab489ce890c2ae7307219f707785062034f3d896dd16a5b7fb9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3731.0.0-linux-x64.tar.gz"
    sha256 "d71a0dbdc06b88edb82f762a63e4f9b8ee930006a035722451efc16d7776a55b"
  end
  version "3731.0.0"
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
