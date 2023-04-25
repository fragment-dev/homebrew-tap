require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2516.0.0-darwin-x64.tar.gz"
    sha256 "8b20dab340fc5ae71780a4ba91c9c1524d78bb72cb90c05c3de98fd85a1dbc57"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2516.0.0-darwin-arm64.tar.gz"
      sha256 "0d46834d9ceaf9bca0f6e33047e9c4382170d0fc923051603fb23a7774c55002"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2516.0.0-linux-x64.tar.gz"
    sha256 "9df89e0741db0dba45b4dda83fd7ab296f3a8a3410d14b91cb5871a317f025c9"
  end
  version "2516.0.0"
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
