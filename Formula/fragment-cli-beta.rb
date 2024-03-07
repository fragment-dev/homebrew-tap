require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4719.0.0-darwin-x64.tar.gz"
    sha256 "567f30afae2692def6e2cb6685cb966730a72e388950b96e4efb5d59d72018b8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4719.0.0-darwin-arm64.tar.gz"
      sha256 "fa885de0d147c669d85b6e8629e6f146b6833828f592f789874c3f5953048585"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4719.0.0-linux-x64.tar.gz"
    sha256 "a4e0426a9db4a8de1bcd7b42dc38347bcaf21950948f0837814412427b4d583f"
  end
  version "4719.0.0"
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
