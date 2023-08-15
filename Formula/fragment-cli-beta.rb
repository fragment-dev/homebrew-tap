require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3321.0.0-darwin-x64.tar.gz"
    sha256 "a14400198b40496b022cb8932c62cbc5f3e07833df28cb283860e8fff93bcfff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3321.0.0-darwin-arm64.tar.gz"
      sha256 "8d385e9b2e201d20fcc9fc5d37fb9ba1ee35f8c80b2633b432cc82d1229a78f3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3321.0.0-linux-x64.tar.gz"
    sha256 "f10761a38d53d3d00f2c12ac85b89b249635acb22413339ab61691cc81648157"
  end
  version "3321.0.0"
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
