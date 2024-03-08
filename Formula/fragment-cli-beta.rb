require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4730.0.0-darwin-x64.tar.gz"
    sha256 "0a45f767b9fd41535873fae7028db00cc9b918c7d4308efe9eedba07de3ef2e8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4730.0.0-darwin-arm64.tar.gz"
      sha256 "c558471223384e4af124ee00263678ac3022d91dba4f4a89700b5af2df2082fc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4730.0.0-linux-x64.tar.gz"
    sha256 "800e22d31268518aab9fccbb9bf2107f02eff89f04efccea92499795db3351ba"
  end
  version "4730.0.0"
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
