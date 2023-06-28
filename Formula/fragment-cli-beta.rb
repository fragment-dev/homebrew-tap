require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2964.0.0-darwin-x64.tar.gz"
    sha256 "8319bb778af400a17fdd1d4c0f24ef8256bdf9c88e228552c83baa2a44f027a5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2964.0.0-darwin-arm64.tar.gz"
      sha256 "caabac9689b988d682ad07aaf295a3b92405f24f8098f10c936b8bb712f14648"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2964.0.0-linux-x64.tar.gz"
    sha256 "463b27bf2e57f026fecf24bcc315710712ae2b07a1032a67ae7538a89b82072e"
  end
  version "2964.0.0"
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
