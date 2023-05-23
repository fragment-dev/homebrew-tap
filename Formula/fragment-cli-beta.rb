require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2722.0.0-darwin-x64.tar.gz"
    sha256 "b3f02c2222cd7687d52ac8b03495ecc0ffc60fc6ef135ccddaa0599085166e8d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2722.0.0-darwin-arm64.tar.gz"
      sha256 "c00e36ed88cb0b7a2dd751c8f8318e9f6e7e4f0daffddde4743edddcc9e7ba99"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2722.0.0-linux-x64.tar.gz"
    sha256 "6f1821fb43c7234cf6be81b66bf8b51de8e36419f1e204873d5945c700e7ec88"
  end
  version "2722.0.0"
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
