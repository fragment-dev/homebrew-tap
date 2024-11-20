require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5808.0.0-darwin-x64.tar.gz"
    sha256 "9aabeab9ceee918945ffb981163931f14d90c024727db1601ad34fd769b50243"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5808.0.0-darwin-arm64.tar.gz"
      sha256 "376efc20f39eacb29847399a187ec9a0099bff0272fecfd381e50d5622ba7d2a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5808.0.0-linux-x64.tar.gz"
    sha256 "459ccab27b96c43b3ae59c8a512e3185d04a5b62a1a6ff80f748a13680bf597a"
  end
  version "5808.0.0"
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
