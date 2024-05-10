require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5037.0.0-darwin-x64.tar.gz"
    sha256 "ba8182e65a9e20940f7d0b499da36709e880714fe3511e98d34fb272b300c1cc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5037.0.0-darwin-arm64.tar.gz"
      sha256 "1feadee1a8e77f9b5a87e34c366ef90aa42b6c5912c3c985124c65121f398878"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5037.0.0-linux-x64.tar.gz"
    sha256 "c2fbd8a6ddad69b0d37aa172f39c0103d7e0d4ea75ba136d7acadf50d8ce5743"
  end
  version "5037.0.0"
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
