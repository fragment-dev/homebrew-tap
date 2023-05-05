require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2594.0.0-darwin-x64.tar.gz"
    sha256 "3fd04a61c4c7679a2dd08aa86f059e4726cb5a066302e08bf768f9001f3395b6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2594.0.0-darwin-arm64.tar.gz"
      sha256 "39bea109126002f3c6f9aaff89b77c98bb9343a252c19545dbfc62f84d5ee3b8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2594.0.0-linux-x64.tar.gz"
    sha256 "ae2b56699606966a2dbff9fd33d814e555602a5c46ac0fedf23d44bb54791f2e"
  end
  version "2594.0.0"
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
