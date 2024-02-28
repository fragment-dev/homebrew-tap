require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4664.0.0-darwin-x64.tar.gz"
    sha256 "de7c8b543ea2b7f99e4ae0bb9f4d6bcec53847a462544a41a968a0779bf7d032"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4664.0.0-darwin-arm64.tar.gz"
      sha256 "3202ec9ae6d06fff46ec8e75911ee1f36fa2e49acf9a71291f1a016ca79c70cb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4664.0.0-linux-x64.tar.gz"
    sha256 "9a2b80ae0e5d4b5bff8c4731875176744b2a16ea3c1794a3935050f3a4dcf521"
  end
  version "4664.0.0"
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
