require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4692.0.0-darwin-x64.tar.gz"
    sha256 "c225d69827114a486a80f802a6630f337179ffe7320c5039d179e0cebeb0fd98"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4692.0.0-darwin-arm64.tar.gz"
      sha256 "d80abd2bec92b17598a382c24ee65edd39f5772303c5903e31267803acf4dd7f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4692.0.0-linux-x64.tar.gz"
    sha256 "5c0bf1f84b408a5bfbef72eb60067afacee6d3fc8eb1547007c22a93106d9b6d"
  end
  version "4692.0.0"
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
