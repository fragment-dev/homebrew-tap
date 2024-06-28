require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5328.0.0-darwin-x64.tar.gz"
    sha256 "ce62151b3963e1a101648fc99dea4a8125dd6a7440a44b0da6603c71172a6cc9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5328.0.0-darwin-arm64.tar.gz"
      sha256 "81a289a1a22e73796ec631af3637dbc51b50af86e9fc38dd9c1c9b21dde04cf2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5328.0.0-linux-x64.tar.gz"
    sha256 "70c38b3e0b0e01312eefecdc9ad11fd825f3e77e4c3c216500971e2f1aa70e17"
  end
  version "5328.0.0"
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
