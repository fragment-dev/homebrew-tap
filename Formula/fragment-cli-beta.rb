require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3507.0.0-darwin-x64.tar.gz"
    sha256 "73c92174619904f39389b791e1a5510360abe1c6ca27109960c5da3f5954ad08"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3507.0.0-darwin-arm64.tar.gz"
      sha256 "370508ceb221fa912bb8f87dca56d6879dace3936bc537f1a790875cd904f5d4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3507.0.0-linux-x64.tar.gz"
    sha256 "23bfa69724ca5bb265b2b04b116f2865017c2f02bef1d49ab7a79867e38d838b"
  end
  version "3507.0.0"
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
