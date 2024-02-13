require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4553.0.0-darwin-x64.tar.gz"
    sha256 "9498e62277ab4c8bcf01cdddc7efaae2a9d2f610d23ed197441b8332fecb0930"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4553.0.0-darwin-arm64.tar.gz"
      sha256 "92ff24af4044e417a3880f668333fc5737da729285e4defcb7a93df679d9ca8d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4553.0.0-linux-x64.tar.gz"
    sha256 "7aac02613c2c7d7a28ddfa99f04c9719842fe8b1df534d0011ae78c637abea25"
  end
  version "4553.0.0"
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
