require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2679.0.0-darwin-x64.tar.gz"
    sha256 "da7595f8447d34080efc4c037f36a9028c709ade7d2f4f42eb460b9d0b703702"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2679.0.0-darwin-arm64.tar.gz"
      sha256 "c367cee5156811b3781ee77a1b2d66e28f2181e54d9317286ffb3568cf8ceef5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2679.0.0-linux-x64.tar.gz"
    sha256 "db46989ee2c4111c89e17bdd2935d4dfe76056f2a136925feed37d1baa65ce10"
  end
  version "2679.0.0"
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
