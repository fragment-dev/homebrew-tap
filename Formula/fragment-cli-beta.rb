require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6129.0.0-darwin-x64.tar.gz"
    sha256 "d3fa2d8d4816b43c2e9586095200e23012f4dc0b07a8e758ea9f9e13a5fee5b2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6129.0.0-darwin-arm64.tar.gz"
      sha256 "dcb2cd763495da324dd72d0c4a6d38cfd62350e2637a51cbe3102aea7f141f11"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6129.0.0-linux-x64.tar.gz"
    sha256 "8852e798623ca80a916560c93a41a930c463161c9ef57e4adcfa08c970421086"
  end
  version "6129.0.0"
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
