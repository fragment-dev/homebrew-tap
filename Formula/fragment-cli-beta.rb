require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6123.0.0-darwin-x64.tar.gz"
    sha256 "a4b699bfc9dbfd8928dd11be50a8af297edfaa151b1145df177f680248035f88"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6123.0.0-darwin-arm64.tar.gz"
      sha256 "190a86f2525993ce7a0633def158fa95e3ac9f8e2844b38f760ca5396dbc2a75"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6123.0.0-linux-x64.tar.gz"
    sha256 "ef521a45a518dc931b05fc4b04d6682eae039a4e429c1517b6fb32ed3405cf75"
  end
  version "6123.0.0"
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
