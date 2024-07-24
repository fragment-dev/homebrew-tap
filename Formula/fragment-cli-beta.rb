require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5435.0.0-darwin-x64.tar.gz"
    sha256 "42d98c22a29f4cb34ed94975318b61817fe377e10f366e5145cb640579454472"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5435.0.0-darwin-arm64.tar.gz"
      sha256 "a7dcd3eb141de67168a4055b094e453579aabd2af92ad02bc428c7d452bc4a59"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5435.0.0-linux-x64.tar.gz"
    sha256 "306c843d33b29fbe929da33b25d3ca1a92d53bf8f6b684c4c2c951276a3dba3a"
  end
  version "5435.0.0"
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
