require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4967.0.0-darwin-x64.tar.gz"
    sha256 "e7d54f7da67577373b8ab5e11db44c0e395d223553d54969b9c23af89bab2be0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4967.0.0-darwin-arm64.tar.gz"
      sha256 "cc888bde049061a6f72fe9903fe8eec1e0dab0580400c394aed64b7466942f31"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4967.0.0-linux-x64.tar.gz"
    sha256 "949b3aaf4eb77387b6d17bbecf46d81a4363ea92a00815bf07697ef1e3a0da8f"
  end
  version "4967.0.0"
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
