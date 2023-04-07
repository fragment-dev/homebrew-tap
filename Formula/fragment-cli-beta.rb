require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2379.0.0-darwin-x64.tar.gz"
    sha256 "891c27e3411a10e6af97584918b31992e4930a3cb5502bf76167883b1544addf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2379.0.0-darwin-arm64.tar.gz"
      sha256 "12065838bee19f78df6b577021fa63c70bbf29daeda1bde544557da6ee2da60b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2379.0.0-linux-x64.tar.gz"
    sha256 "ae5d39fe580cd7d5284df702e9a3a17b0f5107db6ee69a5e56ab0e027f780be3"
  end
  version "2379.0.0"
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
