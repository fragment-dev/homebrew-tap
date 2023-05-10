require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2613.0.0-darwin-x64.tar.gz"
    sha256 "6244a2796a3e7c470435374625835fee01078ce3236618418e9bde9748b0f152"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2613.0.0-darwin-arm64.tar.gz"
      sha256 "e8dece6b296e2b99b1092572ff9965a93fd2ee17051561f99d08687390411ecd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2613.0.0-linux-x64.tar.gz"
    sha256 "a9cc3c7ca4554dafc3227c0a8b671e4c60092227fdbd65a145b9b040bd3d68d2"
  end
  version "2613.0.0"
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
