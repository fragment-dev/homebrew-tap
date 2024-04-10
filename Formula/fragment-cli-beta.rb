require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4865.0.0-darwin-x64.tar.gz"
    sha256 "6181582ba24774faa9a04709f5bb8c14e069fbf5c5778e8766b3b3541b4b2c1c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4865.0.0-darwin-arm64.tar.gz"
      sha256 "b0588dbbc5a14ce36377916717faa4b8ab153830b073f7e909b1f62c343b137b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4865.0.0-linux-x64.tar.gz"
    sha256 "3ce07314e2e5fb83eb3fd542c5807b218f116223cb2185c301fcee92a17f1f26"
  end
  version "4865.0.0"
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
