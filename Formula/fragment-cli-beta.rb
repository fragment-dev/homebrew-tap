require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5608.0.0-darwin-x64.tar.gz"
    sha256 "00d4ce722be0858433ddf8576208bd601db7390563d688bee96e50027158c7b4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5608.0.0-darwin-arm64.tar.gz"
      sha256 "61bc126a4ec8f1607b9cda6875b0763899b2955776dd493e8131b5f986670e23"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5608.0.0-linux-x64.tar.gz"
    sha256 "31bdd0b4d2d6a07e60cc4065b3b208570472b583b95e629d4af55a2a94222ad4"
  end
  version "5608.0.0"
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
