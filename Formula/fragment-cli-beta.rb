require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2784.0.0-darwin-x64.tar.gz"
    sha256 "a5f3548d53975226dd37d663e917a83ff0608bd29ed28a1624d17b95f2ea1b6a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2784.0.0-darwin-arm64.tar.gz"
      sha256 "181bca25b46852cc8b05032180d416c1cbc29bcac03deff442e290cb9b65c503"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2784.0.0-linux-x64.tar.gz"
    sha256 "9e788e60c6d2d9e518c3ecd1d7a1d5d9ea2fa076527dc32419f5eba22ed7b1a5"
  end
  version "2784.0.0"
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
