require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2773.0.0-darwin-x64.tar.gz"
    sha256 "6d3dbf983d3d0a603e5558695697855d2f8ec2279b94b22633d0cfc8562f4218"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2773.0.0-darwin-arm64.tar.gz"
      sha256 "22e4551ef7af2cfb73980e6765fab0ac452257b161cdf120e5e6298aa14df6fb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2773.0.0-linux-x64.tar.gz"
    sha256 "0386639f0579823086f6ea93f1c8d19a83eeeb959faa6cad9403234792a14ed0"
  end
  version "2773.0.0"
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
