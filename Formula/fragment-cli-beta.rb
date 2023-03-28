require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2292.0.0-darwin-x64.tar.gz"
    sha256 "520027d3d1c0ef9de6c110994284d58341f24825f846b2c526e2f5679f734853"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2292.0.0-darwin-arm64.tar.gz"
      sha256 "ee3dd69d413866fe13d2c2591012b2260d8bc48290a44c7326394c4bb1e168fe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2292.0.0-linux-x64.tar.gz"
    sha256 "fbe188dc978f886c9af928fc9fa7a1f08e58da04f9078605009cae415b23c04b"
  end
  version "2292.0.0"
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
