require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4550.0.0-darwin-x64.tar.gz"
    sha256 "88021c5b08103aea236c450fa3e50ce26bedec7dff31f1357ab0fd17a4aacca5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4550.0.0-darwin-arm64.tar.gz"
      sha256 "43a3e59360517a0c318d4f0175083f9ead8f00c51225cfff7d4c72533d4c2195"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4550.0.0-linux-x64.tar.gz"
    sha256 "4a50bc85dddf362172ee5f9775f2f6dcb2b267fad7037c23e588cc729df5e183"
  end
  version "4550.0.0"
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
