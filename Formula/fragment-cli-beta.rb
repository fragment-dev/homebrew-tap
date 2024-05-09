require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5018.0.0-darwin-x64.tar.gz"
    sha256 "9f0202e5abe1d99392750011d069a5a2a8ecc7b7353e750d19a7339c05872dd4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5018.0.0-darwin-arm64.tar.gz"
      sha256 "c65ff73d1ab771e88dc719f3531ff8bf54730f1f61c31359ba51d9109bb2fc97"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5018.0.0-linux-x64.tar.gz"
    sha256 "63af1e618d48e27853abd192a0c212b0ee09a3aa40b50356b3ebf520e4435add"
  end
  version "5018.0.0"
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
