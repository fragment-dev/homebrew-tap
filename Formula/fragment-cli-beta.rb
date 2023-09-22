require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3647.0.0-darwin-x64.tar.gz"
    sha256 "29f97834b98fe2e4908bcab2a1cb62459275e7272b18540827da8f9e556a4371"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3647.0.0-darwin-arm64.tar.gz"
      sha256 "0178b53b2ba463dbfb5fcad93a570052b9ff41b6aea93e205c38adefe0e01f28"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3647.0.0-linux-x64.tar.gz"
    sha256 "73985a3a923e4d990a8c7e91d96a54ba4e3b4df042f0c72566b29062fe1cb67c"
  end
  version "3647.0.0"
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
