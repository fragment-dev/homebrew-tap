require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6071.0.0-darwin-x64.tar.gz"
    sha256 "561e7d6216d5b2dd5454139bb711996709c254cbcf7a89e16ac48428ca763883"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6071.0.0-darwin-arm64.tar.gz"
      sha256 "8b91f5f4c3506815302631eefe8c395dc7834c57ce1ba51f89212f890bde718c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6071.0.0-linux-x64.tar.gz"
    sha256 "c693e62468485d43ba712fbaf20c01d4601e96925d29463121cc625ff831fed9"
  end
  version "6071.0.0"
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
