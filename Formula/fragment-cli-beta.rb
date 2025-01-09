require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6052.0.0-darwin-x64.tar.gz"
    sha256 "177262a74e4d36f10eb2ee4ceda751f3e28bf60781911b3917dc94ae7b550f4e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6052.0.0-darwin-arm64.tar.gz"
      sha256 "a2cedb21fd363b999598cc4e34af28f8140d7e54bc1705f8795951613348fd8d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6052.0.0-linux-x64.tar.gz"
    sha256 "6c1779b3038cd6c558e72920867765fd6dc33a5314cc5a9c1dbd49819e3a3e20"
  end
  version "6052.0.0"
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
