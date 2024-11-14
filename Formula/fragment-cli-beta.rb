require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5769.0.0-darwin-x64.tar.gz"
    sha256 "371a3a3e1ae1f4962744783a9e13c159abd86a444a30839c5fb7ba8345038a21"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5769.0.0-darwin-arm64.tar.gz"
      sha256 "0310ec2671ffcab8e76b1c0ce6eb45416125b5e7a18c7618fe50bae6f66e380e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5769.0.0-linux-x64.tar.gz"
    sha256 "ecd0d26b9005ff55d0357e3f4f66718239f6ba5280fab1baf50014f3fa024a43"
  end
  version "5769.0.0"
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
