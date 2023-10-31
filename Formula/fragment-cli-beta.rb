require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3947.0.0-darwin-x64.tar.gz"
    sha256 "e2f0545d246beb850f82953ead6d25ab4f9731b1f62ef27e945a9f203e213fad"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3947.0.0-darwin-arm64.tar.gz"
      sha256 "0aaf37ee4a392ef57b76b6031dbd00355f8b16d983b79bdfea240052c9178119"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3947.0.0-linux-x64.tar.gz"
    sha256 "201cd5a0d3b919d27e0a6f07c78350fec8c77bf05ec6d36e148ed33892082320"
  end
  version "3947.0.0"
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
