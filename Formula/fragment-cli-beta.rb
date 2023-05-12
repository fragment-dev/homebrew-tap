require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2653.0.0-darwin-x64.tar.gz"
    sha256 "1c3b8c4744a3fc4779ef3d30e27a23cadb9d3049977311cac2f1628ed996f2dc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2653.0.0-darwin-arm64.tar.gz"
      sha256 "df5190a06391c25401d69da3f7a89df554632d4337426940864e715855a5afe5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2653.0.0-linux-x64.tar.gz"
    sha256 "2992210d912767ca3ca5a1103698a638d84dab5c25194fec3e4357c73d32aef2"
  end
  version "2653.0.0"
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
