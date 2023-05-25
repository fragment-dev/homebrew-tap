require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2740.0.0-darwin-x64.tar.gz"
    sha256 "aeb16f259c38197d993262f6b1434c05f5fd52e1615f0e0525a0146cd2f88088"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2740.0.0-darwin-arm64.tar.gz"
      sha256 "07cac8aa59e42804d8ad839fec5e72fd3e23b897520904cf797417cc26299508"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2740.0.0-linux-x64.tar.gz"
    sha256 "d32d290348b0f1354da595d3a2f7ba4bd266338e0d6e496cc07921fcbd349f62"
  end
  version "2740.0.0"
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
