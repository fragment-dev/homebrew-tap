require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3347.0.0-darwin-x64.tar.gz"
    sha256 "43bab2e8fe737c7b0e8e211fe7ec026e2848e0d7f971ddaf5b21efe77491cdd3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3347.0.0-darwin-arm64.tar.gz"
      sha256 "9800ae0543689211db3e293cdf67a8c3e255c0873f9388cefdf25af99e063e86"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3347.0.0-linux-x64.tar.gz"
    sha256 "5cf3569d9893c7bc1e5ae614034209626f361546fbbd2c81efc096ef23ba2fc8"
  end
  version "3347.0.0"
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
