require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3172.0.0-darwin-x64.tar.gz"
    sha256 "27e9a27e322874666bf82d4b6943cc8a1ec2bcea8589888741cfda8c0ddca315"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3172.0.0-darwin-arm64.tar.gz"
      sha256 "ea3128c39ac92608013e1627c7fac724a41bd75095dc2d1d4da72ef66704d3df"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3172.0.0-linux-x64.tar.gz"
    sha256 "272489eead5559fc1b4848ddd70e4f23fe5119e08d59406d19a05207bcd5cabc"
  end
  version "3172.0.0"
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
