require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4886.0.0-darwin-x64.tar.gz"
    sha256 "6d1861d26a17d6b71daa733ff26ff912be0f7ea10e3bd491b1450d374793b9ab"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4886.0.0-darwin-arm64.tar.gz"
      sha256 "a0654cd68f2b37ca934f3c2bd478040d3aa66c12b7c47de8762341ab2158934f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4886.0.0-linux-x64.tar.gz"
    sha256 "2e27af07271ebf4fe403a9ee48e4313c01d90b817bee0940a7b3b28285d2ea23"
  end
  version "4886.0.0"
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
