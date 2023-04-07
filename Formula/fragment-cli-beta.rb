require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2384.0.0-darwin-x64.tar.gz"
    sha256 "453c6d42c7fcea1e6bb47e4f99e1d4c0101a3e428629968f1fda49f2ffb7bac6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2384.0.0-darwin-arm64.tar.gz"
      sha256 "e04d328555c011050962677ae06f4bc19eb756a0334f9037437cae5b2d27a016"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2384.0.0-linux-x64.tar.gz"
    sha256 "f8e933894a247fdb49564524c2d118d456b089c1ef4157e805d479b7d429946b"
  end
  version "2384.0.0"
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
