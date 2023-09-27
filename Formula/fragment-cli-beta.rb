require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3684.0.0-darwin-x64.tar.gz"
    sha256 "cdbcacb59381c05df849e699d0ad49822f4535f3ecb2de6150ee4bc0e94024bc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3684.0.0-darwin-arm64.tar.gz"
      sha256 "3111e09af3d32394bf9a516b791bfb1005fe1210451f28013d241de9629c9eab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3684.0.0-linux-x64.tar.gz"
    sha256 "8dc3db614692d6005f777ae7f1cbdc39d5a59170f65903ffee323a617efc8571"
  end
  version "3684.0.0"
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
