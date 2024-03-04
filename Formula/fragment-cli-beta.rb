require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4690.0.0-darwin-x64.tar.gz"
    sha256 "02907c280d55edd9f5438f2471c66d7d5f7f910a90241e428ad7f0340a957bac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4690.0.0-darwin-arm64.tar.gz"
      sha256 "d54e34051b0f45ffaee93cda8401f2c50dc4a4cca32725715818aa335d2fce64"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4690.0.0-linux-x64.tar.gz"
    sha256 "24e53712ab8a496ae7343ba5714ad715597c1fc4eb37475ff6ffe64ee76bef47"
  end
  version "4690.0.0"
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
