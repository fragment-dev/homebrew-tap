require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3556.0.0-darwin-x64.tar.gz"
    sha256 "d26d6840fc82ac69b5c98cc1892a6e4a277361a1befb159a4e8e2cd673c52821"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3556.0.0-darwin-arm64.tar.gz"
      sha256 "8ec818f782e985a25a93a27bb9781ad2a7a16d5ff675953b3949c2a9ac98fce4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3556.0.0-linux-x64.tar.gz"
    sha256 "979c34402ff67fc2e792cf97cefc19ec86d399dd712ae9e04f460e86e3892433"
  end
  version "3556.0.0"
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
